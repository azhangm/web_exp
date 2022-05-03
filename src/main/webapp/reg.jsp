<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zm新闻系统注册页面</title>
    <link href="css/zmreg.css" type="text/css" rel="stylesheet">
</head>
<body>

<div class="zm_reg">
    <form action="DoReg.jsp" method="post">
        <div>  <span style="font-size: 16px;font-weight: bold" >注册页面</span></div>
        <div>
            <span style="font-size: 16px;font-weight: bold" >登录id</span>
            <input type="text" name="id"/>
        </div>
        <div>
        <span style="font-size: 16px;font-weight: bold" >用户名：</span>
        <input type="text" name="username"/>
        </div>
        <div>
        <span style="font-size: 16px;font-weight: bold" >密&nbsp;&nbsp;&nbsp;&nbsp;码:</span>
        <input type="password" name="password"/>
        </div>
        <div>
            <span style="font-size: 16px;font-weight: bold" >确认密码:</span>
            <input type="password" name="twopassword"/>
        </div>
            <div>
        <span style="font-size: 16px;font-weight: bold">邮&nbsp;&nbsp;&nbsp;&nbsp;箱:</span>
                <input type="email" name="email">
        </div>
        <div>
            <span style="font-size: 16px;font-weight: bold">性&nbsp;&nbsp;&nbsp;&nbsp;别:</span>
            <input type="radio" name="sex" value="man"> 男
            <input type="radio" name="sex" value="women">女
        </div>
        <input type="reset" value="重置" id="button1">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" value="注册" id="button2">
    </form>
</div>
</body>
</html>