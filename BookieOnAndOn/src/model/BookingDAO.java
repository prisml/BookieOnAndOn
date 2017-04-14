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

	private BookingDAO() {
		dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static BookingDAO getInstance() {
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

	/**
	 * 부킹리스트
	 * 
	 * @param id
	 * @param pagingBean
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<VO> getBookingList(String id, PagingBean pagingBean) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<VO> list = new ArrayList<VO>();
		BookingVO vo = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select findReceiveridList.* from(");
			sql.append("select row_number() over(order by receiverid desc) rnum, receiverid ");
			sql.append("from booking where senderid=?");
			sql.append(") findReceiveridList where rnum between ? and ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, pagingBean.getStartRowNumber());
			pstmt.setInt(3, pagingBean.getEndRowNumber());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new BookingVO();
				vo.setReceiverid(rs.getString("receiverid"));
				vo.setReceiveridcount(getTotalBookingCount(vo.getReceiverid()));
				list.add(vo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	/**
	 * 부킹리스트 멤버 총 수
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
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
			if (rs.next())
				totalCount = rs.getInt(1);
		} finally {
			closeAll(rs, pstmt, con);
		}
		return totalCount;
	}
	
	/**
	 * 부킹멤버 삭제
	 * @param senderid
	 * @param receiverid
	 * @throws SQLException
	 */
	public void bookingMemberDelete(String senderid, String receiverid) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = dataSource.getConnection();
			String sql = "delete from booking where senderid=? and receiverid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, senderid);
			pstmt.setString(2, receiverid);
			pstmt.executeQuery();
		}finally{
			closeAll(pstmt, con);
		}
	}
	
	
	public boolean BookingCheck(String senderid, String receiverid) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
			con = dataSource.getConnection();
			String sql = "select count(*)from booking where senderid=?and receiverid=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, senderid);
			pstmt.setString(2, receiverid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt(1) == 0)
					flag = true;
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return flag;
	}
	 	
	public void addBooking(String senderid, String receiverid) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "insert into booking(senderid,receiverid) values(?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, senderid);
			pstmt.setString(2, receiverid);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}
}
