#include <opencv\cxmisc.h>
#include <opencv\cvaux.h>
#include "opencv2/calib3d/calib3d.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/contrib/contrib.hpp"

#include <stdio.h>

using namespace cv;

Mat StereoMatch(Mat* img1, Mat* img2, Mat* M1, Mat* D1, Mat* M2, Mat* D2, Mat* R1, Mat* P1, Mat* R2, Mat* P2, Mat* Q);
void StereoCalib(const char* imageList, int nx, int ny, int useUncalibrated, float _squareSize);