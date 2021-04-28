package mvc.models;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import oracle.jdbc.OracleTypes;

public class ApplicationsDAOImpl implements ApplicationsDAO {

	/** 커넥션풀링 싱글톤으로 만들기 **********************************************/
	private DataSource dataSource;

	private static final ApplicationsDAO ApplicationsDAO = new ApplicationsDAOImpl();

	public static ApplicationsDAO getInstance() {
		return ApplicationsDAO;
	}

	private ApplicationsDAOImpl() {
		try {
			Context ctx = new InitialContext();

			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/mymvc");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ApplicationsDAO 생성자에서 에러");
		}
	}

	/*******************************************************************************/

	@Override
	public void insertApplications(ApplicationsDTO applicationsDTO) throws SQLException {

		String runSp = "{call insertApplications(?,?,?,?,?,?,?)}";

		try (Connection conn = dataSource.getConnection(); CallableStatement cstmt = conn.prepareCall(runSp)) {

			cstmt.setString(1, applicationsDTO.getMember_id());
			cstmt.setString(2, applicationsDTO.getMember_phone());
			cstmt.setString(3, applicationsDTO.getMember_email());
			cstmt.setInt(4, applicationsDTO.getAnimal_code());
			cstmt.setString(5, applicationsDTO.getAnimal_type());
			cstmt.setString(6, applicationsDTO.getAnimal_name());
			cstmt.setString(7, applicationsDTO.getContent());

			cstmt.executeUpdate();
		}

	}

	@Override
	public int getTotalApplicationsRecord(int animal_code) throws SQLException {
		String runSP = "{? = call applicationTotalRecord(?) }";

		try (Connection conn = dataSource.getConnection(); CallableStatement cstmt = conn.prepareCall(runSP)) {

			cstmt.registerOutParameter(1, Types.INTEGER);
			cstmt.setInt(2, animal_code);
			cstmt.executeUpdate();

			return (int) cstmt.getInt(1);
		}
	}

	@Override
	public List<ApplicationsDTO> getApplicationsList(int startRow, int endRow, int animal_code) throws SQLException {
		ApplicationsDTO bean;
		List<ApplicationsDTO> list = new ArrayList<ApplicationsDTO>();
		String runSP = "{call getApplicationList(?,?,?,?)}";
		
		try(Connection conn = dataSource.getConnection();
			CallableStatement cstmt = conn.prepareCall(runSP)) {
			
			cstmt.setInt(1, startRow);
			cstmt.setInt(2, endRow);
			cstmt.registerOutParameter(3, OracleTypes.CURSOR);
			cstmt.setInt(4, animal_code);
			
			cstmt.execute();
			
			try(ResultSet rs = (ResultSet) cstmt.getObject(3)) {
				while(rs.next()) {
					bean = new ApplicationsDTO();
					bean.setCode(rs.getInt("code"));
					bean.setMember_id(rs.getString("member_id"));
					bean.setMember_phone(rs.getString("member_phone"));
					bean.setMember_email(rs.getString("member_email"));
					bean.setAnimal_type(rs.getString("animal_type"));
					bean.setAnimal_name(rs.getString("animal_name"));
					bean.setContent(rs.getString("content"));
					bean.setRegdate(rs.getString("regdate"));
					list.add(bean);
				}
			}
		}
		return list;
	}

	@Override
	public ApplicationsDTO getApplicationDetail(int code) throws SQLException {
		
		ApplicationsDTO applicationsDTO = new ApplicationsDTO();
		
		String runSp = "{call getApplicationDetail(?,?,?,?,?,?,?,?,?)}";
		
		try(Connection conn = dataSource.getConnection();
			CallableStatement cstmt = conn.prepareCall(runSp)) {
			
			cstmt.setInt(1, code);
			cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(5, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(6, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(7, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(8, java.sql.Types.INTEGER);
			cstmt.registerOutParameter(9, java.sql.Types.DATE);
			
			
			cstmt.executeUpdate();
			
			applicationsDTO.setCode(code);
			applicationsDTO.setMember_id(cstmt.getString(2));
			applicationsDTO.setMember_phone(cstmt.getString(3));
			applicationsDTO.setMember_email(cstmt.getString(4));
			applicationsDTO.setAnimal_type(cstmt.getString(5));
			applicationsDTO.setAnimal_name(cstmt.getString(6));
			applicationsDTO.setContent(cstmt.getString(7));
			applicationsDTO.setAnimal_code(cstmt.getInt(8));
			applicationsDTO.setRegdate(cstmt.getString(9));
			
		}
		return applicationsDTO;
	}
}
