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
</head>

<body>
 <div class="mianCont">
 
 
  <!-- 引入header.jsp -->
	<jsp:include page="/head.jsp"></jsp:include> 
	
	
	
  <div class="pnt">
   <div class="pntLeft">
    <h2 class="Title">所有商品分类
     <ul class="InPorNav">
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
      </div><!--chilLeftNav/-->
     </li>
     <li><a href="product.html">PET系列</a>
      <div class="chilInPorNav">
       <a href="#">PET透明杯</a>
       <a href="#">PET透明盖</a>
       <a href="#">PET透明沙拉盒</a>
      </div><!--chilLeftNav/-->
     </li>
     <li><a href="product.html">饮品杯配套系列</a>
      <div class="chilInPorNav">
       <a href="#">杯袖</a>
       <a href="#">环保纸浆杯托</a>
       <a href="#">纸杯打包袋</a>
       <a href="#">吸管</a>
       <a href="#">搅拌棒</a>
       <a href="#">杯盖</a>
      </div><!--chilLeftNav/-->
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
      </div><!--chilLeftNav/-->
     </li>
     <li><a href="product.html">纸餐盒系列</a>
      <div class="chilInPorNav">
       <a href="#">圆底纸餐盒</a>
       <a href="#">方底纸餐盒</a>
       <a href="#">三明治纸盒</a>
       <a href="#">蛋糕盒</a>
       <a href="#">其他纸餐盒</a>
      </div><!--chilLeftNav/-->
     </li>
     <li><a href="product.html">刀叉勺餐具</a>
      <div class="chilInPorNav">
       <a href="#">PS刀叉勺系列</a>
       <a href="#">PLA刀叉勺系列</a>
       <a href="#">淀粉刀叉勺系列</a>
       <a href="#">搅拌棒/吸管</a>
      </div><!--chilLeftNav/-->
     </li>
     <li><a href="product.html">生活用纸</a>
      <div class="chilInPorNav">
       <a href="#">餐巾纸</a>
       <a href="#">抽纸</a>
       <a href="#">卫生纸</a>
       <a href="#">擦手纸</a>
       <a href="#">其他纸类</a>
      </div><!--chilLeftNav/-->
     </li>
     <li><a href="product.html">纸袋/环保打包袋</a>
      <div class="chilInPorNav">
       <a href="#">纸袋</a>
       <a href="#">环保淀粉塑料袋</a>
       <a href="#">PLA塑料袋</a>
       <a href="#">食品袋</a>
      </div><!--chilLeftNav/-->
     </li>
    </ul><!--InPorNav/-->
    </h2>
   </div><!--pntLeft/-->
   <div class="pntRight">
    <ul class="nav">
     <li><a href="index.html">商城首页</a></li>
     <li><a href="product.html">促销中心</a></li>
     <li><a href="login.html">会员中心</a></li>
     <li class="navCur"><a href="help.html">帮助中心</a></li>
     <div class="clears"></div>
     <div class="phone">TEL：021-12345678</div>
    </ul><!--nav/-->
   </div><!--pntRight/-->
   <div class="clears"></div>
  </div><!--pnt/-->
  <div class="positions">
   当前位置：<a href="index.html">首页</a> &gt; <a href="#" class="posCur">填写核对订单</a>
  </div><!--positions/-->
  <div class="cont">
   <div class="carImg"><img src="images/car2.jpg" width="961" height="27" /></div>
	<h4 class="orderTitle">收货地址</h4>
	<form class = "form-horizontal" id ="orderForm" action="${pageContext.request.contextPath}/confirm" method="post">
	<input type ="hidden" name ="method" value="confirmOrder"/>
   	<input type ="hidden" name="oid"  value="${order.oid}"/>
   	<input type="text"  name="address"/>地址<br />
   	<br />
   	<input type="text"  name="name"/>姓名<br />
   	<br />
   	<input type="text"  name="telephone"/>电话<br />
   	<br />
    <a href="javascript:document.getElementById('orderForm').submit();"> 提交
    </a>
	</form >
	
	
   <!--  <table class="ord">
    <tr>
     <td width="30%">
     </td>
     <td width="50%">
      上海,上海市,普陀区,曹杨路1040弄中友大厦一号楼19楼	,200000,13020129519
     </td>
     <td>
      <span class="green upd">[修改]</span> | <span class="green add">[添加]</span> 
     </td>
    </tr>
   </table>ord/ -->
   
  <form class = "form-horizontal" id ="orderForm" action="${pageContext.request.contextPath}/productSubmit" method="post"
   			style="margin-top:5px:margin-left:150px;">
   			<input type ="hidden" name ="method" value="confirmOrder"/>
   			<input type ="hidden" name="oid"  value="${order.oid}">
   <div class="address">
    <div class="addList">
       
    </div><!--addList-->
    <div class="addList">
     <label><span class="red">* </span>详细地址:</label>
     <input type="text" id="username" name="address"/>
    </div><!--addList-->
    <div class="addList">
     <label><span class="red">* </span>邮政编码:</label>
     <input type="text" />
    </div><!--addList-->
    <div class="addList">
     <label><span class="red">* </span>收件人:</label>
     <input type="text" name="name"/>
    </div><!--addList-->
    <div class="addList">
     <label><span class="red">* </span>手机号码:</label>
     <input type="text" name="telephone"/> 
    </div><!--addList--> 
  
    <div class="addList2">
   <a href="javascript:document.getElementById('orderForm').submit();"> 提交
    </a>
    </form> 
    <!-- <input type="image" src="images/queren.jpg" width="100" height="32" />
      -->
    </div><!--addList2/-->
   </div><!--address/-->
	
     
   <h4 class="orderTitle">支付方式</h4>
   <ul class="zhiList">
   <li>网银支付-借记卡</li>
   <li>网银支付-信用卡</li>
   <li>财付通-余额支付</li>
   <li>支付宝-余额支付</li>
   <div class="clears"></div>
  </ul><!--zhiList/-->
  <div class="zhifufangshi">
   <ul class="yinhang">
    <li><input type="radio" /><img src="images/yin1.gif" /></li>
    <li><input type="radio" /><img src="images/yin2.gif" /></li>
    <li><input type="radio" /><img src="images/yin3.gif" /></li>
    <li><input type="radio" /><img src="images/yin4.gif" /></li>
    <li><input type="radio" /><img src="images/yin5.gif" /></li>
    <li><input type="radio" /><img src="images/yin6.gif" /></li>
    <li><input type="radio" /><img src="images/yin7.gif" /></li>
    <li><input type="radio" /><img src="images/yin8.gif" /></li>
    <li><input type="radio" /><img src="images/yin9.gif" /></li>
    <li><input type="radio" /><img src="images/yin1.gif" /></li>
    <li><input type="radio" /><img src="images/yin2.gif" /></li>
    <li><input type="radio" /><img src="images/yin3.gif" /></li>
    <li><input type="radio" /><img src="images/yin4.gif" /></li>
    <li><input type="radio" /><img src="images/yin5.gif" /></li>
    <li><input type="radio" /><img src="images/yin6.gif" /></li>
    <li><input type="radio" /><img src="images/yin7.gif" /></li>
    <li><input type="radio" /><img src="images/yin8.gif" /></li>
    <div class="clears"></div>
   </ul>
  </div><!--zhzhifufangshii/-->
  <div class="zhifufangshi">
   <ul class="yinhang">
    <li><input type="radio" /><img src="images/yin7.gif" /></li>
    <li><input type="radio" /><img src="images/yin8.gif" /></li>
    <li><input type="radio" /><img src="images/yin9.gif" /></li>
    <li><input type="radio" /><img src="images/yin1.gif" /></li>
    <li><input type="radio" /><img src="images/yin2.gif" /></li>
    <li><input type="radio" /><img src="images/yin3.gif" /></li>
    <li><input type="radio" /><img src="images/yin4.gif" /></li>
    <li><input type="radio" /><img src="images/yin5.gif" /></li>
    <li><input type="radio" /><img src="images/yin6.gif" /></li>
    <li><input type="radio" /><img src="images/yin7.gif" /></li>
    <li><input type="radio" /><img src="images/yin8.gif" /></li>
    <div class="clears"></div>
   </ul>
  </div><!--zhzhifuouhuo fangshii/-->
  <div class="zhifufangshi">
   <ul class="yinhang">
    <li><input type="radio" /><img src="images/caifutong.jpg" /></li>
    <div class="clear"></div>
   </ul>
  </div><!--zhzhifufangshii/-->
  <div class="zhifufangshi">
   <ul class="yinhang">
    <li><input type="radio" /><img src="images/zhifubao.jpg" /></li>
    <div class="clear"></div>
   </ul>
  </div><!--zhzhifufangshii/-->
  <h4 class="orderTitle">购物清单</h4>
  <table class="orderList">
    <tr>
     <th width="20"></th>
     <th width="430">商品</th>
     <th width="135">单价</th>
     <th width="135">数量</th>
     <th width="135">总金额</th>
     <th>操作</th>
    </tr>
    <tr>
    <c:forEach items="${order.orderItems }" var="orderItem">
     <td><input type="checkbox" /></td>
     <td>
      <dl>
       <dt><a href="proinfo.html"><img src="${pageContext.request.contextPath}/${orderItem.product.pimage}" width="85" height="85" /></a></dt>
       <dd>${orderItem.product.pname}<br /><span class="red">有货：</span>从上海出发</dd>
       <div class="clears"></div>
      </dl>
     </td>
     <td><strong class="red">￥${orderItem.product.shop_price}</strong></td>
     <td>
     <div class="jia_jian">
      <img src="images/jian.jpg" width="21" height="25" class="jian" />
      <input type="text" class="shuliang" name="count" value="${orderItem.count}"/>
      <img src="images/jia.jpg" width="21" height="25" class="jia" />
     </div>
     </td>
     <td><strong class="red">￥${orderItem.subtotal}</strong></td>
     <td><a href="#" class="green">收藏</a><br /><a href="#"  class="green">删除</a></td>
    </tr>
    </c:forEach>
    <tr>
     <td colspan="6"><div class="shanchu"><img src="images/lajio.jpg" /> 全部删除</div></td>
    </tr>
   </table><!--orderList/-->
   <table class="zongjia" align="right">
    <tr>
     <td width="120" align="left">商品总价：</td>
     <td width="60"><strong class="red">￥${order.total}</strong></td>
    </tr>
    <tr>
     <td width="120" align="left">运费总额：</td>
     <td><strong class="red">10元</strong></td>
    </tr>
    <tr>
     <td width="120" align="left">合计：</td>
     <td><strong class="red">￥${order.total+10}</strong></td>
    </tr>
    <tr>
     <td colspan="2" style="height:50px;">
  
      <a href="success.jsp"><img src="images/tijao.png" width="142" height="32" /></a>
     </td>
    </tr>
      
	
    
   </table><!--zongjia/-->
   <div class="clears"></div>
  </div><!--cont/-->

 </div><!--mianCont/-->
 <a href="#" class="backTop">&nbsp;</a>
</body>
</html>
