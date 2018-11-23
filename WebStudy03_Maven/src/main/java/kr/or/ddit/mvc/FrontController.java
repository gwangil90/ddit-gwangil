package kr.or.ddit.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 프론트 컨트롤 영역
 */
//4.로직 선택
//5.모델확보
//6.뷰 선택
//7.모델공유
//3~7까지는 여기서 해결 못하는 부분, 커맨드 헨들러에서 처리 가능한 영역이다. 어떤 뷰, 어떤 방식의 이동이 처리되어지는지 결정이 되어져야 한다. 

public class FrontController extends HttpServlet {
	//URIHandlerMapping.properties는 키, 값의 쌍으로 이루어진 형태르 취하고 있다.
	//키는 String타입, 값은 모든 커맨드 핸들러의 최상위는 ICommendHandler를 취하고 있다.
	private Map<String, ICommandHandler> handlerMap;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		handlerMap = new HashMap<>();
		ResourceBundle bundle = ResourceBundle.getBundle("kr.or.ddit.URIHandlerMapping");
		Set<String> keySet = bundle.keySet();
		for(String uri : keySet) {
			String qualifiedName = bundle.getString(uri);
			try {
				Class<ICommandHandler> handlerClz = (Class<ICommandHandler>) Class.forName(qualifiedName.trim());
				ICommandHandler handler = handlerClz.newInstance();//리플렉션 과정???
				handlerMap.put(uri.trim(), handler); //습관적으로 띄워주는 공백 제거
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) { //InstantiationException : 인스턴스를 생성하는 과정에서 기본생성자가 없어서 생성을 못할 경우 발생하는 예외
				System.err.printf("%s에 대한 핸들러 : %s 에서 문제 발생 %s\n",uri,qualifiedName,e.getMessage()); //요청, 핸들러, 예외에대한 정보 ->continue로
				continue; //예외처리를 할 수 없으니까 넘겨버리겠다.
			}
		}
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8"); //요청이 받아들여지기 전에 제일 먼저 진행되어야 하는 부분!
		//1.요청을 받기 위해 일단 요청과의 등록과 매핑설정을 하자. --> web.xml에 설정했음.
		//2.요청이 오면 분석을 하자. -클라이언트 입장에서는 요청에 대한 세부사항(음식으로 비유하면 싫어하는 재료를 빼주세요 같은 세세함)을 전달할 수 있어야 한다.
		// 주소분석, 파라미터 넘기는 짓거리, 메소드, 헤더분석 등의 세가지 파트를 분석하는 과정이 필요하다.
		String uri = req.getRequestURI(); //이 영역에서는 주소만 해결 가능, 파라미터, 메소드, 헤더등은 요청의 종류에 따라 다르다.
//		/member/memberList.do
		int cpLength = req.getContextPath().length();
		uri = uri.substring(cpLength).split(";")[0];
		
		System.out.println(uri);
		ICommandHandler handler = handlerMap.get(uri);
		//3.의존관계 형성
		
		
		if(handler == null) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND, "해당 서비스 없음, 꺼지셈.");
			return;
		}
		
		
		
		//8.이동방식을 결정하고 V.L로 이동을 한다.
		String view = handler.process(req, resp);
		String prefix = "/WEB-INF/views/";
		String suffix = ".jsp";
		if(view!=null) {			
			boolean redirect = view.startsWith("redirect:");
			if(redirect) {
				view = view.substring("redirect:".length()); //redirect: 이후의 문자를 잘라내서 다시 view에 저장
				resp.sendRedirect(req.getContextPath()+view);
			}else {
				RequestDispatcher rd = req.getRequestDispatcher(prefix+view+suffix);
				rd.forward(req, resp);
			}
		}else {
			//커맨드 핸들러에서 상태코드가 결정되어 오는지의 여부를 조건으로 지정해서 처리한다.
			if(!resp.isCommitted()) {
				resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,"커맨드 핸들러에서 뷰가 선택되지 않았습니다."); //500에러, 개발자의 미스를 의미
			}
		}
			
		
	}
}