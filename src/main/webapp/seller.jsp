<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'seller.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body,html{
			margin: 0;
			padding: 0;
		}
		#top{
			width:100%;
			height:10%;
			background: #EEEEEE;
			text-align: center;
		}
		#left{
			position:absolute;
			top:80px;
			width: 20%;
			height: 88%;
		}
		#right{
			position:absolute;
			right:0px;
			top:80px;
			width: 79%;
			height: 88%;
			background-color: yellow;
		}
		li{
			cursor:pointer;
			list-style: none;
			background-color:#C0C0C0;
			//display: inline-block;
			float:none;
			width: 200px;
			height: 60px;
			text-align: center;
			line-height:60px;
		}
		p{	
			cursor:pointer;
			background-color:#C0C0C0;
			color: yellow;
			font-size: 20 ;
		}
		#upload_value{
			display: none;
		}
		input{
			display: inline-block;
		}
		form{
			position: relative;
			top:150px;
			left:100px;
		}
		.hidd{
			display: none;
		}
		.show{
			
		}
		img{
			height: 60px;
			width: 80px;
		}
		table {
			border:1px solid;
			cellPadding:3px;
			cellSpacing:5px;
		}
		.pointer{
			cursor: pointer;
		}
		#alter_value{
			display: none;
		}
		#logo{
			float: left;
		}
		#logo{
  			width:187px;
  			height:70px;
  		}
	</style>
  </head>
  <script type="text/javascript" src="js/jquery-3.1.1.js" ></script>
  <script type="text/javascript" src="js/updateimg.js" ></script>
  
  <script type="text/javascript">
  		$(document).ready(function(){
  			$("#first").click(function(){
  				upload_hide();
  				$("table").attr("class","hidd");
  				var $li = $("li");
  				if($li.length>0){
  					$("li").remove();
  					return;
  				}
  	  			$.ajax({
  	  				type:"get",
  	  				url:"typeCommodity/findAll.action",
  	  			  //  contentType: 'text/json,charset=utf-8',  
  	  				dataType:"json",
  	  				data:"",
  	  				success:function(data){
  	  					$(data).each(function(){
  	  						$("ul").append("<a onclick='findByTid("+this.tid+",1,10)'><li>"+this.tname+"管理</li></a>");
  	  					});
  	  				},
  	  				error:function(){
  	  					alert("error");
  	  				}
  	  			});
  	  		});
  			
  			$("ul").delegate("li","mouseover",function(){
  				$(this).css("background-color","yellow");
  			});
			$("ul").delegate("li","mouseout",function(){
				$(this).css("background-color","#C0C0C0");
  			});
			$("#upload").click(function(){
				$("table").prop("class","hidd");
				$("#upload_value").show();
			});
  		});
  		function findByTid(tid,index,size){
  			alterNO();
			//获取tr之后的所有兄弟标签，并删除。
  			$(".tr").nextAll().remove();
  			$.ajax({
  				type:"post",
  				url:"commodity/findBytid.action",
  				dataType:"json",
  				data:{"tid":tid,"index":index,"size":size},
  				success:function(data){
  					if(data.length > 0){
  						for(var index in data){
  							$tr=$("<tr class='new_tr'><td>"+index+1+
  									"</td><td>"+data[index].cname+
  									" </td><td>"+data[index].info+
  									" </td><td>"+data[index].marketPrice+
  									" </td><td>"+data[index].shopPrice+
  									" </td><td>"+data[index].hot+
  									"</td><td>"+data[index].putaway+
  									"</td><td>"+data[index].t_id+
  									" </td><td><img src='/commodity/"+data[index].pictrueAddress+"'></img>"+data[index].pictrueAddress+
  									"</td><td class='pointer' onclick='alter("+data[index].cid+")'>编辑</td><td class='pointer'><a href='commodity/deleteCommodity.action?cid="+data[index].cid+"&t_id="+data[index].t_id+"'>删除</a></td></tr>");
  							$("table").append($tr);                          
  						}
  						
  						$("table").prop("class","show");
  					}
  				},
  				error:function(){
  					alert("网络连接超时，请稍后查询");
  				}
  			});
  		}
  
  		function alter(cid){
  			 $.ajax({
  				type:"get",
  				url:"commodity/findBycid.action?cid="+cid,
  				data:"",
  				dataType:"json",
  				success:function(data){
  					$("#cname").prop("value",data.cname);
  					$("#info").prop("value",data.info);
  					$("#marketPrice").prop("value",data.marketPrice);
  					$("#shopPrice").prop("value",data.shopPrice);
					$(".hot").eq(data.hot).attr("checked",true);
					$(".putaway").eq(data.putaway).attr("checked",true);
					$(".t_id").eq(data.t_id).attr("checked",true);
					$("#pic").attr("src","/commodity/"+data.pictrueAddress);
					$("#cid").attr("value",data.cid);
					$("#cid").hide();
					$("#alter_value").show();
  				},
  				error:function(){
  					alert("服务器繁忙");
  				}
  			}); 
  		}
  		function alterNO(){
  			$("#alter_value").hide();
  		}
  		function upload_hide() {
  			$("#upload_value").hide();
		}
  		
  		
  </script>
  <body>
  		<a href="index.jsp"><img id="logo" src="img/logo.jpg"></a>
  		<div id="top"><p><font size="30px">后台管理</font></p></div>
  		<div id="left">
  			<p id="first">商品管理</p>
  			<ul></ul>
  			<p id="upload">上传商品</p>
  		</div>
  		<div id="right">
  			<div id="upload_value">
  			<form action="commodity/addCommodity.action" method="post" enctype="multipart/form-data">
	  				商品名称 ：<input type="text" name="cname"><br>
	  				商品信息 ：<input type="text" name="info"><br>
	  				市&nbsp&nbsp场&nbsp&nbsp价：<input type="text" name="marketPrice"><br>
	  				商&nbsp&nbsp城&nbsp&nbsp价：<input type="text" name="shopPrice"><br>
	  				是否热销 ：<input type="radio" name="hot" value="1">是 <input type="radio" name="hot" value="0">否 <br>
	  				是否上架 ：<input type="radio" name="putaway" value="1">是 <input type="radio" name="putaway" value="0">否 <br>
	  				商品类型 ：
	  						<c:forEach var="typ" items="${sessionScope.list }">
	  							<input type="radio" name="t_id" value="${typ.tid}"> ${typ.tname }
	  						</c:forEach><br>
	  				商品图片 ：<input id="picUpload" type="file" name="pic"><br>
	  				<input type="submit" value="确定">
	  				<input type="reset" value="重置">
	  			</form>
  			</div>
  			<div id="table">
  			<table class="hidd">
  				<tr class="tr">
  					<td>序号</td>
  					<td>商品名称 </td>
  					<td>商品信息 </td>
  					<td>市场价</td>
  					<td>商城价</td>
  					<td>是否热销</td>
  					<td>是否上架</td>
  					<td>商品类型</td>
  					<td>商品图片</td>
  					<td>修改</td>
  					<td>删除</td>
  				</tr>
  				</table>
  				<button id="btn" class="hidd">下一页</button>
  			</div> 
  			
  			<div id="alter_value">
			<form action="commodity/alterCommodity.action" method="post" enctype="multipart/form-data">
					<input id="cid" type="text" name="cid"><br>
				商品名称 ：<input id="cname" type="text" name="cname"><br>
	  			商品信息 ：<input id="info" type="text" name="info"><br>
	  			市&nbsp&nbsp场&nbsp&nbsp价：<input id="marketPrice" type="text" name="marketPrice"><br>
	  			商&nbsp&nbsp城&nbsp&nbsp价：<input id="shopPrice" type="text" name="shopPrice"><br>
				是否热销 ：<input class="hot" type="radio" name="hot" value="1">是 <input class="hot" type="radio" name="hot" value="0">否 <br>
	  			是否上架 ：<input class="putaway" type="radio" name="putaway" value="1">是 <input class="putaway" type="radio" name="putaway" value="0">否 <br>
				商品类型 ：
  						<c:forEach var="typ" items="${sessionScope.list }">
  							<input class="t_id" type="radio" name="t_id" value="${typ.tid}"> ${typ.tname }
  						</c:forEach><br>
  				商品图片 ：<img id="pic" alt="123"><br>
				<input type="submit" value="确定"> 
				<input type="button" onclick="alterNO()" value="取消">
			</form>
		</div>
  		</div>
  		
  </body>
</html>
