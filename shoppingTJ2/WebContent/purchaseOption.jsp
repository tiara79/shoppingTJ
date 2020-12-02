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
  	.divc{
  		padding-bottom: 250px;
  		
  	}
  	.hidden{
  		width: 20%;
  		position: absolute;
  		top: 600px ;padding-top: 250px;
  	}
  	.common_info{
  		padding-top: 150px;
  	}
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
    background-color:rgba(242,56,33,.5);
    box-shadow: 0px 15px 20px rgba(242,56,33,.5);
    color: #fff;
    transform: translateY(-7px);
  	}
  </style>
</head>
<body>
  <%
  
    String img = request.getParameter("img");
    String number = request.getParameter("no");    
    String qty = request.getParameter("quantity");
    int no = Integer.parseInt(request.getParameter("no"));
    int quantity = 0;
    
    SaleDAO dao = new SaleDAO();
    SaleDTO dto = dao.selectOneCloth(no);
    
    if(img == null || number == null || qty == null){
      img = "";	
      no = 0;
      quantity = 0;
    }else{
      no = Integer.parseInt(number);
      quantity = Integer.parseInt(qty);	
    }
    
  %>
  <div align="center">
    <form action="saleCloth.jsp?center=clothPurchaseResult.jsp" method="post"> 
    
      <table width="1000px">
       <tr>
         <td colspan="3" align="center">
           <h2>옵 션 선 택</h2>
         </td>
       </tr>
       <tr>
          <td rowspan="6" width="500px" align="center">
            <img src="img/<%=dto.getImg() %>" width="450px">
          </td>
          <td width="250px" align="center"> 제 품 명 </td>
          <td width="250px" align="center"><%=dto.getName() %></td>
        </tr>
       <tr>
         <td width="250px" align="center">배송일시</td>
         <td width="250px" align="left">
           <input type="date" name="deliverDate" size="15" id="deliverDate" >
           <script>
  			document.getElementById('deliverDate').value = new Date().toISOString().substring(0, 10);
			</script>
         </td>
       </tr>
       <tr>
         <td width="250px" align="center">사이즈</td>
         <td width="250px" align="left">
           <select name = "sizeOpt">
             <option value="1">XS</option>
             <option value="2">S</option>
             <option value="3">M</option>
             <option value="4">L</option>
             <option value="5">XL</option>
           </select> 
         </td>
       </tr>
       <tr>
         <td width="250px" align="center">색상</td>
         <td width="250px" left">
           <select name = "color">
            <option value="1">White</option>
             <option value="2">Black</option>
             <option value="3">Ivory</option>
             <option value="4">Brown</option>
             <option value="5">Beige</option>
           </select> 
         </td>
       </tr>
       <tr>
         <td width="250px" align="center">배송비</td>
         <td width="250px" align="left">
           <select name = "deliverFee">
             <option value="1">포함(+3000)</option>
             <option value="0">착불(3000)</option>
           </select> 
         </td>
         </tr>
       <tr>
         <td colspan="2" align="center">
           <input type="hidden" name="no" value="<%=no %>">
           <input type="hidden" name="quantity" value="<%=quantity %>">
           	<input type="submit" value="Add To Wish List" >
         </td>
       </tr>
     </table>
   </div>  
   <div class="tabcnt_detail tabcnt_detail4">
  <dl class="cscenter">
    <dt></dt>
   </dl>
  <div class="common_info">
    <table class="tbl_row guide" cellspacing="0" cellpadding="0">
      <caption class="hidden">
      <br><h2><i>쇼핑가이드</i></h2></caption>
      <colgroup>
        <col style="width:276px;">
        <col>
      </colgroup>
      <tbody>
        <tr>
          <th scope="row" align="center">배송 안내</th>
          <td>
            <ul>
              <li><strong>배송지역 : 국내 지역, 일부 해외 지역</strong></li>
              <li>배송료 : 3,000원 (80,000원 이상 무료배송)</li>
              <li>배송기간은 재고가 있는 품목에 한하여 당일배송이 되며 그외 품목은 입금확인 후 약 2~5일(토요일,공휴일 제외) 소요됩니다.</li>
              <li>인기품목 및 사이즈는 조기품절이나 배송지연 될 수 있으며, 지연될 경우 7~14일이 소요될 수 있으니 이점 양해바랍니다.</li>
              <li>저희 '아뜨랑스'는 CJ대한통운 택배를 이용하고있습니다.</li>
              <li>운송장번호는 상품 출고시 카카오 알림톡 / 문자로 발송 됩니다.또한 [마이페이지]-[주문/배송조회]-[주문내역]에서 직접 확인 하실 수 있습니다</li>
              <li>CJ대한통운 홈페이지 또는 모바일 전용 APP을 다운받아보시면 빠르게 배송현황을 조회 하실 수있습니다</li>
            </ul>
            <p>[제주도 및 도서 산간지방 배송료]</p>
            <ul>
              <li>제주도및 도서산간지방의 배송비는 편도 3,000원의 추가 금액이 발생 합니다.</li>
              <li>이에 따라 반품시에는 왕복 6,000원의 비용이 추가 발생됩니다.</li>
              <li>제주도 및 도서산간지방 배송비 : 3,000원 + 3,000원 = 6,000원</li>
              <li>제주도 및 도서산간지방 반품 배송비 : 6,000원(기본배송비) + 6,000원(도서산간지방추가운임) = 12,000원 입니다.</li>
              <li>자세한 문의는 1:1게시판이나 고객센터(1644-3225),톡톡으로 해주세요.</li>
              <li>악세사리 상품일경우 최대 2주의 제작기간이 소요될수 있습니다. 참고해서 구매 부탁드립니다.</li>
            </ul>
          </td>
        </tr>
        <tr>
          <th scope="row" align="center">교환/반품(환불) <br> 안내</th>
          <td>
            <ul>
              <li>상품 구매하시기 전 색상 및 사이즈를 꼼꼼히 확인해 주시고 신중한 구매 부탁드립니다 :)</li>
              <li>교환 및 반품이 가능한 경우는 상품을 받으신 날로부터 7일 이내에 접수한 경우입니다. (7일이면 불량을 발견하거나 교환&반품을 결정하시기에 충분한 시간입니다.)</li>

              <li>고객의 기분 좋은 쇼핑을 위해 교환 및 환불이 원활하게 이루어질 수 있도록 24시간 내내 [마이 페이지]내 [주문내역]에서  직접 신청하실 수 있습니다. </li>
              <li>교환/반품(환불) 신청시 고객님의 조건에 따라 추가 금액이 발생 할 수 있습니다. 모든 교환/반품(환불)은 [ pg결제창] 결제 완료후 진행 됩니다.</li>
              <li>교환/반품을 신청을 하시면 자동수거 시스템으로 인해 신청일 2~3일안에 cj대한통운 기사님이 방문하시어 상품회수 진행 됩니다. 따로 수거요청 하실 필요 없습니다.</li>
              <li>오늘출발 배송비 3,000원은 상품 반품시 환불 되지 않습니다. 양해 부탁드립니다</li>
              <li>(오늘출발 배송비: 오늘출발상품과 일반상품을 같이 주문 오늘출발 상품만 먼저 받으려고 지불하는 택배비)</li>
              <li>교환/반품에 다른 문의 사항이 있으신경우 고객센터(1644-3225), 1대1 게시판, 네이버 톡톡,카카오 상담톡을 통해 문의 해주시면 빠르게 상담 받으실 수 있습니다.</li>

              <li>변심으로 인한 단순반품은 왕복배송비 6,000원 고객님 부담이십니다.</li>
              <li>받으신 상품이 불량일 경우 무상으로 교환 도와드리고 있습니다.</li>
              <li>받으신 상품의 사이즈 교환은 1회 무상으로 진행에 드립니다.(무상 교환후 반품시 교환 왕복비용 6,000원이 청구됩니다)</li>
              <li>불량상품을 다른상품이나 다른색상으로 교환시 또는 반품하실경우, 왕복배송료의 절반에 해당하는 3,000원의 배송료가 발생합니다.</li>
              <li>CJ대한통운 외에 일반 다른택배를 이용하실 경우, 착불로 보낼 시 반송되고있으니, 타택배이용시에는 꼭 선불로 보내주세요.</li>
              <li>무료배송 제품의 경우 고객 사정에 의한 반송(부재/주소불분명/전화연결불가)시 택배사의 재접수로 인하여 왕복택배료 6,000원이 발생합니다. </li>
              <li>(반품 및 재배송 요청 시 모두 적용됩니다.)</li>
              <li>* 선배송 받아보시고 후배송상품이 남아 있을경우 후배송상품 마저 받아보신후 반품신청 부탁드리며, 따로 받으셨어도 ★ 꼭! 한상자에 담아서 보내주셔야 택배비 과중부담이 없으십니다.</li>
              <li>무료배송상품 반품으로 인하여 구매금액(실결제금액)이 80,000원이하가 될 경우, 초기 배송료 3,000원+ 반품배송비 3,000 해서 총 6,000원 을 부담해 주셔야 합니다.</li>
              <li>무료교환상품+변심반품상품을 같이 보내실 경우 3,000원 고객님 부담이 발생합니다.</li>
              <li>불량반품상품+변심반품상품을 같이 보내실 경우 3,000원 고객님 부담이 발생합니다.</li>
              <li>불량교환상품+변심반품상품을 같이 보내실 경우 3,000원 고객님 부담이 발생합니다.</li>
              <li>변심상품이 포함된상품은 반품비 고객님 부담이 있는점 꼭 참고해주세요.</li>
            </ul>
            <ul class="paragraph">
              <li>반품시 함께 배송되어진 구성품 (옷걸이,사은품 등)을 꼭 동봉해서 보내주세요. </li>
              <li>보내드린 사은품이 동봉되지 않았을 경우에는 판매가로 추가비용이 발생 할 수 있습니다.</li>
              <li>ex)거울 3,000원, 물티슈 600원, 스타킹 5,800원이 추가비용으로 발생됩니다.</li>
            </ul>

            <ul class="paragraph">
              <li>
                택배 봉투 및 박스 개봉 시 칼 또는 가위의 사용을 주의해 주시고,사용하실 땐 밝은 곳에서<br>
                내용물 위치를 정확히 확인하신 후 컷팅을 부탁드립니다.<br>
                고객님들께서 개봉 시 실수로 내시는 칼집 및 가위집은 불량으로 교환&반품처리가 어렵습니다.
              </li>
            </ul>

            <div style='white-space:pre-line; font-size: 14px;color:#888'>
              <font style='color:red;'>★ 불량 교환&반품 전 참고해주세요</font>

              - 나염 상품 등 패턴으로 된 상품의 경우, 원단이 잘라지는 위치에 따라 재단이 달라지기 때문에 패턴의 위치가 조금씩 다를 수 있으며, 이는 상품의 하자 또는 불량사유에 해당되지 않습니다.

              - 상품의 마감 처리가 미흡한 경우 (예: 실밥, 본드자국, 초크자국, 박음질 불균형, 지퍼의 퍽퍽함, 단추 구멍이 완벽히 뚫리지 않는 경우                      등) 은 상품의 하자 또는 불량사유에 해당되지 않습니다

              - 컴퓨터 모니터 및 스마트폰 화면 등의 해상도 차이로 인해 실물과 색상 차이가 있을 수 있으며, 상품 사이즈는 측정하는 방법에 따라 다를 수 있기 때문에 사이즈 오차 (1-3cm) 는 상품의 하자 또는 불량사유에 해당되지 않습니다.

              - 구매하신 상품과는 관계없는 케이스, 포장지 등의 파손은 상품의 하자 또는 불량사유에 해당되지 않습니다.

              - 끈, 벨트, 단추, 악세사리 등의 부속품 누락의 경우 불량사유에 해당되지 않습니다. (누락일경우 1:1게시판에 문의주시면 담당부서 확인 후 부속품만 별도 발송으로 진행 도와드리겠습니다)

              <font style="color: red;">★ 고객님 부주의로 생긴 불량은 반품불가로 별도의 안내없이 반송될 수 있음을 양해 부탁드립니다.</font>
            </div>
            <ul class="paragraph">
              <li>생활주름및 향수, 착용 흔적및 착용으로인한 인위적인 변형, 수선등으로 상품의 가치가 떨어진경우 교환,반품이 불가할수 있으니 꼭 유의해 주세요.</li>
            </ul>

            <ul class="paragraph">
              <li>겨울코트 착용시 주의사항</li>
              <li>겨울코트는 가공방법에따라서 착용하시다보면 보풀이 생기는 경우가 있거나 고객님들 착용상태에 따라 보풀이 생길수 있습니다. </li>
              <li>가방에의해 생기는 보풀이라든가 마찰에 의해 생기는 보풀등 착용 후 생활상에서 생긴 보풀은 불량,반품에 해당되지 않는 부분 양해 부탁드립니다.</li>
              <li>드라이크리닝 후에 착용하시면 보풀 방지에 도움이 되고 더 오래 깔끔하게 입으실 수 있는 방법이기도 합니다.</li>
              <li>tip) 겨울상품 착용 후 보풀 발생시 보풀 제거기를 사용하시면 깔끔하게 입으실 수 있답니다</li>
            </ul>
          </td>
        </tr>
        <tr>
          <th scope="row">결제 완료 후<br>주문취소</th>
          <td>
            <ul>
              <li>상품 결제 완료 후 주문취소를 원하실 경우  24시간 내내 [마이 페이지]내 [주문내역]에서 [상품 준비중] 단계 까지만  직접 신청하실 수 있습니다. </li>
              <li>이후 주문취소 요청하였으나 출고된 주문건에 대해서는 반품으로 처리되어 반품비 고객님 부담되십니다.</li>
              <li>다른 문의 사항이 있으신경우 고객센터(1644-3225), 1대1 게시판, 네이버 톡톡,카카오 상담톡을 통해 문의 해주시면 빠르게 상담 받으실 수 있습니다.</li>
            </ul>
          </td>
        </tr>
        <tr>
          <th scope="row">소비자보호<br>예외조항</th>
          <td>
            <ul>
              <li>교환/반품(환불) 기간 (상품 수령일로부터 7일이내 접수)이 경과된 상품의 경우</li>
              <li>고객님의 부주의로인해 상품 가치를 훼손한 경우 (착용흔적, 얼룩, 찢김, 화장품, 향수냄새 등)</li>
              <li>인위적으로 상품을 손상하신 경우 (라벨제거, 스크래치, 수선, 세탁 및 드라이크리닝, 훼손 등)</li>
              <li>시간이 경과하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우</li>
              <li>고객주문 확인 후 상품제작에 들어가는 오더메이드 제품은 환불, 교환이 불가합니다.</li>
              <li>교환/반품(환불)을 목적으로 한 의도적인 상품훼손은 손해배상이 청구될 수 있습니다.</li>
            </ul>
          </td>
        </tr>
        <tr>
          <th scope="row">대표 : Thejoeun</th>
          <td>
            <ul>            
            <li>T : 02.766.8367</li>
            <li>F : 02.735.7877</li>
            <li>주소 : 서울특별시 종로구 삼일대로 385-1, 동일빌딩 5,6층</li>
            <li>책임자 : 오세진,전은주,안수환,채진영<br><a href="mailto:Thezoeun@naver.com">Thezoeun@naver.com</a></li>
            </ul>
          </td>
        </tr>
     
      </tbody>
    </table>
  </div> 
</div>
<div align="center">
<!-- 쇼핑몰정보 및 에스크로 -->
Copyright (c) <strong>Thejoeun</strong>. All Rights Reserved.
</div>  
</body>
</html>