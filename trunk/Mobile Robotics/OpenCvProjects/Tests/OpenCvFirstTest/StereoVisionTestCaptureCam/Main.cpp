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

const int C_INT_MAX_THREADS  = 30;
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

void CaptureLeftCamThreadProc(void * param)
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
#pragma endregion

////////////////////////////////////////////////////////////////////////////////////////////////////
/// <summary>	Determines the mean value. </summary>
///
/// <remarks>	Kristijan, 9/6/2014. </remarks>
///
/// <returns>	The mean value. </returns>
////////////////////////////////////////////////////////////////////////////////////////////////////
int Mean(Mat frames[])
{
	Mat frame,frame32f;
	char filename[40];
	cv::Mat mean;
	const int count =10;
	const int width  = 1920;
	const int height = 1080;
	Mat resultframe = Mat::zeros(height, width, CV_32FC3);

	for(int i = 1 ; i<= count; i++)
	{
		sprintf(filename,"d:\\BMdvideos\\images\\image%d.tiff",i);
		frame = imread(filename,CV_LOAD_IMAGE_COLOR);
		frame.convertTo(frame32f, CV_32FC3);

		resultframe +=frame32f;
		cout << " i = " << i<<endl;
		//frame.release();
	}
	resultframe *= (1.0/count);

	imshow("",resultframe);
	waitKey(0);
	return 0;
}

#pragma region Capture Images from web cam
////////////////////////////////////////////////////////////////////////////////////////////////////
/// <summary>	A captre data. </summary>
///
/// <remarks>	Kristijan, 9/6/2014. </remarks>
////////////////////////////////////////////////////////////////////////////////////////////////////
struct CaptreData
{
	CvCapture *captire;
	IplImage * graySclImage;
};

////////////////////////////////////////////////////////////////////////////////////////////////////
/// <summary>	A stereo data. </summary>
///
/// <remarks>	Kristijan, 9/7/2014. </remarks>
////////////////////////////////////////////////////////////////////////////////////////////////////
struct StereoData
{
	
	Mat * image1;
	Mat * image2;
	Mat disp[C_INT_MAX_THREADS];
	bool hasDisp[C_INT_MAX_THREADS];
	CvCapture * capture1;
	CvCapture * capture2;
	Mat * M1;
	Mat * D1;
	Mat * M2;
	Mat * D2;
	Mat * R1;
	Mat * P1;
	Mat * R2;
	Mat * P2;
	Mat * Q;
};

