package com.bh.b4.member;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.bh.b4.util.FileManager;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private HttpSession session;
	@Autowired
	private ServletContext servletContext;
	
	
	
	
	public int setUpdate(MemberDTO memberDTO) throws Exception {
		return memberDAO.setUpdate(memberDTO);
	}
	
	public int setDelete(MemberDTO memberDTO) throws Exception {
		//파일 삭제하기
		
		//1. 어떤 폴더
		String realpath = this.servletContext.getRealPath("/resources/upload/member/");
		
		//2. 어떤 파일
		MemberFilesDTO memberFilesDTO = memberDAO.getFile(memberDTO);
		if(memberFilesDTO!=null) {
			String fileName = memberFilesDTO.getFileName();
			
			//3. 파일 삭제
			File file = new File(realpath, fileName);
			file.delete();
		}
		
		return memberDAO.setDelete(memberDTO);
	}
	
	public int setJoin(MemberDTO memberDTO, MultipartFile photo, HttpSession session) throws Exception {
		int result = memberDAO.setJoin(memberDTO);
		
		if(photo != null) {
			//1. 어느 폴더에 저장
			//   /resources/upload/member - 운영체제가 저장하도록 맡기기
			//2. application(ServletContext) 객체로 저장할 실제 경로 구하기
			//ServletContext sContext = this.session.getServletContext();
			String realPath = this.servletContext.getRealPath("/resources/upload/member/");
			System.out.println("RealPath : "+realPath);
			
			//3. 폴더 확인
			File file = new File(realPath);
			  
			if(!file.exists()) {
				file.mkdirs();
			}
			
			//4. 중복되지 않는 파일 이름 생성
			//a. 시간 -> 밀리세컨즈
			//b. UUID
			String fileName = UUID.randomUUID().toString();
			
			//확장자명까지 포함한 fileName
			fileName = fileName+"_"+photo.getOriginalFilename();
			System.out.println("FileName : "+fileName);
			
			//폴더와 파일명 정보
			file = new File(file, fileName);
			
			//5. 폴더에 파일 저장
			//1) MultipartFile의 transferTo 메서드 사용
			//photo.transferTo(file);
			
			//2) Spring의 API FileCopyUtils의 copy static 메서드 사용
			FileCopyUtils.copy(photo.getBytes(), file);
			
			MemberFilesDTO memberFilesDTO = new MemberFilesDTO();
			memberFilesDTO.setId(memberDTO.getId());
			memberFilesDTO.setFileName(fileName);
			memberFilesDTO.setOriName(photo.getOriginalFilename());
			result = memberDAO.setFileInsert(memberFilesDTO);
		}
		
		return result;
	}
	
	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception {
		return memberDAO.getLogin(memberDTO);
	}
	
	public MemberDTO getIdCheck(MemberDTO memberDTO) throws Exception {
		return memberDAO.getIdCheck(memberDTO);
	}
	
	public MemberFilesDTO getFile(MemberDTO memberDTO) throws Exception {
		return memberDAO.getFile(memberDTO);
	}

}
