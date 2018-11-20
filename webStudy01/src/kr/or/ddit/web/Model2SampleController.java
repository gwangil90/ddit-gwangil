package kr.or.ddit.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.web.model2.SampleModelGenerator;

//was에 등록 및 매핑을 위한 어노테이션 설정, web.xml도 있지만 그건 귀찮음.
@WebServlet("/model2Sample.do")
public class Model2SampleController extends HttpServlet{
	
	//여기는 요청에 대한 분석이 이루어지는 곳이다.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 요청 분석
		//2. 의존 객체 생성 - 어떤 객체가 다른 객체를 사용하는 상황을 의미
		SampleModelGenerator generator = new SampleModelGenerator();
		//3. 로직 메소드를 호출 - 여기서는 generator.generate()을 호출한다는 뜻이다.
		String model = generator.generate();
		//4. 데이터 공유 -scope를 사용하는데 이때는 데이터의 이동방식이 뭐냐에 따라 달라진다.
		req.setAttribute("model", model);
		//5. 뷰레이어를 선택
		String view = "/WEB-INF/views/model2SampleView.jsp";
		//6. 이동 - 핵심은 WEB-INF, 서버내, 그리고 WEB-INF에 요청이 닿아야하기 때문에 Dispatch방식밖에 없다.
		RequestDispatcher rd = req.getRequestDispatcher(view); //서버가 사용하는 쪽이기 때문에 서버사이드방식의 경로 표기가 이루어져있어야 한다.
		rd.forward(req, resp);
	}
}
