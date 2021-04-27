package mvc.controllers.animal;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;
import mvc.models.ApplicationsDTO;
import mvc.service.PetmilyService;
import mvc.service.PetmilyServiceImpl;

public class ApplicationListController implements AbstractController{

	PetmilyService petmilyService = PetmilyServiceImpl.getInstance();
	
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		int animal_code = Integer.parseInt(request.getParameter("code"));
		
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
		
		
		List<ApplicationsDTO> applicationsList;
		
		try {
			totalData = petmilyService.getTotalApplicationsRecord();
			totalPage = (totalData % pageSize == 0) ? totalData / pageSize : (totalData / pageSize) + 1;
			
			if(endPage > totalPage) endPage = totalPage;
			
			applicationsList = petmilyService.getApplicationsList(startRow, endRow, animal_code);
			
			mav.setPath("/WEB-INF/views/applicationslist.jsp");
			mav.addObject("applicationsList", applicationsList);
			mav.addObject("page", page);
			mav.addObject("startPage", startPage);
			mav.addObject("endPage", endPage);
			mav.addObject("totalPage", totalPage);
			mav.addObject("animal_code", animal_code);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}

}
