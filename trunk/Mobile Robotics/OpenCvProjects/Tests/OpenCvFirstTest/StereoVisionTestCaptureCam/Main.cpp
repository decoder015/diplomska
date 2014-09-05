#include <windows.h>
#include <stddef.h>
#include <process.h>
#include <string.h>
#include <iostream>
#include <opencv/cv.h>
#include <opencv/highgui.h>
#include <opencv2/calib3d/calib3d.hpp>
#include <opencv2/opencv.hpp>
#include "opencv2/imgproc/imgproc.hpp"

//file io
#include <iostream>
#include <fstream>
#include <string.h>
#include <direct.h>

#include "stereo_match1.h"

using namespace cv;
using namespace std;

#pragma region Constants
#define C_INT_LEFT_CAM  0
#define C_INT_RIGHT_CAM 1

//window titles
#define C_STR_LEFT_WIN_TITLE "Left camera"
#define C_STR_RIGHT_WIN_TITLE "Right camera"

//list of calibration images
#define C_STR_CALIBRATION_FILE_LIST  ".\\calibImages\\list.txt"

//image calibration directory
#define C_STR_CALIBRATION_DIR "calibImages"

//image name format for calipration 
#define C_STR_CALIBRATION_IMAGE_NAME_FMT "%s\\%s%d.jpg"

#define C_STR_INTRINSIC_FILENAME ".\\CalibFiles\\intr.xml"
#define C_STR_EXTRINSIC_FILENAME ".\\CalibFiles\\extr.xml"

//maximum number of acquired calibration images
const int C_INT_NUMBER_OF_CALIB_IMAGES = 20;
#pragma endregion

#pragma region Functions: capture images from web cams - Not working
void CaptureFromCamera(int camNo, string windowTitle)
{
	Mat image;
	VideoCapture cam;

	cam.set(CV_CAP_PROP_FRAME_WIDTH, 640);
	cam.set(CV_CAP_PROP_FRAME_HEIGHT, 480);
	cam.open(camNo);

	namedWindow(windowTitle, camNo);
	while(1)
	{
		try
		{
			cam>>image;

			imshow(windowTitle, image);
		}
		catch (Exception& e)
		{
			const char* err_msg = e.what();
			std::cout << "exception caught: imshow:\n" << err_msg << std::endl;
		}
	}
}

void CaptureLeftCamThreadProc(void *  param)
{
	int i =0;
	while(1)
	{
		i++;
		cout<<"I:"<<i<<endl;
		//std::cout << "Th1" << endl;
		//CaptureFromCamera(C_INT_LEFT_CAM, C_STR_LEFT_WIN_TITLE);    
	}
}

void CaptureRightCamThreadProc(void *  param)
{
	int i =0;
	while(1)
		i++;
	//cout<<"test2";
	//std::cout << "Th2" << endl;
	//CaptureFromCamera(C_INT_RIGHT_CAM, C_STR_RIGHT_WIN_TITLE);

}
#pragma endregion

#pragma region Capture Images from web cam

void  StereoCapture(Mat* M1, Mat* D1, Mat* M2, Mat* D2, Mat* R1, Mat* R2, Mat* P1, Mat* P2, Mat* Q)
{
	IplImage * image1=0;
	IplImage * image2=0;

	Mat disp;

	CvCapture * capture1=cvCaptureFromCAM(0);
	CvCapture * capture2=cvCaptureFromCAM(1);

	if(!capture1)
	{
		printf("Cannot find device1!\n");
		exit(0);
	}

	if(!capture2)
	{
		printf("Cannot find device2!\n");
		exit(0);
	}	

	cvNamedWindow(C_STR_LEFT_WIN_TITLE);
	cvNamedWindow(C_STR_RIGHT_WIN_TITLE);
	while(1)
	{
		image1=cvQueryFrame(capture1);
		image2=cvQueryFrame(capture2);

		if(!image1||!image2)
			break;
		
		Mat matImg1(image1);
		Mat matImg2(image2);

		disp = StereoMatch(&matImg1, &matImg2, M1, D1, M2, D2, R1, P1, R2, P2, Q);

		imshow(C_STR_LEFT_WIN_TITLE, matImg1);
		imshow(C_STR_RIGHT_WIN_TITLE, matImg2);
		imshow("Disparaty",disp);


		int key=cvWaitKey(10);
		if(27==key)	break;
	}
	cvReleaseCapture(&capture1);
	cvReleaseCapture(&capture2);

	cvDestroyWindow(C_STR_LEFT_WIN_TITLE);
	cvDestroyWindow(C_STR_RIGHT_WIN_TITLE);   
}

