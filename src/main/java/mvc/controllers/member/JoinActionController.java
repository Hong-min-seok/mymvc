package mvc.controllers.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;
import mvc.models.MemberDTO;
import mvc.service.PetmilyService;
import mvc.service.PetmilyServiceImpl;

public class JoinActionController implements AbstractController {

	private PetmilyService petmilyService = PetmilyServiceImpl.getInstance();

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("input_id");
		String pw = request.getParameter("input_pw");
		String name = request.getParameter("input_name");
		String phone = request.getParameter("input_phone");
		String email = request.getParameter("input_email");

		MemberDTO bean = new MemberDTO();
		bean.setId(id);
		bean.setPassword(pw);
		bean.setName(name);
		bean.setPhone(phone);
		bean.setEmail(email);

		ModelAndView mav = new ModelAndView();

		try {
			petmilyService.joinMember(bean);
			mav.setPath("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "회원가입되었습니다!");
			mav.addObject("url", "login");
		} catch (Exception e) {
			mav.setPath("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "회원가입에 실패하였습니다");
			mav.addObject("url", "javascript:history.back()");
		}
		
		return mav;
	}

}
