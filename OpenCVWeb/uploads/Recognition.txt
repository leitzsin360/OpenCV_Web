#include <opencv2\opencv.hpp>
#include <tesseract\baseapi.h>
#include <leptonic\allheaders.h>

using namespace std;
using namespace cv;

class Recognition
{
public:
	Mat convertTo3Channels(const Mat& binImg);
	PIX* cvtMat2PIX(Mat imgGray);
	char* recognition(Mat t, char* lang);
};

Mat Recognition::convertTo3Channels(const Mat& binImg)
{
	Mat three_channel = Mat::zeros(binImg.rows, binImg.cols, CV_8UC3);
	vector<Mat> channels;
	for (int i = 0; i < 3; i++)
	{
		channels.push_back(binImg);
	}
	merge(channels, three_channel);
	return three_channel;
}

PIX* Recognition::cvtMat2PIX(Mat imgGray)
{
	int cols = imgGray.cols;
	int rows = imgGray.rows;

	PIX *pixS = pixCreate(cols, rows, 8);

	for (int i = 0; i < rows; i++)
		for (int j = 0; j < cols; j++)
			pixSetPixel(pixS, j, i, (l_uint32)imgGray.at<uchar>(i, j));
	return pixS;
}

char* Recognition::recognition(Mat t, char* lang)
{
	threshold(t, t, 255, 255, THRESH_BINARY_INV | THRESH_OTSU); //二值化
	t = convertTo3Channels(t);
	cvtColor(t, t, COLOR_BGR2GRAY); //灰度

	tesseract::TessBaseAPI tess;
	tess.Init(NULL, lang, tesseract::OEM_DEFAULT); //初始化
	tess.SetPageSegMode(tesseract::PSM_SINGLE_BLOCK); //识别模式
	tess.SetVariable("save_best_choices", "T");

	PIX *pixImage = cvtMat2PIX(t);
	tess.SetImage(pixImage);
	char* a = tess.GetUTF8Text();
	a[strlen(a) - 1] = 0;
	tess.Clear();
	return a;
}