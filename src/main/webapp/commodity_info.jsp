<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="index1.jsp" %>
<%-- <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'commodity_info.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		#commodity_div{
			padding-left:100px;
			position: absolute;
			margin: 0 auto;
			top:150px;
			width: 100%;
			height: 100%;
		}
		#commodity_id{
			position:absolute;
			width: 500px;
			height: 350px;	
		}
		#cname{
			position: absolute;
			top: 30px;
			left: 650px;
			font-size: 30px;
		}
		#market{
			position: absolute;
			top: 100px;
			left: 650px;
			background-color: FF9933;
			width: 350px;
		}
		#shop{
			position: absolute;
			top: 146px;
			left: 650px;
			background-color: FF9933;
			width: 350px;
		}
		.price{
			font-size: 35px;
			color:FF0033;
		}
		#buy,#car{
			cursor: pointer;
		}
		#buy{
			position:absolute;
			top: 250px;
			left: 650px;
			width: 136px;
			height: 46px;
			line-height:46px;
			background-color: red;
			font-size: 25px;
			text-align: center;
		}
		
		#car{
			position:absolute;
			top: 250px;
			left: 800px;
			width: 182px;
			height: 46px;
			line-height:46px;
			background-color: red;
			font-size: 25px;
			text-align: center;
		}
		
		#info{
			padding:100px;
			position:absolute;
			top:400px;
			width: 900px;
			height:350px;
			background-color: #F8F8F8;
			border: 3px solid D8D8D8;
		}
	</style>
  </head>
  
  <body>
  		<div id="commodity_div">
  			<img alt="hot" id="commodity_id" src='/commodity/${requestScope.commodity.pictrueAddress}'>
	  		<font id="cname">${requestScope.commodity.cname}</font>
	  		<p id="market">市场价：<font class="price"><del>${requestScope.commodity.marketPrice}</del></font></p>
	  		<p id="shop"> 商 城 价： <font class="price">${requestScope.commodity.shopPrice}</font></p>
			<form action="cut/addCatItem.action" method="POST">
				<input type="hidden" name="id" value="${requestScope.commodity.cid}">
				<input type="hidden" name="name" value="${requestScope.commodity.cname}">
				<input type="hidden" name="pictrueAddress" value="${requestScope.commodity.pictrueAddress}">
				商品数量：<input type="text" name="commodityNum" value=1>
			</form>
   			<div id="buy" >立即购买</div>
   			<div id="car" onclick="">加入购物车</div>
   			
   			<div id="info">
   				${requestScope.commodity.info}
   			</div>
   		</div>
  </body>
</html>