////////////////////////////////////////////////////////////////////////////////////////////////////
/// <summary>	Capture camera thread proc. </summary>
///
/// <remarks>	Kristijan, 9/6/2014. </remarks>
///
/// <param name="param">	[in,out] If non-null, the parameter. </param>
////////////////////////////////////////////////////////////////////////////////////////////////////
DWORD WINAPI CaptureCam1Proc(LPVOID lpParam)
{
	//get paramters
	CaptreData* data ((CaptreData*)lpParam);

	IplImage * image1=cvQueryFrame(data->captire);	
	cvCvtColor( image1, data->graySclImage, CV_RGB2GRAY );

	return 0;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
/// <summary>	Calculates the stereo disparity thread. </summary>
///
/// <remarks>	Kristijan, 9/7/2014. </remarks>
///
/// <param name="lpParam">	The parameter. </param>
///
/// <returns>	The calculated stereo disparity thread. </returns>
////////////////////////////////////////////////////////////////////////////////////////////////////
DWORD WINAPI CalculateStereoDisparityThread(LPVOID lpParam)
{
	//TODO get params
	int64 t;
	StereoData * data ((StereoData*)lpParam);
	Mat disp;

	while(1)
	{
		t = getTickCount();					

		/*image1=cvQueryFrame(capture1);
		image2=cvQueryFrame(capture2);
		cvCvtColor( image1, imgGray1, CV_RGB2GRAY );
		cvCvtColor( image2, imgGray2, CV_RGB2GRAY );	
		Mat matImg2(imgGray2, CV_32FC3);*/

		CaptreData cam1Data, cam2Data;
		cam1Data.captire = data->capture1;
		//cam1Data.graySclImage = imgGray1;

		cam2Data.captire =data->capture2;
		//cam2Data.graySclImage = imgGray2;

		HANDLE h1 = CreateThread(
			NULL,				// default security attributes
			0,					// use default stack size
			CaptureCam1Proc,	// thread function name
			&cam1Data,			// argument to thread function 
			0, 
			NULL);

		HANDLE h2 = CreateThread(
			NULL,				// default security attributes
			0,					// use default stack size
			CaptureCam1Proc,	// thread function name
			&cam2Data,			// argument to thread function 
			0, 
			NULL);


		Mat matImg1(cam1Data.graySclImage, CV_32FC3);
		Mat matImg2(cam2Data.graySclImage, CV_32FC3);

		data->image1=&matImg1;
		data->image2=&matImg2;
		disp = StereoMatch(&matImg1, &matImg2, data->M1, data->D1, data->M2, data->D2, data->R1, data->P1, data->R2, data->P2, data->Q);

		//imshow(C_STR_LEFT_WIN_TITLE, matImg1);
		//imshow(C_STR_RIGHT_WIN_TITLE, matImg2);
		imshow("Disparaty", disp);

		int key=cvWaitKey(10);
		if(27==key)	break;

		t = getTickCount() - t;
		printf("Time elapsed: %fms\n", t*1000/getTickFrequency());

		//clean up
		 CloseHandle(h1);
		 CloseHandle(h2);
	}

	return 0;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
/// <summary>	Stereo capture threaded. </summary>
///
/// <remarks>	Kristijan, 9/7/2014. </remarks>
///
/// <param name="M1">	[in,out] If non-null, the first Mat. </param>
/// <param name="D1">	[in,out] If non-null, the first Mat. </param>
/// <param name="M2">	[in,out] If non-null, the second Mat. </param>
/// <param name="D2">	[in,out] If non-null, the second Mat. </param>
/// <param name="R1">	[in,out] If non-null, the first Mat. </param>
/// <param name="R2">	[in,out] If non-null, the second Mat. </param>
/// <param name="P1">	[in,out] If non-null, the first Mat. </param>
/// <param name="P2">	[in,out] If non-null, the second Mat. </param>
/// <param name="Q"> 	[in,out] If non-null, the Mat* to process. </param>
////////////////////////////////////////////////////////////////////////////////////////////////////
void  StereoCaptureThreaded(Mat* M1, Mat* D1, Mat* M2, Mat* D2, Mat* R1, Mat* R2, Mat* P1, Mat* P2, Mat* Q)
{

	int64 t;
	IplImage * image1=0;
	IplImage * image2=0;	
	IplImage * imgGray1 = 0; 
	IplImage * imgGray2 = 0;
	HANDLE handles[C_INT_MAX_THREADS];
	StereoData stereoData;

	stereoData.M1 = M1;
	stereoData.D1 = M1;
	stereoData.M2 = M2;
	stereoData.D1 = D1;
	stereoData.R1 = R1;
	stereoData.R2 = R2;
	stereoData.P1 = P1;
	stereoData.P2 = P1;
	stereoData.Q = Q;

	CvSize imgSize = {640, 480};
	Mat disp;

	CvCapture * capture1 = cvCaptureFromCAM(0);
	CvCapture * capture2 = cvCaptureFromCAM(1);

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


	for (int i =1; i< C_INT_MAX_THREADS;i++)
	{
		CreateThread(
			NULL,				// default security attributes
			0,					// use default stack size
			CalculateStereoDisparityThread,	// thread function name
			&stereoData,			// argument to thread function 
			0, 
			NULL);	
	}


	while(1)
	{
		imshow(C_STR_LEFT_WIN_TITLE, *stereoData.image1);
		imshow(C_STR_RIGHT_WIN_TITLE, *stereoData.image2);
		imshow("Disparaty", disp);

	}

	cvDestroyWindow(C_STR_LEFT_WIN_TITLE);
	cvDestroyWindow(C_STR_RIGHT_WIN_TITLE);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
/// <summary>	Stereo capture. </summary>
///
/// <remarks>	Kristijan, 9/6/2014. </remarks>
///
/// <param name="M1">	[in,out] If non-null, the first Mat. </param>
/// <param name="D1">	[in,out] If non-null, the first Mat. </param>
/// <param name="M2">	[in,out] If non-null, the second Mat. </param>
/// <param name="D2">	[in,out] If non-null, the second Mat. </param>
/// <param name="R1">	[in,out] If non-null, the first Mat. </param>
/// <param name="R2">	[in,out] If non-null, the second Mat. </param>
/// <param name="P1">	[in,out] If non-null, the first Mat. </param>
/// <param name="P2">	[in,out] If non-null, the second Mat. </param>
/// <param name="Q"> 	[in,out] If non-null, the Mat* to process. </param>
////////////////////////////////////////////////////////////////////////////////////////////////////
void  StereoCapture(Mat* M1, Mat* D1, Mat* M2, Mat* D2, Mat* R1, Mat* R2, Mat* P1, Mat* P2, Mat* Q)
{
	int64 t;
	IplImage * image1=0;
	IplImage * image2=0;	
	IplImage * imgGray1 = 0; 
	IplImage * imgGray2 = 0;

	CvSize imgSize = {640, 480};
	Mat disp;

	CvCapture * capture1 = cvCaptureFromCAM(0);
	CvCapture * capture2 = cvCaptureFromCAM(1);

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

	//Mat frame32f=Mat(640, 480 ,CV_32FC3);

	//Mat greyMat1MAt(480,640), colorMat1;
	//Mat greyMat2, colorMat2;

	//Mat mean1 = Mat::zeros(480, 640, CV_32FC3); 
	//Mat mean2 = Mat::zeros(480, 640, CV_32FC3);

	imgGray1 = cvCreateImage(imgSize, IPL_DEPTH_8U, 1 );
	imgGray2 = cvCreateImage(imgSize, IPL_DEPTH_8U, 1 );
	while(1)
	{
		t = getTickCount();					

		//unthreaded
		/*image1=cvQueryFrame(capture1);
		image2=cvQueryFrame(capture2);
		cvCvtColor( image1, imgGray1, CV_RGB2GRAY );
		cvCvtColor( image2, imgGray2, CV_RGB2GRAY );	
		Mat matImg2(imgGray2, CV_32FC3);*/

		CaptreData cam1Data, cam2Data;
		cam1Data.captire = capture1;
		cam1Data.graySclImage = imgGray1;

		cam2Data.captire = capture2;
		cam2Data.graySclImage = imgGray2;

		HANDLE h1 = CreateThread(
			NULL,				// default security attributes
			0,					// use default stack size
			CaptureCam1Proc,	// thread function name
			&cam1Data,			// argument to thread function 
			0, 
			NULL);

		HANDLE h2 = CreateThread(
			NULL,				// default security attributes
			0,					// use default stack size
			CaptureCam1Proc,	// thread function name
			&cam2Data,			// argument to thread function 
			0, 
			NULL);


		Mat matImg1(cam1Data.graySclImage, CV_32FC3);
		Mat matImg2(cam2Data.graySclImage, CV_32FC3);

		disp = StereoMatch(&matImg1, &matImg2, M1, D1, M2, D2, R1, P1, R2, P2, Q);

		imshow(C_STR_LEFT_WIN_TITLE, matImg1);
		imshow(C_STR_RIGHT_WIN_TITLE, matImg2);
		imshow("Disparaty", disp);

		int key=cvWaitKey(10);
		if(27==key)	break;

		t = getTickCount() - t;
		printf("Time elapsed: %fms\n", t*1000/getTickFrequency());

		//clean up
		CloseHandle(h1);
		CloseHandle(h2);
	}
	cvReleaseCapture(&capture1);
	cvReleaseCapture(&capture2);

	cvDestroyWindow(C_STR_LEFT_WIN_TITLE);
	cvDestroyWindow(C_STR_RIGHT_WIN_TITLE);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
/// <summary>	Searches for the first chess board.</summary>
///
/// <remarks>	Kristijan, 9/7/2014. </remarks>
///
/// <param name="img">			 	[in,out] If non-null, the image. </param>
/// <param name="nx">			 	The nx. </param>
/// <param name="ny">			 	The ny. </param>
/// <param name="displayCorners">	The display corners. </param>
///
/// <returns>	true if it succeeds, false if it fails. </returns>
////////////////////////////////////////////////////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////////////////////////////////////////
/// <summary>	Capture calib images from web cameras. </summary>
///
/// <remarks>	Kristijan, 9/6/2014. </remarks>
////////////////////////////////////////////////////////////////////////////////////////////////////
void  CaptureCalibImagesFromWebCameras()
{
	mkdir(C_STR_CALIBRATION_DIR);
	ofstream fileImagesList;	
	fileImagesList.open(C_STR_CALIBRATION_FILE_LIST);

	char buffer[1024];
	//char imgName[30];
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

////////////////////////////////////////////////////////////////////////////////////////////////////
/// <summary>	Loads calib matrces./ </summary>
///
/// <remarks>	Kristijan, 9/6/2014. </remarks>
///
/// <param name="M1">	[in,out] If non-null, the first Mat. </param>
/// <param name="D1">	[in,out] If non-null, the first Mat. </param>
/// <param name="M2">	[in,out] If non-null, the second Mat. </param>
/// <param name="D2">	[in,out] If non-null, the second Mat. </param>
/// <param name="R1">	[in,out] If non-null, the first Mat. </param>
/// <param name="R2">	[in,out] If non-null, the second Mat. </param>
/// <param name="P1">	[in,out] If non-null, the first Mat. </param>
/// <param name="P2">	[in,out] If non-null, the second Mat. </param>
/// <param name="Q"> 	[in,out] If non-null, the Mat* to process. </param>
///
/// <returns>	true if it succeeds, false if it fails. </returns>
////////////////////////////////////////////////////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////////////////////////////////////////
/// <summary>	Main entry-point for this application. </summary>
///
/// <remarks>	Kristijan, 9/6/2014. </remarks>
///
/// <param name="argc">	Number of command-line arguments. </param>
/// <param name="argv">	Array of command-line argument strings. </param>
///
/// <returns>	Exit-code for the process - 0 for success, else an error code. </returns>
////////////////////////////////////////////////////////////////////////////////////////////////////
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

	//WaitForSingleObject(h1, 10000); // wait for thread to exit, TIME is a DWORD in milliseconds
	//WaitForSingleObject(h2, 10000); // wait for thread to exit, TIME is a DWORD in milliseconds
	//CaptureFromCamera(C_INT_LEFT_CAM, C_STR_LEFT_WIN_TITLE);
	//CaptureFromCamera(C_INT_RIGHT_CAM, C_STR_RIGHT_WIN_TITLE);
	//waitKey(33);
	//}
	return 0;
}
#pragma endregion

//mean1 = Mat::zeros(480, 640, CV_32FC3); 
		//mean2 = Mat::zeros(480, 640, CV_32FC3);

		//for(int i = 1 ; i<= 2; i++)
		//{
		//	image1=cvQueryFrame(capture1);
		//	image2=cvQueryFrame(capture2);
		//	CvSize imgSize = { image1->width, image1->height};

		//	img = cvCreateImage(imgSize, IPL_DEPTH_8U, 1 );

		//	cvCvtColor( image1, img, CV_RGB2GRAY );
		//	Mat matImg1(img, CV_32FC3);

		//	cvCvtColor( image2, img, CV_RGB2GRAY );			
		//	Mat matImg2(img, CV_32FC3);

		//	//cvtColor(matImg1, greyMat1, CV_BGR2GRAY);
		//	//cvtColor(matImg2, greyMat2, CV_BGR2GRAY);

		//	accumulate(matImg1, mean1);
		//	accumulate(matImg2, mean2);				
		//}
		//mean1 *= (1.0/2);
		//mean2 *= (1.0/2);

		//mean1.convertTo(mean1, CV_8U);
		//mean2.convertTo(mean2, CV_8U);		