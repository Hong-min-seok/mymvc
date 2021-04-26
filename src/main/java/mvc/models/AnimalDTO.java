package mvc.models;

import java.sql.Date;

import lombok.Data;

@Data
public class AnimalDTO {
	int 	code;
	String  name;
	String  type;
	Date 	datetime;
	String  condition;
	int 	status;
	String  img;
	int     show_board;
}
