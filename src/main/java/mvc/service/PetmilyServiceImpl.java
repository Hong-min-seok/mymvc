package mvc.service;

import java.util.List;

import mvc.models.AnimalDAO;
import mvc.models.AnimalDAOImpl;
import mvc.models.AnimalDTO;
import mvc.models.MemberDAO;
import mvc.models.MemberDAOImpl;
import mvc.models.MemberDTO;

public class PetmilyServiceImpl implements PetmilyService {

	private PetmilyServiceImpl() {
	}

	private static final PetmilyServiceImpl PetmilyService = new PetmilyServiceImpl();

	public static PetmilyServiceImpl getInstance() {
		return PetmilyService;
	}

	private MemberDAO memberDAO = MemberDAOImpl.getInstance();
	private AnimalDAO animalDAO = AnimalDAOImpl.getInstance();
	
	@Override
	public void joinMember(MemberDTO bean) throws Exception {
		memberDAO.joinMember(bean);
	}

	@Override
	public int loginMember(String id, String password) throws Exception {
		int result = memberDAO.loginMember(id, password);
		if (result == 0) throw new RuntimeException("아이디 또는 비밀번호가 잘못되었습니다.");
		return result;
	}

	@Override
	public int getTotalRecord() throws Exception {
		return animalDAO.getTotalRecord();
	}

	@Override
	public List<AnimalDTO> getAnimalList(int startrow, int endrow) throws Exception {
		return animalDAO.getAnimalList(startrow, endrow);
	}


}
