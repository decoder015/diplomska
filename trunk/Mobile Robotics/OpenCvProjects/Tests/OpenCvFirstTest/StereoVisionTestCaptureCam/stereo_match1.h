//#include "stereovar.h"
#include <opencv\cxmisc.h>
#include <opencv\cvaux.h>
#include "opencv2/calib3d/calib3d.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/contrib/contrib.hpp"

#include <stdio.h>

using namespace cv;

Mat StereoMatch(Mat img1, Mat img2);
static void StereoCalib(const char* imageList, int nx, int ny, int useUncalibrated, float _squareSize);