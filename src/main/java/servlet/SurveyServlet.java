package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;

import com.dao.SurveyEat;
import com.dao.SurveyEatDAO;
import com.dao.SurveyHealth;
import com.dao.SurveyHealthDAO;
import com.dao.User;
import com.dao.UserDAO;
import com.util.BeanUtil;

public class SurveyServlet extends HttpServlet {
	private static Logger logger = org.slf4j.LoggerFactory.getLogger(SurveyServlet.class);
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	
	public void doPost(HttpServletRequest req, HttpServletResponse response)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String type = req.getParameter("type");
		System.out.println("SurveySubmitServlet doPost : " + type + " " + req.getSession().getAttribute("user") + "  ; " + req.getParameter("nameZh"));
		if(type == null || type == "") return;
		User user = null;
		if( req.getSession().getAttribute("user") != null){
			 user = (User) req.getSession().getAttribute("user");
		}else{
			response.sendRedirect(req.getContextPath() + "/login.jsp");
			return;
		}
		
		if(type.equals("survey")){
			try {
				user = BeanUtil.getBean(req, User.class, user);
				UserDAO dao = new UserDAO();
				dao.update(user);
				logger.info("save user : " + user );
			} catch (Exception e) {
				response.sendRedirect(req.getContextPath() + "/survey.jsp?result=success");
				e.printStackTrace();
			}
			response.sendRedirect(req.getContextPath() + "/survey.jsp?result=error");
		}else if(type.equals("survey_eat")){
			try {
				user = BeanUtil.getBean(req, User.class, user);
				UserDAO dao = new UserDAO();
				dao.update(user);
				logger.info("save user : " + user );
			} catch (Exception e) {
				response.sendRedirect(req.getContextPath() + "/survey_eat.jsp?result=success");
				e.printStackTrace();
			}
			response.sendRedirect(req.getContextPath() + "/survey_eat.jsp?result=error");
		}else if(type.equals("survey_health")){
			try{
				SurveyHealthDAO dao = new SurveyHealthDAO();
				//SurveyHealth health = dao.findById(user.getId());
				SurveyHealth health = BeanUtil.getBeanForRadioPage2(req, SurveyHealth.class , null);
				health.setUid(user.getId());
				dao.saveOrUpdate(health);
				logger.info("save health : " + health );
			}catch (Exception e){
				response.sendRedirect(req.getContextPath() + "/survey_health.jsp?result=error");
			}
			response.sendRedirect(req.getContextPath() + "/survey_health.jsp?result=error");
		}else if(type.equals("survey_eat")){
			SurveyEatDAO dao = new SurveyEatDAO();
			SurveyEat eat = BeanUtil.getBeanNoNullStringFromRequest(req, SurveyEat.class, null);
			eat.setUid(user.getId());
			dao.saveOrUpdate(eat);
		}
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
	
	public static void main(String[] args) {
		
	}
}
