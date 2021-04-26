package mvc.fx;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AbstractController {
	
	public abstract ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response);
	
}
