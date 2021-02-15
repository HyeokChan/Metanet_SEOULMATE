<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <title>Hello, world!</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> <!-- jQuery사용을 명시 -->
	<script src="${root}/resources/js/member.js"></script>
    
    <style>
        img { max-width: 100%; height: auto; }
			
	#gangnam{
	width: 50px;
    height: 40px;
    left: 65.5%;
    top: 58%;
    position: absolute;
		}
	
	#gangdong{
    width: 50px;
    height: 40px;
    left: 76%;
    top: 45%;
    position: absolute;
		}

	#gangseo{
	width: 50px;
    height: 40px;
    left: 36%;
    top: 44%;
    position: absolute;
		}
	#guro{
	width: 50px;
    height: 40px;
    left: 39.5%;
    top: 58%;
    position: absolute;
		}	
	#guanak{
    width: 50px;
    height: 40px;
    left: 51%;
    top: 64%;
    position: absolute;
		}
	#gumchun{
  	width: 50px;
    height: 40px;
    left: 46%;
    top: 66%;
    position: absolute;
		}
	#dongjak{
	width: 50px;
    height: 40px;
    left: 52%;
    top: 57%;
    position: absolute;
	}	
	#seocho{
	width: 50px;
    height: 40px;
    left: 60%;
    top: 61%;
    position: absolute;
	}	
	#songpa{
	width: 50px;
    height: 40px;
    left: 72%;
    top: 55%;
    position: absolute;
    }		
	#yangchun{
	width: 50px;
    height: 40px;
    left: 40%;
    top: 53%;
    position: absolute;
	}	
	#yeongdungpo{
	width: 50px;
    height: 40px;
    left: 47%;
    top: 53%;
    position: absolute;
	}		
	#gangbuk{
	width: 50px;
    height: 40px;
    left: 60%;
    top: 29%;
    position: absolute;
	}	
	#gwangjin{
	width: 50px;
    height: 40px;
    left: 69%;
    top: 47%;
    position: absolute;
	}
	#nowon{
	width: 50px;
    height: 40px;
    left: 61.5%;
    top: 25%;
    position: absolute;
	}
	#dobong{
	width: 50px;
    height: 40px;
    left: 62%;
    top: 22%;
    position: absolute;
	}	
	#dongdaemoon{
	width: 50px;
    height: 40px;
    left: 64.5%;
    top: 40%;
    position: absolute;
	}			
	#mapo{
	width: 50px;
    height: 40px;
    left: 47%;
    top: 45%;
    position: absolute;
	}
	#seodaemoon{
	width: 50px;
    height: 40px;
    left: 50%;
    top: 41%;
    position: absolute;
	}
	#seongdong{
    width: 50px;
    height: 40px;
    left: 63.5%;
    top: 46%;
    position: absolute;
	}
	#seongbuk{
    width: 50px;
    height: 40px;
    left: 60.5%;
    top: 36%;
    position: absolute;
	}
	#enpyung{
	width: 50px;
    height: 40px;
    left: 49%;
    top: 31%;
    position: absolute;
	}
	#yongsan{
	width: 50px;
    height: 40px;
    left: 56%;
    top: 50%;
    position: absolute;
	}
	#junggu{
	width: 50px;
    height: 40px;
    left: 58%;
    top: 45%;
    position: absolute;
	}
	#jungranggu{
	width: 50px;
    height: 40px;
    left: 69.5%;
    top: 36%;
    position: absolute;
	}
	#jongro{
	width: 50px;
    height: 40px;
    left: 55.5%;
    top: 39%;
    position: absolute;
	}
		#hotarea{
		position : absoulute;
		background: #FF8080;
		}	
		
		
    </style>
</head>
<body>

