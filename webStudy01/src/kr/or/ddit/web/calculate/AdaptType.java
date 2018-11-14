package kr.or.ddit.web.calculate;

public enum AdaptType {
	
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
	
	
	ANDROID("안드로이드"),
	IP ("IOS"),
	WINDOWS("PC"),
	OTHER("기타");

	private String adaptType;

    AdaptType(String adaptType) { 
    	this.adaptType = adaptType;
    }

    public String getAdaptType() {
    	return this.adaptType;
    }
    
	public static AdaptType selectType(String userAgent) {
    	AdaptType result = AdaptType.OTHER;
    	
    	AdaptType[] types = values();
    	for(AdaptType adt : types) {
    		if(userAgent.toUpperCase().contains(adt.name())) {
    			result = adt;
    			break;
    		}
    	}
    	return result;
    }


}
