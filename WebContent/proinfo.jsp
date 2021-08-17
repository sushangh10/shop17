<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>17商城</title>
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script src="js/wb.js" type="text/javascript" charset="utf-8"></script>
<script src="js/MagicZoom.js" type="text/javascript"></script>



<script type="text/javascript">
	function addCart(){
		var buyNum = $("#buyNum").val();
		window.location="${pageContext.request.contextPath}/addcart?pid=${product.pid}&buyNum="+buyNum;
	}
</script>




</head>

<body>
 <div class="mianCont">
 
 
  <!-- 引入header.jsp -->
	<jsp:include page="/head.jsp"></jsp:include> 
	
	
	
  <div class="pnt">
   <div class="pntLeft">
   
   
    <h2 class="Title">所有商品分类
    <ul class="InPorNav">
		<c:forEach items="${sessionScope.categories}" var="category">
			<li><a href="${pageContext.request.contextPath}/product_list?cid=${category.cid}">${category.cname }</a></li>
		</c:forEach>
	</ul>
    </h2>
    
    
   </div><!--pntLeft/-->
   <div class="pntRight">
    <ul class="nav">
     <li><a href="index">商城首页</a></li>
     <li class="navCur"><a href="#">商品详情</a></li>
     <li><a href="login.jsp">会员中心</a></li>
     <li><a href="help.html">帮助中心</a></li>
     <div class="clears"></div>
     <div class="phone">TEL：021-12345678</div>
    </ul><!--nav/-->
   </div><!--pntRight/-->
   <div class="clears"></div>
  </div><!--pnt/-->
  <div class="positions">
   当前位置：<a href="index.jsp">首页</a> &gt; <a href="#" class="posCur">促销商品</a>
  </div><!--positions/-->
  
  <div class="cont">
    <div class="contLeft">
	<ul class="leftPorNav">
		<c:forEach items="${sessionScope.categories}" var="category">
			<li><a href="${pageContext.request.contextPath}/product_list?cid=${category.cid}">${category.cname }</a></li>
		</c:forEach>
	</ul>
	
  </div><!--contLeft/-->
   <div class="contRight" style="border:0;">
   <div class="proBox">
   <div id="tsShopContainer">
	<div id="tsImgS"><a href="${pageContext.request.contextPath}/${product.pimage}" title="Images" class="MagicZoom" id="MagicZoom"><img width="300" height="300" src="${pageContext.request.contextPath}/${product.pimage}" /></a></div>

    <!-- <script src="js/ShopShow.js"></script> -->
    
    </div><!--tsShopContainer/-->
    <div class="proBoxRight">
     <h3 class="proTitle">${product.pname}</h3>
     <div>商品编号：${product.pid} </div>
     <div>会员价：<strong class="red">¥${product.shop_price}</strong> </div>
 		<div>市场价：<strong >¥${product.market_price}</strong> </div>
     <div>库存：<strong class="red">[有货] </strong> 从上海发货</div>
     <ul class="rongliang">
      <div class="clears"></div>
     </ul><!--rongliang/-->
     
     
     
     
    <!--  +id="buyNum -->
     <div class="shuliang2">
      数量： <input type="text" value="1" id="buyNum" />
     </div><!--shuliang2/-->
     
     
     
     
     <!--  href -->
     <div class="gc">
      <a href="javascript:void(0)" onclick="addCart()"><img src="images/goumai.png" width="117"  height="36" /></a>&nbsp;&nbsp;
      <a href="#"><img src="images/shoucang.png" width="117" height="36" /></a>
     </div><!--gc/--> 
     
     
     
     
       
    </div><!--proRight/-->
    <div class="clears"></div>
    </div><!--proBox/-->
    <ul class="fangyuan">
      <li>商品描述</li>
      <li>商品参数</li>
      <li>商品评论</li>
      <li>商品晒图</li>
      <div class="clears"></div>
    </ul><!--fangyuan/-->
    <div class="fangList">
    <div class="fangPar">
     <h1>  ${product.pdesc} </h1><br />
    Information of Vernal Garden 满庭芳花园 <br />
    Location:<br />
    Located close to Gubei Carrefour and the Hongqiao Airport, 15 mins drive to international schools and downtown area.<br />
    Description:<br />
    It offers a full range of accommodations including freestanding houses, semi-detached houses and condominiums. The units are very spacious, well decorated and fully furnished. Resident can enjoy a complete range of onsite <br />recreational facilities. <br />
    Facilities:<br />
    Indoor swimming door, gym, sauna, spa, squash, cafe, childrens playground, restaurant, convenience store, snooker, basketball court. <br />
    Tv Channel:<br />
    HBO，TVB，BBC，DISCOVERY，CINEMAX，
    </div><!--fangPar/-->
    <img src="${product.pimage}" width="756" height="310" />
    </div><!--fangList/-->
    <div class="fangList">
     商品参数
    </div><!--fangList/-->
    <div class="fangList">
     商品评论
    </div><!--fangList/-->
    <div class="fangList">
     <img src="${product.pimage}" width="132" height="129" /><br /><br />
     <img src="${product.pimage}" width="132" height="129" /><br /><br />
     <img src="${product.pimage}" width="132" height="129" /><br /><br />
     <img src="${product.pimage}" width="132" height="129" /><br /><br />
     <img src="${product.pimage}" width="132" height="129" /><br /><br />
    </div><!--fangList/-->
   </div><!--contRight/-->
   <div class="clears"></div>
  </div><!--cont/-->
  <div class="inHelp">
   <div class="inHLeft">
    <h4>帮助中心</h4>
    <ul class="inHeList">
     <li><a href="help.html">购物指南</a></li>
     <li><a href="help.html">支付方式</a></li>
     <li><a href="help.html">售后服务</a></li>
     <li><a href="about.html">企业简介</a></li>
     <div class="clears"></div>
    </ul><!--inHeList/-->
   </div><!--inHLeft/-->
   <div class="inHLeft">
    <h4>会员服务</h4>
    <ul class="inHeList">
     <li><a href="reg.html">会员注册</a></li>
     <li><a href="login.html">会员登录</a></li>
     <li><a href="order.html">购物车</a></li>
     <li><a href="order.html">我的订单</a></li>
     <div class="clears"></div>
    </ul><!--inHeList/-->
   </div><!--inHLeft/-->
   <div class="inHRight">
    <h4>全国统一免费服务热线</h4>
    <div class="telBox">400-0000-0000</div>
    <div class="weibo">
    <wb:follow-button uid="2991975565" type="red_1" width="67" height="24" ></wb:follow-button>
    </div>
   </div><!--inHRight/-->
   <div class="clears"></div>
  </div><!--inHelp/-->
  <div class="footer">
   <p>
   <a href="#">进入17官网</a>&nbsp;|&nbsp;
   <a href="index.html">商城首页</a>&nbsp;|&nbsp;
   <a href="product.html">促销中心</a>&nbsp;|&nbsp;
   <a href="order.html">我的订单</a>&nbsp;|&nbsp;
   <a href="new.html">新闻动态</a>&nbsp;|&nbsp;
   <a href="login.html">会员中心</a>&nbsp;|&nbsp;
   <a href="help.htmll">帮助中心</a>
   </p>
   <p>
    版权所有：上海youhuo实业有限公司 版权所有  Copyright 2010-2015   沪ICP备00000000号   <a href="http://www.mycodes.net/" target="_blank">源码之家</a>   
   </p>
  </div><!--footer/-->
 </div><!--mianCont/-->
 <a href="#" class="backTop">&nbsp;</a>
</body>
</html>
