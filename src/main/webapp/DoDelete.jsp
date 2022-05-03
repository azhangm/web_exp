<%--
  Created by IntelliJ IDEA.
  User: 74282
  Date: 2022/5/3
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf8");
    String title = request.getParameter("title");
    System.out.println(title.toString());
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/zm_test1", "root", "root");
        PreparedStatement pst = conn.prepareStatement("delete from news where title = ?");
        pst.setString(1, (String) title);
        int b = pst.executeUpdate();
        if (b > 0) {
            out.print("删除成功");
            response.setHeader("refresh","0;url=SelectNews.jsp");
        }
        else
            out.print("删除失败");
    }

    catch (Exception e){
        e.printStackTrace();
    }

%>
</body>
</html>
