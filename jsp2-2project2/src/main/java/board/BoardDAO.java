package board;

import java.security.PublicKey;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private PreparedStatement pstmt2;
	private ResultSet rs;
	private PreparedStatement Npstmt; 
	private ResultSet Nrs;
	public BoardDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/A201944010";
			String dbID="root";
			String dbPW="eksldpf1!";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPW);
		}catch(Exception e) {
		e.printStackTrace();
		}
	}

	/*
	 * public int write(String bd_title,String userMail,String bd_txt) { String SQL
	 * =
	 * "insert into board (userMail,bd_title,bd_date,bd_txt) values (?,?,now(),?)";
	 * try { PreparedStatement pstmt = conn.prepareStatement(SQL);
	 * pstmt.setString(1,userMail); pstmt.setString(2,bd_title);
	 * pstmt.setString(3,bd_txt);
	 * 
	 * pstmt.executeUpdate(); return 1; } catch (Exception e) { e.printStackTrace();
	 * } return -1; }
	 */
	public int write(String bd_title, String userMail, String bd_txt, String bd_img) {
	    String SQL = "INSERT INTO board (userMail, bd_title, bd_date, bd_txt, bd_img) VALUES (?, ?, now(), ?, ?)";
	    try {
	        PreparedStatement pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, userMail);
	        pstmt.setString(2, bd_title);          
	        pstmt.setString(3, bd_txt);
	        pstmt.setString(4, bd_img); // 이미지 경로 추가

	        pstmt.executeUpdate();
	        return 1;
	    } catch (Exception e) {
	        e.printStackTrace();
	    } 
	    return -1;     
	}
	public int pagenum() {
		String sql = "select bd_num from board order by bd_num desc";	
		
		try {	
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) 
			{						
			return rs.getInt(1)+1;
			}
			return 1;
		} 
		
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();	
		}
		return -1;
		
		
	}
	public ArrayList<Board> rgetListtitle(int pagenumber,String keyword) {
		ArrayList<Board> li = new ArrayList<Board>();
		String sql = "select bd_num,userMail,bd_title,bd_txt,bd_date from board where bd_title like ? order by bd_num asc limit 20 offset ?";
		
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);			
		
			String KEY = new String();
			KEY = "%"+keyword+"%";
			pstmt.setString(1,KEY);
			pstmt.setInt(2, ((pagenumber * 20)-20));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();								
				board.setBd_num(rs.getInt(1));
				board.setUserMail(rs.getString(2));
				board.setBd_title(rs.getString(3));
				board.setBd_txt(rs.getString(4));
				board.setBd_date(rs.getTimestamp(5));	
				
				li.add(board);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();			
		}
		return li;	
	}
	public ArrayList<Board> rgetListtxt(int pagenumber,String keyword) {
		ArrayList<Board> li = new ArrayList<Board>();
		String sql = "select bd_num,userMail,bd_title,bd_txt,bd_date from board where bd_txt like ? order by bd_num asc limit 20 offset ?";
		
		
		try {		
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			String KEY = new String();
			KEY = "%"+keyword+"%";
			pstmt.setString(1,KEY);
			pstmt.setInt(2, ((pagenumber * 20)-20));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();								
				board.setBd_num(rs.getInt(1));
				board.setUserMail(rs.getString(2));
				board.setBd_title(rs.getString(3));
				board.setBd_txt(rs.getString(4));
				board.setBd_date(rs.getTimestamp(5));
				
				
				li.add(board);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();			
		}
		return li;	
	}
	public ArrayList<Board> rgetListreply(int pagenumber,String keyword) {
		ArrayList<Board> li = new ArrayList<Board>();
		String sql = "select distinct board.bd_num,board.userMail,bd_title,bd_txt,bd_date from board,reply "
				+ "where board.bd_num = reply.bd_num and re_txt like ? order by bd_num asc limit 20 offset ? ";
		
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			String KEY = new String();
			KEY = "%"+keyword+"%";
			pstmt.setString(1,KEY);
			pstmt.setInt(2, ((pagenumber * 20)-20));
			rs = pstmt.executeQuery();			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();								
				board.setBd_num(rs.getInt(1));
				board.setUserMail(rs.getString(2));
				board.setBd_title(rs.getString(3));
				board.setBd_txt(rs.getString(4));
				board.setBd_date(rs.getTimestamp(5));	
				
				li.add(board);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();			
		}
		return li;	
	}
	public ArrayList<Board> rgetList(int pagenumber,String keyword) {
		ArrayList<Board> li = new ArrayList<Board>();
		String sql = "select distinct board.bd_num,board.userMail,bd_title,bd_txt,bd_date from board,reply where (board.bd_num = reply.bd_num) and re_txt like ? or bd_txt like ? or bd_title like ? order by bd_num asc limit 20 offset ? ";	
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			String KEY = new String();
			KEY = "%"+keyword+"%";
			pstmt.setString(1,KEY);
			pstmt.setString(2,KEY);
			pstmt.setString(3,KEY);
			pstmt.setInt(4, ((pagenumber * 20)-20));
			rs = pstmt.executeQuery();
						
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();								
				board.setBd_num(rs.getInt(1));
				board.setUserMail(rs.getString(2));
				board.setBd_title(rs.getString(3));
				board.setBd_txt(rs.getString(4));
				board.setBd_date(rs.getTimestamp(5));	
				
				li.add(board);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();			
		}
		return li;	
	}
	public ArrayList<Board> getListtitle(int pagenumber,String keyword) {
		ArrayList<Board> li = new ArrayList<Board>();
		String sql = "select bd_num,userMail,bd_title,bd_txt,bd_date from board where bd_title like ? order by bd_num desc limit 20 offset ?";
		
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);			
		
			String KEY = new String();
			KEY = "%"+keyword+"%";
			pstmt.setString(1,KEY);
			pstmt.setInt(2, ((pagenumber * 20)-20));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();								
				board.setBd_num(rs.getInt(1));
				board.setUserMail(rs.getString(2));
				board.setBd_title(rs.getString(3));
				board.setBd_txt(rs.getString(4));
				board.setBd_date(rs.getTimestamp(5));	
				
				li.add(board);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();			
		}
		return li;	
	}
	public ArrayList<Board> getListtxt(int pagenumber,String keyword) {
		ArrayList<Board> li = new ArrayList<Board>();
		String sql = "select bd_num,userMail,bd_title,bd_txt,bd_date from board where bd_txt like ? order by bd_num desc limit 20 offset ?";
		
		
		try {		
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			String KEY = new String();
			KEY = "%"+keyword+"%";
			pstmt.setString(1,KEY);
			pstmt.setInt(2, ((pagenumber * 20)-20));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();								
				board.setBd_num(rs.getInt(1));
				board.setUserMail(rs.getString(2));
				board.setBd_title(rs.getString(3));
				board.setBd_txt(rs.getString(4));
				board.setBd_date(rs.getTimestamp(5));	
				
				li.add(board);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();			
		}
		return li;	
	}
	public ArrayList<Board> getListreply(int pagenumber,String keyword) {
		ArrayList<Board> li = new ArrayList<Board>();
		String sql = "select distinct board.bd_num,board.userMail,bd_title,bd_txt,bd_date from board,reply "
				+ "where board.bd_num = reply.bd_num and re_txt like ? order by bd_num desc limit 20 offset ?";
		
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			String KEY = new String();
			KEY = "%"+keyword+"%";
			pstmt.setString(1,KEY);
			pstmt.setInt(2, ((pagenumber * 20)-20));
			rs = pstmt.executeQuery();			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();								
				board.setBd_num(rs.getInt(1));
				board.setUserMail(rs.getString(2));
				board.setBd_title(rs.getString(3));
				board.setBd_txt(rs.getString(4));
				board.setBd_date(rs.getTimestamp(5));	
				
				li.add(board);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();			
		}
		return li;	
	}
	public ArrayList<Board> getList(int pagenumber,String keyword) {
		ArrayList<Board> li = new ArrayList<Board>();
		String sql = "select distinct board.bd_num,board.userMail,bd_title,bd_txt,bd_date from board,reply where"
				+ " (board.bd_num = reply.bd_num) and re_txt like ? or bd_txt like ? or bd_title like ? "
				+ "order by bd_num desc limit 20 offset ? ";	
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			String KEY = new String();
			KEY = "%"+keyword+"%";
			pstmt.setString(1,KEY);
			pstmt.setString(2,KEY);
			pstmt.setString(3,KEY);
			pstmt.setInt(4, ((pagenumber * 20)-20));
			rs = pstmt.executeQuery();
						
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();								
				board.setBd_num(rs.getInt(1));
				board.setUserMail(rs.getString(2));
				board.setBd_title(rs.getString(3));
				board.setBd_txt(rs.getString(4));
				board.setBd_date(rs.getTimestamp(5));	
				
				li.add(board);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();			
		}
		return li;	
	}
	public boolean nextPage (int pagenumber)
	{
		String sql = "select * from board where bd_num < ? ";
		ArrayList<Board> li = new ArrayList<Board>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,pagenum() -  (pagenumber - 1) *20);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
		
	}
	public int backupselectCnt(String keyword){
		int result = 0;
		ResultSet rs = null;
		String sql = "select count(*) from board where bd_title like ?";
		try {
			String KEY = new String();
			KEY = "%"+keyword+"%";
			pstmt.setString(1,KEY);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try { 
				rs.close();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return (result / 20) + 1;
	}
	public int selectCnt(String keyword){
		int result = 0;
		ResultSet rs = null;		
		try {
			PreparedStatement pstmt;
			String KEY = new String();
			KEY = "%"+keyword+"%";
			String sql = "select count(*) from board where bd_title like '"+KEY+"'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try { 
				rs.close();
				//pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return (result / 20) + 1;
	}
	public ArrayList<Board> selectPage(String table, int start, int pageCnt){
		ResultSet rs=null;
		
		String SQL = "SELECT * FROM borad";
		ArrayList<Board> li = new ArrayList<Board>();
		
		try{
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, start);
			pstmt.setInt(2, pageCnt);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				Board board = new Board();								
				board.setBd_num(rs.getInt(1));
				board.setUserMail(rs.getString(2));
				board.setBd_title(rs.getString(3));
				board.setBd_txt(rs.getString(5));
				board.setBd_date(rs.getTimestamp(4));	
				
				li.add(board);
			}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return li;	
		}
	 
	


	
	public String Nick(String userMail) {
		String Nsql = "select userNick from user where userMail = '"+userMail+"'";	
		String nickname = new String();
		try {	
			Npstmt = conn.prepareStatement(Nsql);
			Nrs = Npstmt.executeQuery();
			if(Nrs.next()) 
			{			
			nickname  = Nrs.getString("userNick");
			return nickname;
			}
			
		} 
		
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();	
		}
		return nickname;
		
		
		
	}

	public Board gettxt(int bd_num) {
		String sql = "select * from board where bd_num = ?";	
		try {	
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bd_num);
			rs = pstmt.executeQuery();
			if(rs.next()) 
			{			
				Board board = new Board();								
				board.setBd_num(rs.getInt(1));
				board.setUserMail(rs.getString(2));
				board.setBd_title(rs.getString(3));
				board.setBd_txt(rs.getString(5));
				board.setBd_date(rs.getTimestamp(4));
				board.setBd_img(rs.getString(6));
				
				return board;
			}
			
			
		} 
		
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();	
		}
		return null;
			
	}
	public int update(int bd_num, String bd_title, String bd_txt) {
		String SQL = "update board set bd_title = ?, bd_txt = ? where bd_num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,bd_title);			
			pstmt.setString(2,bd_txt);
			pstmt.setInt(3,bd_num);
			pstmt.executeUpdate();
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return -1;		
	}
	public int delete(int bd_num) {
		String SQL = "delete from board where bd_num = ?";
		String SQL2 = "delete from reply where bd_num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);			
			pstmt.setInt(1,bd_num);
			pstmt.executeUpdate();	
			PreparedStatement pstmt2 = conn.prepareStatement(SQL2);
			pstmt2.setInt(1, bd_num);
			pstmt2.executeUpdate();	
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return -1;		
	}
		
	public int boardcount() {
		
		String sql = "select count(*) from board;";	
		try {	
			PreparedStatement pstmt = conn.prepareStatement(sql);
	
			rs = pstmt.executeQuery();
			if(rs.next()) 
			{			
				
				return rs.getInt(1);
			}
			
			
		} 
		
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();	
		}
		return -1;
			
	}
public int usercount() {
		
		String sql = "select count(*) from user;";	
		try {	
			PreparedStatement pstmt = conn.prepareStatement(sql);
	
			rs = pstmt.executeQuery();
			if(rs.next()) 
			{			
				
				return rs.getInt(1);
			}
			
			
		} 
		
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();	
		}
		return -1;
			
	}
}
