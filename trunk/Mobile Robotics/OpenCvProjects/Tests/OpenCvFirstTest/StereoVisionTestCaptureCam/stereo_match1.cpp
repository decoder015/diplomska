/*
 *  stereo_match.cpp
 *  calibration
 *
 *  Created by Victor  Eruhimov on 1/18/10.
 *  Copyright 2010 Argus Corp. All rights reserved.
 *
 */
#include "stereo_match1.h"

#pragma region Functions
static void saveXYZ(const char* filename, const Mat& mat)
{
    const double max_z = 1.0e4;
    FILE* fp = fopen(filename, "wt");
    for(int y = 0; y < mat.rows; y++)
    {
        for(int x = 0; x < mat.cols; x++)
        {
            Vec3f point = mat.at<Vec3f>(y, x);
            if(fabs(point[2] - max_z) < FLT_EPSILON || fabs(point[2]) > max_z) continue;
            fprintf(fp, "%f %f %f\n", point[0], point[1], point[2]);
        }
    }
    fclose(fp);
}


//******************************************************************
// Given a list of chessboard images, the number of corners (nx, ny)
// on the chessboards, and a flag: useCalibrated for calibrated (0) or
// uncalibrated (1: use cvStereoCalibrate(), 2: compute fundamental
// matrix separately) stereo. Calibrate the cameras and display the
// rectified results along with the computed disparity images.
//*****************************************************************
void StereoCalib(const char* imageList, int nx, int ny, int useUncalibrated, float _squareSize)
{
	int displayCorners = 0;
	int showUndistorted = 1;
	bool isVerticalStereo = false;//OpenCV can handle left-right

	//or up-down camera arrangements
	const int maxScale = 1;
	const float squareSize = _squareSize; //Chessboard square size in cm

	//load image list file
	FILE* fileImagesList = fopen(imageList, "rt");

	int i, j, lr, nframes, n = nx*ny, N = 0;
	vector<string> imageNames[2];
	vector<CvPoint3D32f> objectPoints;
	vector<CvPoint2D32f> points[2];
	vector<int> npoints;
	vector<uchar> active[2];
	vector<CvPoint2D32f> temp(n);
	CvSize imageSize = {0,0};

	// ARRAY AND VECTOR STORAGE:
	double M1[3][3], M2[3][3], D1[5], D2[5];
	double R[3][3], T[3], E[3][3], F[3][3];
	double Q[4][4];

	CvMat _M1 = cvMat(3, 3, CV_64F, M1 );
	CvMat _M2 = cvMat(3, 3, CV_64F, M2 );
	CvMat _D1 = cvMat(1, 5, CV_64F, D1 );
	CvMat _D2 = cvMat(1, 5, CV_64F, D2 );
	CvMat _R = cvMat(3, 3, CV_64F, R );
	CvMat _T = cvMat(3, 1, CV_64F, T );
	CvMat _E = cvMat(3, 3, CV_64F, E );
	CvMat _F = cvMat(3, 3, CV_64F, F );
	CvMat _Q = cvMat(4,4, CV_64F, Q);

	//show window
	if( displayCorners )
		cvNamedWindow( "corners", 1 );

	// READ IN THE LIST OF CHESSBOARDS:
	if( !fileImagesList )
	{
		fprintf(stderr, "can not open file %s\n", imageList );
		return;
	}

	for(i=0;;i++)
	{
		char buf[1024];
		int count = 0, result=0;

		lr = i % 2;
		vector<CvPoint2D32f>& pts = points[lr];

		//read list of images
		if( !fgets( buf, sizeof(buf)-3, fileImagesList))
			break;

		size_t len = strlen(buf);

		while( len > 0 && isspace(buf[len-1]))
			buf[--len] = '\0';

		if( buf[0] == '#')
			continue;

		IplImage* img = cvLoadImage( buf, 0 );
		if( !img ) break;

		imageSize = cvGetSize(img);
		imageNames[lr].push_back(buf);

		//FIND CHESSBOARDS AND CORNERS THEREIN:
		for( int s = 1; s <= maxScale; s++ )
		{
			IplImage* timg = img;
			if( s > 1 )
			{
				timg = cvCreateImage(cvSize(img->width*s,img->height*s), img->depth, img->nChannels );
				cvResize( img, timg, CV_INTER_CUBIC );
			}
			result = cvFindChessboardCorners( timg, cvSize(nx, ny),	&temp[0], &count, CV_CALIB_CB_ADAPTIVE_THRESH | CV_CALIB_CB_NORMALIZE_IMAGE);
			if( timg != img )
				cvReleaseImage( &timg );

			if( result || s == maxScale )
				for( j = 0; j < count; j++ )
				{
					temp[j].x /= s;
					temp[j].y /= s;
				}
				if( result ) break;
		}

		//show image with corners or dots in cmd
		if( displayCorners )
		{
			printf("%s\n", buf);
			IplImage* cimg = cvCreateImage( imageSize, 8, 3 );
			cvCvtColor( img, cimg, CV_GRAY2BGR );

			cvDrawChessboardCorners( cimg, cvSize(nx, ny), &temp[0], count, result );
			cvShowImage( "corners", cimg );
			cvReleaseImage( &cimg );

			//Allow ESC to quit
			if( cvWaitKey(0) == 27 ) 
				exit(-1);
		}
		//display progress bar
		else
			putchar('.');

		N = pts.size();
		pts.resize(N + n, cvPoint2D32f(0,0));
		active[lr].push_back((uchar)result);

		//assert( result != 0 );
		if( result )
		{
			//Calibration will suffer without subpixel interpolation
			cvFindCornerSubPix( img, &temp[0], count, cvSize(11, 11), cvSize(-1,-1),
								cvTermCriteria(CV_TERMCRIT_ITER+CV_TERMCRIT_EPS,
								30, 0.01) );

			copy( temp.begin(), temp.end(), pts.begin() + N );
		}
		cvReleaseImage( &img );
	}

	//close image list file
	fclose(fileImagesList);
	printf("\n");

	// HARVEST CHESSBOARD 3D OBJECT POINT LIST:
	// Number of good chessboads found
	nframes = active[0].size();
	objectPoints.resize(nframes*n);

	for( i = 0; i < ny; i++ )
		for( j = 0; j < nx; j++ )
			objectPoints[i*nx + j] = cvPoint3D32f(i*squareSize, j*squareSize, 0);

	for( i = 1; i < nframes; i++ )
		copy( objectPoints.begin(), objectPoints.begin() + n,objectPoints.begin() + i*n );

	npoints.resize(nframes,n);
	N = nframes*n;
	CvMat _objectPoints = cvMat(1, N, CV_32FC3, &objectPoints[0] );
	CvMat _imagePoints1 = cvMat(1, N, CV_32FC2, &points[0][0] );
	CvMat _imagePoints2 = cvMat(1, N, CV_32FC2, &points[1][0] );
	CvMat _npoints = cvMat(1, npoints.size(), CV_32S, &npoints[0] );
	cvSetIdentity(&_M1);
	cvSetIdentity(&_M2);
	cvZero(&_D1);
	cvZero(&_D2);

	// CALIBRATE THE STEREO CAMERAS
	printf("Running stereo calibration ...");
	fflush(stdout);

	cvStereoCalibrate(&_objectPoints, &_imagePoints1,
					  &_imagePoints2, &_npoints,
					  &_M1, &_D1, &_M2, &_D2,
		              imageSize, 
					  &_R, &_T, &_E, &_F,
		              cvTermCriteria(CV_TERMCRIT_ITER+CV_TERMCRIT_EPS, 100, 1e-5),
					  CV_CALIB_FIX_ASPECT_RATIO + CV_CALIB_ZERO_TANGENT_DIST + CV_CALIB_SAME_FOCAL_LENGTH 
					 );
	printf(" done\n");

	// CALIBRATION QUALITY CHECK
	// because the output fundamental matrix implicitly
	// includes all the output information,
	// we can check the quality of calibration using the
	// epipolar geometry constraint: m2^t*F*m1=0
	vector<CvPoint3D32f> lines[2];
	points[0].resize(N);
	points[1].resize(N);

	_imagePoints1 = cvMat(1, N, CV_32FC2, &points[0][0] );
	_imagePoints2 = cvMat(1, N, CV_32FC2, &points[1][0] );

	lines[0].resize(N);
	lines[1].resize(N);

	CvMat _L1 = cvMat(1, N, CV_32FC3, &lines[0][0]);
	CvMat _L2 = cvMat(1, N, CV_32FC3, &lines[1][0]);

	//Always work in undistorted space
	cvUndistortPoints( &_imagePoints1, &_imagePoints1, &_M1, &_D1, 0, &_M1 );
	cvUndistortPoints( &_imagePoints2, &_imagePoints2, &_M2, &_D2, 0, &_M2 );
	cvComputeCorrespondEpilines( &_imagePoints1, 1, &_F, &_L1 );
	cvComputeCorrespondEpilines( &_imagePoints2, 2, &_F, &_L2 );

	double avgErr = 0;
	for( i = 0; i < N; i++ )
	{
		double err = fabs(points[0][i].x*lines[1][i].x +
			points[0][i].y*lines[1][i].y + lines[1][i].z)
			+ fabs(points[1][i].x*lines[0][i].x +
			points[1][i].y*lines[0][i].y + lines[0][i].z);
		avgErr += err;
	}
	printf( "avg err = %g\n", avgErr/(nframes*n) );
	//COMPUTE AND DISPLAY RECTIFICATION
	if( showUndistorted )
	{
		CvMat* mx1 = cvCreateMat( imageSize.height,
			imageSize.width, CV_32F );
		CvMat* my1 = cvCreateMat( imageSize.height,
			imageSize.width, CV_32F );
		CvMat* mx2 = cvCreateMat( imageSize.height,

			imageSize.width, CV_32F );
		CvMat* my2 = cvCreateMat( imageSize.height,
			imageSize.width, CV_32F );
		CvMat* img1r = cvCreateMat( imageSize.height,
			imageSize.width, CV_8U );
		CvMat* img2r = cvCreateMat( imageSize.height,
			imageSize.width, CV_8U );
		CvMat* disp = cvCreateMat( imageSize.height,
			imageSize.width, CV_16S );
		CvMat* vdisp = cvCreateMat( imageSize.height,
			imageSize.width, CV_8U );
		CvMat* pair;
		double R1[3][3], R2[3][3], P1[3][4], P2[3][4];
		CvMat _R1 = cvMat(3, 3, CV_64F, R1);
		CvMat _R2 = cvMat(3, 3, CV_64F, R2);
		// IF BY CALIBRATED (BOUGUET'S METHOD)
		if( useUncalibrated == 0 )
		{
			CvMat _P1 = cvMat(3, 4, CV_64F, P1);
			CvMat _P2 = cvMat(3, 4, CV_64F, P2);
			cvStereoRectify( &_M1, &_M2, &_D1, &_D2, imageSize,
				&_R, &_T,
				&_R1, &_R2, &_P1, &_P2, &_Q,
				0/*CV_CALIB_ZERO_DISPARITY*/ );
			isVerticalStereo = fabs(P2[1][3]) > fabs(P2[0][3]);
			//Precompute maps for cvRemap()
			cvInitUndistortRectifyMap(&_M1,&_D1,&_R1,&_P1,mx1,my1);
			cvInitUndistortRectifyMap(&_M2,&_D2,&_R2,&_P2,mx2,my2);

			//Save parameters
			cvSave("M1.xml",&_M1);
			cvSave("D1.xml",&_D1);
			cvSave("R1.xml",&_R1);
			cvSave("P1.xml",&_P1);
			cvSave("M2.xml",&_M2);
			cvSave("D2.xml",&_D2);
			cvSave("R2.xml",&_R2);
			cvSave("P2.xml",&_P2);
			cvSave("Q.xml",&_Q);
			cvSave("mx1.xml",mx1);
			cvSave("my1.xml",my1);
			cvSave("mx2.xml",mx2);
			cvSave("my2.xml",my2);

		}
		//OR ELSE HARTLEY'S METHOD
		else if( useUncalibrated == 1 || useUncalibrated == 2 )
			// use intrinsic parameters of each camera, but
			// compute the rectification transformation directly
			// from the fundamental matrix
		{
			double H1[3][3], H2[3][3], iM[3][3];
			CvMat _H1 = cvMat(3, 3, CV_64F, H1);
			CvMat _H2 = cvMat(3, 3, CV_64F, H2);
			CvMat _iM = cvMat(3, 3, CV_64F, iM);
			//Just to show you could have independently used F
			if( useUncalibrated == 2 )
				cvFindFundamentalMat( &_imagePoints1,
				&_imagePoints2, &_F);
			cvStereoRectifyUncalibrated( &_imagePoints1,
				&_imagePoints2, &_F,
				imageSize,
				&_H1, &_H2, 3);
			cvInvert(&_M1, &_iM);
			cvMatMul(&_H1, &_M1, &_R1);
			cvMatMul(&_iM, &_R1, &_R1);
			cvInvert(&_M2, &_iM);
			cvMatMul(&_H2, &_M2, &_R2);
			cvMatMul(&_iM, &_R2, &_R2);
			//Precompute map for cvRemap()
			cvInitUndistortRectifyMap(&_M1,&_D1,&_R1,&_M1,mx1,my1);

			cvInitUndistortRectifyMap(&_M2,&_D1,&_R2,&_M2,mx2,my2);
		}
		else
			assert(0);
		cvNamedWindow( "rectified", 1 );
		// RECTIFY THE IMAGES AND FIND DISPARITY MAPS
		if( !isVerticalStereo )
			pair = cvCreateMat( imageSize.height, imageSize.width*2,
			CV_8UC3 );
		else
			pair = cvCreateMat( imageSize.height*2, imageSize.width,
			CV_8UC3 );
		//Setup for finding stereo corrrespondences
		CvStereoBMState *BMState = cvCreateStereoBMState();
		assert(BMState != 0);
		BMState->preFilterSize=41;
		BMState->preFilterCap=31;
		BMState->SADWindowSize=41;
		BMState->minDisparity=-64;
		BMState->numberOfDisparities=128;
		BMState->textureThreshold=10;
		BMState->uniquenessRatio=15;
		for( i = 0; i < nframes; i++ )
		{
			IplImage* img1=cvLoadImage(imageNames[0][i].c_str(),0);
			IplImage* img2=cvLoadImage(imageNames[1][i].c_str(),0);
			if( img1 && img2 )
			{
				CvMat part;
				cvRemap( img1, img1r, mx1, my1 );
				cvRemap( img2, img2r, mx2, my2 );
				if( !isVerticalStereo || useUncalibrated != 0 )
				{
					// When the stereo camera is oriented vertically,
					// useUncalibrated==0 does not transpose the
					// image, so the epipolar lines in the rectified
					// images are vertical. Stereo correspondence
					// function does not support such a case.
					cvFindStereoCorrespondenceBM( img1r, img2r, disp,
						BMState);
					cvNormalize( disp, vdisp, 0, 256, CV_MINMAX );
					cvNamedWindow( "disparity" );
					cvShowImage( "disparity", vdisp );
				}
				if( !isVerticalStereo )
				{
					cvGetCols( pair, &part, 0, imageSize.width );
					cvCvtColor( img1r, &part, CV_GRAY2BGR );
					cvGetCols( pair, &part, imageSize.width,
						imageSize.width*2 );
					cvCvtColor( img2r, &part, CV_GRAY2BGR );
					for( j = 0; j < imageSize.height; j += 16 )
						cvLine( pair, cvPoint(0,j),
						cvPoint(imageSize.width*2,j),
						CV_RGB(0,255,0));
				}
				else
				{
					cvGetRows( pair, &part, 0, imageSize.height );
					cvCvtColor( img1r, &part, CV_GRAY2BGR );
					cvGetRows( pair, &part, imageSize.height,
						imageSize.height*2 );
					cvCvtColor( img2r, &part, CV_GRAY2BGR );
					for( j = 0; j < imageSize.width; j += 16 )
						cvLine( pair, cvPoint(j,0),
						cvPoint(j,imageSize.height*2),
						CV_RGB(0,255,0));
				}
				cvShowImage( "rectified", pair );
				if( cvWaitKey() == 27 )
					break;
			}
			cvReleaseImage( &img1 );
			cvReleaseImage( &img2 );
		}
		cvReleaseStereoBMState(&BMState);
		cvReleaseMat( &mx1 );
		cvReleaseMat( &my1 );
		cvReleaseMat( &mx2 );
		cvReleaseMat( &my2 );
		cvReleaseMat( &img1r );
		cvReleaseMat( &img2r );
		cvReleaseMat( &disp );
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////
/// <summary>	Stereo match. </summary>
///
/// <remarks>	Kristijan, 9/5/2014. </remarks>
///
/// <param name="img1">	[in,out] If non-null, the first image. </param>
/// <param name="img2">	[in,out] If non-null, the second image. </param>
/// <param name="M1">  	[in,out] If non-null, the first Mat. </param>
/// <param name="D1">  	[in,out] If non-null, the first Mat. </param>
/// <param name="M2">  	[in,out] If non-null, the second Mat. </param>
/// <param name="D2">  	[in,out] If non-null, the second Mat. </param>
/// <param name="R1">  	[in,out] If non-null, the first Mat. </param>
/// <param name="P1">  	[in,out] If non-null, the first Mat. </param>
/// <param name="R2">  	[in,out] If non-null, the second Mat. </param>
/// <param name="P2">  	[in,out] If non-null, the second Mat. </param>
/// <param name="Q">   	[in,out] If non-null, the Mat* to process. </param>
///
/// <returns>	A Mat. </returns>
////////////////////////////////////////////////////////////////////////////////////////////////////
Mat StereoMatch(Mat* img1, Mat* img2, Mat* M1, Mat* D1, Mat* M2, Mat* D2, Mat* R1, Mat* P1, Mat* R2, Mat* P2, Mat* Q)
{
	//const char* algorithm_opt = "--algorithm=";
	//const char* maxdisp_opt = "--max-disparity=";
	//const char* blocksize_opt = "--blocksize=";
	//const char* nodisplay_opt = "--no-display";
	//const char* scale_opt = "--scale=";
	//const char* img1_filename = 0;
	//const char* img2_filename = 0;    
	//const char* disparity_filename = 0;
	//const char* point_cloud_filename = 0;

	//algo type
	enum { STEREO_BM=0, STEREO_SGBM=1, STEREO_HH=2, STEREO_VAR=3 };
	int alg = STEREO_SGBM;

	int SADWindowSize = 0, numberOfDisparities = 0;
	bool no_display = false;
	float scale = 1.f;

	StereoBM bm;
	StereoSGBM sgbm;
	StereoVar var;

	//resize if needed
	if( scale != 1.f )
	{
		Mat temp1, temp2;
		int method = scale < 1 ? INTER_AREA : INTER_CUBIC;
		resize(*img1, temp1, Size(), scale, scale, method);
		*img1 = temp1;

		resize(*img2, temp2, Size(), scale, scale, method);
		*img2 = temp2;
	}

	Size img_size = img1->size();
	numberOfDisparities = numberOfDisparities > 0 ? numberOfDisparities : ((img_size.width/8) + 15) & -16;	

	*M1 *= scale;
	*M2 *= scale;	

	Mat map11, map12, map21, map22;
	initUndistortRectifyMap(*M1, *D1, *R1, *P1, img_size, CV_16SC2, map11, map12);
	initUndistortRectifyMap(*M2, *D2, *R2, *P2, img_size, CV_16SC2, map21, map22);

	Mat img1r, img2r;
	remap(*img1, *img1, map11, map12, INTER_LINEAR);
	remap(*img2, *img2, map21, map22, INTER_LINEAR);
	
	bm.state->preFilterCap = 31;
	bm.state->SADWindowSize = SADWindowSize > 0 ? SADWindowSize : 9;
	bm.state->minDisparity = 0;
	bm.state->numberOfDisparities = numberOfDisparities;
	bm.state->textureThreshold = 10;
	bm.state->uniquenessRatio = 15;
	bm.state->speckleWindowSize = 100;
	bm.state->speckleRange = 32;
	bm.state->disp12MaxDiff = 1;

	sgbm.preFilterCap = 63;
	sgbm.SADWindowSize = SADWindowSize > 0 ? SADWindowSize : 3;

	int cn = img1->channels();

	sgbm.P1 = 8*cn*sgbm.SADWindowSize*sgbm.SADWindowSize;
	sgbm.P2 = 32*cn*sgbm.SADWindowSize*sgbm.SADWindowSize;
	sgbm.minDisparity = 8;
	sgbm.numberOfDisparities = numberOfDisparities;
	sgbm.uniquenessRatio = 10;
	sgbm.speckleWindowSize = bm.state->speckleWindowSize;
	sgbm.speckleRange = bm.state->speckleRange;
	sgbm.disp12MaxDiff = 1;
	sgbm.fullDP = alg == STEREO_HH;

	var.levels = 3;                                 // ignored with USE_AUTO_PARAMS
	var.pyrScale = 0.5;                             // ignored with USE_AUTO_PARAMS
	var.nIt = 25;
	var.minDisp = -numberOfDisparities;
	var.maxDisp = 0;
	var.poly_n = 3;
	var.poly_sigma = 0.0;
	var.fi = 15.0f;
	var.lambda = 0.03f;
	var.penalization = var.PENALIZATION_TICHONOV;   // ignored with USE_AUTO_PARAMS
	var.cycle = var.CYCLE_V;                        // ignored with USE_AUTO_PARAMS
	var.flags = var.USE_SMART_ID | var.USE_AUTO_PARAMS | var.USE_INITIAL_DISPARITY | var.USE_MEDIAN_FILTERING ;

	Mat disp, disp8;	

	
	if( alg == STEREO_BM )
	{
		bm(*img1, *img2, disp);
	}
	else if( alg == STEREO_VAR ) 
	{
		var(*img1, *img2, disp);
	}
	else if( alg == STEREO_SGBM || alg == STEREO_HH )
	{
		sgbm(*img1, *img2, disp);
	}
	

	//disp8 = disp.colRange(numberOfDisparities, img1->cols);
	if( alg != STEREO_VAR )
		disp.convertTo(disp8, CV_8U, 255/(numberOfDisparities*16.));
	else
		disp.convertTo(disp8, CV_8U);
	
	//fflush(stdout);
	
	return disp8;
}
#pragma endregion

#pragma region Code

/* if(disparity_filename)
	imwrite(disparity_filename, disp8);*/

	/*  if(point_cloud_filename)
	{
	printf("storing the point cloud...");
	fflush(stdout);
	Mat xyz;
	reprojectImageTo3D(disp, xyz, Q, true);
	saveXYZ(point_cloud_filename, xyz);
	printf("\n");
	}*/

//if( !no_display )
	//{
	//    //namedWindow("left", 1);
	//    //imshow("left", img1);
	//    //namedWindow("right", 1);
	//   // imshow("right", img2);
	//    namedWindow("disparity", 0);
	//    imshow("disparity", disp8);
	//    //printf("press any key to continue...");
	//   
	//   // waitKey();
	//    //printf("\n");
	//}

	//Mat img1p, img2p, dispp;
	//copyMakeBorder(img1, img1p, 0, 0, numberOfDisparities, 0, IPL_BORDER_REPLICATE);
	//copyMakeBorder(img2, img2p, 0, 0, numberOfDisparities, 0, IPL_BORDER_REPLICATE);

	/*for( int i = 1; i < argc; i++ )
	{
	if( argv[i][0] != '-' )
	{
	if( !img1_filename )
	img1_filename = argv[i];
	else
	img2_filename = argv[i];
	}
	else if( strncmp(argv[i], algorithm_opt, strlen(algorithm_opt)) == 0 )
	{
	char* _alg = argv[i] + strlen(algorithm_opt);
	alg = strcmp(_alg, "bm") == 0 ? STEREO_BM :
	strcmp(_alg, "sgbm") == 0 ? STEREO_SGBM :
	strcmp(_alg, "hh") == 0 ? STEREO_HH :
	strcmp(_alg, "var") == 0 ? STEREO_VAR : -1;
	if( alg < 0 )
	{
	printf("Command-line parameter error: Unknown stereo algorithm\n\n");
	print_help();
	return -1;
	}
	}
	else if( strncmp(argv[i], maxdisp_opt, strlen(maxdisp_opt)) == 0 )
	{
	if( sscanf( argv[i] + strlen(maxdisp_opt), "%d", &numberOfDisparities ) != 1 ||
	numberOfDisparities < 1 || numberOfDisparities % 16 != 0 )
	{
	printf("Command-line parameter error: The max disparity (--maxdisparity=<...>) must be a positive integer divisible by 16\n");
	print_help();
	return -1;
	}
	}
	else if( strncmp(argv[i], blocksize_opt, strlen(blocksize_opt)) == 0 )
	{
	if( sscanf( argv[i] + strlen(blocksize_opt), "%d", &SADWindowSize ) != 1 ||
	SADWindowSize < 1 || SADWindowSize % 2 != 1 )
	{
	printf("Command-line parameter error: The block size (--blocksize=<...>) must be a positive odd number\n");
	return -1;
	}
	}
	else if( strncmp(argv[i], scale_opt, strlen(scale_opt)) == 0 )
	{
	if( sscanf( argv[i] + strlen(scale_opt), "%f", &scale ) != 1 || scale < 0 )
	{
	printf("Command-line parameter error: The scale factor (--scale=<...>) must be a positive floating-point number\n");
	return -1;
	}
	}
	else if( strcmp(argv[i], nodisplay_opt) == 0 )
	no_display = true;
	else if( strcmp(argv[i], "-i" ) == 0 )
	intrinsic_filename = argv[++i];
	else if( strcmp(argv[i], "-e" ) == 0 )
	extrinsic_filename = argv[++i];
	else if( strcmp(argv[i], "-o" ) == 0 )
	disparity_filename = argv[++i];
	else if( strcmp(argv[i], "-p" ) == 0 )
	point_cloud_filename = argv[++i];
	else
	{
	printf("Command-line parameter error: unknown option %s\n", argv[i]);
	return -1;
	}
	}

	if( !img1_filename || !img2_filename )
	{
	printf("Command-line parameter error: both left and right images must be specified\n");
	return -1;
	}

	if( (intrinsic_filename != 0) ^ (extrinsic_filename != 0) )
	{
	printf("Command-line parameter error: either both intrinsic and extrinsic parameters must be specified, or none of them (when the stereo pair is already rectified)\n");
	return -1;
	}

	if( extrinsic_filename == 0 && point_cloud_filename )
	{
	printf("Command-line parameter error: extrinsic and intrinsic parameters must be specified to compute the point cloud\n");
	return -1;
	}*/
	//int color_mode = alg == STEREO_BM ? 0 : -1;
	//Mat img1 = imread(img1_filename, color_mode);
	//Mat img2 = imread(img2_filename, color_mode);
	//Mat Q;
	//// reading intrinsic parameters
	//FileStorage fs(intrinsic_filename, CV_STORAGE_READ);
	//if(!fs.isOpened())
	//{
	//    printf("Failed to open file %s\n", intrinsic_filename);
	//   // return ;
	//}
	/*Mat M1, D1, M2, D2;
	fs["M1"] >> M1;
	fs["D1"] >> D1;
	fs["M2"] >> M2;
	fs["D2"] >> D2;*/

	//fs.open(extrinsic_filename, CV_STORAGE_READ);
	//if(!fs.isOpened())
	//{
	//    printf("Failed to open file %s\n", extrinsic_filename);
	//    //return -1;
	//}
	//Mat R, T, R1, P1, R2, P2;
	/*fs["R"] >> R;
	fs["T"] >> T;
	stereoRectify( M1, D1, M2, D2, img_size, R, T, R1, R2, P1, P2, Q, CALIB_ZERO_DISPARITY, -1, img_size, &roi1, &roi2 );*/
	//fs["R1"] >> R1;
	//fs["R2"] >> R2;
	//fs["P1"] >> P1;
	//fs["P2"] >> P2;
	//fs["Q"] >> Q;
#pragma endregion