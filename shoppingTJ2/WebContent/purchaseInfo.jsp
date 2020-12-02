<%@page import="db.SaleDTO"%>
<%@page import="db.SaleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style type="text/css">
   	input[type="submit"]{
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
    box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease 0s;
    cursor: pointer;
    outline: none;
  	}
  	input[type="submit"]:hover{
    background-color: rgba(242,56,33,.5);
    box-shadow: 0px 15px 20px rgba(242,56,33,.8);
    color: #fff;
    transform: translateY(-7px);
  	}
  </style>
</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
  
    SaleDAO dao = new SaleDAO();
    SaleDTO dto = dao.selectOneCloth(no);
    
    // Category 값 받아오기 (Outer(1), Top(2), Pants(3))
    int category = dto.getCategory();

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
    <form action="saleCloth.jsp?center=purchaseOption.jsp" method="post">
      <table width="1000px">
       
        <tr>
          <td rowspan="6" width="500px" align="center">
            <img src="img/<%=dto.getImg() %>" width="450px">
          </td>
          <td width="250px" align="center"> 제 품 명 </td>
          <td width="250px" align="center"><%=dto.getName() %></td>
        </tr>
        <tr>
          <td width="250px" align="center">수량</td>
          <td width="250px" align="center">
            <select name="quantity">
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
          </td>
        </tr>
        <tr>
          <td width="250px" align="center"> 분류 </td>
          <td width="250px" align="center"><%=model %></td>
        </tr>   
        <tr>
          <td width="250px" align="center"> 가격 </td>
          <td width="250px" align="center"><%=dto.getPrice() %></td>
        </tr>
        <tr>
          <td colspan="2" align="center">
            <input type="hidden" name="no" value="<%=dto.getNo() %>">
            <input type="hidden" name="img" value="<%=dto.getImg() %>">
            <input type="submit" value="Choose Option">
          </td>
        </tr> 
        <tr>
          <br><br><br>
        </tr>       
        </table> 
        <br><br><h2> 상세 정보 </h2><br><br>
        <img src="img/<%=dto.getInfo() %>" width="450px">
                  
    </form>
  
  </div>
  
</body>
</html>