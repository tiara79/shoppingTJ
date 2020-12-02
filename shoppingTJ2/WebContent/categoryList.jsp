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
  <style>
  @import url('https://fonts.googleapis.com/css2?family=Single+Day&display=swap');
  
  td p{
  font-family: 'Single Day', cursive;
  font-weight: 600;
  }
  
  </style>
</head>
<body>
   <%
     // Category 값 받아오기 (Outer(1), Top(2), Pants(3))
     String ctg = request.getParameter("category");
     int category = Integer.parseInt(ctg);
 
     // System.out.println(category);
     
     String model = "";
     if(category == 1) { 
    	 model = "Outer";
     }else if(category == 2){
    	 model = "Top";
     }else if(category == 3){
    	 model = "Pants";
     }
 
   %>
 
 <div align="center">
 <table >
   <tr>
     <td colspan="3" align="center"> 
       <h2><%=model %> Wears</h2> 
     </td>
   </tr>
   <%
     
     
     SaleDAO dao = new SaleDAO();
     ArrayList<SaleDTO> list = dao.selectCategoryCloth(category);
   
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








