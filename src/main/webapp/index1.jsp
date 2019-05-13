<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'MyJsp.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Pragma" content="no-cache">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!--添加css响应效果,自动根据识别屏幕分辨率，来调整大小
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />-->
  	<!--引入js效果-->
		<script type="text/javascript" src="js/jquery-3.1.1.js" ></script>
		<script type="text/javascript" src="js/bootstrap.js" ></script>
  </head>
  <style>
  	*{
			margin: 0;
			padding: 0;
		}
	.user{
	    position: fixed;
	    top: 80px;
	    left: 0px;
	    right: 0px;
	    bottom: 0px;
	    margin: auto;
	    display: none;
	    background-color: white;
	    width: 220px ;
	    height: 250px ;
	    z-index: 100;
	}
	.login{
		position: fixed;
		top: 80px;
	    left: 0px;
	    right: 0px;
	    bottom: 0px;
	    margin: auto;
	    display: none;
	    background-color: white;
	    width: 220px ;
	    height: 250px ;
	    z-index: 100;
	}
	.cancel{
		position: relative;
		left:100px;
	}
	#seller{
		position: absolute;
		top:15px;
		right: 450px;
	}
	#login{
		position: absolute;
		top:15px;
		right: 200px;
	}
	#reg{
		position: absolute;
		top:15px;
		right: 150px;
	}
	.li_Type{
	/* 	clear:right; */
		margin:0 auto;
		cursor:pointer;
		background-color:red;
		list-style:none;
		float: left; 
		display: inline-block;
		width: 250px;
		height: 60px;
		text-align: center;
		line-height: 60px;
	}
	.hotCommondity{
		width: 500px;
		height: 350px;
	}
	#type_ul{
		position: relative;
		left:49px;
	}
	a{
		margin-left: 15px;
	}
	#p_content{
		position: absolute;
		right: 100px;
		top:15px;
	}
</style>
  <script type="text/javascript">
  	$(function(){
  		$.ajax({
			type:"get",
			url:"typeCommodity/findAll.action",
			dataType:"json",
			data:"",
			success:function(data){
				var arr = data;
				var len = arr.length;
				for(var type in arr){
					var $li = $("<a href=commodity/findByTid?tid='"+arr[type].tid+"'><li>"+arr[type].tname+"</li></a>");
					$("ul").append($li);
				}
				$("li").attr("class","li_Type");
				$("li").css("width",1250/len);
			},
			error:function(){
				alert("error");
			}
		});
  		
  		$("#reg").click(function(){
  			$(".user").show();
  		});
  		$("#login").click(function(){
  			$(".login").show();
  		});
  		$(".cancel").click(function(){
  			$(".user").hide();
  			$(".login").hide();
  		});
  		$("ul").delegate("li","mouseover",function(){
			$(this).css("background-color","blue");
		});
  		$("ul").delegate("li","mouseout",function(){
  			$(this).css("background-color","red");
  		});
  	});
  </script>
  <body>
  		<a href="index.jsp"><img alt="shop" src="img/logo.jpg" height="70px"></a>
  		<a id="seller" href="seller.jsp">后台管理</a>
  		<c:if test="${empty sessionScope.user }">
  			<a id="login" href="#">登陆</a><a id="reg" href="#">注册</a>
  		</c:if>
  		<c:if test="${not empty sessionScope.user }">
  			<p id="p_content">
  			<font id="scope_value"><c:out value="${sessionScope.user.uname }"></c:out>,你好</font> <a id="loginOut" href="/shopping/admin/loginOut.action">退出</a>
  			<a href='#'>购物车</a><a href='#'>我的订单</a>
  			<p>
  		</c:if>
  		
  		<div class="user">
			<form action="admin/addUser.action" method="post">
				<!-- 用户ID<input type="text" name="uid" value="1"><br> -->
				用&nbsp户&nbsp名<input type="text" name="uname" value="root"> <br>
				密&nbsp&nbsp&nbsp码&nbsp&nbsp<input type="text" name="upwd" value="123"> <br>
				邮&nbsp&nbsp&nbsp箱&nbsp&nbsp<input type="text" name="email" value="666@qq.com"> <br>
				性&nbsp&nbsp&nbsp别&nbsp&nbsp<input type="text" name="sex" value="男"> <br>
				真实姓名<input type="text" name="realname" value="zs"> <br>
				手&nbsp机&nbsp号<input type="text" name="phonenum" value="18888888888"> <br>
				状&nbsp态&nbsp码<input type="text" name="activenum" value="1234"> <br>
				<!-- 状态码<input type="" name="activestatus" value=""> <br> -->
				<input type="submit" value="注册"> <button class="cancel" type="button">取消</button>
			</form>
		</div>
		<div class="login">
			<form action="admin/loginUser.action" method="post">
				用&nbsp户&nbsp名<input type="text" name="uname" value="${cookie.uname.value}"> <br>
				密&nbsp&nbsp&nbsp码&nbsp&nbsp<input type="text" name="upwd"> <br>
				<input type="checkbox" name="whether" value="ok">是否保存用户名
				<input type="submit" value="登陆" >
				<button class="cancel" type="button">取消</button>
			</form>
		</div>
		<%-- <c:forEach items="${requestScope.list }" var="typeCommodity">
				${typeCommodity.tname}wesfdgjhkgjghfdgfhkjlgjgfdfsghj
		</c:forEach> --%>
		<ul id="type_ul"></ul>
</body>
</html>

