<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>17商城</title>
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript">String code_session=(String) request.getSession().getAttribute("code_session");</script>
<script type="text/javascript">
function checkCode() {
	
	document.getElementById("img").src="session/checkCode?r="+ new Date().getTime();
}
</script>
<script type="text/javascript">

	//自定义校验规则检测用户名是否存在
	$.validator.addMethod(
		"checkUsername",//自定义的校验规则	
		function(value,element,params){//自定义校验规则的实现
			//value)表单元素值
			//element)校验的元素对象
			//params)校验规则输入的参数
			//ajax技术
			var flag = true;
			//发送一个ajax,到服务器进行用户已验证
			$.ajax({
				"async":false,// true异步操作 false 同步操作
				"url":"${pageContext.request.contextPath}/checkUsername",
				"type":"POST",
				"data":{"username":value},
				"dataType":"json",
				"success":function(data){// data:{"isExist":true}
					flag = data.isExist;//true,存在，false 不存在
				}
				
			});
			return !flag;
		}
	);
	//在页面加载完成后，执行内部代码
	$(function(){
		//使用jquery提供的表单校验插件
		$('#registForm').validate({
			//校验规则
			rules:{
				"username":{
					"required":true,
					"checkUsername":true
				},
				"password":{
					"required":true,
					"rangelength":[6,12]
				},
				"confirmpwd":{
					"required":true,
					"rangelength":[6,12],
					"equalTo":"#password"
				},
				"email":{
					"required":true,
					"email":true
				},
				"telephone":{
					"required":true
				},
				"name":{
					"required":true
				},
				"sex":{
					"required":true
				},
				"birthday":{
					"required":true,
					"date":true
				}
				
				
			},
			//提示信息
			messages:{
				"username":{
					"required":"用户名不能为空",
					"checkUsername":"用户名已存在"
				},
				"password":{
					"required":"密码不能位空",
					"rangelength":"密码必须是6-12位之间"
				},
				"confirmpwd":{
					"required":"确认密码不能位空",
					"rangelength":"确认密码必须是6-12位之间",
					"equalTo":"确认密码必须与密码一致"
				},
				"email":{
					"required":"邮箱必须填写",
					"email":"邮箱格式不正确"
				},
				"telephone":{
					"required":"电话必须填写"
				},
				"name":{
					"required":"姓名必须填写"
				},
				"sex":{
					"required":"性别必须选择"
				},
				"birthday":{
					"required":"生日必须填写",
					"date":"日期格式不正确"
				}
				
			},
			errorPlacement: function (error, element) { //指定错误信息位置
			      if (element.is(':radio') || element.is(':checkbox')) { //如果是radio或checkbox
			       error.appendTo(element.parent().parent()); //将错误信息添加当前元素的父结点后面
			     } else {
			       error.insertAfter(element);
			     } 
			   }
		});
	});
	
</script>

</head>

<body style="background: #FFF;">
	<div class="loginLogo">
		<div class="logoMid">
			<h1 class="logo" style="height: 71px; padding-top: 10px;">
				<a href="index.html"><img src="images/loginLogo.jpg" width="241"
					height="71" /></a>
			</h1>
			<div class="loginReg">
				有会员账号?&nbsp;<a href="login.jsp">点击登录</a>
			</div>
			<!--loginReg/-->
		</div>
		<!--logoMid/-->
	</div>
	<!--loginLogo/-->
	<div class="loginBox">
		<img src="images/chengnuo.jpg" width="295" height="393"
			class="chengnuo" />
		<form id="registForm" method="post" action="${pageContext.request.contextPath}/regist" class="reg">
			<div class="regList">
				<label><span class="red">*</span> 账户名</label> <input type="text" name="username" id="username"/>
			</div>
			<!--regList/-->
			<div class="regList">
				<label><span class="red">*</span> 请设置密码</label> <input
					type="password" name="password" id="password" />
			</div>
			<!--regList/-->
			<div class="regList">
				<label><span class="password">*</span> 请确认密码</label> <input
					type="password"  name="confirmpwd" id="confirmpwd"/>
			</div>
			<!--regList/-->
			<div class="regList">
				<label><span class="red">*</span>Email</label> <input type="email" id="email" name="email"
					 />
			</div>
			<!--regList/-->
			<div class="regList">
				<label><span class="password">*</span> 电话号码</label> <input
					type="text" id="telephone" name="telephone"/>
			</div>
			<!--regList/-->
			<div class="regList">
				<label><span class="password">*</span> 姓名</label> <input
					type="text" id="name" name="name"/>
			</div>
			<!--regList/-->
			<div class="regList">
				<label><span class="password">*</span> 生日</label> <input
					type="text" type="date"  id="birthday" name="birthday"/>
			</div>
			
			<!--regList/-->
			<div class="regList">
						<label for="inlineRadio1" class="col-sm-2 control-label">性别</label>
						<select name="sex">
						<option value="male">男</option>
						<option value="femael">女</option>
						</select>
						
						
						
						<!-- <div class="" >
							 <input type="radio"
								name="sex" id="inlineRadio1" value="male"/>
								男
							</label> <label class="radio-inline"> <input type="radio"
								name="sex" id="inlineRadio2" value="female" />
								女
							</label>
						</div> -->
					</div>
					
			<!--regList/-->
			<div class="regList">
				<label><span class="red">*</span> 验证码</label> <input type="text"class="yanzheng" name="yanzhengma" id="yanzhengma" />
			</div>
			<div class="reg">
			<img id = "img" alt="" src="session/checkCode"/><a href="#" onclick="checkCode();">看不清？换</a>
			</div>
			<!--regList/-->
			
			<!--xieyi/-->
			<div class="reg">
				<input type="image" src="images/reg.jpg" width="284" height="34" />
			</div>
			<!--reg/-->
		</form>
		<!--reg/-->
		<div class="clears"></div>
	</div>
	<!--loginBox/-->
</body>
</html>