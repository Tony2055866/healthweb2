package servlet;

import com.dao.HibernateSessionFactory;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
                Logger logger = LoggerFactory.getLogger(this.getClass());

                while (true){
                    Session session = HibernateSessionFactory.getSession();
                    SQLQuery query = session.createSQLQuery("select 1");
                    logger.info("query.list():"+query.list());
                    session.close();
                    try {
                        Thread.sleep(120 * 1000L);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
               
            }
        }.start();
    }
    
    
}
