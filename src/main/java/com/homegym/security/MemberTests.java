//package com.homegym.security;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//
//import javax.sql.DataSource;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import lombok.Setter;
//import lombok.extern.log4j.Log4j;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration({
//	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
//	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
//})
//@Log4j
//public class MemberTests {
//	
//	@Setter(onMethod_ = @Autowired)
//	private PasswordEncoder pwencoder;
//	
//	@Setter(onMethod_ = @Autowired)
//	private DataSource ds;
//	
//	@Test
//	public void testInsertMember() {
//		String sql = "insert into member(m_id, memberId, password, name, nickname, phone, zip_code, address, image, birth, gender, enabled) values (?,?,?,?,?,?,?,?,?,?,?,?)";
//		
//		for(int i=1; i <= 10; i++) {
//			Connection con = null;
//			PreparedStatement pstmt = null;
//			
//			try {
//				con = ds.getConnection();
//				pstmt = con.prepareStatement(sql);
//				
//				pstmt.setString(3, pwencoder.encode("pw"+i));
//				
//				if (i<8) {
//					pstmt.setInt(1, i);
//					pstmt.setString(2, "member"+i);
//					pstmt.setString(4, "회원"+i);
//					pstmt.setString(5, "회원"+i);
//					pstmt.setString(6, "010-1111-"+i);
//					pstmt.setString(7, "1111"+i);
//					pstmt.setString(8, "강남구"+i);
//					pstmt.setString(9, null);
//					pstmt.setString(10, "2020-"+i);
//					pstmt.setString(11, "성별");
//					pstmt.setString(12, "1");
//				} else {
//					pstmt.setInt(1, i);
//					pstmt.setString(2, "admin"+i);
//					pstmt.setString(4, "관리자"+i);
//					pstmt.setString(5, "관리자"+i);
//					pstmt.setString(6, "010-1111-"+i);
//					pstmt.setString(7, "1111"+i);
//					pstmt.setString(8, "광진구"+i);
//					pstmt.setString(9, null);
//					pstmt.setString(10, "2020-"+i);
//					pstmt.setString(11, "성별");
//					pstmt.setString(12, "1");
//				}
//				
//				pstmt.executeUpdate();
//			} catch(Exception e) {
//				e.printStackTrace();
//			} finally {
//				if(pstmt != null) { try {pstmt.close(); } catch(Exception e) {} }
//				if(con != null) { try {con.close(); } catch(Exception e) {} }
//			}
//		} //end for
//	}
//		
//		@Test
//		public void testInsertAuth() {
//			String sql = "insert into member_auth(m_id, memberId, auth) values (?,?,?)";
//			
//			for(int i=1; i <= 10; i++) {
//				Connection con = null;
//				PreparedStatement pstmt = null;
//				
//				try {
//					con = ds.getConnection();
//					pstmt = con.prepareStatement(sql);
//					
//					if (i<8) {
//						pstmt.setInt(1, i);
//						pstmt.setString(2, "member"+i);
//						pstmt.setString(3, "ROLE_MEMBER");
//	
//					} else {
//						pstmt.setInt(1, i);
//						pstmt.setString(2, "admin"+i);
//						pstmt.setString(3, "ROLE_ADMIN");
//					}
//					
//					pstmt.executeUpdate();
//				} catch(Exception e) {
//					e.printStackTrace();
//				} finally {
//					if(pstmt != null) { try {pstmt.close(); } catch(Exception e) {} }
//					if(con != null) { try {con.close(); } catch(Exception e) {} }
//				}
//			} //end for
//		
//	}
//}
