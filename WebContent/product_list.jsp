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

<!--分页样式  -->
<style>
ul.pagination {
    display: inline-block;
    padding: 0;
    margin: 0;
}

ul.pagination li {display: inline;}

ul.pagination li a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
}

ul.pagination li a.active {
    background-color: #4CAF50;
    color: white;
    border: 1px solid #4CAF50;
}

ul.pagination li a:hover:not(.active) {background-color: #ddd;}

div.center {text-align: center;}
</style>

</head>

<body>
 <div class="mianCont">
 
 
  <!-- 引入header.jsp -->
	<jsp:include page="/head.jsp"></jsp:include> 
	
	
  <div class="pnt">
   <div class="pntLeft">
    <h2 class="Title">所有商品分类
    
    
    
    
     <!-- <ul class="InPorNav">
     <li><a href="product.html">纸杯系列</a>
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
     <li><a href="product.html">PET系列</a>
      <div class="chilInPorNav">
       <a href="#">PET透明杯</a>
       <a href="#">PET透明盖</a>
       <a href="#">PET透明沙拉盒</a>
      </div>chilLeftNav/
     </li>
     <li><a href="product.html">饮品杯配套系列</a>
      <div class="chilInPorNav">
       <a href="#">杯袖</a>
       <a href="#">环保纸浆杯托</a>
       <a href="#">纸杯打包袋</a>
       <a href="#">吸管</a>
       <a href="#">搅拌棒</a>
       <a href="#">杯盖</a>
      </div>chilLeftNav/
     </li>
     <li><a href="product.html">纸浆环保餐具系列</a>
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
     <li><a href="product.html">纸餐盒系列</a>
      <div class="chilInPorNav">
       <a href="#">圆底纸餐盒</a>
       <a href="#">方底纸餐盒</a>
       <a href="#">三明治纸盒</a>
       <a href="#">蛋糕盒</a>
       <a href="#">其他纸餐盒</a>
      </div>chilLeftNav/
     </li>
     <li><a href="product.html">刀叉勺餐具</a>
      <div class="chilInPorNav">
       <a href="#">PS刀叉勺系列</a>
       <a href="#">PLA刀叉勺系列</a>
       <a href="#">淀粉刀叉勺系列</a>
       <a href="#">搅拌棒/吸管</a>
      </div>chilLeftNav/
     </li>
     <li><a href="product.html">生活用纸</a>
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
			<li><a href="${pageContext.request.contextPath}/product_list?cid=${category.cid}">${category.cname }</a></li>
		</c:forEach>
	</ul>
    </h2>
   </div><!--pntLeft/-->
   
   <div class="pntRight">
    <ul class="nav">
     <li><a href="index">商城首页</a></li>
     <li class="navCur"><a href="product.html">商品展示</a></li>
     <li><a href="login.html">会员中心</a></li>
     <li><a href="help.html">帮助中心</a></li>
     <div class="clears"></div>
     <div class="phone">TEL：021-12345678</div>
    </ul><!--nav/-->
   </div><!--pntRight/-->
   <div class="clears"></div>
  </div><!--pnt/-->
  
  <div class="positions">
   当前位置：<a href="index">首页</a> &gt; <a href="#" class="posCur">商品展示</a>
  </div><!--positions/-->
  
  <div class="cont">
  <div class="jilu">
    总计 <span>8</span> 个记录
   </div><!--jilu/-->
   
   <div class="contLeft">
   
    <!-- <ul class="leftPorNav">
     <li><a href="product.html">纸杯系列</a>
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
     <li><a href="product.html">PET系列</a>
      <div class="chilInPorNav">
       <a href="#">PET透明杯</a>
       <a href="#">PET透明盖</a>
       <a href="#">PET透明沙拉盒</a>
      </div>chilLeftNav/
     </li>
     <li><a href="product.html">饮品杯配套系列</a>
      <div class="chilInPorNav">
       <a href="#">杯袖</a>
       <a href="#">环保纸浆杯托</a>
       <a href="#">纸杯打包袋</a>
       <a href="#">吸管</a>
       <a href="#">搅拌棒</a>
       <a href="#">杯盖</a>
      </div>chilLeftNav/
     </li>
     <li><a href="product.html">纸浆环保餐具系列</a>
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
     <li><a href="product.html">纸餐盒系列</a>
      <div class="chilInPorNav">
       <a href="#">圆底纸餐盒</a>
       <a href="#">方底纸餐盒</a>
       <a href="#">三明治纸盒</a>
       <a href="#">蛋糕盒</a>
       <a href="#">其他纸餐盒</a>
      </div>chilLeftNav/
     </li>
     <li><a href="product.html">刀叉勺餐具</a>
      <div class="chilInPorNav">
       <a href="#">PS刀叉勺系列</a>
       <a href="#">PLA刀叉勺系列</a>
       <a href="#">淀粉刀叉勺系列</a>
       <a href="#">搅拌棒/吸管</a>
      </div>chilLeftNav/
     </li>
     <li><a href="product.html">生活用纸</a>
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
    
      <ul class="leftPorNav">
		<c:forEach items="${sessionScope.categories}" var="category">
			<li><a href="${pageContext.request.contextPath}/product_list?cid=${category.cid}">${category.cname }</a></li>
		</c:forEach>
	</ul>
   </div><!--contLeft/-->
   
   
   <!-- 显示每类商品  -->
   <div class="contRight">
    <div class="frProList">
    <c:forEach items="${pageBean.list}" var="product">
    	<dl>
      		<dt><a href="${pageContext.request.contextPath}/productInfo?pid=${product.pid}&currentPage=${pageBean.currentPage}&cid=${cid}"><img src="${pageContext.request.contextPath }/${product.pimage}" width="132" height="129" /></a></dt>
      		<dd>${product.pname} </dd>
      		<dd class="cheng">店铺价:${product.shop_price} <span>￥${product.market_price}</span></dd>
     	</dl>
    </c:forEach>
    <div class="clears"></div>
    </div><!--frProList-->
   </div><!--contRight/-->
    <!-- 显示每类商品结束  -->

<div class="clears"></div>
  </div><!--cont/-->
  

    <!--分页 -->
 	<div class="center">
  	<ul class="pagination">
  	  <br/>
  		<!-- 前一页 判断当前是否是第一页/如果当前页是第一页，如法点击 -->
  		<c:if test="${pageBean.currentPage == 1}">
    		<li class="disabled"><a href="javascript:void(0);" aria-label="Previous">
    		<span aria-hidden="true">&laquo;</span></a></li>
    	</c:if>
    	<c:if test="${pageBean.currentPage != 1}">
    		<li><a href="${pageContext.request.contextPath}/product_list?cid=${cid}&currentPage=${pageBean.currentPage-1}" aria-label="Previous">
    		<span aria-hidden="true">&laquo;</span></a></li>
    	</c:if>
    
    	<!-- 分页栏中间内容 -->
    	<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
    		<!-- 如果是当前页则不允许点击，并且是绿色背景 -->
    		<c:if test="${page == pageBean.currentPage }">
    			<li ><a class="active" href="javascript:void(0);">${page}</a></li>
    		</c:if>
    		<c:if test="${page != pageBean.currentPage }">
    			<li><a href="${pageContext.request.contextPath}/product_list?cid=${cid}&currentPage=${page}">${page}</a></li>
    		</c:if>
    	</c:forEach>
    	
    	<!-- 下一页 如果是最后一页，不允许点点击 -->
    	<c:if test="${pageBean.currentPage == pageBean.totalPage }">
    		<li class="disabled"><a href="javascript:void(0);"  aria-label="Next">
    		<span aria-hidden="true">&raquo;</span></a></li>
    	</c:if>	
    	<c:if test="${pageBean.currentPage != pageBean.totalPage }">
    		<li><a href="${pageContext.request.contextPath}/product_list?cid=${cid}&currentPage=${pageBean.currentPage+1}"  aria-label="Next">
    		<span aria-hidden="true">&raquo;</span></a></li>
    	</c:if>
  	</ul>
	</div>
    <!-- 分页结束 -->
    

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
   <a href="index">商城首页</a>&nbsp;|&nbsp;
   <a href="product.html">促销中心</a>&nbsp;|&nbsp;
   <a href="order.html">我的订单</a>&nbsp;|&nbsp;
   <a href="new.html">新闻动态</a>&nbsp;|&nbsp;
   <a href="login.html">会员中心</a>&nbsp;|&nbsp;
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
