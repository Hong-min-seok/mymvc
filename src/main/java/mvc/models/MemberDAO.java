package mvc.models;

import java.sql.SQLException;

public interface MemberDAO {

	void joinMember(MemberDTO bean) throws SQLException;

	int loginMember(String id, String password) throws SQLException;

}
