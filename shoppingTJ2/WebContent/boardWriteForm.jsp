<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
   <style >
  
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
td textarea{
	border:none;
	outline: none;
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

input[type="password"]{
	border:none;
	outline: none;
}

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
input { outline: none;}

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
.button1{
    width: 180px;
    height: 45px;
    font-family: 'Sunflower', sans-serif;
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 2.5px;
    font-weight: 500;
    color: #000;
    background-color: rgba(242,56,33,.5);
    border: none;
    border-radius: 45px;
    transition: all 0.3s ease 0s;
    cursor: pointer;
    outline: none;
}
.button{
    font-family: 'Sunflower', sans-serif;
    width: 160px;
    height: 45px;
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 2.5px;
    font-weight: 500;
    color: #000;
    background-color: rgba(242,56,33,.5);
    border: none;
    border-radius: 45px;
    transition: all 0.3s ease 0s;
    cursor: pointer;
    outline: none;
}
.button1:hover,
.button:hover{
    background-color: rgba(242,56,33,.5);
    box-shadow: 0px 15px 20px rgba(242,56,33,.5);
    color: #fff;
    transform: scale(1.1);
    border-radius: 45px;
}

   </style>
</head>
<body>
  <div class="contents">
    <form action="boardWriteProc.jsp" method="post">
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
            <input type="text" name="subject" >
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
          <th><span>*</span>이메일주소</th>
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
        <tr class="fontsize">
          <td align="center" colspan="2">
            <input class="button" style="font-size:20px" type="submit" value="글 쓰 기"> &nbsp;&nbsp;
            <input  class="button" style="font-size:20px" type="reset" value="다시작성"> &nbsp;&nbsp;
            <button class="button1" style="font-size:20px" onclick="location.href='rentCar.jspcenter=boardList.jsp">전체게시글보기</button> 
          </td>
        </tr>
      </tbody>
    </table>
    </form>
   </div>
 
</body>
</html>