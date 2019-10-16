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
	
	// xml�� ������ ���ҽ�����
	//bean�� id�� uploadPath�� �±׸� ����
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	
	// url�� ������ get������� �Ѿ��
	@RequestMapping(value="/upload/uploadForm", method = RequestMethod.GET)
	public void uploadForm() {
		// upload/uploadForm.jsp�� ������
	}
	
	
	//���ε� ��ư => �ӽõ��丮���ε� => ���������� file�� ���� => ������ ���丮�� ����
	@RequestMapping(value = "/upload/uploadForm", method = RequestMethod.POST)
	public ModelAndView uploadForm(MultipartFile file, ModelAndView mav,HttpServletRequest req) throws Exception{
		
		String name = req.getParameter("memArea");
		logger.info("memArea" + name);
		
		logger.info("파일이름" + file.getOriginalFilename());
		String savedName = file.getOriginalFilename();
		
		logger.info("파일사이즈:" + file.getSize());
		logger.info("파일타입" + file.getContentType());
		
		savedName = uploadFile(savedName,file.getBytes());
		mav.setViewName("upload/uploadResult");
		mav.addObject("saveName",savedName);
		return mav; // uploadResult.jsp
	}
	
	@RequestMapping(value = "/mypage/edit", method = RequestMethod.POST)
	public String mypageInfo(MultipartFile file, HttpServletRequest req) throws Exception{
		
		String name = req.getParameter("memArea");
		logger.info("memArea" + name);
		
		if(file == null)
		{
			System.out.println("���Դϴ�.");			
		}
		
		logger.info("�����̸�:" + file.getOriginalFilename());
		String savedName = file.getOriginalFilename();
		
		logger.info("����ũ��:" + file.getSize());
		logger.info("����ƮŸ��:" + file.getContentType());
		
		savedName = uploadFile(savedName,file.getBytes());
	
		return "/upload/uerEdit"; // uploadResult.jsp�� ������	
	}
	
	//�����̸��� �ߺ����� �ʵ��� ó��
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		
		//uuid ����(Universal Unique IDentifier, ���� ���� �ĺ��� , �������� �ڵ带 ����)
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		
		//�ӽõ��丮�� ����� ���ε�� ������ ������ �� �丮�� ����
		//FileCopyUtils.copy(����Ʈ�迭,���ϰ�ü)
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	
}

