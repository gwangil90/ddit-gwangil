package kr.or.ddit.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ICommandHandler {
	/**
	 * 각 커맨드마다 구체적인 작업을 정의한 커맨드 핸들러 메소드
	 * @param req
	 * @param resp
	 * @return 논리적인 view name
	 * @throws IOException
	 * @throws ServletException
	 */
	public String process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException;
}
