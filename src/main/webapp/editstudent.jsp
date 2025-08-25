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
</head>
<body style="padding:40px;">
<%
 	Connection con = DBConnection.getConnection();
	int id  = Integer.parseInt(request.getParameter("id"));
	PreparedStatement psmt = con.prepareStatement("select * from student where id=?");
	psmt.setInt(1, id);
	ResultSet rs = psmt.executeQuery();
	while(rs.next())
	{
%>
	<center>
		<div style="border:1px solid; border-radius:10px;background:lightblue; width:20%; padding:13px; font-size:20px;" >
			<form method=post action=StudentController>
				<table>
					<b>Edit Student</b>
					<input type="hidden" name="action" value="UPDATE">
					<input type="hidden" name="id" value ="<%=rs.getInt("id") %>">
					<tr>
						<td>Name</td>
						<td><input type="text" name="name" id="name" value="<%=rs.getString("name")%>"></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><input type="email" name="email" id="name" value="<%=rs.getString("email")%>"></td>
					</tr>
					<tr>
						<td>Gender</td>
						<td><select name="gender" id="gender" style="width:100%;">
								<!-- <option value="" selected disabled>--- Select ---</option> -->
								<option value="Male"<%="Male".equals(rs.getString("gender"))?"Selected" : "" %>>Male</option>
								<option value="Female"<%="Female".equals(rs.getString("gender"))?"Selected" : "" %>>Female</option>
								<option value="Other"<%="Other".equals(rs.getString("gender"))? "Selected" : "" %>>Other</option>
							</select>
						</td>
					<tr>
					
					<tr>
						<td>Class</td>
						<td><input type="text" name="className" id="className" value="<%= rs.getString("class")%>"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type='submit' value="Update Student"></td>
					</tr>
				</table>
			</form>
			<p>
				<a href="viewstudent.jsp">View Student List</a>
			</p>
			<div>
	</center>
	<%}%>
</body>
</html>