
<%@page import="model.BoardDAO"%>
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
  
    request.setCharacterEncoding("UTF-8");
  
    // BoardDTO dto = new BoardDTO();
  %>
  <jsp:useBean id="dto" class="model.BoardDTO">
    <jsp:setProperty name="dto" property="*" />
  </jsp:useBean>
  
  <%
    BoardDAO dao = new BoardDAO();
    dao.insertRewrite(dto);
    
    
    response.sendRedirect("saleCloth.jsp?center=boardList.jsp");
  
  %>
  
</body>
</html>










