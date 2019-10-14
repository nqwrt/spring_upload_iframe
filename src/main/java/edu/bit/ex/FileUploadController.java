package edu.bit.ex;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class FileUploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	
	// xml에 설정된 리소스참조
	//bean의 id가 uploadPath인 태그를 참조
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	
	// url은 같지만 get방식으로 넘어옴
	@RequestMapping(value="/upload/uploadForm", method = RequestMethod.GET)
	public void uploadForm() {
		// upload/uploadForm.jsp로 포워딩
	}
	
	
	//업로드 버튼 => 임시디렉토리업로드 => 파일정보가 file에 저장 => 지정된 디렉토리에 저장
	@RequestMapping(value = "/upload/uploadForm", method = RequestMethod.POST)
	public ModelAndView uploadForm(MultipartFile file, ModelAndView mav,HttpServletRequest req) throws Exception{
		
		String name = req.getParameter("name");
		logger.info("그냥이름:" + name);
		
		logger.info("파일이름:" + file.getOriginalFilename());
		String savedName = file.getOriginalFilename();
		
		logger.info("파일크기:" + file.getSize());
		logger.info("컨텐트타입:" + file.getContentType());
		
		savedName = uploadFile(savedName,file.getBytes());
		mav.setViewName("upload/uploadResult");
		mav.addObject("saveName",savedName);
		return mav; // uploadResult.jsp로 포워딩	
	}
	
	//파일이름이 중복되지 않도록 처리
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		
		//uuid 생성(Universal Unique IDentifier, 범용 고유 식별자 , 랜덤으로 코드를 만들어냄)
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		
		//임시디렉토리에 저장된 업로드된 파일을 지정된 디렉 토리로 복사
		//FileCopyUtils.copy(바이트배열,파일객체)
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	
}

