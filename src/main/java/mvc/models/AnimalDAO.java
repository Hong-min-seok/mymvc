package mvc.models;

import java.sql.SQLException;
import java.util.List;

public interface AnimalDAO {

	int getTotalRecord() throws SQLException;

	List<AnimalDTO> getAnimalList(int startrow, int endrow) throws SQLException;

}
