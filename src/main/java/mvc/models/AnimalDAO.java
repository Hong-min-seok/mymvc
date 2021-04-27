package mvc.models;

import java.sql.SQLException;
import java.util.List;

public interface AnimalDAO {

	int getTotalRecord() throws SQLException;

	List<AnimalDTO> getAnimalList(int startrow, int endrow) throws SQLException;

	void addAnimal(AnimalDTO animalDTO) throws SQLException;

	AnimalDTO getAnimalDetail(int code) throws SQLException;

	void adoptComplete(int code) throws SQLException;

}
