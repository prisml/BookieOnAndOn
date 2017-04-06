package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class ReviewDAO {
	private static ReviewDAO instance = new ReviewDAO();
	private DataSource dataSource;

	private ReviewDAO() {
		dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static ReviewDAO getInstance() {
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

	public ArrayList<VO> getReviewList(String no, PagingBean pb) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<VO> list = new ArrayList<VO>();
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select A.* from(SELECT row_number() over(order by rvdate desc) ");
			sql.append("as rnum, bookno,id,star,rvcontent,rvdate ");
			sql.append("from review B where bookno=? ) A where rnum between ? and ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, no);
			pstmt.setInt(2, pb.getStartRowNumber());
			pstmt.setInt(3, pb.getEndRowNumber());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReviewVO vo = new ReviewVO();
				vo.setBookno(rs.getString(2));
				vo.setId(rs.getString(3));
				vo.setStar(rs.getInt(4));
				vo.setRvcontent(rs.getString(5));
				vo.setRvdate(rs.getString(6));
				list.add(vo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	public int totalReviewCount(String no) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			con = dataSource.getConnection();
			String sql = "select count(*) from review where bookno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return result;
	}
}
