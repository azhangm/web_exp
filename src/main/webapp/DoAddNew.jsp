<%@page import="java.sql.*" %>
Created by IntelliJ IDEA.
  User: 74282
  Date: 2022/5/3
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
        request.setCharacterEncoding("utf8");
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String heat = request.getParameter("heat");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/zm_test1", "root", "root");
        PreparedStatement pst = conn.prepareStatement("insert into news(title,author,date,heat) values (?,?,?,?)");
        pst.setString(1, title);
        pst.setString(2, author);
        pst.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
        pst.setString(4, heat);
        int b = pst.executeUpdate();
        if (b > 0) {
            out.print("添加成功");
            response.setHeader("refresh","0;url=SelectNews.jsp");
        }
        else
            out.print("添加失败");
    }

    catch (Exception e){
        e.printStackTrace();
    }

%>
</body>
</html>
