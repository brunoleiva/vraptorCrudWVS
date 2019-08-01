package br.com.wvs.controle;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.wvs.interceptor.Open;

@Controller
public class IndexController {

	private final Result result;

	/**
	 * @deprecated CDI eyes only
	 */

	protected IndexController() {
		this(null);
	}
	
	@Inject
	public IndexController(Result result) {
		this.result = result;
	}
	
	@Open
	@Path("/")
	public void index() {
		result.include("mensagem0", "Bem-vindo ao site!!");
		result.include("mensagem1", "--CRUD desenvolvido em VRaptor e Hibernate--");
		result.include("mensagem2", "Por: Bruno Leiva Pires");
		result.include("mensagem3", "WVS - Work Vision Technology");
	}
	
	@Open
	@Path("/teste")
	public void teste() {

	}
	@Open
	@Path("/teste2")
	public void teste2() {

	}


}

