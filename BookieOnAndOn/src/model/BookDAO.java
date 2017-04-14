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
				sql.append("select row_number() over(order by bookno) rnum, bookno, title, author, pub, to_char(pubdate, 'YYYY-MM-DD') as pubdate, rate ");
				sql.append("from book where title like '%"); 
				sql.append(title + "%' order by bookno");
				sql.append(") findBookList where rnum between ? and ? ");
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, pagingBean.getStartRowNumber());
				pstmt.setInt(2, pagingBean.getEndRowNumber());
				rs = pstmt.executeQuery();
				 
				while(rs.next()){
					findBookList.add(new BookVO(rs.getString("bookno"), rs.getString("title"), rs.getString("author"),
					rs.getString("pub"), rs.getString("pubdate"), rs.getDouble("rate")));
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
				
				String sql="select count(*) from book where title like '%"+ title +"%'";
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
		
		public ArrayList<VO> getBookAutoCompleteList(String title) throws SQLException{
			ArrayList<VO> bookAutoCompleteList = new ArrayList<VO>();
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try
			{
				con = getConnection();
				
				String sql = "select title from book where title like '%"+title+"%'";
				pstmt = con.prepareStatement(sql);

				rs = pstmt.executeQuery();
				 
				while(rs.next()){
					bookAutoCompleteList.add(new BookVO(rs.getString("title")));
				}
			}
			finally
			{
				closeAll(rs, pstmt, con);
			}
			
			return bookAutoCompleteList;
		}
	
	/**
	 * 도서 상세 정보 가져오기 - 영덕
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public BookVO getBookInfoByNo(String no) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BookVO result = null;
		try{
			con=dataSource.getConnection();
			String sql="select title,author,pub,to_char(pubdate,'yyyy-mm-dd')"
					+ ",genre,summary,rate from book where bookno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()){
				result = new BookVO(no,rs.getString(1),rs.getString(2),rs.getString(3)
						,rs.getString(4),rs.getString(5),rs.getString(6),rs.getDouble(7));
			}
		}finally{
			closeAll(rs, pstmt,con);
		}
		return result;
	}
	
	/**
	 * 전체 도서 리스트 -서경
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<VO> getAllBookList(PagingBean pb) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<VO> list = new ArrayList<VO>();
		try{
			con=dataSource.getConnection(); 
			StringBuilder sql = new StringBuilder();
			sql.append("select A.* from (SELECT row_number() over(order by rate desc, bookno) ");
			sql.append("as rnum,bookno,title,author,pub,to_char(pubdate,'yyyy-mm-dd') as pubdatee,genre,rate,bookphoto ");
			sql.append(" from book order by rate desc) A where rnum between ? and ?");
			pstmt=con.prepareStatement(sql.toString());	
			pstmt.setInt(1, pb.getStartRowNumber());
			pstmt.setInt(2, pb.getEndRowNumber());
			System.out.println(pb.getStartRowNumber() + " " + pb.getEndRowNumber());
			rs=pstmt.executeQuery();	
			while(rs.next()){					
				BookVO vo=new BookVO();
				vo.setBookno(rs.getString("bookno"));
				vo.setTitle(rs.getString("title"));
				vo.setAuthor(rs.getString("author"));
				vo.setPub(rs.getString("pub"));
				vo.setPubdate(rs.getString("pubdatee"));
				vo.setGenre(rs.getString("genre"));
				vo.setRate(rs.getDouble("rate"));
				vo.setBookcover(rs.getBlob("bookphoto"));
				list.add(vo);			
			}
		}finally{
			closeAll(rs, pstmt,con);
		}
		return list;
	}
	/**
	 * 장르 별 도서 리스트 -서경
	 * @param genre
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<VO> getGenreBookList(String genre, PagingBean pb) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<VO> list = new ArrayList<VO>();
		try{
			con=dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select A.* from(SELECT row_number() over(order by rate desc) ");
			sql.append("as rnum,bookno,title,author,pub,to_char(pubdate,'yyyy-mm-dd') as pubdatee,genre,rate,bookphoto ");
			sql.append("from book where genre=? ) A where rnum between ? and ?");
			pstmt=con.prepareStatement(sql.toString());	
			pstmt.setString(1, genre);
			pstmt.setInt(2, pb.getStartRowNumber());
			pstmt.setInt(3, pb.getEndRowNumber());
			rs=pstmt.executeQuery();	
			while(rs.next()){					
				BookVO vo=new BookVO();
				vo.setBookno(rs.getString("bookno"));
				vo.setTitle(rs.getString("title"));
				vo.setAuthor(rs.getString("author"));
				vo.setPub(rs.getString("pub"));
				vo.setPubdate(rs.getString("pubdatee"));
				vo.setGenre(genre);
				vo.setRate(rs.getDouble("rate"));
				vo.setBookcover(rs.getBlob("bookphoto"));
				list.add(vo);			
			}
		}finally{
			closeAll(rs, pstmt,con);
		}
		System.out.println(list);
		return list;
	}
	/**
	 * 총 도서 수 -서경
	 * @return
	 * @throws SQLException
	 */
	public int getTotalBookCount() throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int contents=0;
		try{
			con=dataSource.getConnection();
			String sql="select count(*) from book";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				contents=rs.getInt(1);
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return contents;
	}
	/**
	 * 장르 별 도서 수 -서경
	 * @param genre
	 * @return
	 * @throws SQLException
	 */
	public int getGenreBookCount(String genre) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int contents=0;
		try{
			con=dataSource.getConnection();; 
			String sql="select count(*) from book where genre=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, genre);
			rs=pstmt.executeQuery();
			if(rs.next()){
				contents=rs.getInt(1);
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return contents;
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
