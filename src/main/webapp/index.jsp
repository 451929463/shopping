<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="index1.jsp" %>
<%-- <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%-- <base href="<%=basePath%>"> --%>
    <title>My JSP 'MyJsp.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Pragma" content="no-cache">
	<script type="text/javascript" src="js/jquery-3.1.1.js" ></script>
	<style type="text/css">
		*{
			margin: 0;
			padding: 0;
		}
		#content{
			position:absolute;
			top:150px;
			width: 100%;
			height: 80%;
			background-color: yellow;
		}
		.hot_show{
			float: left;
		}
		#p{
			cursor:pointer;
			width: 8000px;
			height: 350px;
			background: white;
		}
		#p_show{
			width: 1000px;
			height: 350px;
			margin: 5px auto;
			/* border: 1px solid red; */
			overflow: hidden;
		}
		
	</style>
  </head>
 	<script type="text/javascript">
 		$(function(){
 			$.ajax({
				url:"commodity/findByHot.action?hot=1",
				type:"get",
				data:"",
				dataType:"json",
				success:function(data){
					for(var index in data){
						var $p = $("<p class='hot_show' onclick='findBycid("+data[index].cid+")'><img class='hotCommondity' src='/commodity/"+data[index].pictrueAddress+"'></img></p>");
						$("#p").append($p);
					}
				},
				error:function(){
					alert("服务器维护");
				}
			});
 			
 			var offset = 0;
 			var timer ;
 			//图片滚动 效果
 			function autoplay(){
 				timer = setInterval(function(){
 					offset += -10;
 					if(offset <= -7000){
 						offset = 0;
 					}
 					$("#p").css("margin-left",offset);
 				}, 100);
 			}
 			autoplay();
 			//鼠标移入图片效果
 			$("#p").delegate(".hot_show","mouseover",function(){
 				clearInterval(timer);
				$(this).siblings().fadeTo(100,0.5);
				$(this).fadeTo(100,1);
			});
 			$("#p").delegate(".hot_show","mouseout",function(){
 				autoplay();
				$(".hot_show").fadeTo(100,1);
			});
 		});
 		function findBycid(cid){
 			$.ajax({
 				url:"commodity/findBycid.action?cid="+cid,
 				type:"get",
 				data:"",
 				dataType:"json",
 				success:function(data){
 					alert(data);
 				},
 				error:function(){
 					alert("findBycid error");
 				}
 			});
 			
 		}
 	</script>
  <body>
	<div id="content">
		<div id="p_show">
			<p id="p"></p>
		</div>
	</div>
</body>
</html>

