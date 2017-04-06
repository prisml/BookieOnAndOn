package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class BookDAO {
	private static BookDAO instance = new BookDAO();
	private DataSource dataSource;
	
	private BookDAO(){
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	
	public static BookDAO getInstance(){
		return instance;
	}
	
	private Connection getConnection() throws SQLException{
		return dataSource.getConnection();
	}
	
	// 도서명에 따라 도서를 검색하는 메서드 : 성준
	public ArrayList<VO> findBookByTitle(String title, PagingBean pagingBean) throws SQLException{
		ArrayList<VO> findBookList = new ArrayList<VO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			con = getConnection();
			
			StringBuilder sql=new StringBuilder();
			sql.append("select findBookList.* from(");
			sql.append("select row_number() over(order by bookno) rnum, bookno, title, author, pub, rate ");
			sql.append("from book");
			sql.append(") findBookList where rnum between ? and ? and findBookList.title like '");
			sql.append(title.charAt(0) + "%' order by findBookList.bookno");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, pagingBean.getStartRowNumber());
			pstmt.setInt(2, pagingBean.getEndRowNumber());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				findBookList.add(new BookVO(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDouble(6)));
			}
		}
		finally
		{
			closeAll(rs, pstmt, con);
		}
		
		return findBookList;
	}
	
	// 도서검색리스트수 반환 메서드 : 성준
	public int getTotalFindBookListCount(String title) throws SQLException{
		int totalFindBookListCount = 0;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try
		{
			con=getConnection(); 
			
			String sql="select count(*) from book where title like '"+ title.charAt(0) +"%'";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				totalFindBookListCount = rs.getInt(1);
			}
		}
		finally
		{
			closeAll(rs,pstmt,con);
		}
		
		return totalFindBookListCount;
	}
	
	public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException{
		closeAll(null,pstmt,con);
	}
	
	public void closeAll(ResultSet rs,PreparedStatement pstmt, Connection con) throws SQLException{
		if(rs!=null){
			rs.close();
		}
			
		if(pstmt!=null){
			pstmt.close();
		}
			
		if(con!=null){
			con.close();
		}
	}
	
	
}
