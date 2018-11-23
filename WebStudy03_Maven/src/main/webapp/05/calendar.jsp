<%@page import="java.util.Locale"%>
<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.util.Calendar"%>
<%@page import="static java.util.Calendar.*"%> <!-- JDK1.7이후부터 사용 가능한 방식 -->
<!--이 방식을 사용하면 14~18번째 줄의 Calendar.getInstance()식의 방식에서 Calendar를 굳이 사용해줄 필요가 없어진다.  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04/calender.jsp</title>
<style type="text/css">
   .sunday{
      background-color : red;
   }
   .saturday{
      background-color: blue;
   }
   table{
      width: 100%;
      height: 500px;
      border-collapse: collapse; 
   }
   td,th{
      border: 1px solid #2E2E2E;
   }
</style>
<script type="text/javascript">
   function eventHandler(year, month){
      var form = document.forms[0];
      if((year && month)||month==0){
         form.year.value = year;      
         form.month.value = month;
      }
      form.submit();
      return false;
   }
</script>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");   //인코드 방식을 UTF-8로
   String yearStr = request.getParameter("year");
   String monthStr = request.getParameter("month");
   String language = request.getParameter("language");
   
   Locale clientLocale = request.getLocale();//클라이언트에 대한 모든 정보를 가지고 있는 녀석을 사용
   if(language!=null && language.trim().length()>0){
      clientLocale = Locale.forLanguageTag(language);
   }
   
   
   //String[] dayStr = new String[]{"일", "월"}; 방식은 하드코딩이어서 좋지 않은 소스이다.
   //요일방식은 클라이언트의 기준으로 보여주어야 한다.
   DateFormatSymbols symbols = new DateFormatSymbols(clientLocale);
   
   Calendar cal = getInstance(); //protected되어있는 형태, new객체로 불러올 수 없어서 Calendar의 getInstance로 불러온다.
   if(yearStr != null && yearStr.matches("\\d{4}")
      && monthStr != null && monthStr.matches("1[0-1]|\\d")){
      cal.set(YEAR, Integer.parseInt(yearStr));
      cal.set(MONTH, Integer.parseInt(monthStr));
   }
   
   int currentYear = cal.get(YEAR);//만약 상수를 직접 정의한다면 그 방법은 잘못된 숫자데이터가 넘어오는 것을 막을 수 없다. 해결법은 ENUM
   //그러나 Calendar는 ENUM이 만들어지기 전에 만든 방식이어서 Calendar.YEAR식의 방식으로도 해결 가능하다. 캘린더 객체에서 YEAR을 가져와 정수형 변수에 담는다.
   int currentMonth = cal.get(MONTH);//currentYear과 동일
   
   cal.set(DAY_OF_MONTH, 1); //한달에서 몇번째 날로 세팅을 함을 의미
   int firstDayofWeek = cal.get(DAY_OF_WEEK); //첫번째 주를 담는 변수 선언, 담기
   int offset = firstDayofWeek - 1; //자바의 계산법에 의해 1을 빼준다.
   int lastDate = cal.getActualMaximum(DAY_OF_MONTH); //한달에서 제일 큰 값을 꺼내온다.
   
   cal.add(MONTH, -1);
   int beforeYear = cal.get(YEAR);
   int beforeMonth = cal.get(MONTH);
   
   cal.add(MONTH, 2); //캘린더가 다음달로 바뀐다.
   int nextYear = cal.get(YEAR);
   int nextMonth = cal.get(MONTH);
   
   Locale[] locales = Locale.getAvailableLocales();
%>
<form>
<h4>
<a href="javascript:eventHandler(<%=beforeYear%>,<%=beforeMonth%>);">이전달</a> <!-- ?는 그 뒤에 쿼리스트링으로 get방식의 쿼리스트링을 날리겠다는 의미 -->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<input type="number" name="year" value="<%=currentYear%>"
   onblur="eventHandler();" 
/>년 <!-- onblur : text창에 어떤 문자값을 입력 받기 전에 다른 작업을 할 수 없게 할때 사용 -->
<select name="month" onchange="eventHandler();">
   <%
      String[] monthStrings = symbols.getShortMonths();
      for(int idx = 0; idx < monthStrings.length-1; idx++){
         out.println(String.format
               ("<option value='%d'%s>%s</option>", 
                  idx, idx==currentMonth?"selected":"", monthStrings[idx]
                     ));
      }
   %>
</select>
<select name="language" onchange="eventHandler();">
   <%
      for(Locale tmp : locales){
         out.println(String.format
               ("<option value='%s' %s>%s</option>",
               tmp.toLanguageTag(),
               tmp.equals(clientLocale)?"selected":"",
               tmp.getDisplayLanguage(clientLocale)
                  ));
      }
   %>
</select>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a onclick="eventHandler(<%=nextYear%>,<%=nextMonth%>);">다음달</a> <!-- href에 주소를 생략하면 현재 브라우저가 가지고 있는 주소 입력창을 그대로 쓰게 된다.  -->
</h4> 
</form>
<table>
<thead><!-- 실제 날짜를 보여주는 구간 -->
   <tr>
      <%
         String[] dateStrings = symbols.getShortWeekdays();
         for(int idx = Calendar.SUNDAY; idx<=Calendar.SATURDAY; idx++){
            out.println(String.format
                  ("<th>%s</th>", dateStrings[idx]));   
         }
      %>
   </tr>
   </thead>
<tbody>
<%
   int dayCount = 1;
   for(int row=1; row<=6; row++){ //캘린더의 행은 총 6이다.
      %>
      <tr>
      <%
      for(int col=1; col<=7; col++){ //캘린더의 열은 7이다.
         int dateChar = dayCount++ - offset;
         if(dateChar < 1 || dateChar > lastDate){//앞쪽에 나오는 공백은 1로 걸러내야 한다.
            out.println("<td>&nbsp;</td>");
         }else{
            String clzValue = "normal";
            if(col==1){
               clzValue = "sunday";
            }else if(col==7){
               clzValue = "saturday";
            }

            out.println(String.format
                  ("<td class='%s'>%d</td>", clzValue, dateChar));            
         }
      }
      %>
      </tr>
      <%
   }
%>

</tbody>
</table>
</body>
</html>