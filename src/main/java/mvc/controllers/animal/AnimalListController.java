package mvc.controllers.animal;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;
import mvc.models.AnimalDTO;
import mvc.service.PetmilyService;
import mvc.service.PetmilyServiceImpl;

public class AnimalListController implements AbstractController{

	PetmilyService petmilyService = PetmilyServiceImpl.getInstance();
	
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		int page = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
		int pageSize = 10;
		int totalData = 0;
		int totalPage = 0;
		int pageLen = 5;
		
		int currentBlock = (page % pageLen == 0) ? page / pageLen : (page / pageLen) + 1;
		
		int startPage = (currentBlock - 1) * pageLen + 1;
		int endPage = startPage + pageLen - 1;
		
		int startRow = ((page - 1) * pageSize) + 1;
		int endRow = (page * pageSize);
		
		List<AnimalDTO> animalList;
		
		try {
			totalData = petmilyService.getTotalRecord();
			totalPage = (totalData % pageSize == 0) ? totalData / pageSize : (totalData / pageSize) + 1;
			
			animalList = petmilyService.getAnimalList(startRow, endRow);
			
			mav.setPath("/WEB-INF/views/animallist.jsp");
			mav.addObject("animalList", animalList);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}

}
