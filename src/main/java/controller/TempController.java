package controller;

import javax.servlet.ServletContext;

import org.opencv.core.Core;
import org.opencv.core.CvType;
import org.opencv.core.Mat;
import org.opencv.core.Size;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TempController {

	static final String VIEWPATH = "/WEB-INF/views";
	
	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = "/")
	public String main() {
		return "redirect:/temp.do";
	}

	@RequestMapping(value = { "/temp.do" })
	public String temp() {
		return VIEWPATH + "/main/temp.jsp";
	}

	@RequestMapping(value = "/top.do")
	public String temptop() {
		return VIEWPATH + "/comp/top.jsp";
	}

	@RequestMapping(value = "/header.do")
	public String temphead() {
		return VIEWPATH + "/comp/header.jsp";
	}

	@RequestMapping(value = "/index.do")
	public String goindex() {
		return VIEWPATH + "/main/index.jsp";
	}

	@RequestMapping(value = "/footer.do")
	public String gofooter() {
		return VIEWPATH + "/comp/footer.jsp";
	}

	@RequestMapping(value = "/test.do")
	public String test() {
		//에러 추측 : 빌드패스 설정누락? 아마도.. 근데 하는법을 잘모르겠어요ㅠ
		nu.pattern.OpenCV.loadShared();
		System.loadLibrary(org.opencv.core.Core.NATIVE_LIBRARY_NAME);
		String imageLocation = servletContext.getRealPath("/resources/images/temp.png");
		
		Mat imageRead = Imgcodecs.imread(imageLocation, Imgcodecs.CV_LOAD_IMAGE_UNCHANGED);
		Mat image = new Mat();
		if(imageRead.empty()) {
		    System.out.println("이미지 로드 실패: " + imageLocation);
		} else {
		    Imgproc.resize(imageRead, image, new Size(28, 28));
		}
		
		// Mat data = new Mat(14, 14, CvType.CV_8UC3);
		//System.out.println(image.row(14));
		//System.out.println(image.col(14));
		return "/WEB-INF/views/test.jsp";
	}
}
