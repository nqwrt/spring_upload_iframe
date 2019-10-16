package edu.bit.ex;

import java.io.File;

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
	
	// xml占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쌀쏙옙占쏙옙占쏙옙
	//bean占쏙옙 id占쏙옙 uploadPath占쏙옙 占승그몌옙 占쏙옙占쏙옙
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	
	// url占쏙옙 占쏙옙占쏙옙占쏙옙 get占쏙옙占쏙옙占쏙옙占� 占싼억옙占�
	@RequestMapping(value="/upload/uploadForm", method = RequestMethod.GET)
	public void uploadForm() {
		// upload/uploadForm.jsp占쏙옙 占쏙옙占쏙옙占쏙옙
	}
	
	
	//占쏙옙占싸듸옙 占쏙옙튼 => 占쌈시듸옙占썰리占쏙옙占싸듸옙 => 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 file占쏙옙 占쏙옙占쏙옙 => 占쏙옙占쏙옙占쏙옙 占쏙옙占썰리占쏙옙 占쏙옙占쏙옙
	@RequestMapping(value = "/upload/uploadForm", method = RequestMethod.POST)
	public ModelAndView uploadForm(MultipartFile file, ModelAndView mav,HttpServletRequest req) throws Exception{
		
		String name = req.getParameter("memArea");
		logger.info("memArea" + name);
		
		logger.info("�뙆�씪�씠由�" + file.getOriginalFilename());
		String savedName = file.getOriginalFilename();
		
		logger.info("�뙆�씪�궗�씠利�:" + file.getSize());
		logger.info("�뙆�씪���엯" + file.getContentType());
		
		savedName = uploadFile(savedName,file.getBytes());
		mav.setViewName("upload/uploadResult");
		mav.addObject("saveName",savedName);
		return mav; // uploadResult.jsp
	}
	
	@RequestMapping(value = "/mypage/upload", method = RequestMethod.POST)
	public String  mypagUpload(MultipartFile file) throws Exception{
			
		if(file == null)
		{
			System.out.println("占쏙옙占쌉니댐옙.");			
		}
		
		logger.info("占쏙옙占쏙옙占싱몌옙:" + file.getOriginalFilename());
		String savedName = file.getOriginalFilename();
		
		logger.info("占쏙옙占쏙옙크占쏙옙:" + file.getSize());
		logger.info("占쏙옙占쏙옙트타占쏙옙:" + file.getContentType());
		
		savedName = uploadFile(savedName,file.getBytes());
		
		return "/upload/uploadResult"; // uploadResult.jsp	
	}
	
	@RequestMapping(value = "/mypage/edit", method = RequestMethod.POST)
	public String mypageInfo(MultipartFile file, HttpServletRequest req) throws Exception{
		
		String name = req.getParameter("memArea");
		logger.info("memArea" + name);
		

		return "/upload/uploadResult"; // uploadResult.jsp	
	}
	
	//占쏙옙占쏙옙占싱몌옙占쏙옙 占쌩븝옙占쏙옙占쏙옙 占십듸옙占쏙옙 처占쏙옙
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		
		//uuid 占쏙옙占쏙옙(Universal Unique IDentifier, 占쏙옙占쏙옙 占쏙옙占쏙옙 占식븝옙占쏙옙 , 占쏙옙占쏙옙占쏙옙占쏙옙 占쌘드를 占쏙옙占쏙옙爭�)
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		
		//占쌈시듸옙占썰리占쏙옙 占쏙옙占쏙옙占� 占쏙옙占싸듸옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙 占썰리占쏙옙 占쏙옙占쏙옙
		//FileCopyUtils.copy(占쏙옙占쏙옙트占썼열,占쏙옙占싹곤옙체)
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	
}

