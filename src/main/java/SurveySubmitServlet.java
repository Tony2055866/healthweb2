import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.User;
import com.dao.UserDAO;
import com.util.BeanUtil;


public class SurveySubmitServlet extends HttpServlet {
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		System.out.println(this.getClass() + ": init");
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String type = req.getParameter("type");
		System.out.println("SurveySubmitServlet doPost : " + type + " " + req.getSession().getAttribute("user"));
		if(type == null || type == "") return;
		User user = null;
		if( req.getSession().getAttribute("user") != null){
			 user = (User) req.getSession().getAttribute("user");
		}else{
			return;
		}
		
		
		
		if(type.equals("survey_user")){
			user = BeanUtil.getBean(req, User.class, user);
			UserDAO dao = new UserDAO();
			dao.update(user);
			System.out.println("save user : " + user + "  ; " + user);
		}else if(type.equals("survey_eat")){
			
		}
		
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {

		super.doGet(req, resp);
		System.out.println(this.getClass() + ": doGet");

	}
	
}
