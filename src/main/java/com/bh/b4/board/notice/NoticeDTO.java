package com.bh.b4.board.notice;

import java.util.List;

import com.bh.b4.board.BoardDTO;
import com.bh.b4.board.BoardFilesDTO;

public class NoticeDTO extends BoardDTO {
	
	//is a
	//has s
	private List<BoardFilesDTO> files;

	//-------------- setter, getter
	
	public List<BoardFilesDTO> getFiles() {
		return files;
	}

	public void setFiles(List<BoardFilesDTO> files) {
		this.files = files;
	}
	
}
