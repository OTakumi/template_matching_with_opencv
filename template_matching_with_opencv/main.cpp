#include "main.h"
#include <iostream>
#include <cstdint>
#include <opencv2/opencv.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

#define OPENCV_VERSION(a, b, c)		(((a) << 16) + ((b) << 8) + (c))

void TakeTemplateImage(void);
cv::Mat MakePyr(cv::Mat, int32_t);
void PatternMatching(cv::Mat, cv::Mat);

int16_t main(void)
{
#if(_DEBUG)
	std::cout << "OpenCV version:" << CV_VERSION << std::endl;
#endif

	TakeTemplateImage();

}

/// <summary>
/// カメラを起動し、テンプレート画像を取得する
/// </summary>
void TakeTemplateImage(void)
{
	// Open the camera device
	cv::VideoCapture capture(0);

	// デバイスエラー時の処理
	if (!capture.isOpened())
	{
		std::cout << "Camera error" << std::endl;
	}

	// 撮影したフレーム
	cv::Mat frame;

	while (capture.read(frame))
	{
		imshow("win", frame);
		const int key = cv::waitKey(1);

		// qが押されたとき画面を閉じる
		if (key == 'q')
		{
			break;
		}
		// aが押されたとき画像を保存する
		else if (key == 'a')
		{
			std::ostringstream file_name;
			time_t time_result = time(nullptr);
			file_name << "./template_image/image_" << time_result << ".jpg";
			std::cout << file_name.str() << std::endl;
			imwrite(file_name.str(), frame);
		}
	}
	cv::destroyAllWindows();
}
/// <summary>
/// 画像ピラミッドを生成
/// http://opencv.jp/sample/pyramid.html
/// </summary>
/// <param name="src"> 入力画像。ここでは、マッチングのためのテンプレート画像 </param>
/// <param name="magnif"> 出力画像の倍率 </param>
/// <returns> 解像度変更された画像 </returns>
cv::Mat MakePyr(cv::Mat src, int32_t mag)
{
	cv::Mat dst = src;

	for (int32_t i = 0; i < mag; i++)
		cv::pyrDown(dst, dst);

	return dst;
}

void TemplateMatching(cv::Mat src, cv::Mat template_image)
{
	std::int32_t sad_min = INT_MAX;
	std::int32_t sad_x = 0;
	std::int32_t sad_y = 0;

	// 第一段階
	cv::Mat src1_4 = MakePyr(src, 2);  // ４分の１の入力画像
	cv::Mat tmp1_4 = MakePyr(template_image, 2);  // ４分の１のテンプレート画像
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

	// 第二段階
	cv::Mat src1_2 = MakePyr(src, 1);  // ２分の１の入力画像
	cv::Mat tmp1_2 = MakePyr(template_image, 1);  // ２分の１のテンプレート画像
	sad_min = INT_MAX;
	int yyy = sad_y * 2;  // 画像が２倍の大きさになるので２倍
	int xxx = sad_x * 2;
	// テンプレート画像サイズの周囲±１ピクセルの範囲を探索
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

	// 第三段階
	cv::Mat src1_1 = src.clone();  // 元画像と同じ大きさの入力画像
	cv::Mat tmp1_1 = template_image.clone();  // 元画像と同じ大きさのテンプレート画像
	sad_min = INT_MAX;
	int yy = sad_y * 2;  // 画像が２倍の大きさになるので２倍
	int xx = sad_x * 2;
	// テンプレート画像サイズの周囲±１ピクセルの範囲を探索
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

	// テンプレートマッチング位置を四角で囲む
	cv::Mat rect = src.clone();
	rectangle(rect, cv::Point(sad_x, sad_y), cv::Point(sad_x + template_image.cols, sad_y + template_image.rows), cv::Scalar(0, 0, 200), 3, 4);
	cv::namedWindow("Rectangle", cv::WINDOW_AUTOSIZE);  // ウィンドウ表示の準備
	imshow("Rectangle", rect);  // ウィンドウで表示
	imwrite("build.jpg", rect);  // 画像として出力

	std::cout << "３段階SAD法" << std::endl;
	// マッチした座標（左上）とそのときのsad値を表示
	std::cout << "(" << sad_x << ", " << sad_y << ") " << sad_min << std::endl;
}