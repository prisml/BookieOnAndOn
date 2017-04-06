package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class BookingDAO {
	private static BookingDAO instance = new BookingDAO();
	private DataSource dataSource;
	private BookingDAO(){
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static BookingDAO getInstance(){
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
	public ArrayList<BookingVO> getBookingList(String id, PagingBean pagingBean) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<BookingVO> list = new ArrayList<BookingVO>();
		ListVO lvo = new ListVO();
		try{
			con=dataSource.getConnection();
			String sql="";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				BookingVO vo = new BookingVO();
				vo.setReceiverid(rs.getString(1));
				list.add(vo);
			}
		}finally{
			closeAll(rs, pstmt,con);
		}
		return list;
	}
	
	public int getTotalBookingContent(String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalCount = 0;
		try {
			con = dataSource.getConnection();
			String sql = "select count(*) from booking where senderid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next())
				totalCount = rs.getInt(1);
		} finally {
			closeAll(rs, pstmt, con);
		}
		return totalCount;
	}
}
