<%@page import="java.util.ArrayList"%>
<%@page import="model.BoardDAO"%>
<%@page import="model.BoardDTO"%>
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
  
input{
    width: 160px;
    height: 45px;
    font-family: 'Roboto', sans-serif;
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
    margin-top: 30px;
}
input:hover{
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
      <caption></caption>
      <colgroup>
        <col style="width: 170px;">
      </col>
      </colgroup>
    <!-- 게시글 보기 countering 설정에 필요한 변수 선언하기   -->
    <%
    int pageSize = 10;
    
    String pageNum = request.getParameter("pageNum");
    
    if(pageNum == null){
      pageNum = "1";
    }
    int count = 0;
    int number = 0;
    
    int currentPage = Integer.parseInt(pageNum);
    
    BoardDAO dao = new BoardDAO();
    
    count = dao.getAllCount();
    
    System.out.println("count : " + count);
    
    int startRow = (currentPage-1)*pageSize+1;
    int endRow = currentPage * pageSize;
    
    ArrayList<BoardDTO> list = 
        dao.selectAll(startRow, endRow);
    
    number = count - (currentPage-1) * pageSize;
      
    %>
       <tbody>
        <tr>
          <th>번 호</th>
          <th>제 목</th>
          <th>작성자</th>
          <th>작성일</th>   
          <th>조회수</th> 
        </tr>
     
      <%
        for(int i = 0; i < list.size(); i++){
          BoardDTO dto = list.get(i); 
      %>
     
      <tr>
        <th><%=number-- %></th>
        <th>
          <a href="saleCloth.jsp?center=boardInfo.jsp?num=<%=dto.getNum() %>">
        <%
          if(dto.getRe_step() > 1){
          	for(int j = 0; j < (dto.getRe_step()-1)*2; j++){
        %>
          &nbsp;
        <%  		
          	}
          }
        %>  
          <%=dto.getSubject() %></a></th>
          
        <th width="100px" align="center"><%=dto.getWriter() %></th>
        <th width="150px" align="center"><%=dto.getReg_date() %></th>
        <th width="80px" align="center"><%=dto.getReadcount() %></th>
      </tr>      
      <%    
        }
      %>
      <br><br>
       <td colspan="5" align="right">
          <input type="button" value="글쓰기" 
                 onclick="location.href='saleCloth.jsp?center=boardWriteForm.jsp'">
        </td>
      </tbody>   
    </table>
    <p>
      <!-- page countering -->
      <%
        if(count > 0){ 
          // countering 숫자를 얼마까지 보여줄지 설정함
          int pageCount = 
        	  count / pageSize + (count % pageSize == 0 ? 0 : 1);
          
          // 시작 페이지 숫자 설정함
          int startPage = 1;
          
          if(currentPage % 10 != 0){
          	startPage = (int)(currentPage / 10) * 10 + 1;
          }else{
          	startPage = ((int)(currentPage / 10)-1) * 10 + 1;
          }
          
          // countering 숫자
          int pageBlock = 10;
          // 화면에 보여질 page의 마지막 숫자
          int endPage = startPage + pageBlock - 1;
          
          if(endPage > pageCount){
          	endPage = pageCount;
          }       
          // [이전] 링크   
          if(startPage > 10){
          %>
          	<a href="saleCloth.jsp?center=boardList.jsp?pageNum=<%=startPage - 10 %>">[이전]</a>
          <%	
          }
          
          // paging 처리하기
          for(int i = startPage; i <= endPage; i++){
          %>
            <a href="saleCloth.jsp?center=boardList.jsp?pageNum=<%=i %>">[<%=i %>]</a>
          <%	
          }
          
          // [다음] 링크
          if(endPage < pageCount){
          %>
            <a href="saleCloth.jsp?center=boardList.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
          <%	
          }		
        }
      %>
    </p> 
  </div>  
</body>
</html>
















