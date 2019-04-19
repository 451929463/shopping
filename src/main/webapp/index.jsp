<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
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
</style>
  <script type="text/javascript">
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
  	});
  </script>
  <body>
	       
   
	        <c:set var="uname" value="${requestScope.uname}"/>
	        
        	<c:if test="${empty uname}">
        		 <a href="#" id="login">请登陆</a>
	        	 <a href="#" id="reg">注册</a>
        	</c:if>
        	<c:if test="${not empty uname }">
        		${requestScope.uname }	你好
	        <a href="#" id="loginOut">退出</a>
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
				用&nbsp户&nbsp名<input type="text" name="uname" value="root"> <br>
				密&nbsp&nbsp&nbsp码&nbsp&nbsp<input type="text" name="upwd" value="123"> <br>
				<input type="submit" value="登陆" >
				<button class="cancel" type="button">取消</button>
			</form>
		</div>
</body>
</html>

