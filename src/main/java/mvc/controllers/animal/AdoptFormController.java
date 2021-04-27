package mvc.controllers.animal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;
import mvc.models.AnimalDTO;
import mvc.models.MemberDTO;
import mvc.service.PetmilyService;
import mvc.service.PetmilyServiceImpl;

public class AdoptFormController implements AbstractController{

	PetmilyService petmilyService = PetmilyServiceImpl.getInstance();
	
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		int animalCode = Integer.parseInt(request.getParameter("code"));
		String memberId = (String) session.getAttribute("member_id");
		ModelAndView mav = new ModelAndView();
		AnimalDTO animalDTO;
		MemberDTO memberDTO;
		
		try {
			animalDTO = petmilyService.getAnimalDetail(animalCode);
			memberDTO = petmilyService.getMemberDetail(memberId);
			mav.setPath("/WEB-INF/views/adoptform.jsp");
			mav.addObject("animalDTO", animalDTO);
			mav.addObject("memberDTO", memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
			mav.setPath("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "동물 정보를 불러올 수 없습니다.");
			mav.addObject("url", "javascript:history.back()");
		}
		
		
		return mav;
	}

}
