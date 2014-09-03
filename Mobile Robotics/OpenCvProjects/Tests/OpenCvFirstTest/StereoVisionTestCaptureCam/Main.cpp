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

#include "stereo_match1.h"

using namespace cv;
using namespace std;

#pragma region Constants
#define C_INT_LEFT_CAM  0
#define C_INT_RIGHT_CAM 1

#define C_STR_LEFT_WIN_TITLE "Left camera"
#define C_STR_RIGHT_WIN_TITLE "Right camera"
#pragma endregion

#pragma region Functions
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
#pragma endregion


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

void  TestCapture()
{
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

   IplImage * image1=0;
   IplImage * image2=0;

   Mat disp;

   cvNamedWindow("Grab1");
   cvNamedWindow("Grab2");
   while(1)
   {
      image1=cvQueryFrame(capture1);
      image2=cvQueryFrame(capture2);

      if(!image1||!image2)
         break;

	 disp = StereoMatch(image1, image2);

      cvShowImage("Grab1",image1);
      cvShowImage("Grab2",image2);
	  imshow("Disparaty",disp);
	  //imshow("right", img2);
      int key=cvWaitKey(10);
      if(27==key)
         break;
   }
   cvReleaseCapture(&capture1);
   cvReleaseCapture(&capture2);

   cvDestroyWindow("Grab1");
   cvDestroyWindow("Grab2");

   //return 0;
}



#pragma region Main
int main()
{	
	TestCapture();
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