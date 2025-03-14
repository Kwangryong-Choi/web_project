package portfolio;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class mail_del extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
		Connection con = null;
		PreparedStatement ps = null;
		String sql = null;
		int result = 0;
		m_dbinfo db = new m_dbinfo();
		PrintWriter pw = null;
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		this.pw = response.getWriter();
		try {
			String mdix = request.getParameter("midx");
			this.con = this.db.db_info();
			this.sql = "delete from kr_mail where midx=?";
			this.ps = this.con.prepareStatement(this.sql);
			this.ps.setString(1, mdix);
			this.result = this.ps.executeUpdate();
			if(result > 0) {
				this.pw.print("<script>"
						+ "alert('해당 게시물을 정상적으로 삭제하였습니다.');"
						+ "location.href='./mail_list.do';"
						+ "</script>");
			}
			
		} catch (Exception e) {
			this.pw.print("<script>"
					+ "alert('데이터 삭제 부분에 문제가 발생하였습니다.');"
					+ "location.href='./mail_list.do';"
					+ "</script>");
		}finally {
			try {
				this.ps.close();
				this.con.close();
				this.pw.close();
			} catch (Exception e2) {
				System.out.println("");
			}finally {
				
			}
		}
	}
}
