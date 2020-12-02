<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style type="text/css">
  @charset "UTF-8";
*{
  margin: 0;
  padding: 0;
  text-decoration: none;
  font-family: arial;
  box-sizing: border-box;
}
#login-form {
  width: 300px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%,-50%);
  margin: 20px 0px;
  background-size: 300px;
  z-index: 1;
}
#login-form h1 {
  text-align: center;
  margin-bottom: 60px;
  color: #00bcd4;
  font-size: 30px;
}
#login-form p {
  font-size: 16px;
  color: #333;
}
#login-form p a {
  color: #00bcd4;
}
#login-form label {
  color: #848484;
}
.input-box{
  border-bottom: 2px solid #adadad;
  position: relative;
  margin: 30px 0;
}
.input-box input{
  font-size: 15px;
  color: #333;
  border: none;
  width: 100%;
  outline: none;
  background: none;
  padding: 0 5px;
  height: 40px;
}
input [type="text"]{


    background: transparent;
    border: none;
}

.input-box span::before{
  content: attr(data-placeholder);
  position: absolute;
  top: 50%;
  left: 5px;
  color: #adadad;
  transform: translateY(-50%);
  z-index: -1;
  transition: .5s;
}
.input-box span::after{
  content: '';
  position: absolute;
  width: 0%;
  height: 2px;
  background: linear-gradient(120deg,#2196F3,#FF5722);
  transition: .5s;
}
.input-box input::placeholder{
  opacity: 0.5;
}
.focus + span::before{
  top: -5px;
}
.focus + span::after{
  width: 100%;
}
.login-btn {
  display: block;
  width: 100%;
  height: 50px;
  border: none;
  background: linear-gradient(70deg,#2196F3,#03bcd4,#2196F3);
  background-size: 200%;
  color: #fff;
  outline: none;
  cursor: pointer;
  margin: 20px 0px 0px;
  border-radius: 50px;
  transition: 2s;
  font-size: 18px;
  letter-spacing: 1px;
}
.login-btn:hover{
  background-position: right;
}
.bottom-links{
  margin-top: 30px;
  text-align: center;
  font-size: 13px;
}
.bgimg{
  position: absolute;
  height: 900px;
  top: 10px;
  left: 500px;
}
.fa-autoprefixer{
  position: absolute;
  left:430px;	
  margin-top:60px;
  color: #2a92b8 ;
}
/*--For Small Devices CSS--*/
@media (max-width: 575px){
#login-form {
  width: 300px;
}
}
  </style>
</head>
<body>
<tr height="70px">
      <td colspan="4">
        <a href="saleCloth.jsp">
          <i class="fab fa-autoprefixer fa-5x"></i>
        </a>
      </td>
    </tr>
  <form action="loginProc.jsp" id="login-form">
    <a href="saleCloth.jsp"><h1>Welcome</h1></a>
    <div class="input-box">
        <input type="text" placeholder="Username" name="id">
    </div>
    <div class="input-box">
        <input placeholder="Password" type="password" name="pw">
    </div>
    <label>
      <input type="checkbox" name="remember"> Remember me
    </label>
    <button type="submit" class="login-btn">Login</button>
    <div class="bottom-links">
      <p>Don’t have account? <a href="#">Sign up</a></p>
    </div>
  </form>
  <img class="bgimg" src="img/backimg.png" alt="">
<script src="https://kit.fontawesome.com/fac1f30643.js" crossorigin="anonymous"></script>
</body>
</html>








