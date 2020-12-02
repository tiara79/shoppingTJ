<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
  	body{
  	background-color: #efcec5;
  	}
  
  </style>

</head>
<body>
  <table width="1000px">
  <div>
<tr height="500px">
      <td align="center">
      <a href="saleCloth.jsp?center=listAll.jsp">
        <img src="img/main.gif" style="width:100%" alt="">
        </a>
      </td>
    </tr>
    </div>
  <div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <a href="saleCloth.jsp?center=categoryList.jsp&category=<%=1 %>">
  <img src="img/main1.png" style="width:100%">
  </a>
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <a href="saleCloth.jsp?center=categoryList.jsp&category=<%=2 %>">
  <img src="img/main2.png" style="width:100%">
  </a>
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <a href="saleCloth.jsp?center=categoryList.jsp&category=<%=3 %>">
  <img src="img/main3.png" style="width:100%">
  </a>
  <div class="text">Caption Three</div>
</div>

<a class="prev" onclick="plusSlides(-1)" >&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>
  </table>
  <script src="https://kit.fontawesome.com/fac1f30643.js" crossorigin="anonymous"></script>
  
  <script defer>
  var slideIndex = 0;
  showSlides();

  function showSlides() {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("dot");
      for (i = 0; i < slides.length; i++) {
         slides[i].style.display = "none";  
      }
      slideIndex++;
      if (slideIndex > slides.length) {slideIndex = 1}    
      for (i = 0; i < dots.length; i++) {
          dots[i].className = dots[i].className.replace(" active", "");
      }
      slides[slideIndex-1].style.display = "block";  
      dots[slideIndex-1].className += " active";
      setTimeout(showSlides, 2000); // Change image every 2 seconds
  }
  </script>
    
    
  </table>
  
</body>
</html>










