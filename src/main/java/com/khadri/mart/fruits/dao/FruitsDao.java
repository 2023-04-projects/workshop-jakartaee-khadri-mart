package com.khadri.mart.fruits.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.khadri.mart.fruits.form.FruitsForm;

import jakarta.servlet.ServletContext;

public class FruitsDao {
	private Connection con;
	private String Url;
	private String User;
	private String Password;
	private PreparedStatement pstmt;
	private Statement stmt;

	public FruitsDao(ServletContext context) {
		this.Url = context.getInitParameter("Url");
		this.User = context.getInitParameter("User");
		this.Password = context.getInitParameter("Password");
	}

	private Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(Url, User, Password);
	}

	public int insertFruits(FruitsForm form) {
		System.out.println("FruitsDao insertFruits(-)");
		int result = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("insert into fruits values(?,?,?)");
			pstmt.setString(1, form.getItemName());
			pstmt.setInt(2, form.getItemQty());
			pstmt.setDouble(3, form.getItemPrice());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Exception occured" + e.getMessage());
		} finally {
			System.out.println("Executed finally block");
			try {
				pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public int updateFruitsItem(String name, int qty, double price) {
		int result = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("UPDATE Fruits SET qty = ?, price = ? WHERE name = ?");
			pstmt.setInt(1, qty);
			pstmt.setDouble(2, price);
			pstmt.setString(3, name);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("Executed finally block");
			try {
				pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public List<FruitsForm> selectFruits(String Item_name) {
		System.out.println("FruitsDao selectFruits(-)");
		List<FruitsForm> listOfData = new ArrayList<>();
		try {
			con = getConnection();

			stmt = con.createStatement();
			ResultSet resultSet = stmt.executeQuery("select * from Fruits where name='" + Item_name + "'");

			while (resultSet.next()) {
				FruitsForm form = new FruitsForm(resultSet.getString(1), resultSet.getInt(2), resultSet.getDouble(3));
				listOfData.add(form);
			}

		} catch (Exception e) {
			System.out.println("Exception occured" + e.getMessage());
		} finally {
			System.out.println("Executed finally block");
			try {
				stmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listOfData;
	}

	public List<FruitsForm> selectAllFruits() {
		System.out.println("FruitsDao selectAllFruits(-)");
		List<FruitsForm> listOfFruits = new ArrayList<>();
		try {
			con = getConnection();

			stmt = con.createStatement();
			ResultSet resultSet = stmt.executeQuery("select * from fruits");

			while (resultSet.next()) {
				FruitsForm form = new FruitsForm(resultSet.getString(1), resultSet.getInt(2), resultSet.getDouble(3));
				listOfFruits.add(form);
			}

		} catch (Exception e) {
			System.out.println("Exception occured" + e.getMessage());
		} finally {
			System.out.println("Executed finally block");
			try {
				stmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listOfFruits;
	}

	public int deleteFruits(String name) {
		int result = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("delete from fruits where name=?");
			pstmt.setString(1, name);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("Executed finally block");
			try {
				pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
