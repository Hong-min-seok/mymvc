package mvc.controllers.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;
import mvc.service.PetmilyService;
import mvc.service.PetmilyServiceImpl;

public class LoginActionController implements AbstractController{
	
	PetmilyService petmilyService = PetmilyServiceImpl.getInstance();

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("input_id");
		String password = DigestUtils.sha3_512Hex(request.getParameter("input_pw"));
		
		try {
			int result = petmilyService.loginMember(id, password);
			mav.setPath("main");
			mav.setRedirect(true);
			HttpSession session = request.getSession();
			session.setAttribute("member_id", id);
		} catch (Exception e) {
			mav.setPath("/WEB-INF/views/result.jsp");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back()");
		}
		
		return mav;
		
	}

}
