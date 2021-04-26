package mvc.fx;

import java.util.HashMap;
import java.util.Map;

public class ModelAndView {
	
	private String path = null;
	private boolean isRedirect = false;
	private Map<String, Object> model = new HashMap<>();
	
	public ModelAndView() {}
	
	public ModelAndView(String path) {
		setPath(path);
	}
	
	public ModelAndView(String path, boolean isRedirect) {
		setPath(path);
		setRedirect(isRedirect);
	}
	
	public ModelAndView(String path, String key, Object value) {
		setPath(path);
		addObject(key, value);
	}
	
	public ModelAndView(String path, boolean isRedirect, String key, Object value) {
		setPath(path);
		setRedirect(isRedirect);
		addObject(key, value);
	}
	
	public boolean isRedirect(){
		return isRedirect;
	}
	
	public String getPath(){
		return path;
	}
	
	public void setRedirect(boolean b){
		isRedirect = b;
	}
	
	public void setPath(String string){
		path = string;
	}
	
	public Map<String, Object> getModel() {
		return model;
	}

	public void addObject(String key, Object value) {
		model.put(key, value);
	}
}