<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zm 登录页面</title>
  <link href="css/zmlogin.css" rel="stylesheet" type="text/css">
</head>
<body>
<h1 style="color: red" align="center">新闻管理系统</h1>
<div class="zm_login">
  <form action="DoLogin.jsp" method="post">
    <h3>登录</h3>
<h3>登陆ID：<input type="text" name="id"/></h3>
<h3>密&nbsp码：<input type="password" name="password"/></h3>
      <div class="dbutton">
          &nbsp;
          &nbsp;
          &nbsp;          &nbsp;

          &nbsp;
<input type="submit" value="登录" id="button1">
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
<input type="reset" value="重置" id="button2">
          <br>
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;&nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;&nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
<input type="checkbox" value="记住我" name="isRem">记住我<br>
</div>
          <span>没有账号？<a href="reg.jsp">点击注册</a> </span>
  </form>
</div>
</body>
</html>