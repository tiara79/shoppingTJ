<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="db.SaleDTO"%>
<%@page import="db.SaleDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.PurchaseListDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style type="text/css">
  body{
  	width: 100%;
  }
  	.center{
  		display: flex;
  		justify-content: center;
  		
  	}
  </style>
</head>
<body>
	<%
    request.setCharacterEncoding("UTF-8");
  %>
  <jsp:useBean id="opDto" class="db.OptionDTO2">
    <jsp:setProperty name="opDto" property="*" />  
  </jsp:useBean> 
  <%
    String id = (String)session.getAttribute("id");
  
    if(id == null){
  %>
    <script>
      alert("로그인 후 구매하셔야 합니다");
      location.href="login.jsp";
    </script>
  <%  	
    }else{ 
    Date date1 = new Date();
    Date date2 = new Date();
    
    // "2020-01-01"
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    
    // date1 - 예약하려는 날짜
    // date2 - 현재 날짜
    date1 = sdf.parse(opDto.getDeliverDate());
    date2 = sdf.parse(sdf.format(date2));
    int compare = date1.compareTo(date2);
    
    if(compare < 0){
      %>
        <script>
          alert("현재 날짜 보다 이전 날짜로는 예약할 수 없습니다");
          history.go(-1);
        </script>
      <%	
      }
    
      String id2 = (String)session.getAttribute("id");
      opDto.setId(id2);
      
      SaleDAO dao = new SaleDAO();
      dao.setOptionDto(opDto);
      
      ArrayList<PurchaseListDTO> list = dao.selectPurchaseListbyId(id);
      SaleDTO dto = dao.selectOneCloth(opDto.getNo());
      
      int deliverFee = 0;
      
      if(opDto.getDeliverFee() == 1){
      	deliverFee = 3000;
      }
      
      int purchaseTotal = dto.getPrice() * opDto.getQuantity() + deliverFee;
      String getColor = "";
      String getSizeOpt = "";
      
      for(int i = 0; i < list.size(); i++){
        PurchaseListDTO pcdto = list.get(i);
        if(pcdto.getSizeOpt() == 1){
        	getSizeOpt = "XS";
        }else if(pcdto.getSizeOpt() == 2){
        	getSizeOpt = "S";
        }else if(pcdto.getSizeOpt() == 3){
        	getSizeOpt = "M";
        }else if(pcdto.getSizeOpt() == 4){
        	getSizeOpt = "X";
        }else if(pcdto.getSizeOpt() == 5){
        	getSizeOpt = "XL";
        }
      
        
        if(pcdto.getColor() == 1){
        	getColor = "White";
        }else if(pcdto.getColor() == 2){
        	getColor = "Black";
        }else if(pcdto.getColor() == 3){
        	getColor = "Ivory";
        }else if(pcdto.getColor() == 4){
        	getColor = "Brown";
        } 
        
        if(pcdto.getDeliverFee() == 1){
        	deliverFee = 3000;
        }else if(pcdto.getDeliverFee() == 2){
        	deliverFee = 0;
        }
      }
      ArrayList<PurchaseListDTO> list1 = 
      		dao.selectPurchaseListbyId(id);
      for(int i = 0; i < 1; i++){
      	PurchaseListDTO pcdto = list.get(i);
      %>
      <div align="center">
    <table width="1000px" align="center">
    <div class="center">
      <tr height="100px" align="center">
        <td align="center"> <h2 align="center">장바구니</h2> </td>        
      </tr>
      <tr align="center">
        <td align="center">
          <img src="img/<%=dto.getImg() %>" width="470px">
        </td>
      </tr>
      </div>
      <tr height="50px">
        <th align="center">배송시작일</th>
        <td><%=pcdto.getDeliverDate() %></td>
      </tr>
      <tr height="50px">
        <th align="center">배송비</th>
        <td><%=deliverFee %> 원</td>
      </tr>
      <tr height="50px">
        <th align="center">구매수량</th>
        <td><%=opDto.getQuantity() %></td>
      </tr>
      <tr height="50px">
        <th align="center">사이즈</th>
        <td><%=getSizeOpt %></td>
      </tr>
      <tr height="50px">
        <th align="center">색상</th>
        <td><%=getColor %></td>
      </tr>
      <tr height="50px">
        <th align="center">결제 금액</th>
        <td><%=purchaseTotal %> 원</td>
      </tr>
   
     <%
    }
    }
     %>
    </table>  
  </div>
  
  
</body>
</html>