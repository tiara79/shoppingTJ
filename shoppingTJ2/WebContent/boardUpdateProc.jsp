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
  
  %>  
  <!--  데이터를 읽어서 DTO에 저장하기  -->
  <jsp:useBean id="dto" class="model.BoardDTO">
    <jsp:setProperty name="dto" property="*" />
  </jsp:useBean>
  <%
    BoardDAO dao = new BoardDAO();
    String password = dao.getPassword(dto.getNum());
    
    // DB에서 가져온 password하고
    // boardUpdateForm.jsp에서 입력한 password하고
    // 같은 경우에만 update 되도록 함
    if(password.equals(dto.getPassword())){
    	// DB 수정하는 메소드 호출하기
    	dao.updateBoard(dto);
    	
    	response.sendRedirect("saleCloth.jsp?center=boardList.jsp");
    	
    }else{ // password가 맞지 않는 경우
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