<jsp:include page="../navbar.jsp"></jsp:include>
<div class="container" style="margin-top: 90px">
    <div class="row">
        <div class="col-md-2">
            <a class="btn btn-outline-dark" href="allBoard">리뷰 게시판 보러가기</a>
            
        </div>
        <div class="col-md-10">
              <img src="${root}/resources/images/seoulmap.jpg" usemap="#regionMap" name="point" >

			<map id="regionMap" name="regionMap">
				<area shape="rect" alt="강남구" coords="1808,1644,1967,1728" href="allBoard?region_code=1" target="" />
				<area shape="rect" alt="강동구" coords="2269,1270,2433,1351" href="allBoard?region_code=2" target="" />
				<area shape="rect" alt="강서구" coords="546,1201,757,1301" href="allBoard?region_code=3" target="" />
				<area shape="rect" alt="구로구" coords="694,1649,849,1724" href="allBoard?region_code=4" target="" />
				<area shape="rect" alt="관악구" coords="1224,1830,1392,1918" href="allBoard?region_code=5" target="" />
				<area shape="rect" alt="금천구" coords="984,1882,1122,1955" href="allBoard?region_code=6" target="" />
				<area shape="rect" alt="동작구" coords="1260,1604,1413,1682" href="allBoard?region_code=7" target="" />
				<area shape="rect" alt="서초구" coords="1558,1737,1739,1824" href="allBoard?region_code=8" target="" />
				<area shape="rect" alt="송파구" coords="2110,1552,2285,1638" href="allBoard?region_code=9" target="" />
				<area shape="rect" alt="양천구" coords="731,1496,900,1577" href="allBoard?region_code=10" target="" />
				<area shape="rect" alt="영등포구" coords="993,1489,1193,1562" href="allBoard?region_code=11" target="" />
				<area shape="rect" alt="강북구" coords="1594,749,1752,832" href="allBoard?region_code=12" target="" />
				<area shape="rect" alt="광진구" coords="1961,1305,2115,1382" href="allBoard?region_code=13" target="" />
				<area shape="rect" alt="노원구" coords="1890,627,2049,710" href="allBoard?region_code=14" target="" />
				<area shape="rect" alt="도봉구" coords="1680,526,1831,605" href="allBoard?region_code=15" target="" />
				<area shape="rect" alt="동대문구" coords="1756,1077,1961,1161" href="allBoard?region_code=16" target="" />
				<area shape="rect" alt="마포구" coords="1030,1239,1192,1312" href="allBoard?region_code=17" target="" />
				<area shape="rect" alt="서대문구" coords="1123,1129,1323,1201" href="allBoard?region_code=18" target="" />
				<area shape="rect" alt="성동구" coords="1729,1271,1900,1355" href="allBoard?region_code=19" target="" />
				<area shape="rect" alt="성북구" coords="1591,952,1762,1038" href="allBoard?region_code=20" target="" />
				<area shape="rect" alt="은평구" coords="1126,808,1286,894" href="allBoard?region_code=21" target="" />
				<area shape="rect" alt="용산구" coords="1410,1387,1570,1466" href="allBoard?region_code=22" target="" />
				<area shape="rect" alt="중구" coords="1517,1224,1636,1297" href="allBoard?region_code=23" target="" />
				<area shape="rect" alt="중랑구" coords="1983,972,2157,1051" href="allBoard?region_code=24" target="" />	
				<area shape="rect" alt="종로구" coords="1390,1061,1542,1131" href="allBoard?region_code=25" target="" />
				<!-- Created by Online Image Map Editor (http://www.maschek.hu/imagemap/index) -->
			</map>
                 	 <c:forEach var="topThree" items="${topThree}">
            	 <input type="hidden" name="post_code" value="${topThree.region_code}">
            	  <c:if test="${topThree.region_code == 1}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="gangnam">
				  </c:if>
				  <c:if test="${topThree.region_code == 2}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="gangdong">
				  </c:if>
				  <c:if test="${topThree.region_code == 3}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="gangseo">
				  </c:if>
            	  <c:if test="${topThree.region_code == 4}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="guro">
				  </c:if>
            	  <c:if test="${topThree.region_code == 5}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="guanak">
				  </c:if>
				  <c:if test="${topThree.region_code == 6}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="gumchun">
				  </c:if>
            	  <c:if test="${topThree.region_code == 7}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="dongjak">
				  </c:if>
				  <c:if test="${topThree.region_code == 8}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="seocho">
				  </c:if>
				  <c:if test="${topThree.region_code == 9}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="songpa">
				  </c:if>
            	  <c:if test="${topThree.region_code == 10}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="yangchun">
				  </c:if>
            	  <c:if test="${topThree.region_code == 11}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="yeongdungpo">
				  </c:if>
            	  <c:if test="${topThree.region_code == 12}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="gangbuk">
				  </c:if>
				  <c:if test="${topThree.region_code == 13}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="gwangjin">
				  </c:if>
            	  <c:if test="${topThree.region_code == 14}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="nowon">
				  </c:if>
				  <c:if test="${topThree.region_code == 15}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="dobong">
				  </c:if>
				  <c:if test="${topThree.region_code == 16}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="dongdaemoon">
				  </c:if>
				  <c:if test="${topThree.region_code == 17}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="mapo">
				  </c:if>	 				 
				  <c:if test="${topThree.region_code == 18}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="seodaemoon">
				  </c:if>	 
				   <c:if test="${topThree.region_code == 19}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="seongdong">
				  </c:if>
				   <c:if test="${topThree.region_code == 20}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="seongbuk">
				  </c:if>
				  <c:if test="${topThree.region_code == 21}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="enpyung">
				  </c:if>
				  <c:if test="${topThree.region_code == 22}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="yongsan">
				  </c:if>
				  <c:if test="${topThree.region_code == 23}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="junggu">
				  </c:if>
				  <c:if test="${topThree.region_code == 24}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="jungranggu">
				  </c:if>
				  <c:if test="${topThree.region_code == 25}">
                  <img src="${pageContext.request.contextPath}/resources/images/heart.png" usemap="#HotMap" id="jongro">
				  </c:if>
				  
             </c:forEach> -->
            
        </div>

    </div>
</div>

<script src="${root}/resources/js/jquery.rwdImageMaps.min.js"></script>
<script>
	$(document).ready(function(e) { $('img[usemap]').rwdImageMaps(); });
</script>
<script>	 
 </script>


<!-- Optional JavaScript; choose one of the two! -->
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>-->
</body>
</html>