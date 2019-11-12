package filter;

import domain.Researcher;
import services.LoginService;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "JspFilter")
public class JspFilter implements Filter {
	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
		String path = ((HttpServletRequest) req).getRequestURI();
		if(!(path.equals("/web/jsp/login/login.jsp") || path.equals("/web/login"))){
			if(checkCredentials(
					(HttpServletRequest)req,
					(HttpServletResponse) resp,
					((HttpServletRequest)req).getSession())){
				chain.doFilter(req, resp);
			}
		} else {
			chain.doFilter(req, resp);
		}
	}

	public void init(FilterConfig config) throws ServletException {

	}

	protected Boolean checkCredentials(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, ServletException {
		if(session.getAttribute("loggedResearcher") == null){
			response.sendRedirect("/web/login");
			return false;
		}
		
		Researcher loggedResearcher = (Researcher) session.getAttribute("loggedResearcher");

		if(loggedResearcher == null){
			response.sendRedirect("/web/login");
			return false;
		}

		Long researcherId = loggedResearcher.getId();
		if(researcherId == null){
			dispatchWithParams(request, response, "/web/login");
			return false;
		}

		LoginService loginService = new LoginService();
		if(!loginService.checkResearcherExists(researcherId)){
			dispatchWithParams(request, response, "/web/login");
			return false;
		}

		return true;
	}

	protected void dispatchWithParams(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
