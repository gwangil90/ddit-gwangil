package kr.or.ddit.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/***
 * 
 * @author pc06
 *
 */
public class CookieUtil {
	private HttpServletRequest request;
	Map<String, Cookie> cookieMap = new LinkedHashMap<>();
	
	public CookieUtil(HttpServletRequest request) {
		super();
		this.request = request;
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie tmp : cookies) {
				cookieMap.put(tmp.getName(), tmp);
			}
		}
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	private void generateCookieMap(HttpServletRequest request) {
		cookieMap.clear();
		Cookie[] cookie = request.getCookies();
		if(cookie != null) {
			for(Cookie tmp : cookie) {
				cookieMap.put(tmp.getName(), tmp);
			}
		}
	}
	
	private static String enc = "UTF-8";
	public static void setEnc(String enc) {
		CookieUtil.enc = enc;
	}
	/**
	 * 이름으로 쿠키 검색
	 * @param name
	 * @return 존재하지 않는 경우 null반환
	 */
	public Cookie getCookie(String name){
		return cookieMap.get(name);
	}
	/**
	 * 이름으로 검색 후 value 획득(UTF-8방식의디코딩)
	 * @param name
	 * @return
	 */
	public String getCookieValue(String name) {
		try {
			String value = null;
			if(cookieMap.containsKey(name)) {
				value = URLDecoder.decode(cookieMap.get(name).getValue(),enc);
			}
			return value;
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static Cookie createCookie(String name, String value) {
		try {
			value = URLEncoder.encode(value, enc);
			Cookie cookie = new Cookie(name,value);
			return cookie;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	/**
	 * 쿠키 생성
	 * @param name 쿠키명
	 * @param value 쿠키값(UTF-8인코딩)
	 * @param maxAge 초단위 만료시간
	 * @return
	 */
	public static enum TextType{PATH, DOMAIN};
	
	public static Cookie createCookie(String name, String value, int maxAge){
		Cookie cookie = createCookie(name, value);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
	/**
	 * 
	 * @param name 이름
	 * @param value 값
	 * @param path 도메인이나 경로로 사용함
	 * @param type type에 따라 위의 경로가 결정되는 enum 상수
	 * @return
	 */
	public static Cookie createCookie(String name, String value, String path, TextType type) {
		Cookie cookie = createCookie(name, value);
		if(type == TextType.PATH) {
			cookie.setPath(path);
		}else if(type == TextType.DOMAIN) {
			cookie.setDomain(path);
		}
		return cookie;
	}
	/**
	 * 
	 * @param name
	 * @param value
	 * @param path
	 * @param type
	 * @param maxAge
	 * @return
	 */
	public static Cookie createCookie(String name, String value, String path, TextType type, int maxAge) {
		Cookie cookie = createCookie(name, value);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
	/**
	 * 
	 * @param name
	 * @param value
	 * @param domain
	 * @param path
	 * @return
	 */
	public static Cookie createCookie(String name, String value, String domain, String path) {
		Cookie cookie = createCookie(name, value);
		cookie.setPath(path);
		cookie.setDomain(domain);
		return cookie;
	}
	/**
	 * 
	 * @param name
	 * @param value
	 * @param domain
	 * @param path
	 * @return
	 */
	public static Cookie createCookie(String name, String value, String domain, String path, int maxAge) {
		Cookie cookie = createCookie(name, value, domain, path);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
	
}
