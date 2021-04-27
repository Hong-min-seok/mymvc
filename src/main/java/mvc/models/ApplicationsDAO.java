package mvc.models;

import java.sql.SQLException;
import java.util.List;

public interface ApplicationsDAO {

	void insertApplications(ApplicationsDTO applicationsDTO) throws SQLException;

	int getTotalApplicationsRecord() throws SQLException;

	List<ApplicationsDTO> getApplicationsList(int startRow, int endRow, int animal_code) throws SQLException;

	ApplicationsDTO getApplicationDetail(int code) throws SQLException;

}
