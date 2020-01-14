#include "ImageProcess.hpp"
#include <fstream>
using namespace std;

int main()
{
    ImageProcess ip;
    string msg;
	ifstream in("D:\\OpenCV_Web\\OpenCVWeb\\uploads\\img.txt");
    string path;
	in >> path;
	in.close();

    bool isDone = ip.process(path,msg);

	ofstream out("D:\\OpenCV_Web\\OpenCVWeb\\uploads\\buffer.txt");
	out << msg;
	out.close();
    
    #define SHOW_PICTURE
    #undef  SHOW_PICTURE
    #ifdef SHOW_PICTURE
    Mat img;
    ip.getImage(img);
    imshow("待识别图像", img);
    waitKey(0);
    #endif

    return 0;
}