<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf8");
    if (request.getParameter("password").equals(request.getParameter("twopassword"))){
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/zm_test1","root","root");
    PreparedStatement pst=conn.prepareStatement("insert into user(id,username,password,usex,uemail,uredate) values(?,?,?,?,?,?)");

    pst.setString(1,request.getParameter("id"));
    pst.setString(2,request.getParameter("username"));
    pst.setString(3,request.getParameter("password"));
    pst.setString(4,request.getParameter("sex"));
    pst.setString(5,request.getParameter("email"));
//    pst.setDate(5,new Date(System.currentTimeMillis()));
    pst.setTimestamp(6,new Timestamp(System.currentTimeMillis()));
    int rs=pst.executeUpdate();
    if(rs>0){
    out.print("注册成功!将在2秒后跳转登录页面请稍后");
    	response.setHeader("refresh","2;url=login.jsp");
    }
    else{
    	out.print("注册失败");
    }
}
catch(Exception e){
	out.println(e);
}
    }
    else{
        %>
    <script>
        alert("两次密码不一致")
    </script>
    <%}
    %>
</body>
</html>