package mvc.service;

import java.util.List;

import mvc.models.AnimalDTO;
import mvc.models.MemberDTO;

public interface PetmilyService {

	void joinMember(MemberDTO bean) throws Exception;

	int loginMember(String id, String password) throws Exception;

	int getTotalRecord() throws Exception;

	List<AnimalDTO> getAnimalList(int startRow, int endRow) throws Exception;

}
