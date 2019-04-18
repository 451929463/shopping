<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<!--添加css响应效果,自动根据识别屏幕分辨率，来调整大小-->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!--引入css样式-->
		<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
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
  <a href="bt_top.html">html</a>
  		<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
     	 <a class="navbar-brand" href="#">
      	<img src="img/logo2.png" height="30px"/>
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">java <span class="sr-only">(current)</span></a></li>
        <li><a href="#">C++</a></li>
        <li><a href="#">php</a></li>
        <li><a href="#">C++</a></li>
        <li><a href="#"><button id="login">登陆</button></a></li>
        <li><a href="#"><button id="reg">注册</button></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">人生</a></li>
            <li><a href="#">何在</a></li>
            <li><a href="#">取消/a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-right">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
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
			用&nbsp户&nbsp名<input type="text" name="uname" value="root"> <br>
			密&nbsp&nbsp&nbsp码&nbsp&nbsp<input type="text" name="upwd" value="123"> <br>
			<input type="submit" value="登陆" >
			<button class="cancel" type="button">取消</button>
		</div>
</body>
</html>

