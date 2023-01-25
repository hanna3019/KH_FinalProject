package com.yb.spring.board.model.vo;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Comments {
	
		private int cnum;
		private int bnum;
		private String cContent;
		public String getcContent() {
			return cContent;
		}
		public void setcContent(String cContent) {
			this.cContent = cContent;
		}
		public String getcWriter() {
			return cWriter;
		}
		public void setcWriter(String cWriter) {
			this.cWriter = cWriter;
		}
		private String cWriter;
		private String regDate;
		private String type;
		private String status;
		private int userNum;
		
		
		
	
}

