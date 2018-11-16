<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="static java.util.Calendar.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*날짜 출력 및 버튼로직*/
	 //Locale객체 가져오기
   	String lang = request.getParameter("lang");
   	Locale currentLocale = request.getLocale();
   	if(lang!=null && lang.trim().length()!=0){
      currentLocale = Locale.forLanguageTag(lang);
   	}
	
	int year = 0;//년도
	int month = 0;//월
	
	Calendar now = Calendar.getInstance();//날짜객체 선언
	String mStr = request.getParameter("Mnum");
	String yStr = request.getParameter("Ynum");
	
	
	if(mStr == null && request.getParameter("action") == null) {
		month = now.get(Calendar.MONTH);
	    year = now.get(Calendar.YEAR); 
	    now.set(year,month,1);
	    
	}else if(mStr!= null && request.getParameter("action") == null){
		month = Integer.parseInt(mStr);
		year = Integer.parseInt(yStr);
	    now.set(year,month-1,1);
	}else{
		year = Integer.parseInt(request.getParameter("year"));
		month = Integer.parseInt(request.getParameter("month"));
		
		if(Integer.parseInt(request.getParameter("action")) == 1){
			
			now.set(year,month,1);
			now.add(Calendar.MONTH, 1);
			month = now.get(Calendar.MONTH);
            year = now.get(Calendar.YEAR);
            
		}else{
			now.set(year,month,1);
			now.add(Calendar.MONTH, -1);
			month = now.get(Calendar.MONTH);
            year = now.get(Calendar.YEAR);
		}
	}
	int weekDay = now.get(Calendar.DAY_OF_WEEK);//주 1~7
	int endDay = now.getActualMaximum(Calendar.DAY_OF_MONTH);//마지막 날짜를 구하는 변수
%>

<%!
     public String getTitle(Calendar cal){
          SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월");
          return sdf.format(cal.getTime());    
     }
%>
<script>
$(function() {
	$("[name = 'lang']").on('change',function(){
		document.langForm.submit();
	})
})
</script>
<style>
	table{
		margin-left: auto;
		margin-right: auto;
	}
	#week, #week td{
		border-spacing: 1px;
		border: 1px solid lightblack;
		border-collapse: collapse;
		padding: 5px;
		text-align: center;
	}
	#week tr:nth-child(1){
		background-color: lightgray;
	}
	#week tr td:nth-child(1){
		color: red;
	}
	#week tr td:nth-child(7){
		color: blue;
	}
	a:link, a:visited{
		text-decoration: none;
		color: blue;
	}
</style>
<%
Locale[] locales = Locale.getAvailableLocales();
%>
<form name="langForm">
언어선택 : <select name="lang">
         <option value="">언어선택</option>
         <%
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
	<table id = "month">
		<tr>
			<td><a href="<%=request.getContextPath() %>/?command=calendar&month=<%=month%>&year=<%=year%>&action=0">◀</a></td>
			<td><a href="<%=request.getContextPath() %>/01/SubCalendar.jsp?year=<%=year%>" target=""><%=getTitle(now) %></a></td>
			<td><a href="<%=request.getContextPath() %>/?command=calendar&month=<%=month%>&year=<%=year%>&action=1">▶</a></td>
		</tr>
	</table>
	<table id = "week">
		<tr>
			<%
            Calendar calDay = Calendar.getInstance();
            for(int i = 1; i <= 7; i++){
               calDay.set(Calendar.DAY_OF_WEEK, i);
                String dayOfWeekStr = calDay.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.SHORT, currentLocale);
                out.print("<td>" + dayOfWeekStr + "</td>");
             }
            %>
		</tr>
		<%	
			int LineColor = 0;
			out.println("<tr>");//최초 tr
			for(int i = 1; i < weekDay; i++){
                //시작날짜 구분을 위한 작업 1~7중 한개의 숫자를 가지고 간다. 
				out.println("<td>&nbsp;</td>");//토요일 부터라면 공백칸이 필요하다.
                LineColor++;//2라면 1은공백 td생성
			}
			
			for(int i = 1; i <= endDay; i++){
				/* color = (LineColor == 0)? "red": (LineColor == 6 ? "blue" : "black"); */
				out.println("<td>"+i+"</td>");
				LineColor++;
				if(LineColor == 7 && i != endDay){
					out.println("</tr>");//마지막 요일이 아닌데 Line이 7일이라면 tr을 닫고 줄바꿈
					out.println("<tr>");//새로운 tr생성
					LineColor = 0;//Line 초기화
				}
			}
			while(LineColor>0 && LineColor<7)
            {
                out.println("<td>&nbsp;</td>");
                LineColor++;    
            }
			out.println("</tr>");
		%>
	</table>
	<div id = "result"></div>