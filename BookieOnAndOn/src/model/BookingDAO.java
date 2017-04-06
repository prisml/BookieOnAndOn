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
	public ArrayList<BookingVO> getBookingList(String id) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BookingVO vo = new BookingVO();
		ArrayList<BookingVO> list = new ArrayList<BookingVO>();
		int count = 0;
		//ListVO lvo = new ListVO();
		try{
			con=dataSource.getConnection();
			String sql="select receiverid from booking where senderid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				vo.setReceiverid(rs.getString(1));
				list.add(vo);
			}
			pstmt.close();
			String sql2="select count(*) from booking where senderid=?";
			pstmt=con.prepareStatement(sql2);
			pstmt.setString(1, vo.getReceiverid());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}finally{
			closeAll(rs, pstmt,con);
		}
		System.out.println("부킹한 멤버별 부킹 수: "+count);
		System.out.println("DAO: "+list);
		return list;
	}
	
		
	public int getTotalBookingCount(String id) throws SQLException {
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
	      System.out.println("부킹한 멤버 수: "+totalCount);
	      return totalCount;
	   }
}
