package portfolio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class mail_select {
	Connection con = null;
	PreparedStatement ps = null;
	String sql = "";
	m_dbinfo db = new m_dbinfo();
	
	// Resultset : buffered와 비슷한 기능
	ResultSet rs = null;
	ArrayList<String> data = null;	// 1개의 데이터를 가져올 때는 1차 배열 사용
	ArrayList<ArrayList<String>> alldata = null;	// 여러 개의 데이터를 가져올 때는 2차 배열 사용
	
	public ArrayList<ArrayList<String>> mail_list(){
		
		try {
			this.con = this.db.db_info();
			this.sql = "select midx,to_name,to_mail,subject,context,maildate"
					+ "(select count(*) from kr_mail as total"
					+ "from kr_mail order by midx desc limit 0,2";
			this.ps = this.con.prepareStatement(this.sql);
			this.rs = this.ps.executeQuery();
			
			this.alldata = new ArrayList<ArrayList<String>>();
			
			/*
			String sql2 = "select count(*) as total from kr_mail";
			this.ps = this.con.prepareStatement(sql2);
			ResultSet rs2 = this.ps.executeQuery();
			rs2.next();
			*/
			
			while(this.rs.next()) {
				this.data = new ArrayList<String>();
				this.data.add(this.rs.getString("midx"));
				this.data.add(this.rs.getString("to_name"));
				this.data.add(this.rs.getString("to_mail"));
				this.data.add(this.rs.getString("subject"));
				this.data.add(this.rs.getString("context"));
				this.data.add(this.rs.getString("maildate"));
				this.data.add(this.rs.getString("total"));
//				this.data.add(rs2.getString("total"));
				
				this.alldata.add(this.data);
			}
			
		} catch (Exception e) {
			this.alldata = null;
		}finally {
			try {
				this.ps.close();
				this.rs.close();
				this.con.close();
			} catch (Exception e2) {
				System.out.println("데이터베이스 오류 발생");
			}finally {
				
			}
		}
		
		return this.alldata;	// Controller한테 값 전달
	}
}
