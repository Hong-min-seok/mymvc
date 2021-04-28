package mvc.service;

import java.util.List;

import mvc.models.AnimalDTO;
import mvc.models.ApplicationsDTO;
import mvc.models.MemberDTO;

public interface PetmilyService {

	void joinMember(MemberDTO bean) throws Exception;

	int loginMember(String id, String password) throws Exception;

	int getTotalRecord() throws Exception;

	List<AnimalDTO> getAnimalList(int startRow, int endRow) throws Exception;

	void addAnimal(AnimalDTO animalDTO) throws Exception;

	AnimalDTO getAnimalDetail(int code) throws Exception;

	MemberDTO getMemberDetail(String memberId) throws Exception;

	void insertApplications(ApplicationsDTO applicationsDTO) throws Exception;

	int getTotalApplicationsRecord(int animal_code) throws Exception;

	List<ApplicationsDTO> getApplicationsList(int startRow, int endRow, int animal_code) throws Exception;

	ApplicationsDTO getApplicationDetail(int code) throws Exception;

	void adoptComplete(int code) throws Exception;

}
