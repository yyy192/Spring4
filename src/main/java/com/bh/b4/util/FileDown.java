package com.bh.b4.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.bh.b4.board.BoardFilesDTO;

@Component
public class FileDown extends AbstractView{
	
	@Autowired
	private ServletContext servletContext;

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// model -> Controller의 Model
		
		//폴더명, fileName 출력하기
		String board = (String) model.get("board");
		
		//String realPath = this.servletContext.getRealPath("/resources/upload/"+board+"/");
		String realPath = request.getSession().getServletContext().getRealPath("/resources/upload/"+board+"/");
		
		BoardFilesDTO boardFilesDTO = (BoardFilesDTO) model.get("dto");
		String fileName = boardFilesDTO.getFileName();
		
		File file = new File(realPath, fileName);
		
		//한글 처리
		response.setCharacterEncoding("UTF-8");
		
		//파일 크기
		response.setContentLength((int) file.length());
		
		//다운 시 파일 이름 인코딩
		//String downName = URLEncoder.encode(boardFilesDTO.getOriName(), "UTF-8");
		String downName = fileName.substring(fileName.lastIndexOf("_")+1);
		
		//response header 설정
		response.setHeader("Content-Disposition", "attachment;fileName=\""+downName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		//파일을 읽어서 Client 전송
		FileInputStream fi = new FileInputStream(file);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(fi, os);
		
		//자원 사용 후 끊어주기
		os.close();
		fi.close();
		
	}

}
