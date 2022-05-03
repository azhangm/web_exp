<%--
  Created by IntelliJ IDEA.
  User: 74282
  Date: 2022/5/3
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/zm_test1","root","root");
PreparedStatement pst=conn.prepareStatement("select * from news where title = ?");
    String title = request.getParameter("title");
    pst.setString(1,title);
    ResultSet resultSet = pst.executeQuery();
    request.setCharacterEncoding("utf-8");
if (resultSet.next()){  %>
    <form method="post" action="DoAddNew.jsp">
        新闻标题
        <input type="text" name="title" value="<%=title%>" hidden><br>
        作者
        <input type="text" name="author" value="<%=resultSet.getString("author")%>"><br>
        热度
        <input type="text" name="heat" value="<%=resultSet.getString("heat")%>"><br>
        <input type="submit" value="修改">
    </form>
<%}%>
</body>
</html>
