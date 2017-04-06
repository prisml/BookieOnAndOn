package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class BookDAO {
	private static BookDAO instance = new BookDAO();
	private DataSource dataSource;

	private BookDAO() {
		dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static BookDAO getInstance() {
		return instance;
	}

	public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
		closeAll(null, pstmt, con);
	}

	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}

	public BookVO getBookInfoByNo(String no) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BookVO result = null;
		try{
			con=dataSource.getConnection();
			String sql="select title,author,pub,pubdate,genre,summary,rate from book where bookno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()){
				result = new BookVO(no,rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getDouble(7));
			}
		}finally{
			closeAll(rs, pstmt,con);
		}
		return result;
	}
}
