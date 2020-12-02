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
    /*
    BoardDTO dto = new BoardDTO();
    dto.setWriter("tjoeun");
    */
  %>
  <!-- 
    게시판에 입력한 data들을 한 번에 읽어와서 
    BoardDTO 의 멤버변수에 저장함 <-- setter() 
  -->
  <jsp:useBean id="dto" class="model.BoardDTO">
    <jsp:setProperty name="dto" property="*"/>
  </jsp:useBean>
  <%
    // DAO 객체 생성하기
    BoardDAO dao = new BoardDAO();
    // 게시판에 입력한 data를 database에 저장하기
    dao.insertBoard(dto);
    // 게시글 저장 후 게시글 전체 보기
    response.sendRedirect("saleCloth.jsp?center=boardList.jsp");
  %>
  
</body>
</html>