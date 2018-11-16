package kr.or.ddit.web.homepage;

public enum LeftMenu {
	GUGUDAN("/01/gugudanForm.html"),
	GUGUDANPROCESS("/gugudan.do"),
	MUSIC("/02/musicForm.jsp"),
	CALENDAR("/01/Calendar.jsp"),
	IMAGE("/imageForm");
	private String link;
	LeftMenu(String link) {
		this.link = link;
	}
	public String getLink() {
		return link;
	}
}
