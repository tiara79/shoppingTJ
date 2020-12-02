<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <%
    String number = request.getParameter("num");
    int num = Integer.parseInt(number);
    
    String password = request.getParameter("password");
    
    BoardDAO dao = new BoardDAO();
    String passwordDB = dao.getPassword(num);
    
    if(passwordDB.equals(password)){
   	  dao.deleteBoard(num);	
   	
   	  response.sendRedirect("saleCloth.jsp?center=boardList.jsp");
   	  
    }else{  // 비밀번호가 맞지 않는 경우
  %>
   <script>
     alert("비밀번호를 다시 확인해 주세요");
     history.go(-1);
   </script>  
  <%
  }
  %>
</body>
</html>