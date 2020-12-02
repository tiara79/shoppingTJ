<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="css/bottom.css" />
  <style>

  	@charset "UTF-8";
@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@400;700&family=Song+Myung&display=swap');
  *{
  	font-family: none;
  }
body{
  	background-color: #efcec5;
  	
}
footer {
  margin: auto;
}

footer .top .tit {
 	 color: #efcec5;
   text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
  font-size: 50px;
  text-align: center;
  margin-bottom: 40px;
}

footer .bottom {
  border-top: 2px solid rgba(255,255,255,0.7);
  padding: 40px 0 100px;
}


footer .bottom ul {
  overflow: hidden;
  /* position:relative; */
}

footer .bottom ul li {
/*   position:absolute; */
  float: left;
  width: 23%;
  font-size: 12px;
  line-height: 2;
   color: black;
   list-style: none;
}

footer .bottom ul li:nth-child(1) {
  width: 31%;
  font-size: 28px;
  line-height: 1.1;
}

footer .bottom ul li b {
  font-weight: bold;
  color: black;
  
}
footer .bottom ul li b:nth-child(1) {
  display: inline-block;
  margin-bottom: 12px;
  font-size: 18px;
}
  </style>
</head>
<body>
  <!-- footer -->
   <footer>
    <div class="top">
      <h2 class="tit en animation" data-animate="motion">
        <span><b>TJeun Fashion Group.Co.,Ltd Info </b></span>
      </h2>
    </div>
    <div class="bottom en">
      <ul>
        <li>TJOEUN <br>SHOP<br>PLATFORM</li>
        <li>
          <b>Address</b><br><br>
          <b>T.</b> 02.738.5001<br>
          <b>T.</b> 02.738.5012<br>
          <b>E.</b> hello@tjoeun.co.kr
        </li>
        <li>
          <b>Contacts</b><br><br>
             33, samil-ro gi-go,<br>
             Jongno-gu, Seoul,<br>
             Republic of Korea
        </li>
        <li>
          <div><a class="fixd" href=""><img src="img/1home.PNG"></a></div>
          <div><a class="fixd" href="https://www.instagram.com/tjoeun/"><img src="img/1insta.PNG"></a></div>
          <div><a class="fixd" href="https://www.facebook.com/tjoeun"><img src="img/1facebook.PNG"></a></div>
          <div><a class="fixd" href="https://pf.kakao.com/_zRPqK"><img src="img/1kakao.PNG"></a></div>
        </li>
      </ul>
    </div>
  </footer>
</body>
</html>