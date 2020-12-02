<%@page import="db.PurchaseListDTO"%>
<%@page import="java.util.ArrayList"%>
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
* {
		font-family: none;
}

tr h2 {
		top: 200px;
}

#purchase {
	color: darkgray;
}
.cancel {
	background-color: rgba(242,56,33,.5);
	border:none;
	color: white;
	padding: 10px 20px;
    transition: all 0.3s ease;
}

.cancel:hover {
	background-color: rgba(242,56,33,.8);
	cursor: pointer;
	border:none;
	border-radius: 20px;
	border-bottom-left-radius: 0px;
	border-top-right-radius: 0px; 
	}
</style>
</head>
<body>
		<%
			String id = (String) session.getAttribute("id");

			if (id == null) {
		%>
		<script>
			alert("로그인 후 이용해 주세요");
			location.href = "login.jsp";
		</script>
		<%
			}
			SaleDAO dao = new SaleDAO();
			ArrayList<PurchaseListDTO> list = dao.selectPurchaseListbyId(id);
		%>
		<div align="center">
				<table width="1000px">
						<tr height="100px">
								<td colspan="11" align="center">
										<h2>Wish List</h2>
								</td>
						</tr>
				</table>
				<table width="1000px">
						<tr height="40px">
								<td width="150px" align="center"><b>제품이미지</b></td>
								<td width="150px" align="center"><b> 제 품 명</b></td>
								<td width="150px" align="center"><b> 배송시작일</b></td>
								<td width="100px" align="center"><b> 제품금액 </b></td>
								<td width="100px" align="center"><b> 구매수량 </b></td>
								<td width="60px" align="center"><b> 사이즈 </b></td>
								<td width="60px" align="center"><b> 색상 </b></td>
								<td width="60px" align="center"><b> 배송료 </b></td>
								<td width="90px" align="center"><b>구매취소 </b></td>

						</tr>
						<%
							String getColor = "";
							String getSizeOpt = "";
							String getDeliverFee = "";
							for (int i = 0; i < list.size(); i++) {
								PurchaseListDTO pcdto = list.get(i);
								if (pcdto.getSizeOpt() == 1) {
									getSizeOpt = "XS";
								} else if (pcdto.getSizeOpt() == 2) {
									getSizeOpt = "S";
								} else if (pcdto.getSizeOpt() == 3) {
									getSizeOpt = "M";
								} else if (pcdto.getSizeOpt() == 4) {
									getSizeOpt = "X";
								} else if (pcdto.getSizeOpt() == 5) {
									getSizeOpt = "XL";
								}

								if (pcdto.getColor() == 1) {
									getColor = "White";
								} else if (pcdto.getColor() == 2) {
									getColor = "Black";
								} else if (pcdto.getColor() == 3) {
									getColor = "Ivory";
								} else if (pcdto.getColor() == 4) {
									getColor = "Brown";
								}

								if (pcdto.getDeliverFee() == 1) {
									getDeliverFee = "3000";
								} else if (pcdto.getDeliverFee() == 0) {
									getDeliverFee = "착불";
								}
						%>
						<tr height="40px">
								<td width="150px" align="center"><img
										src="img/<%=pcdto.getImg()%>" width="120px" heigth="70px"></td>
								<td width="150px" align="center"><%=pcdto.getName()%></td>
								<td width="150px" align="center"><%=pcdto.getDeliverDate()%>
								</td>
								<td width="100px" align="center"><%=pcdto.getPrice()%></td>
								<td width="60px" align="center"><%=pcdto.getQuantity()%></td>
								<td width="60px" align="center"><%=getSizeOpt%></td>
								<td width="60px" align="center"><%=getColor%></td>
								<td width="60px" align="center"><%=getDeliverFee%></td>
								<td width="90px" align="center">
										<button class="cancel"
												onclick="location.href='delReserve.jsp?purchaseno=<%=pcdto.getPurchaseno()%>'">
												취소</button>
								</td>
						</tr>
						<%
							}
						%>
				</table>
				<%
					int totalPrice = dao.selectPrice(id);
				%>
				<div align="center">

						총 가 격 :
						<%=totalPrice%>
						원
						<h6 style="font-weight: normal; color: #888; margin-bottom: 50px; ">※배송료 제외</h6>


				</div>
				<div align="center">
						<a href="#" id="purchase">구매하기</a>
				</div>
		</div>
</body>
</html>