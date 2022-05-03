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
    Cookie[] cookies = request.getCookies();
    String id = request.getParameter("id");
    if (!id.equals("") || cookies.length!=0){
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/zm_test1","root","root");
    PreparedStatement pst=conn.prepareStatement("select * from user where id=? and password=?");
    request.setCharacterEncoding("utf-8");
    pst.setString(1,id);
    pst.setString(2,request.getParameter("password"));
    ResultSet rs=pst.executeQuery();
    if(rs.next()){

        boolean cookieFlag = false; // 赋初值  默认不创建 cookie
        if (cookies.length != 0){
            //对 cookie 进行遍历 看是否 已经有设置的对应的 cookie 存在浏览器中
            for(int i=0; i<cookies.length; i++){
                if(!"Cookie2019".equals(cookies[i].getName())){
                    // 如果 没有相应的cookie 值 break
                    out.print("登录成功！两秒后跳转");
                    response.setHeader("refresh","2;url=SelectNews.jsp");
                    cookieFlag = true;
                    break;
                }
            }

        // 有了 cookie 是否创建的标志 创建cookie rember 有值 说明被选中
        String rember = request.getParameter("isRem");
        if (cookieFlag && rember != null){
//                 添加 # 利于分割
            Cookie cookie = new Cookie("Cookie2019",id + "#" + request.getParameter("password"));
            // 设置 cookie 生命周期为 60  分钟
            cookie.setMaxAge(60);
            // 添加 cookie 到 响应头中
            response.addCookie(cookie);

        }else if (cookieFlag){
            // 没有记住我 功能的实现
            Cookie cookie = new Cookie("Cookie2019",id + "#" + request.getParameter("password"));
            // 设置 cookie 生命周期为 0  创建 即 销毁 仅仅用于验证是否登录成功
            cookie.setMaxAge(0);
            // 每次刷新浏览器都要添加一次 周期为 0的 cookie
            response.addCookie(cookie);
        }}

            out.print("登录成功！两秒后跳转");
            response.setHeader("refresh","0;url=SelectNews.jsp");
        //重定向 两次 请求 放在 request 域中不能拿到相应的值
        // 放在 session 域中才可以拿到 这里 要设置 值到 session 域中
        session.setAttribute("username",rs.getString("username"));
        String username = rs.getString("username");
        System.out.println(username);
        //设置session生命周期

    }
    else{
   out.print("登陆失败！请重新登录 ");
        response.setHeader("refresh","0;url=login.jsp");
    }
}
catch(Exception e){
	out.println(e);
}
    }
    else {
        out.print("用户名和密码不能为空！");
        response.setHeader("refresh","1;url=login.jsp");
    }
%>
</body>
</html>