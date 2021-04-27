package mvc.controllers.animal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;
import mvc.service.PetmilyService;
import mvc.service.PetmilyServiceImpl;

public class AdoptCompleteController implements AbstractController {
	
	PetmilyService petmilyService = PetmilyServiceImpl.getInstance();

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		int code = Integer.parseInt(request.getParameter("animal_code"));
		
		try {
			petmilyService.adoptComplete(code);
			mav.setPath("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "분양이 완료되었습니다.");
			mav.addObject("url", "animalList?page=1");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setPath("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "분양 절차가 비정상적으로 종료되었습니다.");
			mav.addObject("url", "javascript:history.back()");
		}
		
		return mav;
	}

}