bool FindChessBoard(IplImage* img, int nx, int ny, int displayCorners)
{
	char buf[1024];
	int count = 0, result=0, j;
	int board_n = nx*ny;	
	CvSize imageSize = cvGetSize(img);
	//vector<CvPoint2D32f> temp(n);
	CvPoint2D32f* corners = new CvPoint2D32f[ board_n ];

	//or up-down camera arrangements
	const int maxScale = 1;

	//FIND CHESSBOARDS AND CORNERS THEREIN:
	for( int s = 1; s <= maxScale; s++ )
	{
		IplImage* timg = img;
		if( s > 1 )
		{
			timg = cvCreateImage(cvSize(img->width*s,img->height*s), img->depth, img->nChannels );
			cvResize( img, timg, CV_INTER_CUBIC );
		}
		
		//find corners
		result = cvFindChessboardCorners(timg, cvSize(nx, ny),	&corners[0], &count,  CV_CALIB_CB_ADAPTIVE_THRESH | CV_CALIB_CB_FILTER_QUADS); // CV_CALIB_CB_ADAPTIVE_THRESH | CV_CALIB_CB_NORMALIZE_IMAGE)

		if( timg != img )
			cvReleaseImage( &timg );

		if( result || s == maxScale )
			for( j = 0; j < count; j++ )
			{
				corners[j].x /= s;
				corners[j].y /= s;
			}
			if( result )break;
	}

	if( displayCorners &&  count > 0 )
	{
		IplImage* cimg = cvCreateImage(imageSize, 8, 3 );
		cimg = cvCloneImage(img);
		cvDrawChessboardCorners( cimg, cvSize(nx, ny), &corners[0], count, result );
		cvShowImage( "corners", cimg );	
	}

	if(count == board_n)
		return true;
	else
		return false;
}

