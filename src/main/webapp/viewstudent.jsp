<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
    import = "com.eis.Connection.DBConnection"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	width: 100%;
}
table,td, tr, th{
	border: 1px solid;
	border-collapse: collapse;
}
.container{
	padding: 15px;
	width: 50%;
	margin: 0 auto;
	background-color: lightblue;
}
</style>
</head>
<body>
<%
	Connection con = DBConnection.getConnection();
	PreparedStatement psmt = con.prepareStatement("select * from student");
	ResultSet rs = psmt.executeQuery();
%>
<div class="container">
	<p><a href="student.jsp">Back</a></p>
	<table>
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Gender</th>
			<th>Class</th>
			<th>Operation</th>
		</tr>
		<%
			while(rs.next()){
				int id  = rs.getInt("id");
		%>
		<tr>
			<td><%= rs.getString("name") %></td>
			<td><%= rs.getString("email") %></td>
			<td><%= rs.getString("gender") %></td>
			<td><%= rs.getString("class") %></td>
			<td>
				&nbsp;
				<a href="editstudent.jsp?id=<%=id%>"> Edit </a> &nbsp;
				<a href="StudentController?action=DELETE&id=<%=id%>" onclick="return confirm('Delete')"> Delete </a>				
			</td>	
		</tr>
		<%}%>
	</table>
</div>

</body>
</html>