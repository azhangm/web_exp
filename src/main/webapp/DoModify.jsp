<%--
  Created by IntelliJ IDEA.
  User: 74282
  Date: 2022/5/3
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<html>
<head>
    <title>修改</title>
</head>
<body>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/zm_test1","root","root");
        PreparedStatement pst=conn.prepareStatement("update set title = ? , author = ? , heat = ?");
        request.setCharacterEncoding("utf-8");
        String title = request.getParameter("title");
        pst.setString(1,title);
        pst.setString(2,request.getParameter("author"));
        pst.setString(3,request.getParameter("heat"));
        int resultSet = pst.executeUpdate();
    if (resultSet > 0){
        out.print("添加成功");
        response.setHeader("refresh","3;url=SelectNews.jsp");
    }else
        out.print("添加失败");
%>
</body>
</html>
