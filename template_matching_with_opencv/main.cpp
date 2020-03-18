#include "main.h"
#include <iostream>
#include <opencv2/opencv.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

#define OPENCV_VERSION(a, b, c)		(((a) << 16) + ((b) << 8) + (c))

using namespace std;
using namespace cv;

void TakeTemplateImage(void);
Mat MakePyr(Mat, int32_t);
void PatternMatching(Mat, Mat);

int16_t main(void)
{
#if(_DEBUG)
	cout << "OpenCV version is " << CV_VERSION << endl;
#endif

	TakeTemplateImage();

}

/// <summary>
/// �J�������N�����A�e���v���[�g�摜���擾����
/// </summary>
void TakeTemplateImage(void)
{
	// Open the camera device
	VideoCapture capture(0);

	// �f�o�C�X�G���[���̏���
	if (!capture.isOpened())
	{
		cout << "Camera error" << endl;
	}

	// �B�e�����t���[��
	Mat frame;

	while (capture.read(frame))
	{
		imshow("win", frame);
		const int key = waitKey(1);

		// q�������ꂽ�Ƃ���ʂ����
		if (key == 'q')
		{
			break;
		}
		// a�������ꂽ�Ƃ��摜��ۑ�����
		else if (key == 'a')
		{
			ostringstream file_name;
			time_t time_result = time(nullptr);
			file_name << "./template_image/image_" << time_result << ".jpg";
			cout << file_name.str() << endl;
			imwrite(file_name.str(), frame);
		}
	}
	destroyAllWindows();
}
/// <summary>
/// �摜�s���~�b�h�𐶐�
/// http://opencv.jp/sample/pyramid.html
/// </summary>
/// <param name="src"> ���͉摜�B�����ł́A�}�b�`���O�̂��߂̃e���v���[�g�摜 </param>
/// <param name="magnif"> �o�͉摜�̔{�� </param>
/// <returns> �𑜓x�ύX���ꂽ�摜 </returns>
Mat MakePyr(Mat src, int32_t mag)
{
	Mat dst = src;

	for (int32_t i = 0; i < mag; i++)
		pyrDown(dst, dst);

	return dst;
}

void TemplateMatching(Mat src, Mat template_image)
{
	int32_t sad_min = INT_MAX;
	int32_t sad_x = 0;
	int32_t sad_y = 0;

	// ���i�K
	Mat src1_4 = MakePyr(src, 2);  // �S���̂P�̓��͉摜
	Mat tmp1_4 = MakePyr(template_image, 2);  // �S���̂P�̃e���v���[�g�摜
	for (int y = 0; y < src1_4.rows - tmp1_4.rows; y++)
	{
		for (int x = 0; x < src1_4.cols - tmp1_4.cols; x++)
		{
			int sad = 0;
			for (int j = 0; j < tmp1_4.rows; j++)
			{
				for (int i = 0; i < tmp1_4.cols; i++)
				{
					sad += abs((int)src1_4.at<uchar>(y + j, x + i) - (int)tmp1_4.at<uchar>(j, i));
					if (sad > sad_min) goto SSDA_loop1;
				}
			}
			sad_min = sad;
			sad_x = x;
			sad_y = y;
		SSDA_loop1:;
		}
	}

	// ���i�K
	Mat src1_2 = MakePyr(src, 1);  // �Q���̂P�̓��͉摜
	Mat tmp1_2 = MakePyr(template_image, 1);  // �Q���̂P�̃e���v���[�g�摜
	sad_min = INT_MAX;
	int yyy = sad_y * 2;  // �摜���Q�{�̑傫���ɂȂ�̂łQ�{
	int xxx = sad_x * 2;
	// �e���v���[�g�摜�T�C�Y�̎��́}�P�s�N�Z���͈̔͂�T��
	for (int y = yyy - 1; y <= yyy + 1 && y < src1_2.rows - tmp1_2.rows; y++)
	{
		for (int x = xxx - 1; x <= xxx + 1 && x < src1_2.cols - tmp1_2.cols; x++)
		{
			int sad = 0;
			for (int j = 0; j < tmp1_2.rows; j++)
			{
				for (int i = 0; i < tmp1_2.cols; i++)
				{
					sad += abs((int)src1_2.at<uchar>(y + j, x + i) - (int)tmp1_2.at<uchar>(j, i));
					if (sad > sad_min) goto SSDA_loop2;
				}
			}
			sad_min = sad;
			sad_x = x;
			sad_y = y;
		SSDA_loop2:;
		}
	}

	// ��O�i�K
	Mat src1_1 = src.clone();  // ���摜�Ɠ����傫���̓��͉摜
	Mat tmp1_1 = template_image.clone();  // ���摜�Ɠ����傫���̃e���v���[�g�摜
	sad_min = INT_MAX;
	int yy = sad_y * 2;  // �摜���Q�{�̑傫���ɂȂ�̂łQ�{
	int xx = sad_x * 2;
	// �e���v���[�g�摜�T�C�Y�̎��́}�P�s�N�Z���͈̔͂�T��
	for (int y = yy - 1; y <= yy + 1 && y < src1_1.rows - tmp1_1.rows; y++)
	{
		for (int x = xx - 1; x <= xx + 1 && x < src1_1.cols - tmp1_1.cols; x++)
		{
			int sad = 0;
			for (int j = 0; j < tmp1_1.rows; j++)
			{
				for (int i = 0; i < tmp1_1.cols; i++)
				{
					sad += abs((int)src1_1.at<uchar>(y + j, x + i) - (int)tmp1_1.at<uchar>(j, i));
					if (sad > sad_min) goto SSDA_loop3;
				}
			}
			sad_min = sad;
			sad_x = x;
			sad_y = y;
		SSDA_loop3:;
		}
	}

	// �e���v���[�g�}�b�`���O�ʒu���l�p�ň͂�
	Mat rect = src.clone();
	rectangle(rect, Point(sad_x, sad_y), Point(sad_x + template_image.cols, sad_y + template_image.rows), Scalar(0, 0, 200), 3, 4);
	namedWindow("Rectangle", WINDOW_AUTOSIZE);  // �E�B���h�E�\���̏���
	imshow("Rectangle", rect);  // �E�B���h�E�ŕ\��
	imwrite("build.jpg", rect);  // �摜�Ƃ��ďo��

	cout << "�R�i�KSAD�@" << endl;
	// �}�b�`�������W�i����j�Ƃ��̂Ƃ���sad�l��\��
	cout << "(" << sad_x << ", " << sad_y << ") " << sad_min << endl;
}