package mvc.models;

import org.apache.commons.codec.digest.DigestUtils;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDTO {
	int code;
	String id;
	String phone;
	String email;
	String password;
	String name;

	public void setPassword(String password) {
		this.password = DigestUtils.sha3_512Hex(password);
	}

}