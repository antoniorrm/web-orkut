package br.ufc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutorizaInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub

		String uri = request.getRequestURI();
		if(uri.endsWith("homelogin") || uri.endsWith("login") || 
				uri.endsWith("inserirUsuario") || uri.endsWith("inserirUsuarioFormulario")
				|| uri.endsWith("login.css") || uri.endsWith("logo.png"))
			return true;
		

		if(request.getSession().getAttribute("usuario_logado")!=null){
			return true;
		}
		response.sendRedirect("homelogin");
		return false;
	}
}
