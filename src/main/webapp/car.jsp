<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="index1.jsp" %>
<%-- <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'car.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		#car_show{
			position:absolute;
			left:600px;
			width:650px;
			padding-top: 50px;
		}
		.commodity_pic{
			width: 100px;
			height: 70px;
		}
		table{
			border: 1px solid #F0F0F0;
			width: 650px;
		}
		tr{
			cursor: pointer;
		}
		td{
			text-align: center;
		}
		.title_show{
			background-color: FF9900;
		}
		.body_show{
			background-color: #F8F8F8;
		}
		#totalPrice{
			color: red;
		}
		
	</style>
  </head>
  		<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
  		<script type="text/javascript">
  			$(function(){
  				$(".body_show").mouseover(function(){
  					$(this).prop("class","title_show");
  				});
				$(".body_show").mouseout(function(){
					$(this).prop("class","body_show");
  				});
  			});
  			function sub(){
  				alert("sub");
  			}
  		</script>
  <body>
        <c:if test="${empty sessionScope.map }">
  			<img alt="" src="img/logo.jpg">
  			购物车暂无商品
  		</c:if>
  		<c:if test="${not empty sessionScope.map }">
  			<div id="car_show">
  			<p style="font-size: 20px;color: red">购物车</p>
  			<table>
  				<tr class="title_show">
  					<td>图片</td>
  					<td>商品</td>
  					<td>单价</td>
  					<td>数量</td>
  					<td>小计</td>
  					<td>操作</td>
  				</tr>
  			
  			<c:forEach items="${sessionScope.map.cars }" var="item">
  		
  				 <tr class="body_show">
  				 	
  					<td><a href="commodity/findBycid.action?cid=${item.id }"> <img class='commodity_pic' src="/commodity/${item.pictrueAddress }"></a></td>
  					<td>${item.name } </td>
  					<td>${item.shopPrices } </td>
  					<td>${item.commodityNum } </td>
  					
  					<td>${item.commodityNum }*${item.shopPrices }</td>
  					<td><a href="car/delCarItem.action?id=${item.id }">删除</a></td>
  				</tr>
  			</c:forEach>
  			</table>
  			<p id="totalPrice">	商品金额：${sessionScope.map.totalPrice } <p>
 			<button onclick="sub()">提交订单</button>
  		</c:if>
  		</div>
  </body>
</html>
