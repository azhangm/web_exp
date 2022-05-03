<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻查询页面</title>
	<link href="css/zmnews.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/zm_test1?useUnicode=true&characterEncoding=utf-8","root", "root");
PreparedStatement pst=conn.prepareStatement("select * from news");
ResultSet rs=pst.executeQuery();
%>
<h1>登录成功[<%=session.getAttribute("username")%>]访问新闻管理系统!</h1>
<div id="xian"></div>
<div id="operation">
	<a id="add" href="addNew.jsp">增加新闻</a>
	<a id="exit" href="logout.jsp">安全退出</a>

</div>

	   <table border="1px">
		   <tr>
			   <th>编号</th>
			   <th>标题</th>
			   <th>作者</th>
			   <th>日期</th>
			   <th>热度</th>
			   <th>操作</th>
		   </tr>

   <%
	   int count = 0;
	while(rs.next()){
		count++;
	%>
	<tr><td><%=count%></td>
		<td><%=rs.getString("title")%>
			<% request.setAttribute("title",rs.getString("title"));%>
		</td>
		<td><%=rs.getString("author") %></td>
		<td><%=rs.getString("date")%></td>
		<td><%=rs.getString("heat")%></td>
		<td>
			<button><a class="a" href="zmselectNew.jsp">查询详情</a></button>
			<button><a class="a" href="modify.jsp?title=${title}">修改</a></button>
			<button><a class="a" href="DoDelete.jsp?title=${title}">删除</a></button>
		</td>
	</tr>
	<%
	}
	%>
	</table>
	<%
if(pst!=null){
	pst.close();
}	
if(conn!=null){
conn.close();	
}
}
catch(Exception e){
	out.println(e);
	
}
%>
</body>
</html>