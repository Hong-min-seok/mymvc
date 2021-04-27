package mvc.controllers.animal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;
import mvc.models.ApplicationsDTO;
import mvc.service.PetmilyService;
import mvc.service.PetmilyServiceImpl;

public class AdoptActionController implements AbstractController{

	PetmilyService petmilyService = PetmilyServiceImpl.getInstance();
	
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		ApplicationsDTO applicationsDTO = new ApplicationsDTO();
		
		applicationsDTO.setMember_id(request.getParameter("member_id"));
		applicationsDTO.setMember_phone(request.getParameter("member_phone"));
		applicationsDTO.setMember_email(request.getParameter("member_email"));
		applicationsDTO.setAnimal_code(Integer.parseInt(request.getParameter("animal_code")));
		applicationsDTO.setAnimal_name(request.getParameter("animal_name"));
		applicationsDTO.setAnimal_type(request.getParameter("animal_type"));
		applicationsDTO.setContent(request.getParameter("adopt_content"));
		
		try {
			petmilyService.insertApplications(applicationsDTO);
			mav.setPath("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "신청서가 접수되었습니다.");
			mav.addObject("url", "animalList?page=1");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setPath("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "신청서 등록에 실패하였습니다");
			mav.addObject("url", "javascript:history.back()");
		}
		return mav;
	}

}
