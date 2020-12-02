<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
  body{
  	background-color: #efcec5;
  }
  </style>
</head>
<body>
<%
    String center = request.getParameter("center");
  
    // 이 페이지를 처음 실행할 때는
    // center 값이 넘어오지 않으므로 null 값임
    if(center == null){
      center = "center.jsp";
    }  
  %>
  
  <div align="center"> 
  <table width="1000px">
  
    <!-- top.jsp  -->
    <tr height="140px" align="center">
      <td align="center" width="1000px">
        <jsp:include page="top.jsp" />        
      </td>      
    </tr>  
    
    <!-- center.jsp  -->
    <tr align="center">
      <td align="center" width="1000px">
        <jsp:include page="<%=center %>" />        
      </td>      
    </tr> 
    
    <!-- bottom.jsp  -->
    <tr height="100px" align="center">
      <td align="center" width="1000px">
        <jsp:include page="bottom.jsp" />        
      </td>      
    </tr>  
    
  </table>
  </div> 
</body>
</html>