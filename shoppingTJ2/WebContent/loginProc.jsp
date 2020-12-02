<%@page import="db.SaleDAO"%>
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
    request.setCharacterEncoding("UTF-8");
  
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    
    SaleDAO dao = new SaleDAO();
    
    // argument로 지정한 id와 pw가 DB에 있는지 확인하기
    int result = dao.selectIdPw(id, pw);
    
    if(result == 0){ %>
    <script>
      alert("아이디와 비밀번호를 확인해 주세요");
      location.href="login.jsp";
    </script>
    <%  	
    }else{
      session.setAttribute("id", id);	
      response.sendRedirect("saleCloth.jsp");	
    }
  
  %>
</body>
</html>





