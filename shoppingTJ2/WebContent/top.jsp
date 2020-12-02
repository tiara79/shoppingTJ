<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="css/top.css" />
  <style>
  @charset "UTF-8";
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@400;700&family=Song+Myung&display=swap');
*{
  box-sizing: border-box;
  font-family:none;
}

body{
  	background-color: #efcec5;
}

table{
  display: flex;
  
}
.login{	
  position: absolute;
  right: 450px;
  top: 100px;
}
.loginbtn{
  position: absolute;
  right: 30px;
  top: 100px;
}

.color__out{
	background-color: #efcec5;
}
a{
  text-decoration: none;
}

td a i{
  font-size: 72px;
  position: absolute;
  left: 10px;
  top: 60px;
}

.color__in{

  margin-top: 100px;
  border-bottom: 2px solid rgba(255,255,255,0.7); 
  border-top: 2px solid rgba(255,255,255,0.7);
  background-color: #efcec5;
 
}

.color{

  text-align: center;
  height: 50px;
  width: 160px;
  font-size: 20px;
  background: #efcec5 !important;
}

.color a{
	color: #000;
	font-weight: 900;
	z-index:100;
}
.color a:hover{ 
  color: #ffffff !important; 
  text-shadow: 0px 1px rgba(0, 	0, 0, 0.678), 4px 4px 0px #dad7d7;
  transition: 300ms;
}
 
.fa-autoprefixer{
  position: absolute;
  left:430px;
  color: #000 ;

}

.loginbtn{
  height: 50px;
  width: 150px;
  background-color: #00BCD4;
  border: 0;
  outline: 0;
  color: black;
  border-radius: 10px;
  letter-spacing: 2px;
}
.loginbtn:hover{
  transform: scale(1.1);
  transition: 200ms;
  border: 1px solid wheat;
}
.idsee span{
  position: absolute;
  right: 180px;
  top: 110px;
}
.img{
  position: absolute;
  left: 200px;
  top: 300px;
  -webkit-transition: opacity 1s ease-in-out;
  -moz-transition: opacity 1s ease-in-out;
  -o-transition: opacity 1s ease-in-out;
  transition: opacity 1s ease-in-out;
  opacity: 0;
  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
  filter: alpha(opacity=0);
}

.img:first-child {
  opacity: 1;
}

#wrap {
  padding: 20px;
}

div {
  margin: 5px 0px
}

.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}


.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}
.prev{
left: 10px;
}

.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}
.numbertext img{
	background-size: 150px;
}

.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

.loginBTN{
	text-decoration: none;
 	color: #000; 
 	font-size: 25px;
  	padding: 5px
 }
.loginBTN:hover{
text-decoration: none; 
color: #ffffff;
  padding: 5px
}
@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
  
  </style>
</head>
<body>
<%
String id = (String)session.getAttribute("id");

// 로그인이 되어있지 않은 경우
if(id == null){
	id = " ";
}
%>
   <table class="main">
    <tr height="70px">
      <td colspan="4">
        <a href="saleCloth.jsp">
          <i class="fab fa-autoprefixer"></i>
        </a>
      </td>
    </tr>
      <td class="idsee">
        <span>
        </span>
        <td align="right" width="200px" class="login">
        <%=id %>
        <%
        	if(id.equals(" ")){
        %>		
        	<a href="login.jsp" class="loginBTN">login</button>
        		
        <%	
        	}
        	else{
        		%>
        		<a href="logout.jsp" name="id" class="loginBTN">logout</a>
        		<%
        	}
        
        %>
      </td>
      </td>
    </tr>
     <div class="color__out">
      <table class="color__in">
        <tr>
          <td class="color">
           <a href="saleCloth.jsp?center=listAll.jsp">Total</a>
          </td>
          <td class="color">
             <a href="saleCloth.jsp?center=categoryList.jsp&category=<%=1 %>">Outer</a>
          </td>
          <td class="color">
          <a href="saleCloth.jsp?center=categoryList.jsp&category=<%=2 %>">Top</a>
          </td>
          <td class="color">
           <a href="saleCloth.jsp?center=categoryList.jsp&category=<%=3 %>">Pants</a>
          </td>
          <td class="color">
            <a href="saleCloth.jsp?center=purchaseList.jsp">Wish List</a>
          </td>
          <td class="color">
            <a href="saleCloth.jsp?center=boardList.jsp">Q & A</a>
          </td>
        </tr>
      </table>
    </div>
<script src="https://kit.fontawesome.com/fac1f30643.js" crossorigin="anonymous"></script>
</body>
</html>














