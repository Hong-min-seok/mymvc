package mvc.controllers.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;

public class LoginController implements AbstractController{

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("LoginController 접근");
		return new ModelAndView("/WEB-INF/views/login.jsp");
	}

}
