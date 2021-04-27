package mvc.controllers.animal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.MoveAction;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;
import mvc.models.AnimalDTO;
import mvc.service.PetmilyService;
import mvc.service.PetmilyServiceImpl;

public class AnimalDetailController implements AbstractController{

	PetmilyService petmilyService = PetmilyServiceImpl.getInstance();
	
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		String code = request.getParameter("code");
		AnimalDTO animalDTO;
		
		try {
			animalDTO = petmilyService.getAnimalDetail(Integer.parseInt(code));
			mav.addObject("animalDTO", animalDTO);
			mav.setPath("/WEB-INF/views/animaldetail.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.setPath("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "동물 정보를 불러올 수 없습니다.");
			mav.addObject("url", "javascript:history.back()");
		}
		
		return mav;
	}

}
