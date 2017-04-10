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

	/**
	 * 도서에 해당하는 리뷰 목록 - 영덕
	 * @param no
	 * @param pb
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<VO> getReviewList(String no, PagingBean pb) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<VO> list = new ArrayList<VO>();
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select A.* from(SELECT row_number() over(order by rvdate desc) ");
			sql.append("as rnum, bookno,id,star,rvcontent,to_char(rvdate,'yyyy-mm-dd') ");
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

	/**
	 * 도서에 해당하는 리뷰의 수 - 영덕
	 * @param no
	 * @return
	 * @throws SQLException
	 */
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
	
	public void registReview(ReviewVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			String sql = "insert into review(bookno,id,rvcontent,rvdate,star) values(?,?,?,sysdate,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getBookno());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getRvcontent());
			pstmt.setInt(4, vo.getStar());
			pstmt.executeUpdate();
		} finally {
			closeAll(rs, pstmt, con);
		}
	}
	
	public void updateReview(ReviewVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			String sql = "update review set rvcontent=?, star=? where bookno=? and id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(3, vo.getBookno());
			pstmt.setString(4, vo.getId());
			pstmt.setString(1, vo.getRvcontent());
			pstmt.setInt(2, vo.getStar());
			pstmt.executeUpdate();
		} finally {
			closeAll(rs, pstmt, con);
		}
	}
	
	public void deleteReview(ReviewVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			String sql = "delete from review where bookno=? and id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getBookno());
			pstmt.setString(2, vo.getId());
			pstmt.executeUpdate();
		} finally {
			closeAll(rs, pstmt, con);
		}
	}

	public ReviewVO getReview(String bookno, String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReviewVO vo = null;
		try {
			con = dataSource.getConnection();
			String sql = "select bookno,id,star,rvcontent,rvdate from review where bookno=? and id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bookno);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if(rs.next())
				vo = new ReviewVO(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5));
		} finally {
			closeAll(rs, pstmt, con);
		}
		return vo;
	}

	public void updateStar(String bookno) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			String sql = "update book set rate=(select avg(star) from review where bookno=?) where bookno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bookno);
			pstmt.setString(2, bookno);
			pstmt.executeUpdate();
		} finally {
			closeAll(rs, pstmt, con);
		}
	}
}