//Capturees images for calibration
void  CaptureCalibImagesFromWebCameras()
{
	mkdir(C_STR_CALIBRATION_DIR);
	ofstream fileImagesList;	
	fileImagesList.open(C_STR_CALIBRATION_FILE_LIST);

	char buffer[1024];
	char imgName[30];
	IplImage * leftImage = 0;
	IplImage * rightImage = 0;

	CvCapture * capture1=cvCaptureFromCAM(0);
	CvCapture * capture2=cvCaptureFromCAM(1);

	if(!capture1)
	{
		printf("Cannot find device1!\n");
		exit(0);
	}

	if(!capture2)
	{
		printf("Cannot find device2!\n");
		exit(0);
	}	

	cvNamedWindow(C_STR_LEFT_WIN_TITLE);
	cvNamedWindow(C_STR_RIGHT_WIN_TITLE);


	Sleep(2000);
	printf("Starting to capture images...");

	int index = 1;
	while(index <= C_INT_NUMBER_OF_CALIB_IMAGES )
	{
		leftImage=cvQueryFrame(capture1);
		rightImage=cvQueryFrame(capture2);

		if(!leftImage || !rightImage)
			break;

		if(FindChessBoard(leftImage, 8, 6, 1) && FindChessBoard(rightImage, 8, 6, 1))
		{
			//store left image
			sprintf(buffer, C_STR_CALIBRATION_IMAGE_NAME_FMT, C_STR_CALIBRATION_DIR, "left", index);
			fileImagesList << buffer << endl;
			cvSaveImage(buffer, leftImage );
			printf("Save image %s\n", buffer);		

			//store right image
			sprintf(buffer, C_STR_CALIBRATION_IMAGE_NAME_FMT,C_STR_CALIBRATION_DIR, "right", index);
			fileImagesList << buffer <<endl;
			cvSaveImage(buffer, rightImage );
			printf("Save image %s \n", buffer);
			Sleep(200);

			index++;
		}
		else
		{
			cvShowImage(C_STR_LEFT_WIN_TITLE, leftImage);
			cvShowImage(C_STR_RIGHT_WIN_TITLE, rightImage);
		}

		//read keyboard input
		int key=cvWaitKey(10);
		if(27==key)	break;		
	}

	//close file with limage list
	fileImagesList.close();

	//release resources
	cvReleaseCapture(&capture1);
	cvReleaseCapture(&capture2);
	cvDestroyWindow(C_STR_LEFT_WIN_TITLE);
	cvDestroyWindow(C_STR_RIGHT_WIN_TITLE);

	StereoCalib(C_STR_CALIBRATION_FILE_LIST, 8, 6, 0, 2.5);
}


bool LoadCalibMatrces(Mat* M1, Mat* D1, Mat* M2, Mat* D2, Mat* R1, Mat* R2, Mat* P1, Mat* P2, Mat* Q)
{
	//open filenames
	FileStorage fsIntr(C_STR_INTRINSIC_FILENAME, CV_STORAGE_READ);
	FileStorage fsExtr(C_STR_EXTRINSIC_FILENAME, CV_STORAGE_READ);

	if(!fsIntr.isOpened() && !fsExtr.isOpened())
	{
	    printf("Failed to open file %s\n", C_STR_INTRINSIC_FILENAME);
	   return false;
	}
	
	fsIntr["M1"] >> *M1;
	fsIntr["D1"] >> *D1;
	fsIntr["M2"] >> *M2;
	fsIntr["D2"] >> *D2;

	fsExtr["R1"] >> *R1;
	fsExtr["R2"] >> *R2;
	fsExtr["P1"] >> *P1;
	fsExtr["P2"] >> *P2;
	fsExtr["Q"] >> *Q;

	return true;
}
#pragma region Main
int main(int argc, char** argv)
{

	Mat M1, D1, M2, D2, R1, R2, P1, P2, Q;
	bool doCalib = LoadCalibMatrces(&M1, &D1, &M2, &D2, &R1, &R2, &P1, &P2, &Q);

	if(!doCalib)
	{
		//load image list file
		CaptureCalibImagesFromWebCameras();
	}
	else
		StereoCapture(&M1, &D1, &M2, &D2, &R1, &R2, &P1, &P2, &Q);


	//_beginthread( CaptureLeftCamThreadProc, 0, NULL );
	//_beginthread( CaptureRightCamThreadProc, 0, NULL );
	//HANDLE h1 = CreateThread(NULL, 0, CaptureLeftCamThreadProc, NULL, 0L, NULL );
	//HANDLE h2 = CreateThread(NULL, 0, CaptureRightCamThreadProc, NULL, 0L, NULL );
	//WaitForSingleObject(h1, 10000); // wait for thread to exit, TIME is a DWORD in milliseconds
	//WaitForSingleObject(h2, 10000); // wait for thread to exit, TIME is a DWORD in milliseconds
	//CaptureFromCamera(C_INT_LEFT_CAM, C_STR_LEFT_WIN_TITLE);
	//CaptureFromCamera(C_INT_RIGHT_CAM, C_STR_RIGHT_WIN_TITLE);
	//waitKey(33);
	//}
	return 0;
}
#pragma endregion