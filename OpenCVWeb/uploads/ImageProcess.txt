#include "Recognition.hpp"
#include <string>
#include <vector>

using namespace std;
using namespace cv;

#define	TARGET_MIN_SIZE		20
#define	TARGET_LEFT_ANGLE	75
#define	TARGET_RIGHT_ANGLE	15
#define	TARGET_MIN_RATIO	2.10f
#define	TARGET_MAX_RATIO	4.20f

#define	CHI_SIM				"chi_sim"
#define ENG					"eng"

class ImageProcess
{
private:
	Mat image;
	vector<Mat> recog_vec;
	string recog_ans;
	Recognition recog;

public:
	void getImage(Mat &img);
	vector<Mat> getRecogVec();
	string getRecogAns();
	bool  process(string &path, string &msg);

};

void ImageProcess::getImage(Mat &img)
{
	img = NULL;
	image.copyTo(img);
}

vector<Mat> ImageProcess::getRecogVec()
{
	return recog_vec;
}

string ImageProcess::getRecogAns()
{
	return recog_ans;
}

bool ImageProcess::process(string &path, string &msg)
{
	Mat img = imread(path);
	if (img.empty()) {
		msg = "加载图片失败，请检查路径是否正确！";
		return false;
	}
	img.copyTo(image);

#ifdef DEBUG
	imshow("待识别图像", img);
#endif

	Mat gray, hsv;
	cvtColor(img, gray, COLOR_BGR2GRAY);
	cvtColor(img, hsv, COLOR_BGR2HSV);
	inRange(hsv, Scalar(100, 80, 96), Scalar(124, 255, 255), hsv);
	threshold(hsv, hsv, 0, 255, THRESH_BINARY | THRESH_OTSU);
	dilate(hsv, hsv, getStructuringElement(MORPH_RECT, Size(3, 1)));

#ifdef DEBUG
	imshow("hsv", hsv);
#endif

	vector<vector<Point>> contours;
	vector<Vec4i> hierarchy;
	findContours(hsv, contours, hierarchy, RETR_EXTERNAL, CHAIN_APPROX_SIMPLE, Point());
	Mat ans(img);   //车牌
	bool isFind = false;
	for (int i = 0; i < contours.size(); i++)
	{
		if (contours[i].size() < TARGET_MIN_SIZE) continue;
		RotatedRect rect = minAreaRect(contours[i]);
		float realWidth = rect.size.width, realHeight = rect.size.height;
		if (fabs(rect.angle) >= TARGET_LEFT_ANGLE) swap(realWidth, realHeight);
		float ratio = realWidth / realHeight;
		bool if1 = ratio >= 2.1&&ratio <= 4.2;
		bool if2 = fabs(rect.angle) >= TARGET_LEFT_ANGLE || fabs(rect.angle <= TARGET_RIGHT_ANGLE);
		if (if1&&if2) {
			isFind = true;
			Rect r = rect.boundingRect2f();
			int w = r.width, h = r.height;
			ans = gray(Rect(r.tl() + Point2i(w / 21, h / 21), r.br() + Point2i(-w / 21, -h / 21)));

#ifdef DEBUG 
			cerr << "Target's size : " << contours[i].size() << endl;
			cerr << "Target's angle : " << rect.angle << endl;
#endif

			break;
		}
	}

	if (!isFind) {
		msg = "提取车牌失败(照片分辨率过低或较昏暗，能力有限，请见谅)";
		return false;
	}

#ifdef DEBUG
	imshow("车牌提取", ans);
#endif

	int r = ans.rows, c = ans.cols / 7;
	recog_vec.push_back(ans(Rect(c * 0, 0, c * 1, r))); //chi
	recog_vec.push_back(ans(Rect(c * 1, 0, c * 6, r))); //eng

#ifdef DEBUG
//车牌切割
	for (int i = 0; i < recog_vec.size(); i++) imshow(to_string(i), recog_vec[i]);
#endif

	recog_ans += recog.recognition(recog_vec.at(0), (char*)("chi_sim"));
	recog_ans += recog.recognition(recog_vec.at(1), (char*)("eng"));

	msg = recog_ans;
	return true;
}