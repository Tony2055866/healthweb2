package servlet;

import com.dao.HibernateSessionFactory;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

/**
 * Created by Gaotong on 2015/2/12.
 */
public class InitServlet  extends HttpServlet {
    @Override
    public void init() throws ServletException {
        new Thread(){
            @Override
            public void run() {
                while (true){
                    Session session = HibernateSessionFactory.getSession();
                    SQLQuery query = session.createSQLQuery("select 1");
                    System.out.println("query.list():"+query.list());
                    session.close();
    
                    try {
                        Thread.sleep(3600 * 1000L);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
               
            }
        }.start();
    }
    
    
}
