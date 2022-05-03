<%--
  Created by IntelliJ IDEA.
  User: 74282
  Date: 2022/4/6
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退出登录页面</title>
</head>
<body>
  <h1>您已退出登录,欢迎下次光临。</h1>
<%--  使得session 会话 失效--%>
  <%session.invalidate(); %>
  <%response.setHeader("refresh","0.5;url=login.jsp");%>
</body>
</html>
