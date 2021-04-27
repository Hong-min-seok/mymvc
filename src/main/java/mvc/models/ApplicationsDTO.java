package mvc.models;

import lombok.Data;

@Data
public class ApplicationsDTO {
	int    code;
	String member_id;
	String member_phone;
	String member_email;
	int animal_code;
	String animal_type;
	String animal_name;
	String content;
	String regdate;
}
