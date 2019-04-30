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
	}
	.cancel{
		position: relative;
		left:100px;
	}
	#seller{
		position: absolute;
		top:15px;
		right: 250px;
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
	font{
		position: absolute;
		top:15px;
		right: 250px;
	}
	#loginOut{
		position: absolute;
		top:15px;
		right: 200px;
	}
	li{
		margin:0 auto;
		cursor:pointer;
		background-color:red;
		list-style:none;
		float: left;
		display: inline-block;
		//width: 250px;
		height: 60px;
		text-align: center;
		line-height: 60px;
	}
	
</style>
  <script type="text/javascript">
  window.onload=function(){
		$.ajax({
				type:"get",
				url:"typeCommodity/findAll.action",
				dataType:"json",
			/* 	contentType: "application/json;charset=utf-8", */
				data:"",
				success:function(data){
					var arr = data;
					var len = arr.length;
					for(var type in arr){
						var $li = $("<a href=commodity/findByTid?tid='"+arr[type].tid+"'><li>"+arr[type].tname+"</li></a>");
						$("ul").append($li);
					}
					$("li").css("width",1300/len);
				},
				error:function(){
					alert("error");
				}
			});
		}
  	$(document).ready(function(){
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
 		/* $("ul").delegate("li","click",function(){
 			$.ajax({
 				url:"",
 				type:"get",
 				dataType:"json",
 				data:"",
 				success:function(){
 					
 				},
 				error:function(){
 					
 				}
 				
 			});
 		}); */
  	});
  </script>
  <body>
  		<img alt="shop" src="img/logo.jpg" height="70px">
  		<a id="seller" href="seller.jsp">后台管理</a>
  		<c:if test="${empty sessionScope.user }">
  			<a id="login" href="#">登陆</a><a id="reg" href="#">注册</a>
  		</c:if>
  		<c:if test="${not empty sessionScope.user }">
  			<font><c:out value="${sessionScope.user.uname }"></c:out>,你好</font> <a id="loginOut" href="/shopping/admin/loginOut.action">退出</a>
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
		<c:forEach items="${requestScope.list }" var="typeCommodity">
				${typeCommodity.tname}
		</c:forEach>
		<ul></ul>
</body>
</html>

