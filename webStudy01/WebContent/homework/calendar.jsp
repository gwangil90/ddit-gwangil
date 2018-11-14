<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	//Locale객체 가져오기
	String lang = request.getParameter("lang");
	System.out.println("lang = "+lang);
	Locale currentLocale = request.getLocale();
	if(lang!=null && lang.trim().length()!=0){
		currentLocale = Locale.forLanguageTag(lang);
		System.out.println("currentLocale.toLanguageTag() = "+currentLocale.toLanguageTag());
	}

	//달력객체 생성 
    Calendar cal = Calendar.getInstance();
	
	//현재년도 가져옴 
	String yearStr = request.getParameter("y");
	
	int year;
	//검증 
	if(yearStr == null || yearStr.trim().length() == 0 ){
		year = cal.get(Calendar.YEAR);
	}else {
		year = Integer.parseInt(request.getParameter("y"));
	}
	//System.out.println(year);
	
	//현재달 가져옴
	String monthStr = request.getParameter("m");
	
	int month;
	//검증 
	if(monthStr == null || monthStr.trim().length() == 0 ){
		month = cal.get(Calendar.MONTH);
	}else {
		month = Integer.parseInt(request.getParameter("m"))-1;
	}
	//System.out.println(month);
	//현재 달력객체의 년,월,일을 설정하는 메소드 set()으로 해당월의 첫날로 설정
    cal.set(year, month, 1);
    int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);

    // 다음/이전월 계산
    // - MONTH 계산시 표기월로 계산하기 때문에 +1을 한 상태에서 계산함
    int prevYear = year;
    int prevMonth = (month + 1) - 1;
    int nextYear = year;
    int nextMonth = (month  + 1) + 1;

    // 1월인 경우 이전년 12월로 지정
    if (prevMonth < 1) {
        prevYear--;
        prevMonth = 12;
    }

    // 12월인 경우 다음년 1월로 지정
    if (nextMonth > 12) {
        nextYear++;
        nextMonth = 1;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar homework</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>
	$(function() {
		//콤보 체인지이벤트
		$("[name='lang']").on("change", function() {
			document.langForm.submit();
		});
	});
</script>
<style>
	table {
		border : 1px solid green;
	}
	
	tr, td {
		border : 1px solid lightgreen;
	}
</style>
</head>
<body>
	<%
		//콤보를 채우기위한 locale 객체 배열 생성
		//Locale[] locales = Locales.getAvailableLocales();
		Locale[] locales = Calendar.getAvailableLocales();
	%>
<form name="langForm">
언어선택 : <select name="lang">
			<option value="">언어선택</option>
			<%
				//Locale combo 채우기
				String optPattern = "<option value='%s' %s>%s</option>";
				for(Locale tmp : locales){
					String value = tmp.toLanguageTag();
					String text = tmp.getDisplayLanguage();
					String selected = "";
					
					if(currentLocale.equals(tmp)){
						selected = "selected='selected'";
					}
					
					if(text!=null && text.trim().length() != 0){
						out.println(String.format(optPattern, value, selected, text));
					}
				}
			%>
		</select>
</form>
<br>


    <!-- 전월 후월 클릭버튼 get방식으로 데이터 전송  -->
    <h3>
    <a href="./calendar.jsp?y=<%=prevYear%>&m=<%=prevMonth%>&lang=<%=currentLocale.toLanguageTag()%>">←</a>
    <a href="./yearselect.jsp" ><%=year%> - <%=cal.getDisplayName(Calendar.MONTH, Calendar.LONG, currentLocale)%></a>
    <a href="./calendar.jsp?y=<%=nextYear%>&m=<%=nextMonth%>&lang=<%=currentLocale.toLanguageTag()%>">→</a>
	</h3>

        <table>
        <tr>
            <%
            //요일 세팅 (주의 : 한글로 때려박으면 한글만 출력되고 언어안바뀜.. 다바꿔줄줄알앗는디..)
            Calendar calDay = Calendar.getInstance();
            for(int i = 1; i <= 7; i++){
            	calDay.set(Calendar.DAY_OF_WEEK, i);
                String dayOfWeekStr = calDay.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.SHORT, currentLocale);
                out.print("<td>" + dayOfWeekStr + "</td>");
             }
            %>
        </tr>
        <tr>
			<%
			    // 시작요일까지 이동
			    for (int i=1; i<bgnWeek; i++){
			    	out.println("<td>&nbsp;</td>");
			    }
			
			    // 첫날~마지막날까지 처리
			    // - 날짜를 하루씩 이동하여 월이 바뀔때까지 그린다
			    // 토요일 파랑, 일요일 빨강, 평일 검정
			    while (cal.get(Calendar.MONTH) == month) {
			    	if(cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY){
			    		out.println("<td><font color='red'>" + cal.get(Calendar.DATE) + "</font></td>");
			    	}else if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY){
			    		out.println("<td><font color='blue'>" + cal.get(Calendar.DATE) + "</font></td>");
			    	}else{
			    		out.println("<td>" + cal.get(Calendar.DATE) + "</td>");
			    	}
			        
			        // 토요일인 경우 줄바꿔서 다음줄에생성 
			        if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) {
			        	out.println("</tr><tr>");
			        }
			        // 날짜 증가시키기 set 메소드 사용
			        cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1);
			    }
			
			    // 마지막날부터 토요일까지 빈칸으로 처리
			    for (int i=cal.get(Calendar.DAY_OF_WEEK); i<=7; i++){
			    	out.println("<td>&nbsp;</td>");
			    }
			%>
        </tr>
        </table>


</body>