package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class SaleDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getConn() {
		try {
			Context ctx = new InitialContext();
			Context ctxEnv = (Context)ctx.lookup("java:comp/env");
			DataSource ds = (DataSource)ctxEnv.lookup("jdbc/oracle");
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}  // getConn
	
	public ArrayList<SaleDTO> selectCar(){
		ArrayList<SaleDTO> list = new ArrayList<SaleDTO>();
		
		getConn();
		
		try {
			String sql = "select * from salecloth order by no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// 한 화면에 자동차 3 개만 보여주기 
			int count = 0;
			while(rs.next()) {
				SaleDTO dto = new SaleDTO();
				
				dto.setNo(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setCategory(rs.getInt(3));
				dto.setPrice(rs.getInt(4));
				dto.setCompany(rs.getString(5));
				dto.setImg(rs.getString(6));
				dto.setInfo(rs.getString(7));
				
				list.add(dto);
				count++;
				if(count >= 3) {
					break;
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return list;		
	}  // selectCar
public ArrayList<SaleDTO> selectCategoryCloth(int category){
		
		ArrayList<SaleDTO> list = new ArrayList<SaleDTO>();
		
		getConn();
		
		try {
			String sql = "select * from salecloth where category=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, category);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SaleDTO dto = new SaleDTO();
				
				dto.setNo(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setCategory(rs.getInt(3));
				dto.setPrice(rs.getInt(4));
				dto.setCompany(rs.getString(5));
				dto.setImg(rs.getString(6));
				dto.setInfo(rs.getString(7));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}  // selectCategoryCar

	
public ArrayList<SaleDTO> selectAllCloth(){
		
		ArrayList<SaleDTO> list = new ArrayList<SaleDTO>();
    getConn();
		
		try {
			String sql = "select * from salecloth";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SaleDTO dto = new SaleDTO();
				
				dto.setNo(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setCategory(rs.getInt(3));
				dto.setPrice(rs.getInt(4));
				dto.setCompany(rs.getString(5));
				dto.setImg(rs.getString(6));
				dto.setInfo(rs.getString(7));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
		
	}  // selectAllCloth
	

public SaleDTO selectOneCloth(int no){
	SaleDTO dto = new SaleDTO();
  getConn();
	
	try {
		String sql = "select * from salecloth where no=?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, no);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			
			dto.setNo(rs.getInt(1));
			dto.setName(rs.getString(2));
			dto.setCategory(rs.getInt(3));
			dto.setPrice(rs.getInt(4));
			dto.setCompany(rs.getString(5));
			dto.setImg(rs.getString(6));
			dto.setInfo(rs.getString(7));
			
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	return dto;	
}  // selectOneCloth

public int selectIdPw(String id, String pw) {
	// 0경우에는 해당되는 회원이 없음
	int result = 0;
	
	getConn();
	
	
	try {
		String sql = "select count(*) from member4 where id=? and pw=?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			result = rs.getInt(1);
		}
		
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	return result;
}  // selectIdPw

public void setOptionDto(OptionDTO2 opDto){
	
	getConn();
	
	
	try {
		String sql = "insert into optiondto2 values(purchaseno_seq.nextval,?,?,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, opDto.getId());
		pstmt.setInt(2, opDto.getNo());
		pstmt.setInt(3, opDto.getQuantity());
		pstmt.setString(4, opDto.getDeliverDate());
		pstmt.setInt(5, opDto.getDeliverFee());
		pstmt.setInt(6, opDto.getColor());
		pstmt.setInt(7, opDto.getSizeOpt());
		
		pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		 try {
		   if(pstmt != null) {pstmt.close();}
			 if(conn != null) {conn.close();}
	   } catch (SQLException e) {
			 e.printStackTrace();
		 }
	}
	
	
} // setOptionDto

public ArrayList<PurchaseListDTO> selectPurchaseListbyId(String id){
	
	ArrayList<PurchaseListDTO> list = new ArrayList<PurchaseListDTO>();
	
	getConn();
	
	
	try {
		String sql = "select * from salecloth natural join optiondto2 where id =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			PurchaseListDTO pcdto = new PurchaseListDTO();
			pcdto.setName(rs.getString(2));
			pcdto.setPrice(rs.getInt(4));
			pcdto.setImg(rs.getString(6));
			pcdto.setPurchaseno(rs.getInt(8));
			pcdto.setQuantity(rs.getInt(10));
			pcdto.setDeliverDate(rs.getString(11));
			pcdto.setDeliverFee(rs.getInt(12));
			pcdto.setColor(rs.getInt(13));
			pcdto.setSizeOpt(rs.getInt(14));
			
			list.add(pcdto);
			
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	return list;
	
}  // selectPurchaseListbyId

public void deleteReserve(int purchaseno) {
	getConn();
	try {
		String sql = "delete from optiondto2 where purchaseno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, purchaseno);
		pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}  // deleteReserve

public int selectPrice(String id) {
	getConn();
	int totalPrice = 0;
	try {
		String sql="select sum(price * quantity + (deliverfee*3000)) from salecloth natural join optiondto2 where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			totalPrice = rs.getInt(1);
		}
		
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	return totalPrice;
	
}







}
