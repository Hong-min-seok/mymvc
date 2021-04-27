package mvc.controllers.animal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;
import mvc.models.ApplicationsDTO;
import mvc.service.PetmilyService;
import mvc.service.PetmilyServiceImpl;

public class ApplicationDetailController implements AbstractController {
	
	PetmilyService petmilyService = PetmilyServiceImpl.getInstance();

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		
		int code = Integer.parseInt(request.getParameter("code"));
		ModelAndView mav = new ModelAndView();
		
		ApplicationsDTO applicationDTO;
		
		try {
			applicationDTO = petmilyService.getApplicationDetail(code);
			mav.setPath("/WEB-INF/views/applicationDetail.jsp");
			mav.addObject("applicationDTO", applicationDTO);
		} catch (Exception e) {
			e.printStackTrace();
			mav.setPath("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "신청서를 불러오지 못하였습니다.");
			mav.addObject("url", "javascript:history.back()");
		}
		
		return mav;
	}

}
