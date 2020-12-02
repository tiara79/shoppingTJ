<%@page import="db.SaleDTO"%>
<%@page import="db.SaleDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style type="text/css">
  @import url('https://fonts.googleapis.com/css2?family=Single+Day&display=swap');
  
  td p{
  font-family: 'Single Day', cursive;
  font-weight: 600;
  }
  </style>
</head>
<body>
<div align="center">
 <table>
    <tr>
     <td colspan="3" align="center"> <h2>Wears</h2> </td>
    </tr>
   <%
     
     SaleDAO dao = new SaleDAO();
     ArrayList<SaleDTO> list = dao.selectAllCloth();
   
     int count = 0;
     for(int i = 0; i < list.size(); i++){
    	 SaleDTO dto = list.get(i);
        if(count % 3 == 0){
        	
   %> 
     <tr>
   <%} %>
   
       <td width="333px" align="center">
         <a href="saleCloth.jsp?center=purchaseInfo.jsp&no=<%=dto.getNo() %>">
         <img src="img/<%=dto.getImg() %>" width="300px" height="300px">
         </a>
         <p><%=dto.getName() %></p>
       </td>  
	        
	   <%     
	       // 한 행에 3 개의 자동차 정보를 보여줌
	       count++;
	       
            
         }
       
       %>
       
       
     </tr>  
     </table>
   
  </div> 
</body>
</html>











