package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	private DataSource dataSource;
	private MemberDAO(){
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static MemberDAO getInstance(){
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
	
	public ArrayList<String> getMemberNameList() throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<String> list = new ArrayList<String>();
		try{
			con=dataSource.getConnection();
			String sql="select name from bookmember";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				list.add(rs.getString(1));
			}
		}finally{
			closeAll(rs, pstmt,con);
		}
		return list;
	}

	public MemberVO login(String id, String password) throws SQLException {
		MemberVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			String sql = "select name,tel from bookmember where id=? and password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next())
				vo = new MemberVO(id, password, rs.getString(1), rs.getString(2));
		} finally {
			closeAll(rs, pstmt, con);
		}
		return vo;
	}
	public void register(MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=dataSource.getConnection();
			String sql="insert into bookmember(id,password,name,tel) values(?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getTel());
			pstmt.executeUpdate();
			System.out.println(vo);
		}finally{
			closeAll(pstmt, con);
		}
	}	
	public boolean idCheck(String id) throws SQLException{
		boolean flag = false;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=dataSource.getConnection();
			String sql="select count(*) from bookmember where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				if(rs.getInt(1) == 0){
					flag = true;
				}
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
			return flag;
	}

	public void updateMember(MemberVO vo) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=dataSource.getConnection();
			String sql=
				"update bookmember set password=?,name=?,tel=? where id=?";
			pstmt=con.prepareStatement(sql);			
			pstmt.setString(1,vo.getPassword());
			pstmt.setString(2,vo.getName());
			pstmt.setString(3,vo.getTel());
			pstmt.setString(4,vo.getId());
			pstmt.executeUpdate();			
		}finally{
			closeAll(pstmt,con);
		}
	}

	public MemberVO getMemberById(String id) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberVO vo=null;
		try{
			con=dataSource.getConnection();
			String sql="select * from bookmember where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				vo=new MemberVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));			
				}			
		}finally{
			closeAll(rs,pstmt,con);
		}
			return vo;
	}
	public String findMemberById(String name,String tel) throws SQLException {
		String id = null;	
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;		
		try{
			con=dataSource.getConnection();
			String sql=
			"select id from bookmember where name=? and tel=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, tel);
			rs=pstmt.executeQuery();
			if(rs.next()){
				id = rs.getString("id");
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return id;
	}
	
	public String findMemberByPw(String id, String name,String tel) throws SQLException {
		String pw = null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con=dataSource.getConnection();
			String sql=
			"select password from bookmember where id = ? and name=? and tel=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, tel);
			rs=pstmt.executeQuery();
			if(rs.next()){
				pw = rs.getString("password");
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return pw;
	}
	
}
