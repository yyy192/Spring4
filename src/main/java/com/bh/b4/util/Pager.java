package com.bh.b4.util;

public class Pager {

	// 검색
	private String kind;
	private String search;
	
	private Long pn;
	//한 페이지에 출력할 리스트의 글 개수 - 10
	private Long perPage;
	//한 페이지에 출력할 pn의 개수 - 5
	private Long perBlock;
	
	// RowNum Mapper에서 사용
	private Long startRow;
	private Long lastRow;
	
	private Long startNum;
	private Long lastNum;
	
	//전체 페이지의 개수 - 10개씩 몇 번까지 나오나?
	private Long totalPage;
	
	//------------------- rowNum 계산
	public void makeRow() {
		
		this.startRow = (this.getPn()-1)*this.getPerPage()+1;
		this.lastRow = this.getPn()*this.getPerPage();
	}
	
	//------------------- startNum, lastNum  jsp 번호 출력
	public void makeNum(Long totalCount) {
		//1. totlaCount 구하기
		//Long  totalCount = 211L;
		
		//2. totalPage 구하기
		totalPage = totalCount/this.getPerPage();
		
		if(totalCount%this.getPerPage() != 0) {
			//totalPage = totalPage + 1L;
			totalPage++;
		}
		
		//3. totalPage로 totalBlock구하기
		Long totalBlock = totalPage/this.getPerBlock();
		if(totalPage%this.getPerBlock() !=0) {
			totalBlock++;
		}
		
		//3-1.
		if(totalPage<this.getPn()) {
			this.setPn(totalPage);
		}
		
		//4. pn으로 curBlock(현재 block 번호) 구하기
		Long curBlock = this.getPn()/this.getPerBlock();
		if(this.getPn()%this.getPerBlock() !=0) {
			curBlock++;
		}
		
		//5. curBlock으로 시작번호와 마지막번호 구하기
		this.startNum = (curBlock-1)*5+1;
		this.lastNum = curBlock*5;
		
		//6. curBLock이 마지막 Block일 때
		if(curBlock == totalBlock) {
			this.lastNum = totalPage;
		}
	}
	
//----------------------- Setter, Getter -----------------------	
	
	public String getKind() {
		return kind;
	}

	
	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSearch() {
		if(this.search == null) {
			this.search ="";
		}
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
	public Long getTotalPage() {
		return totalPage;
	}

	public Long getStartNum() {
		return startNum;
	}

	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}

	public Long getLastNum() {
		return lastNum;
	}

	public void setLastNum(Long lastNum) {
		this.lastNum = lastNum;
	}

	public Long getPerBlock() {
		this.perBlock = 5L;
		return perBlock;
	}

	public void setPerBlock(Long perBlock) {
		this.perBlock = perBlock;
	}
	
	public Long getPerPage() {
		this.perPage=10L;
//		if(this.perPage==null || this.perPage==0) {
//			this.perPage=10L;
//		}
		return perPage;
	}

	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}
	
	public Long getPn() {
		if(this.pn==null || this.pn<=0) {
			this.pn=1L;
		}
		return pn;
	}
	public void setPn(Long pn) {
		this.pn = pn;
	}
	public Long getStartRow() {
		return startRow;
	}
	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}
	public Long getLastRow() {
		return lastRow;
	}
	public void setLastRow(Long lastRow) {
		this.lastRow = lastRow;
	}
}
