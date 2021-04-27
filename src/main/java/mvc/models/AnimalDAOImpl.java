package mvc.models;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLType;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.pool2.impl.CallStack;

import jdk.internal.org.objectweb.asm.Type;
import oracle.jdbc.OracleTypes;

public class AnimalDAOImpl implements AnimalDAO {
	
	/** 커넥션풀링 싱글톤으로 만들기 **********************************************/
	private DataSource dataSource;

	private static final AnimalDAO AnimalDAO = new AnimalDAOImpl();

	public static AnimalDAO getInstance() {
		return AnimalDAO;
	}

	private AnimalDAOImpl() {
		try {
			Context ctx = new InitialContext();

			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/mymvc");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("AnimalDAO 생성자에서 에러");
		}
	}
	/*******************************************************************************/

	@Override
	public int getTotalRecord() throws SQLException {
		
		String runSP = "{? = call animalTotalRecord }";
		
		try(Connection conn = dataSource.getConnection();
			CallableStatement cstmt = conn.prepareCall(runSP)) {
			
			cstmt.registerOutParameter(1, Types.INTEGER);
			cstmt.executeUpdate();
			
			return (int) cstmt.getInt(1);
		}
	}

	@Override
	public List<AnimalDTO> getAnimalList(int startrow, int endrow) throws SQLException {
		
		AnimalDTO bean;
		List<AnimalDTO> list = new ArrayList<AnimalDTO>();
		String runSP = "{call getAnimalList(?,?,?)}";
		
		try(Connection conn = dataSource.getConnection();
			CallableStatement cstmt = conn.prepareCall(runSP)) {
			
			cstmt.setInt(1, startrow);
			cstmt.setInt(2, endrow);
			cstmt.registerOutParameter(3, OracleTypes.CURSOR);
			
			cstmt.execute();
			
			try(ResultSet rs = (ResultSet) cstmt.getObject(3)) {
				while(rs.next()) {
					bean = new AnimalDTO();
					bean.setCode(rs.getInt("code"));
					bean.setName(rs.getString("name"));
					bean.setType(rs.getString("type"));
					bean.setDatetime(rs.getString("datetime"));
					bean.setCondition(rs.getString("condition"));
					bean.setStatus(rs.getInt("status"));
					bean.setImg(rs.getString("img"));
					bean.setShow_board(rs.getInt("show_board"));
					list.add(bean);
				}
			}
		}
		return list;
	}

	@Override
	public void addAnimal(AnimalDTO animalDTO) throws SQLException {
		
		String runSp = "{call animalInsert(?,?,?,?,?)}";
		
		try(Connection conn = dataSource.getConnection();
			CallableStatement cstmt = conn.prepareCall(runSp)) {
			
			cstmt.setString(1, animalDTO.getName());
			cstmt.setString(2, animalDTO.getType());
			cstmt.setString(3, animalDTO.getDatetime());
			cstmt.setString(4, animalDTO.getCondition());
			cstmt.setString(5, animalDTO.getImg());
			
			cstmt.executeUpdate();
		}
		
	}

	@Override
	public AnimalDTO getAnimalDetail(int code) throws SQLException {
		
		AnimalDTO animalDTO = new AnimalDTO();
		String runSp = "{call getAnimalDetail(?,?,?,?,?)}";
		
		try(Connection conn = dataSource.getConnection();
			CallableStatement cstmt = conn.prepareCall(runSp)) {
			
			cstmt.setInt(1, code);
			cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(4, java.sql.Types.DATE);
			cstmt.registerOutParameter(5, java.sql.Types.VARCHAR);
			
			cstmt.executeUpdate();
			
			animalDTO.setCode(code);
			animalDTO.setName(cstmt.getString(2));
			animalDTO.setType(cstmt.getString(3));
			animalDTO.setDatetime(cstmt.getString(4));
			animalDTO.setImg(cstmt.getString(5));
			
		}
		return animalDTO;
	}

	@Override
	public void adoptComplete(int code) throws SQLException {
		
		String runSp = "{call adoptComplete(?)}";
		
		try(Connection conn = dataSource.getConnection();
			CallableStatement cstmt = conn.prepareCall(runSp)) {
			
			cstmt.setInt(1, code);
			
			cstmt.executeUpdate();
		}
	}

}
