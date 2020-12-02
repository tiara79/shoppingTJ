<%@page import="model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
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
table.type1 td input[type="text"]{
  border: 1px solid #ccc ;
  height: 38px;
  line-height: 38px;
  font-family: 'Sunflower', sans-serif;
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
 
tr td input[type="password"],
textarea,
input {
	border: none;
 outline: none;
 }

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
td textarea{
	border: none;
	outline: none;
}
input[type="reset"],
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
      int num = Integer.parseInt(request.getParameter("num"));
      int ref = Integer.parseInt(request.getParameter("ref"));
      int re_step = Integer.parseInt(request.getParameter("re_step"));
      int re_level = Integer.parseInt(request.getParameter("re_level"));   
    %>  
 <div class="contents">
   <form action="boardRewriteProc.jsp" method="post">
    <h2 class="h2">Question & Answer</h2>
     <p>사람을 아름답게 하는 저희 쇼핑몰을 찾아주셔서 감사합니다.<br>
        궁금하신 사항이 있으시면 Q&A 에 남겨주시면 빠른 답변 드리겠습니다.</p>
     <ol class="step">
      <li>SETP1<div>입금확인 ></div></li>
      <li>SETP2<div>배송 ></div></li>
      <li>SETP3<div>반품 ></div></li>
      <li>SETP4<div>교환 ></div></li>
    </ol>
     <table class="type1">
      <caption></caption>
      <colgroup>
        <col style="width: 170px;">
      </col>
      </colgroup>
      <h2>답글쓰기</h2>
      <tbody>
        <tr>
          <th><span>*</span>작성자</th>
          <td>
            <input type="text" name="writer">
          </td>
        </tr>
        <tr>
          <th><span>*</span>제 목</th>
          <td>
            <input type="text" name="subject" value="[답변]" >
          </td>
        </tr>
        <tr>
          <th><span>*</span>비밀번호</th>
          <td>
            <input type="password" name="password" >
            <span class="info">비밀번호는 4~10자리로 입력해주세요.</span>
          </td>
        </tr>    
        <tr>
          <th><span>*</span>이메일</th>
          <td>
            <input type="text" name="email">
          </td>
        </tr>
        <tr>
          <th>글 내 용</th>
          <td>
            <textarea cols="60" rows="10" style="height:150px" name="content"></textarea>
          </td>
        </tr> 
        <tr>
         <!-- form에서 사용자로부터 입력받지 않고 data를 넘김 -->
        <td align="center" colspan="2">
          <input type="hidden" name="ref" value="<%=ref %>">
          <input type="hidden" name="re_step" value="<%=re_step %>">
          <input type="hidden" name="re_level" value="<%=re_level %>">
          <input type="submit" value="답글쓰기"> &nbsp;&nbsp;
          <input type="reset" value="다시작성"> &nbsp;&nbsp;
          <input type="button" onclick="location.href='saleCloth.jsp?center=boardList.jsp'"
                value="전체글보기">
        </td>
        </tr>
       </tbody>
     </table>
     </form>
   </div>
</body>
</html>