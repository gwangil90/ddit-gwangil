package kr.or.ddit.web.calculate;

public enum BrowserType {
	
	/* 	if(userAgent.contains("ANDROID")){
	if(userAgent.contains("Firefox")){
		browser = String.format(format, "브라우저","파이어폭스");
		adapter = String.format(format, "접속기기", "안드로이드");
	}else if(userAgent.contains("Chrome")){
		browser = String.format(format, "크롬");
		adapter = String.format(format, "접속기기", "안드로이드");
	}else if(userAgent.contains("Trident")){
		browser = String.format(format, "익스플로러");
		adapter = String.format(format, "접속기기", "안드로이드");
	}
}else if(userAgent.contains("iP")){
	if(userAgent.contains("Firefox")){
		browser = String.format(format, "브라우저", "파이어폭스");
		adapter = String.format(format, "접속기기", "ios");
	}else if(userAgent.contains("Chrome")){
		browser = String.format(format, "브라우저", "크롬");
		adapter = String.format(format, "접속기기", "ios");
	}else if(userAgent.contains("Trident")){
		browser = String.format(format, "브라우저", "익스플로러");
		adapter = String.format(format, "접속기기", "ios");
	}
}else if(userAgent.contains("Windows")){
	if(userAgent.contains("Firefox")){
		browser = String.format(format, "브라우저", "파이어폭스");
		adapter = String.format(format, "접속기기", "pc");
	}else if(userAgent.contains("Chrome")){
		browser = String.format(format, "브라우저", "크롬");
		adapter = String.format(format, "접속기기", "pc");
	}else if(userAgent.contains("Trident")){
		browser = String.format(format, "브라우저", "익스플로러");
		adapter = String.format(format, "접속기기", "pc");
	}
} */
	
	//접속방법 android, ios, window
	//접속브라우저 firefox, chrome explorer
	
	FIREFOX("파이어폭스"),CHROME("크롬"),TRIDENT("익스플로러"),OTHER("기타 브라우저");
	
	private String browserType;
	
	BrowserType(String browserType) {
		this.browserType = browserType;
	}

	public String getBrowserType() {
		return browserType;
	}

	public static BrowserType selectBrowserType(String userAgent) {
		BrowserType result = BrowserType.OTHER;
    	
		BrowserType[] types = values();
    	for(BrowserType bt : types) {
    		if(userAgent.toUpperCase().contains(bt.name())) {
    			result = bt;
    			break;
    		}
    	}
    	return result;
	}
	
	
}
