package controller;

import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.core.MatOfRect;
import org.opencv.core.Rect;
import org.opencv.core.Scalar;
import org.opencv.core.Size;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;
import org.opencv.objdetect.CascadeClassifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import nu.pattern.OpenCV;

@Controller
public class OpenCVController {

    @RequestMapping("/getcolor.do")
    public String processImage() {
        OpenCV.loadShared();
        System.loadLibrary(Core.NATIVE_LIBRARY_NAME);

        //이미지 경로 삽입
        String image_path = "C:/back4_spring/work/Opencv/face_img/face3.jpg"; 
        int[] averageColor = extractFaceColor(image_path);
        
        if (averageColor != null) {
            System.out.println("Average Face Color (RGB): R: " + averageColor[0] + " G: " + averageColor[1] + " B: " + averageColor[2]);
        } else {
            System.out.println("No face detected.");
        }
        
        return "itworkswell";
    }

    //미리 함수를 만들어두는 식으로 사용
    public static int[] extractFaceColor(String image_path) {
        // Load the image
        Mat image = Imgcodecs.imread(image_path);

        // Convert the image to RGB
        Mat image_rgb = new Mat();
        Imgproc.cvtColor(image, image_rgb, Imgproc.COLOR_BGR2RGB);

        // Load the pre-trained face detector from OpenCV(얼굴 학습데이터파일(xml) 경로 삽입)
        CascadeClassifier faceCascade = new CascadeClassifier("C:/back4_spring/work/Opencv/face_haarcascade/haarcascade_frontalface_default.xml");

        // Detect faces in the image (얼굴부위 추출)
        MatOfRect faces = new MatOfRect();
        faceCascade.detectMultiScale(image_rgb, faces, 1.1, 5, 0, new Size(30, 30), new Size());

        if (!faces.empty()) {
            // Take the first detected face 얼굴 틀이되는 배열 생성
            Rect face = faces.toArray()[0];

            // Extract the region of interest (ROI) which is the face 생성한 얼굴 틀에 원본이미지 적용
            Mat face_roi = new Mat(image_rgb, face);

            // Calculate the average color of the face 틀에 잡힌 평균 색상 계산
            Scalar averageColor = Core.mean(face_roi);
            int[] rgb = new int[] { (int) averageColor.val[0], (int) averageColor.val[1], (int) averageColor.val[2] };

            //Scalar 값이기 때문에 색상이 아닌, 위치 값도 있음
            System.out.println(rgb);
            
            return rgb;
        } else {
            return null;
        }
        
    }
    
}