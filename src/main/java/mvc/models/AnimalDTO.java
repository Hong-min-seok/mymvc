package mvc.models;

import java.util.Date;

import lombok.Data;

@Data
public class AnimalDTO {
	int 	code;
	String  name;
	String  type;
	String 	datetime;
	String  condition;
	int 	status;
	String  img;
	int     show_board;
}
