package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class SawWishDAO {
	private static SawWishDAO instance = new SawWishDAO();
	private DataSource dataSource;
	private SawWishDAO(){
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static SawWishDAO getInstance(){
		return instance;
	}
	public void closeAll(PreparedStatement pstmt,
			Connection con) throws SQLException{
		closeAll(null,pstmt,con);
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,
			Connection con) throws SQLException{
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close();
	}
	public String saw(String no, String id)  throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String result = "";
		try{
			con=dataSource.getConnection();
			String sql="select id,bookno from saw where id=? and bookno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, no);
			rs=pstmt.executeQuery();
			if(rs.next()){
				pstmt.close();
				sql = "delete from saw where id=? and bookno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, no);
				pstmt.executeUpdate();
				result="안봤어요";
				System.out.println("delete");
			}else{
				pstmt.close();
				sql = "insert into saw(id,bookno) values(?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, no);
				pstmt.executeUpdate();
				result="봤어요";
				System.out.println("insert");
			}
		}finally{
			closeAll(rs, pstmt,con);
		}
		return result;
	}
	public String wish(String no, String id) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String result = "";
		try{
			con=dataSource.getConnection();
			String sql="select id,bookno from wish where id=? and bookno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, no);
			rs=pstmt.executeQuery();
			if(rs.next()){
				pstmt.close();
				sql = "delete from wish where id=? and bookno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, no);
				pstmt.executeUpdate();
				result="보고싶어요 취소했어요";
				System.out.println("delete");
			}else{
				pstmt.close();
				sql = "insert into wish(id,bookno) values(?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, no);
				pstmt.executeUpdate();
				result="보고싶어요 눌렀어요";
				System.out.println("insert");
			}
		}finally{
			closeAll(rs, pstmt,con);
		}
		return result;
	}
}
