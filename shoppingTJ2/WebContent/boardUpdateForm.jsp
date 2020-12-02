<%@page import="model.BoardDTO"%>
<%@page import="model.BoardDAO"%>
<%@page import="model.BoardDTO"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
 
@import url('https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap');

.contents{
  width: 1180px;
  margin: 0 auto;}
.h2{
 font-family: 'Sunflower', sans-serif;
 position: relative;
 font-size: 36px;
 color:#222;
 line-height: 100%;
 text-align: center;
 font-weight: normal;
}
.h2+p{
font-family: 'Sunflower', sans-serif; 
  padding: 46px 0 54px;
  font-size: 18px;
  color: #666;
  text-align: center;
  line-height: 30px;
}
.step{
  list-style-type: none;
  display: flex;
  border-top: 1px solid rgba(255,255,255,0.7);
  border-bottom: 1px solid rgba(255,255,255,0.7);
  margin-bottom: 20px;
}
.step li{
  flex:1;
  position: relative;
  padding: 22px 0;
  font-size:11px;
  color: #222;
  text-align: center;
  height: 100%;
  font-family: 'Sunflower', sans-serif; 
}

.step li:last-child:after{display: none;}

.step li div{
  font-size:18px;
  color: black;
  /* text-align: center; */
  padding: 8px 0 0;
  font-family: 'Sunflower', sans-serif; 
}
.h3{ font-size: 10px;} 

table.type1 th,
table.type1 td {
width: 1180px;
height: 40px;
padding: 10px;;
border-top: 2px solid rgb(199, 199, 199);
 font-family: 'Sunflower', sans-serif;
}
table.type1 th:first-child{
  border-left: none;
}
table.type1 td:first-child th,
table.type1 td:first-child td{
  border-left: none;
}
table.type1 th{
  padding: 10px 10px 10px 45px;
  text-align: center;
  font-size: 18px;
  font-weight: normal;
  color:#222;
}
table.type1 td{ 
  padding: 10px 55px;
  color : #777; 
}
table.type1 td input[type="text"],
table.type1 tr td input[type="password"]{
  border: 1px solid #ccc ;
  height: 38px;
  line-height: 38px;
  font-family: 'Sunflower', sans-serif;
  color: black;
}
.btn_type1{
  display: inline-block;
  min-width: 102px;
  border: 2px solid #aaa;
  height: 38px;
  line-height: 36px;
  text-align: center;
  box-sizing: border-box;
  vertical-align: middle;
  padding: 0 10px;
}
table.type1 td> div{ padding: 10px 0 0;}
table.type1 td> div:first-child{padding: 0;   }
table.type1 td> .btn_type1{ margin-left: 50px;}



tr td textarea,
input {
	border:none;
 	outline: none;}

input#ch1{
  position: absolute;
  left: -4000%;
}
input.chck1+label{
  font-size: 14px;
  color:#222;
  line-height: 27px;
  padding: 0 35px 0 0;
}

.td,
input[type="password"]{
	border: none;
	border-bottom: 1px solid black; 
	padding: 15px 0px;
}
input[type="submit"],
input[type="button"]{
	color:white;
    width: 80px;
    height: 30px;
    font-family: 'Roboto', sans-serif;
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 2.5px;
    font-weight: 500;
	cursor:pointer;
	border-radius:0px 30px 0px 30px;
	background:rgba(242,56,33,.5);
	-webkit-box-shadow: 0px 0px 20px 0px rgba(242,56,33,.5); 
	-moz-box-shadow: 0px 0px 20px 0px rgba(242,56,33,.4); 
	box-shadow: 0px 0px 20px 0px rgba(242,56,33,.6);
	transition: all ease-in-out 0.3s;
	border:none;
	margin-top: 22px;
}
input[type="submit"]:hover,
input[type="reset"]:hover,
input[type="button"]:hover{
		border-radius:30px 0px 30px 0px;
}
  </style>
</head>
<body>
  <%
    // 수정할 게시글의 num 값을 받아와서
    // 받아온 num 값에 해당하는 게시글을 수정함
    String number = request.getParameter("num");
    System.out.println("number : " + number);
  
    int num = Integer.parseInt(number);
    
    // 게시들 하나에 대한 정보를 return함
    
    BoardDAO dao = new BoardDAO();
    BoardDTO dto = dao.getOneUpdate(num);
    
  %>
 <div class="contents">
    <form action = "boardUpdateProc.jsp" method="post">
    <h2 class="h2">Question & Answer</h2>
     <p>사람을 아름답게 하는 저희 쇼핑몰을 찾아주셔서 감사합니다.<br>
        궁금하신 사항이 있으시면 Q&A 에 남겨주시면 빠른 답변 드리겠습니다.</p>
            <ol class="step">
      <li>SETP1<div>입금확인 ></div></li>
      <li>SETP2<div>배송 ></div></li>
      <li>SETP3<div>반품 ></div></li>
      <li>SETP4<div>교환 ></div></li>
    </ol>
    <h3 class="h3"></h3>
    <table class="type1">
      	<h2>수정하기</h2>
       <tbody>
        <tr>
           <th><span></span>작성자</th>
           <th><span></span>작성일</th>   
           <th><span></span>제 목</th>      
        </tr>
        <tr>
          <th><%=dto.getWriter() %></th>  
          <th><%=dto.getReg_date() %></th>
          <th><input type="text" name="subject" value="<%=dto.getSubject() %>"></th>
      
        </tr>
         <tr>
          <td width="120px" align="center">비밀번호</td>
          <td width="480px" colspan="3">
            <input type="password" name="password" >
          </td>
        </tr>  
         <tr>
            <th colspan="3">글 내 용</th>
         </tr>
         <tr>
              <td colspan ="3" align ="center"><textarea rows="20" cols="150" name="content" align="left">
            <%=dto.getContent() %>
          </textarea>  </td>
         </tr>
         <tr>	
           <td colspan="5" align="center" >
             <input type="hidden" name="num" value="<%=dto.getNum() %>" >
             <input type="button" value="답글쓰기"
                 onclick="location.href='saleCloth.jsp?center=boardRewriteForm.jsp?num=<%=dto.getNum() %>&ref=<%=dto.getRef() %>&re_step=<%=dto.getRe_step() %>&re_level=<%=dto.getRe_level() %>'" >
             <input type="submit" value="수정하기" >
             <input type="button" value="삭제하기" 
                 onclick="location.href='saleCloth.jsp?center=boardDeleteForm.jsp?num=<%=dto.getNum() %>'">    
             <input type="button" value="목록보기" 
                 onclick="location.href='saleCloth.jsp?center=boardList.jsp'">    
           </td>
         </tr>
       </tbody>
     </table>
   </div>
</body>
</html>












