package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	//송희송희송희송희송희  Saw 메서드
	public ArrayList<VO> getSawBookList(String id,PagingBean pagingBean) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<VO> list = new ArrayList<VO>();
		try{
			con=dataSource.getConnection();
			String sql="select * "
					+ "from (select row_number() over(order by bookno desc)as rnum,bookno from saw where id=?)s,book b "
					+ "where s.bookno=b.bookno and rnum between ? and ? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pagingBean.getStartRowNumber());
			pstmt.setInt(3, pagingBean.getEndRowNumber());
			rs=pstmt.executeQuery();
			while(rs.next()){
				
				list.add(new BookVO(rs.getString("bookno"),rs.getString("title"),
						rs.getString("author"),rs.getString("pub"),rs.getString("pubdate"),
						rs.getString("genre"),rs.getString("summary"),
						rs.getDouble("rate"),rs.getBlob("bookphoto")));

			}
		}finally{
			closeAll(rs, pstmt,con);
		}
		return list;
	}
	//송희송희송희송희송희  Saw Count 메서드
	public int getSawTotalContent(String id) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalContent=0;
		try{
			con=dataSource.getConnection();
			String sql="select count(*)from saw where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				totalContent=rs.getInt(1);
				
			}
		}finally{
			closeAll(rs, pstmt,con);
		}
		return totalContent;
	}
	//송희송희송희송희송희  Wish 메서드
	public ArrayList<VO> getWishBookList(String id,PagingBean pagingBean) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<VO> list = new ArrayList<VO>();
		try{
			con=dataSource.getConnection();
			String sql="select * "
					+ "from (select row_number() over(order by bookno desc)as rnum,bookno from wish where id=?)s,book b "
					+ "where s.bookno=b.bookno and rnum between ? and ? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pagingBean.getStartRowNumber());
			pstmt.setInt(3, pagingBean.getEndRowNumber());
			rs=pstmt.executeQuery();
			while(rs.next()){
				
				list.add(new BookVO(rs.getString("bookno"),rs.getString("title"),
						rs.getString("author"),rs.getString("pub"),rs.getString("pubdate"),
						rs.getString("genre"),rs.getString("summary"),
						rs.getDouble("rate"),rs.getBlob("bookphoto")));

			}
		}finally{
			closeAll(rs, pstmt,con);
		}
		return list;
	}
	//송희송희송희송희송희  Wish Count 메서드
	public int getWishTotalContent(String id) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalContent=0;
		try{
			con=dataSource.getConnection();
			String sql="select count(*)from wish where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				totalContent=rs.getInt(1);
				
			}
		}finally{
			closeAll(rs, pstmt,con);
		}
		return totalContent;
	}
	

}
