<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>17商城</title>
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script src="js/wb.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	$("#kinMaxShow").kinMaxShow();
});
</script>
</head>

<body>
<div class="mianCont">

	<!-- 引入header.jsp -->
	<jsp:include page="/head.jsp"></jsp:include> 

  <div class="pnt">
   <div class="pntLeft">
    <h2 class="Title">所有商品分类</h2>
    
    <!-- <ul class="InPorNav">
     <li><a href="product.html">居家生活</a>
      <div class="chilInPorNav">
       <a href="#">单层热饮杯</a>
       <a href="#">双层中空杯</a>
       <a href="#">瓦楞隔热杯</a>
       <a href="#">双淋膜冷饮杯</a>
       <a href="#">爆米花桶</a>
       <a href="#">纸碗</a>
       <a href="#">冰淇淋纸杯</a>
       <a href="#">PS杯盖</a>
      </div>chilLeftNav/
     </li>
     <li><a href="product.html">收纳整理</a>
      <div class="chilInPorNav">
       <a href="#">PET透明杯</a>
       <a href="#">PET透明盖</a>
       <a href="#">PET透明沙拉盒</a>
      </div>chilLeftNav/
     </li>
     <li><a href="product.html">餐饮用具</a>
      <div class="chilInPorNav">
       <a href="#">杯袖</a>
       <a href="#">环保纸浆杯托</a>
       <a href="#">纸杯打包袋</a>
       <a href="#">吸管</a>
       <a href="#">搅拌棒</a>
       <a href="#">杯盖</a>
      </div>chilLeftNav/
     </li>
     <li><a href="product.html">节日礼品</a>
      <div class="chilInPorNav">
       <a href="#">纸碟</a>
       <a href="#">纸碗</a>
       <a href="#">纸浆带盖汤碗</a>
       <a href="#">连体餐盒</a>
       <a href="#">分体餐盒</a>
       <a href="#">纸浆沙拉盒</a>
       <a href="#">纸托盘</a>
      </div>chilLeftNav/
     </li>
     <li><a href="product.html">厨房用具</a>
      <div class="chilInPorNav">
       <a href="#">圆底纸餐盒</a>
       <a href="#">方底纸餐盒</a>
       <a href="#">三明治纸盒</a>
       <a href="#">蛋糕盒</a>
       <a href="#">其他纸餐盒</a>
      </div>chilLeftNav/
     </li>
     <li><a href="product.html">清洁工具</a>
      <div class="chilInPorNav">
       <a href="#">PS刀叉勺系列</a>
       <a href="#">PLA刀叉勺系列</a>
       <a href="#">淀粉刀叉勺系列</a>
       <a href="#">搅拌棒/吸管</a>
      </div>chilLeftNav/
     </li>
     <li><a href="product.html">居家饰品</a>
      <div class="chilInPorNav">
       <a href="#">餐巾纸</a>
       <a href="#">抽纸</a>
       <a href="#">卫生纸</a>
       <a href="#">擦手纸</a>
       <a href="#">其他纸类</a>
      </div>chilLeftNav/
     </li>
     <li><a href="product.html">纸袋/环保打包袋</a>
      <div class="chilInPorNav">
       <a href="#">纸袋</a>
       <a href="#">环保淀粉塑料袋</a>
       <a href="#">PLA塑料袋</a>
       <a href="#">食品袋</a>
      </div>chilLeftNav/
     </li>
    </ul>InPorNav/ -->
    
    <ul class="InPorNav">
		<c:forEach items="${sessionScope.categories}" var="category">
			<li><a href="${pageContext.request.contextPath}/product_list?cid=${category.cid}">${category.cname}</a></li>
		</c:forEach>
	</ul>

   </div><!--pntLeft/-->
   <div class="pntRight">
    <ul class="nav">
     <li class="navCur"><a href="index">商城首页</a></li>
     <li><a href="#">促销中心</a></li>
     <li><a href="login.html">会员中心</a></li>
     <li><a href="help.html">帮助中心</a></li>
     <div class="clears"></div>
     <div class="phone">TEL：021-12345678</div>
    </ul><!--nav/-->

    <div class="banner">
     <div id="kinMaxShow">
     <div>
       <a href="#"><img src="images/1.jpg" height="350"  /></a>
      </div> 		
      <div>
       <a href="#"><img src="images/2.jpg" height="350"  /></a>
      </div>
      <div>
       <a href="#"><img src="images/3.jpg" height="350"  /></a>
      </div>
      <div>
       <a href="#"><img src="images/4.jpg" height="350"  /></a>
      </div>
      <div>
       <a href="#"><img src="images/5.jpg" height="350"  /></a>
      </div>      
     </div><!--kinMaxShow/-->
    </div><!--banner/-->
   </div><!--pntRight/-->
   <div class="clears"></div>
  </div><!--pnt/-->
  
  <div class="rdPro">
   <div class="rdLeft">
    <ul class="rdList">
     <li>热销商品</li>
     <li>最新商品</li>
     <li>促销商品</li>
     <div class="clears"></div>
    </ul><!--rdList/-->
    <div class="rdProBox">   
    	<c:forEach items="${requestScope.hot_products}" var="product">
     <dl>
      <dt><a href="${pageContext.request.contextPath}/productInfo?pid=${product.pid}"><img src="${product.pimage}" width="132" height="129" /></a></dt>
      <dd>${product.pname}</dd>
      <dd class="cheng">价格：￥${product.shop_price}</dd>
     </dl>
	</c:forEach>

     <div class="clears"></div>
    </div><!--rdPro/-->
    
    <div class="rdProBox">

     <c:forEach items="${requestScope.new_products}" var="product">
     <dl>
      <dt><a href="proinfo.jsp"><img src="${product.pimage}" width="132" height="129" /></a></dt>
      <dd>${product.pname}</dd>
      <dd class="cheng">价格：￥${product.shop_price}</dd>
     </dl>
    </c:forEach>
     <div class="clears"></div>
    </div><!--rdPro/-->
    
      <div class="rdProBox">   
    	<c:forEach items="${requestScope.cx_products}" var="product">
     <dl>
      <dt><a href="${pageContext.request.contextPath}/productInfo?pid=${product.pid}"><img src="${product.pimage}" width="132" height="129" /></a></dt>
      <dd>${product.pname}</dd>
      <dd class="cheng">价格：￥${product.shop_price}</dd>
     </dl>
	</c:forEach>

     <div class="clears"></div>
    </div><!--rdPro/-->
    
    
   </div><!--rdLeft/-->
   <div class="rdRight">
    <img src="images/rdRight.jpg" width="221" height="254" />
   </div><!--rdRight/-->
   <div class="clears"></div>
  </div><!--rdPro/-->
  <div class="hengfu">
   <img src="images/hengfu1.jpg" width="979" height="97" />
  </div><!--hengfu/-->
  <div class="floor" id="floor1">
  
  
  </h3>
   <div class="floorBox">
    <div class="floorLeft">
    
     <ul class="flList">
      <h1>1F&nbsp;&nbsp;&nbsp;&nbsp;有好货</h1>
      <div class="clears"></div>
     </ul><!--flList/-->
     
     <div class="flImg"><img src="images/flListimg.jpg" width="198" height="350" /></div>
    </div><!--floorLeft/-->
    <div class="floorRight">
     <div class="frProList">
  
  
  <!--  <h3 class="floorTitle">

   <h1> 1F&nbsp;&nbsp;&nbsp;&nbsp;有好货</h1>
   </h3>
   <div class="floorBox">
    <div class="floorLeft">
     <ul class="flList">
    
      <div class="clears"></div>
     </ul>flList/
     <div class="flImg"><img src="images/flListimg.jpg" width="198" height="360" /></div>
    </div>floorLeft/
    <div class="floorRight">
     <div class="frProList"> -->
     
     <c:forEach items="${requestScope.first_products}" var="product">
      <dl>
      <dt><a href="${pageContext.request.contextPath}/productInfo?pid=${product.pid}"><img src="${product.pimage}" width="132" height="129" /></a></dt>
      <dd>${product.pname}</dd>
      <dd class="cheng">价格：￥${product.shop_price}</dd>
     </dl>
     </c:forEach>

     </div><!--frProList-->
     <div class="frProList">
      <div class="clears"></div>
     </div><!--frProList-->
     <div class="frProList">
     
      <div class="clears"></div>
     </div><!--frProList-->
     <div class="frProList">
     
      <div class="clears"></div>
     </div><!--frProList-->
    </div><!--floorRight/-->
    <div class="clears"></div>
   </div><!--floorBox/-->
  </div><!--floor/-->
  <div class="hengfu">
   <img src="images/hengfu2.jpg" width="978" height="97" />
  </div><!--hengfu/-->
  <div class="floor" id="floor3">
   <h3 class="floorTitle">
   
   </h3>
   <div class="floorBox">
    <div class="floorLeft">
    
     <ul class="flList">
      <h1>2F&nbsp;&nbsp;&nbsp;&nbsp;有好货</h1>
      <div class="clears"></div>
     </ul><!--flList/-->
     
     <div class="flImg"><img src="images/flListimg.jpg" width="198" height="350" /></div>
    </div><!--floorLeft/-->
    <div class="floorRight">
     <div class="frProList">


     <c:forEach items="${requestScope.second_products}" var="product">
      <dl>
      <dt><a href="${pageContext.request.contextPath}/productInfo?pid=${product.pid}"><img src="${product.pimage}" width="132" height="129" /></a></dt>
      <dd>${product.pname}</dd>
      <dd class="cheng">价格：￥${product.shop_price}</dd>
     </dl>
     </c:forEach>

      <div class="clears"></div>
     </div><!--frProList-->
     <div class="frProList">
      <div class="clears"></div>
     </div><!--frProList-->
     
     <div class="frProList">
      <div class="clears"></div>
     </div><!--frProList-->

     <div class="frProList">
      <div class="clears"></div>
     </div><!--frProList-->

     <div class="frProList">
	 <div class="clears"></div>
     </div><!--frProList-->
    </div><!--floorRight/-->

    <div class="clears"></div>
   </div><!--floorBox/-->
  </div><!--floor/-->
  <div class="hengfu">
   <img src="images/hengfu1.jpg" width="978" height="97" />
  </div><!--hengfu/-->
  <div class="floor" id="floor2">
   <h3 class="floorTitle">
   
   </h3>
   <div class="floorBox">
    <div class="floorLeft">
     <ul class="flList">
     <h1>3F&nbsp;&nbsp;&nbsp;&nbsp;有好货</h1>
      <div class="clears"></div>
     </ul><!--flList/-->
     <div class="flImg"><img src="images/flListimg.jpg" width="198" height="350" /></div>
    </div><!--floorLeft/-->
    <div class="floorRight">
    
     <div class="frProList">

      <c:forEach items="${requestScope.third_products}" var="product">
      <dl>
      <dt><a href="${pageContext.request.contextPath}/productInfo?pid=${product.pid}"><img src="${product.pimage}" width="132" height="129" /></a></dt>
      <dd>${product.pname}</dd>
      <dd class="cheng">价格：￥${product.shop_price}</dd>
     </dl>
     </c:forEach>

      <div class="clears"></div>
     </div><!--frProList-->
 
     <div class="frProList">
      <div class="clears"></div>
     </div><!--frProList-->

     <div class="frProList">     
      <div class="clears"></div>
     </div><!--frProList-->

     <div class="frProList">
      <div class="clears"></div>
     </div><!--frProList-->
 
     <div class="frProList">    
      <div class="clears"></div>
     </div><!--frProList-->
    </div><!--floorRight/-->
    
    
    <div class="clears"></div>
   </div><!--floorBox/-->
  </div><!--floor/-->
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
     <li><a href="reg.jsp">会员注册</a></li>
     <li><a href="login.jsp">会员登录</a></li>
     <li><a href="cart.jsp">购物中心</a></li>
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
   <a href="index">进入17官网</a>&nbsp;|&nbsp;
   <a href="index">商城首页</a>&nbsp;|&nbsp;
   <a href="#">促销中心</a>&nbsp;|&nbsp;
   <a href="order.html">我的订单</a>&nbsp;|&nbsp;
   <a href="new.html">新闻动态</a>&nbsp;|&nbsp;
   <a href="login.jsp">会员中心</a>&nbsp;|&nbsp;
   <a href="help.htmll">帮助中心</a>
   </p>
   <p>
    版权所有：上海17实业有限公司 版权所有  Copyright 2010-2015   沪ICP备00000000号   <a href="http://www.mycodes.net/" target="_blank">源码之家</a>   
   </p>
  </div><!--footer/-->
 </div><!--mianCont/-->
 <a href="#" class="backTop">&nbsp;</a>
</body>
</html>
