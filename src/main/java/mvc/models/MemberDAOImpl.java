package mvc.models;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAOImpl implements MemberDAO {

	/** 커넥션풀링 싱글톤으로 만들기 **********************************************/
	private DataSource dataSource;

	private static final MemberDAO MemberDAO = new MemberDAOImpl();

	public static MemberDAO getInstance() {
		return MemberDAO;
	}

	private MemberDAOImpl() {
		try {
			Context ctx = new InitialContext();

			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/mymvc");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MEMBERDAO 생성자에서 에러");
		}
	}
	/*******************************************************************************/

	@Override
	public void joinMember(MemberDTO bean) throws SQLException {
		
		String runSp = "{call joinmember(?,?,?,?,?)}";
		
		try(Connection conn = dataSource.getConnection();
			CallableStatement cstmt = conn.prepareCall(runSp)) {
			
			cstmt.setString(1, bean.getId());
			cstmt.setString(2, bean.getPassword());
			cstmt.setString(3, bean.getName());
			cstmt.setString(4, bean.getPhone());
			cstmt.setString(5, bean.getEmail());
			
			cstmt.executeUpdate();
			System.out.println("MemberDAOImpl : joinMember() Success");
		}
	}

	@Override
	public int loginMember(String id, String password) throws SQLException {

		String runSp = "{? = call loginmember(?,?)}";
		
		try(Connection conn = dataSource.getConnection();
			CallableStatement cstmt = conn.prepareCall(runSp)) {
			
			cstmt.registerOutParameter(1, Types.INTEGER);
			cstmt.setString(2, id);
			cstmt.setString(3, password);
			
			cstmt.executeUpdate();
			return (int) cstmt.getInt(1);
		}
	}

	@Override
	public MemberDTO getMemberDetail(String memberId) throws SQLException {

		String runSp = "{call getMemberDetail(?,?,?,?)}";
		MemberDTO memberDTO;
		
		try(Connection conn = dataSource.getConnection();
			CallableStatement cstmt = conn.prepareCall(runSp)) {
			
			cstmt.setString(1, memberId);
			cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
			
			cstmt.executeUpdate();
			
			memberDTO = new MemberDTO();
			
			memberDTO.setId(memberId);
			memberDTO.setName(cstmt.getString(2));
			memberDTO.setPhone(cstmt.getString(3));
			memberDTO.setEmail(cstmt.getString(4));
			
		}
		return memberDTO;
	}

}
