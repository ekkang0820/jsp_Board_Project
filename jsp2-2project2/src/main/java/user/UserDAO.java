package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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
	
		public int login(String userMail,String userPW) {
			String SQL = "SELECT userPW FROM user WHERE userMail = ?";
			try {	
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,userMail);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getString(1).equals(userPW)) {
						return 	1;
					}
					
					else
						return 0;
				}
				return -1;//아이디가 없음
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
			return -2; //데이터베이스 오류
			
		}
		public int join(User user) {
			String SQL = "INSERT INTO USER VALUES(?,?,?)";//0은 sql문
			try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,user.getUserMail());
				pstmt.setString(2,user.getUserPW());
				pstmt.setString(3,user.getUserNick());
				return pstmt.executeUpdate();//실행한 결과
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1;//db오류
		}
		public int checkDuplication(String userMail) {
		    String SQL = "SELECT COUNT(*) FROM user WHERE userMail = ?";
		    try {
		        pstmt = conn.prepareStatement(SQL);
		        pstmt.setString(1, userMail);
		        rs = pstmt.executeQuery();
		        if (rs.next()) {
		            int count = rs.getInt(1);
		            if (count > 0) {
		                return -1; // 중복된 이메일
		            } else {
		                return 1; // 사용 가능한 이메일
		            }
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return 0; // 데이터베이스 오류
		}
}














