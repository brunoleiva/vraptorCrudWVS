package br.com.wvs.interceptor;

import javax.inject.Inject;

import br.com.caelum.vraptor.Accepts;
import br.com.caelum.vraptor.AroundCall;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.controller.ControllerMethod;
import br.com.caelum.vraptor.interceptor.SimpleInterceptorStack;
import br.com.wvs.controle.ClientesController;
import br.com.wvs.web.ClienteWeb;

@Intercepts
public class AutorizacaoInterceptor {
	private ControllerMethod controllerMethod;
	private ClienteWeb clienteWeb;
	private Result result;

	public AutorizacaoInterceptor() {
	}

	@Inject
	public AutorizacaoInterceptor(ControllerMethod controllerMethod, ClienteWeb clienteWeb, Result result) {
		this.controllerMethod = controllerMethod;
		this.clienteWeb = clienteWeb;
		this.result = result;
	}

	@Accepts
	public boolean accepts() {
		return !controllerMethod.containsAnnotation(Open.class);
	}

	@AroundCall
	public void intercept(SimpleInterceptorStack stack) {
		if (clienteWeb.isLogado()) {
			stack.next();
		} else {
			result.redirectTo(ClientesController.class).login();
		}
	}
}
