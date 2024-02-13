package beauty;

import org.opencv.core.CvType;
import org.opencv.core.Mat;
import org.opencv.core.Size;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Test1 {
	public static void main(String[] args) {
		System.loadLibrary(org.opencv.core.Core.NATIVE_LIBRARY_NAME);
		String imageLocation = "/resources/images/temp.png";
		Mat imageRead = Imgcodecs.imread(imageLocation, Imgcodecs.CV_LOAD_IMAGE_UNCHANGED);
		Mat image = new Mat();
		Imgproc.resize(imageRead, image, new Size(28, 28));
		Mat data = new Mat(14, 14, CvType.CV_8UC3);
		System.out.println(image.row(14));
		System.out.println(image.col(14));
	}
}