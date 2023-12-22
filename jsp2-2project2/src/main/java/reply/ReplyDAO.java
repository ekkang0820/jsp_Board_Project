package reply;

import java.security.PublicKey;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.Board;

public class ReplyDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private PreparedStatement Npstmt; 
	private ResultSet Nrs;
	public ReplyDAO() {
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
	public int replywrite(String userMail,int bd_num,String re_txt) {
		String SQL = "insert into reply (userMail,bd_num,re_txt,re_date) values (?,?,?,now())";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);			
			pstmt.setString(1,userMail);	
			pstmt.setInt(2,bd_num);
			pstmt.setString(3,re_txt);			
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return -1;		
	}
	public ArrayList<Reply> replytxt(int bd_num){		
		String SQL = "select re_txt,reply.userMail,re_date,re_num from reply,board where board.bd_num = reply.bd_num and reply.bd_num = ?";
		ArrayList<Reply> li = new ArrayList<Reply>();
		
		try{
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, bd_num);			
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				Reply reply = new Reply();				
				reply.setRe_txt(rs.getString(1));
				reply.setUserMail(rs.getString(2));
				reply.setRe_date(rs.getTimestamp(3));	
				reply.setRe_num(rs.getInt(4));
				li.add(reply);
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
	public int delete(int re_num) {
		String SQL = "delete from reply where re_num = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);			
			pstmt.setInt(1,re_num);		
		
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return -1;		
	}
			
		public int replycount(int bd_num) {
		String SQL = "select count(*) from reply where bd_num = ? ";
		int count = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);			
			pstmt.setInt(1,bd_num);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				count = rs.getInt(1);
			}
					
			return count;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return -1;		
	}
}
