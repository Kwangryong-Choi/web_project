package portfolio;

import java.sql.Connection;
import java.sql.DriverManager;


// 데이터베이스를 사용하기 위해서는 해당 프로젝트에서 DB 버전에 맞는 라이브러리를 설정해야 함
 
public class m_dbinfo {
	
	public static Connection db_info(){
		String db = "com.mysql.jdbc.Driver";					// DB 사용 라이브러리 이름 (드라이버)
		String db_url = "jdbc:mysql://kbsn.or.kr:3306/bluedb";	// DB 접속 경로 (url)
		String db_user = "memebera";							// DB 접속 아이디
		String db_password = "a123456";							// DB 접속 패스워드

		Connection con = null;
		try {
			Class.forName(db);
			con = DriverManager.getConnection(db_url,db_user,db_password);
//			System.out.println(con);
		} catch (Exception e) {
			System.out.println("Database 연결 실패");
		}finally {
			
		}
		return con;
		
	}
}
