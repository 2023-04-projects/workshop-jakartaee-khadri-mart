package com.khadri.mart.vegetable.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.khadri.mart.vegetable.form.VegetableForm;

import jakarta.servlet.ServletContext;

public class VegetableDao {

	private Connection con;
	private String Url;
	private String User;
	private String Password;
	private PreparedStatement pstmt;
	private Statement stmt;

	public VegetableDao(ServletContext context) {
		this.Url = context.getInitParameter("Url");
		this.User = context.getInitParameter("User");
		this.Password = context.getInitParameter("Password");
	}

	private Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(Url, User, Password);
	}

	public int insertVegetables(VegetableForm form) {
		System.out.println("VegetableDao insertVegetables(-)");
		int result = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("insert into vegetable values(?,?,?)");
			pstmt.setString(1, form.getVegName());
			pstmt.setInt(2, form.getVegQty());
			pstmt.setDouble(3, form.getVegPrice());
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

	public int updateVegetables(VegetableForm form) {
		System.out.println("VegetableDao updateVegetables(-,-)");

		int result = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("UPDATE vegetable SET qty = ?, price = ? WHERE name = ?");
			pstmt.setInt(1, form.getVegQty());
			pstmt.setDouble(2, form.getVegPrice());
			pstmt.setString(3, form.getVegName());

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

	public List<VegetableForm> selectVegetables(String veg_name) {
		System.out.println("VegetableDao selectVegetables(-)");
		List<VegetableForm> listOfData = new ArrayList<>();
		try {
			con = getConnection();

			stmt = con.createStatement();
			ResultSet resultSet = stmt.executeQuery("select * from vegetable where name='" + veg_name + "'");

			while (resultSet.next()) {
				VegetableForm form = new VegetableForm(resultSet.getString(1), resultSet.getInt(2),
						resultSet.getDouble(3));
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

	public List<VegetableForm> selectAllVegetables() {
		System.out.println("VegetableDao selectAllVegetables(-)");
		List<VegetableForm> listOfvegetables = new ArrayList<>();
		try {
			con = getConnection();

			stmt = con.createStatement();
			ResultSet resultSet = stmt.executeQuery("select * from vegetable");

			while (resultSet.next()) {
				VegetableForm form = new VegetableForm(resultSet.getString(1), resultSet.getInt(2),
						resultSet.getDouble(3));
				listOfvegetables.add(form);
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
		return listOfvegetables;

	}

	public int deleteVegetables(String name) {
		System.out.println("VegetableDao deleteVegetable(-,-)");
		int result = 0;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("DELETE FROM vegetable WHERE name = ?");
			pstmt.setString(1, name);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Exception occurred: " + e.getMessage());
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
