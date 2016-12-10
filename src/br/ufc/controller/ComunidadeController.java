package br.ufc.controller;


import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import br.ufc.interfaces.ICategoriaDAO;
import br.ufc.interfaces.IComunidadeDAO;
import br.ufc.model.Categoria;
import br.ufc.model.Comunidade;
import br.ufc.model.Forum;
import br.ufc.model.Usuario;
import br.ufc.util.AulaFileUtil;

@Transactional
@Controller
public class ComunidadeController {
	@Autowired
	@Qualifier(value = "comunidadeDAOHibernate")
	private IComunidadeDAO comunidadeDAO;
	
	@Autowired
	@Qualifier(value = "categoriaDAOHibernate")
	private ICategoriaDAO categoriaDAO;
	
	@Autowired
	private ServletContext context;
	
	@RequestMapping("/comunidades")
	public String comunidade(HttpSession session, Model model) {
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		Set<Comunidade> comunidades= usuario.getComunidades();
		String cvaziahtml = "<tr><td><p class='text-empty'>Nenhuma comunidade encontrada.</p></td><td></td><td></td></tr>"; 
		if (comunidades.isEmpty()) {
			model.addAttribute("html", cvaziahtml);
		}
		model.addAttribute("comunidades", comunidades);
		model.addAttribute("usuario", usuario);
		return "comunidade/listar_comunidades";
	}
	
	@RequestMapping("/addComunidadeFormulario")
	public String addComunidadeFormulario(HttpSession session, Model model) {
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		List<Categoria> categorias= categoriaDAO.listar();
		model.addAttribute("categorias", categorias);
		model.addAttribute("usuario", usuario);
		return "comunidade/add_comunidade";
	}

	
	@RequestMapping("/addComunidade")
	public String addComunidade(HttpSession session, Long id, Comunidade comunidade,
			@RequestParam(value = "image", required = false) MultipartFile image) {
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		if (image != null && !image.isEmpty()) {
			String path = context.getRealPath("/");
			path += "resources/images/" + image.getOriginalFilename();
			AulaFileUtil.saveFile(path, image);
		}	
		Categoria categoria = categoriaDAO.recuperar(id);
		comunidade.setCategoria(categoria);
		comunidade.setImagem(image.getOriginalFilename());
		//Comunidade
		Set<Usuario> usuarios = new HashSet<Usuario>();
		usuarios.add(usuario);
		Set<Forum> foruns = new HashSet<Forum>();
		comunidade.setUsuarios(usuarios);
		comunidade.setForuns(foruns);
		comunidadeDAO.add(comunidade);		
		//Usuario
		usuario.getComunidades().add(comunidade);
		//Categoria
		categoria.getComunidades().add(comunidade);
		return "redirect:homecomunidade?com_id="+comunidade.getCom_id();
	}
	
	@RequestMapping("/homecomunidade")
	public String homecomunidade(HttpSession session, HttpServletRequest request, Model model){
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		Long com_id = Long.parseLong(request.getParameter("com_id"));
		Comunidade comunidade = comunidadeDAO.recuperar(com_id);
		Categoria categoria = categoriaDAO.recuperar(comunidade.getCat_id());
		Set<Usuario> usuarios= comunidade.getUsuarios();
		Set<Forum> foruns = comunidade.getForuns();
		
		String html = "<tr><td colspan='4'><p class='text-empty'>Nenhum forum encontrado.</p></td></tr>";
		if (foruns.isEmpty()) {
			model.addAttribute("htmlf", html);
		}
		Boolean teste = false;
		String addC = "<p><a href=\"participarComunidade?com_id="+com_id+"\" class='icone icon-usuario-adicionar'>participar</a></p>";
		for (Comunidade c: usuario.getComunidades() ) {
			if (c.equals(comunidade)) {
				teste = true;
				break;
			}
		}
		if (!teste) {
			model.addAttribute("addComunidade", addC);
		}
		model.addAttribute("categoria", categoria);
		model.addAttribute("usuario", usuario);
		model.addAttribute("comunidade", comunidade);
		model.addAttribute("usuarios", usuarios);
		model.addAttribute("foruns", foruns);
		return "comunidade/home_comunidade";
	}
	
	//BUSCAR
	@RequestMapping("/buscarComunidade")
	public String buscarComunidade(HttpSession session, String txt, Model model){
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
//		String nome = request.getParameter(arg0)
		List<Comunidade> resultado = comunidadeDAO.recuperar(txt);
		for (Comunidade comunidade : usuario.getComunidades()) {
			resultado.remove(comunidade);
		}
		String cvaziahtml = "<div class='col-xs-12 col-sm-12 col-lg-12 nopadding'><p class='text-empty'>Nenhum usuario encontrada.</p></div>";
		if (resultado.isEmpty()) {
			model.addAttribute("html", cvaziahtml);
		}
		
		model.addAttribute("usuario", usuario);
		model.addAttribute("txt", txt);
		model.addAttribute("comunidades", resultado);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
		return "buscar/comunidade";
	}
	
	@RequestMapping("/participarComunidade")
	public String participarComunidade(HttpSession session, HttpServletRequest request, Model model){
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		Long com_id = Long.parseLong(request.getParameter("com_id"));
		Comunidade comunidade = comunidadeDAO.recuperar(com_id);
		comunidade.getUsuarios().add(usuario);
		usuario.getComunidades().add(comunidade);
		return "redirect:homecomunidade?com_id="+com_id;
	}
	
}
