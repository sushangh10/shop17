<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="top">
   <!-- <span>您好！欢迎来到17商城 请&nbsp;<a href="login.jsp">[登录]</a>&nbsp;<a href="reg.jsp">[注册]</a></span> -->
   
   <c:choose>
  	<c:when test="${empty  sessionScope.user.getUsername()}">
  		 <span>您好！欢迎来到17商城 请&nbsp;<a href="login.jsp">[登录]</a>&nbsp;<a href="reg.jsp">[注册]</a></span>
  	</c:when>
  	<c:otherwise>
  		<span>欢迎您尊敬的用户:&nbsp;<a href="#">${sessionScope.user.getUsername()}</a><a href="out">&nbsp;&nbsp;[注销]</a></span>
  	</c:otherwise>
  </c:choose>
   
   
   
   <span class="topRight">
    <a href="vip.html">我的17</a>&nbsp;| 
    <a href="order.html">我的订单</a>&nbsp;| 
    <a href="login.html">会员中心</a>&nbsp;|
    <a href="contact.html">联系我们</a>
   </span>
  </div><!--top/-->
  <div class="lsg">
   <h1 class="logo"><a href="index"><img src="images/logo.png" width="217" height="90" /></a></h1>
   
   <form action="${pageContext.request.contextPath}/search" method="post" class="subBox" >
    <div class="subBoxDiv">
     <input type="text" class="subLeft" name="search"/>
     <input type="image" src="images/subimg.png" width="63" height="34" class="sub" />
     <div class="hotWord">
      热门搜索：
      <a href="#">伞&nbsp;天堂</a>&nbsp;
      <a href="#">鞋柜</a> &nbsp;
      <a href="#">礼品</a>&nbsp;
      <a href="#">拖鞋</a>  &nbsp;
      <a href="#">化妆品</a> &nbsp;
      <a href="#">厨房用具</a>&nbsp;
     </div><!--hotWord/-->
    </div><!--subBoxDiv/-->
   </form><!--subBox/-->
  
   <div class="gouwuche">
    <div class="gouCar">
     <img src="images/gouimg.png" width="19" height="20" style="position:relative;top:6px;" />&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
     <strong>购物车</strong>&nbsp;&nbsp;|&nbsp;&nbsp;
     <!-- <strong class="red">￥ 0.00</strong>  -->
     <a href="cart.jsp">去结算</a> <img src="images/youjian.jpg" width="5" height="8" />    
    </div><!--gouCar/-->
    <div class="myChunlv">
    <label>
    
    <a href="vip.html"><img src="images/mychunlv.jpg" width="106" height="34" /></a>
 
<!-- 	<a href="history"><font size="5">我的足迹</font></a> -->
   
   
   
   <a href="history"><img src="products/1/0001.png" width="106" height="34" /></a>
    
    
    
    </label>
     
    
    
    
    </div><!--myChunlv/-->

  </div><!--lsg/-->
