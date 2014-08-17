#include <opencv/cv.h>
#include <opencv/highgui.h>

using namespace cv;

int main()
{
	Mat image;

	VideoCapture cap;
	cap.set(CV_CAP_PROP_FRAME_WIDTH, 640);
	cap.set(CV_CAP_PROP_FRAME_HEIGHT, 480);
	cap.open(1);

	namedWindow("window",1);
	while(1)
	{

		try
		{
			cap>>image;

			imshow("window",image);
		}
		catch (Exception& e)
		{
			const char* err_msg = e.what();
			std::cout << "exception caught: imshow:\n" << err_msg << std::endl;
		}
		waitKey(33);
	}
	return 0;
}