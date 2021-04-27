package mvc.controllers.animal;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;
import mvc.models.AnimalDTO;
import mvc.service.PetmilyService;
import mvc.service.PetmilyServiceImpl;
import oracle.sql.DATE;

public class AddAnimalActionController implements AbstractController {
	
	PetmilyService petmilyService = PetmilyServiceImpl.getInstance();

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		AnimalDTO animalDTO = new AnimalDTO();
		
		String encoding = "utf-8";
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//File uploadPath = new File(request.getRealPath("/"), "upload");
		File uploadPath = new File("C:\\myCode\\KOSA\\WebExam\\mymvc\\src\\main\\webapp\\img", "upload");
		
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(uploadPath); // 파일 경로 설정
		factory.setSizeThreshold(1024 * 1024 * 1024); // 최대 업로드 가능한 파일 크기 설정

		ServletFileUpload upload = new ServletFileUpload(factory);
		
		try {
			List items = upload.parseRequest(request); //request 객체에서 매개변수를 list로 가져옴
			
			for (int i = 0; i < items.size(); i++) {
				
				FileItem fileItem = (FileItem) items.get(i); //업로드된 항목들을 하나씩 가져온다

				if (fileItem.isFormField()) { // 폼필드이면 전송된 매개변수 값을 출력
					
					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
					
					switch(fileItem.getFieldName()) {
					case("name"):
						animalDTO.setName(fileItem.getString(encoding));
						break;
					case("type"):
						animalDTO.setType(fileItem.getString(encoding));
						break;
					case("datetime"):
						animalDTO.setDatetime(fileItem.getString(encoding));
						break;
					case("condition"):
						animalDTO.setCondition(fileItem.getString(encoding));
						break;
					}
					
					
				
				} else { //파일이면
					
					System.out.println("파라미터명:" + fileItem.getFieldName());
					System.out.println("파일명:" + fileItem.getName());
					System.out.println("파일크기:" + fileItem.getSize() + "bytes");
					
					animalDTO.setImg(fileItem.getName());

					if (fileItem.getSize() > 0) {
						
						int idx = fileItem.getName().lastIndexOf("\\");
						
						if (idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}
						
						String fileName = fileItem.getName().substring(idx + 1);
						File uploadFile = new File(uploadPath + "\\" + fileName);
						fileItem.write(uploadFile);
						
					}
				}
			}
			
			petmilyService.addAnimal(animalDTO);
			mav.setPath("animalList?page=1");
			mav.setRedirect(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.setPath("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "동물 등록에 실패하였습니다");
			mav.addObject("url", "javascript:history.back()");
		}
		
	return mav;	

	}

}
