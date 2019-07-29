package com.uni.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
  "file:src/main/webapp/WEB-INF/spring/security-context.xml"
  })
@Log4j
public class MemberTests {

  @Autowired
  private PasswordEncoder pwencoder;
  
  @Autowired
  private DataSource ds;
  
  @Test
  public void testInsertMember() {

    String sql = "insert into uni_member(mno, userid, userpw, name, phone, email) values (?,?,?,?,?,?)";
     
      Connection con = null;
      PreparedStatement pstmt = null;
      
      try {
        con = ds.getConnection();
        pstmt = con.prepareStatement(sql);
        
        pstmt.setInt(1, 1);
        pstmt.setString(2, "admin");
        pstmt.setString(3, pwencoder.encode("admin"));
        pstmt.setString(4, "관리자");
        pstmt.setString(5, "01091926062");
        pstmt.setString(6, "admin@admin.com");
        
        pstmt.executeUpdate();
        
      }catch(Exception e) {
        e.printStackTrace();
      }finally {
        if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
        if(con != null) { try { con.close();  } catch(Exception e) {} }
        
      }
  }
  
}


