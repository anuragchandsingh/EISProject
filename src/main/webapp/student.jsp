<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="padding:40px;">
	<center>
		<div style="border:1px solid; border-radius:10px;background:lightblue; width:20%; padding:13px; font-size:20px;" >
			<form method=post action=StudentController>
				<table>
					<b>Add Student</b>
					<input type="hidden" name="action" value="INSERT">
					<tr>
						<td>Name</td>
						<td><input type="text" name="name" id="name"></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><input type="email" name="email" id="name"></td>
					</tr>
					<tr>
						<td>Gender</td>
						
						<td><select name="gender" id="gender" style="width:100%;">
								<option vlaue="" selected hidden>-- Select --</option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="Other">Other</option>
							</select>
						</td>
					<tr>
					
					<tr>
						<td>Class</td>
						<td><input type="text" name="className" id="className"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type='submit' value="Add Student"></td>
					</tr>
				</table>
			</form>
			<p>
				<a href="viewstudent.jsp">View Student List</a>
			</p>
			<div>
	</center>
</body>
</html>