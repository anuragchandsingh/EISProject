package com.eis.DAO;

import java.beans.Statement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;

import com.eis.Connection.DBConnection;
import com.eis.Model.Student;

public class StudentDao {
	
	Student s  = new Student();

	public void insert(Student s) {

		try {
			Connection c = DBConnection.getConnection();

			PreparedStatement ps = c.prepareStatement("INSERT INTO student(name,email, gender, class) VALUES(?,?,?,?)");
			{
				ps.setString(1, s.getName());
				ps.setString(2, s.getEmail());
				ps.setString(3, s.getGender());
				ps.setString(4, s.getClassName());
				ps.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete(int id)
	{
		try
		{
			Connection c  = DBConnection.getConnection();
			
			PreparedStatement ps = c.prepareStatement("delete from student where id=?");
			ps.setInt(1, id);
			ps.executeUpdate();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void update(Student s)
	{
		try {
			Connection c = DBConnection.getConnection();
			
			PreparedStatement ps = c.prepareStatement("update student set name=?, email=?, gender=?, class=? where id =?");
			ps.setString(1, s.getName());
			ps.setString(2, s.getEmail());
			ps.setString(3, s.getGender());
			ps.setString(4, s.getClassName());
			ps.setInt(5, s.getId());
			
			ps.executeUpdate();
			
		}catch (Exception e)
		{
			e.printStackTrace();
		}
	} 

}
