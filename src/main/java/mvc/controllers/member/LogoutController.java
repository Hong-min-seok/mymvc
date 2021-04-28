package mvc.controllers.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;

public class LogoutController implements AbstractController{

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		mav.setPath("/WEB-INF/views/result.jsp");
		mav.addObject("msg", "로그아웃되었습니다.");
		mav.addObject("url", "main");
		return mav;
	}

}
