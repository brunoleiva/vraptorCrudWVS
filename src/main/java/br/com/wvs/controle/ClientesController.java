package br.com.wvs.controle;

import java.text.Format;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.wvs.dao.ClienteDao;
import br.com.wvs.infra.Upload;
import br.com.wvs.interceptor.Open;
import br.com.wvs.modelo.Clientes;
import br.com.wvs.web.ClienteWeb;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.*;

@Path("/clientes")
@Controller
@Resource
public class ClientesController {
	private ClienteDao dao;
	private Result result;
	private ClienteWeb clienteWeb;
	private Upload upload;

	/*
	 * @Inject public CarrosController(CarroDao dao, Result result) { this.dao =
	 * dao; this.result = result; }
	 */
	protected ClientesController() {

	}

	@Inject
	public ClientesController(Result result, ClienteDao dao, ClienteWeb clienteWeb, Upload upload) {
		this.result = result;
		this.dao = dao;
		this.clienteWeb = clienteWeb;
		this.upload = upload;
	}

	@Delete("/delete")
	public void remove(final Clientes cliente) {
		System.out.println(cliente);
		Clientes cliente2 = dao.find(cliente.getId());
		System.out.println(cliente2);
		dao.remove(cliente2);
		result.include("aparecer", "show");
		result.include("confirmacao",
				"Cliente de CPF " + cliente2.getCpf() + " nome " + cliente2.getNome() + " foi deletado com sucesso!!");
		result.redirectTo(this).cadastrados();
	}

	@Open
	@Path("/cadastro")
	public void cadastroCliente() {
		result.include("tipoForm", "Formulário de cadastro de CLIENTES:");
	}

	@Path("/cadastroAdministrador")
	public void cadastroAdministrador() {
		result.include("tipoForm", "Formulário de cadastro de ADMINISTRADORES:");
	}

	@Path("/cadastrados")
	public void cadastrados() {
		result.include("lista", lista());
	}

	@Open
	@Path("/add")
	public void add(Clientes cliente) {
		// System.out.println(cliente);
		Clientes emailExiste = dao.validaEmail(cliente.getEmail());
		Clientes cpfExiste = dao.validaCpf(cliente.getCpf());

		result.include("recuperaNome", cliente.getNome());
		result.include("recuperaEmail", cliente.getEmail());
		result.include("recuperaCpf", cliente.getCpf());
		result.include("recuperaRg", cliente.getRg());
		result.include("recuperaTelefone", cliente.getTelefone());

		Format formatter = new SimpleDateFormat("dd/MM/yyyy");
		result.include("recuperaData", formatter.format(cliente.getDtNascimento()));

		result.include("recuperaSenha", cliente.getSenha());
		result.include("recuperaDica", cliente.getDica());

		if (dao.isCpf(cliente.getCpf())) {
			if (emailExiste == null) {
				if (cpfExiste == null) {

					cliente.setSenha(criptografar(cliente.getSenha()));
					
					cliente.setUrl("/imagensClientes/default.png");
					dao.add(cliente);
					if (cliente.getTipo() == 1) {
						result.include("sucesso", "Cadastro feito com sucesso!! Agora você já pode entrar no sistema!");
						result.redirectTo(this).login();
					} else {
						result.include("sucesso", "Administrador cadastrado com sucesso!");
						result.redirectTo(this).cadastroAdministrador();
					}
				} else {
					System.out.println("CPF JA EXISTE");
					result.include("jaExiste", "CPF já existente!");
					if (cliente.getTipo() == 1) {
						result.redirectTo(this).cadastroCliente();
					} else {
						result.redirectTo(this).cadastroAdministrador();
					}
				}
			} else {
				System.out.println("EMAIL JA EXISTE");
				result.include("jaExiste", "E-mail já existente!");
				if (cliente.getTipo() == 1) {
					result.redirectTo(this).cadastroCliente();
				} else {
					result.redirectTo(this).cadastroAdministrador();
				}
			}
		} else {
			System.out.println("CPF INVALIDO");
			result.include("jaExiste", "CPF inválido, por favor digite um CPF existente!");
			if (cliente.getTipo() == 1) {
				result.redirectTo(this).cadastroCliente();
			} else {
				result.redirectTo(this).cadastroAdministrador();
			}
		}
	}

	@Path("/saveorupdate")
	public void saveOrUpdate(Clientes cliente) {
		dao.saveOrUpdate(cliente);
		result.include("aparecer", "show");
		result.include("confirmacao",
				"Cliente do CPF " + cliente.getCpf() + " e nome " + cliente.getNome() + " calterado com sucesso!");
		result.redirectTo(this).cadastrados();

	}

	@Path("/configurar")
	public void configurar(Clientes cliente) {
		if (dao.isCpf(cliente.getCpf())) {
			dao.saveOrUpdate(cliente);
			result.include("confirmacao", "Informações pessoais alteradas com sucesso!!");
			clienteWeb.login(cliente);
			result.redirectTo(this).perfil();
		} else {
			result.include("cpfInvalido", "CPF inválido, digite um CPF existente!!");
			result.redirectTo(this).formularioConfiguracao();
		}

	}

	@Get
	@Path("/alterarEmail/")
	public void alterarEmail(int id, String emailNovo, String confirmaEmail) {
		Clientes cli = dao.find(id);
		System.out.println(emailNovo);
		System.out.println(confirmaEmail);
		System.out.println(id);
		System.out.println(cli);

		if (emailNovo.equals(confirmaEmail)) {
			cli.setEmail(emailNovo);
			dao.saveOrUpdate(cli);
			result.include("confirmacao", "E-mail alterado com sucesso!!");
			clienteWeb.login(cli);
			result.redirectTo(this).perfil();
		} else {
			result.include("emailErrado", "A confimação dos e-mails não conferem");
			result.redirectTo(this).formularioConfiguracao();
		}
	}
	
	public String criptografar(String s) {
		try {
			MessageDigest m = MessageDigest.getInstance("sha-256");

			m.update(s.getBytes(), 0, s.length());

			byte[] digest = m.digest();

			String hexa = new BigInteger(1, digest).toString(16);
			return hexa;
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Get
	@Path("/alterarSenha/")
	public void alterarSenha(int id, String senhaAtual, String senhaNova, String confirmaSenha, String dica) {
		Clientes cli = dao.find(id);
		String atual = criptografar(senhaAtual);
		String nova = criptografar(senhaNova);
		String confirma = criptografar(confirmaSenha);
		
		if (!atual.equals(cli.getSenha())) {
			result.include("errado", "A senha atual não confere com a cadastrada!");
			result.redirectTo(this).formularioConfiguracao();
		} else if (!nova.equals(confirma)) {
			result.include("errado", "A confirmação de senhas não conferem!");
			result.redirectTo(this).formularioConfiguracao();
		} else if (nova.equals(atual)) {
			result.include("errado", "A nova senha deve ser diferente da antiga!");
			result.redirectTo(this).formularioConfiguracao();
		} else {
			cli.setSenha(nova);
			cli.setDica(dica);
			dao.saveOrUpdate(cli);
			result.include("confirmacao", "Senha alterada com sucesso!!");
			clienteWeb.login(cli);
			result.redirectTo(this).perfil();
		}

	}

	@Open
	@Path("/login")
	public void login() {

	}

	@Path("/perfil")
	public void perfil() {

	}

	@Path("/formulario/{cliente.id}")
	public void formularioAlteracao(Clientes cliente) {
		result.include("cliente", dao.find(cliente.getId()));
		result.include("tipoForm", "Formulário de alteração de clientes:");
	}

	@Path("/configuracao")
	public void formularioConfiguracao() {
		result.include("tipoForm", "Configurações:");
	}

	@Open
	@Post("/logar")
	public void logar(Clientes cliente) {
		Clientes carregado = dao.carrega(cliente.getEmail(), cliente.getSenha());
		if (carregado == null) {
			System.out.println("Nao encontrado");
			result.include("erro", "E-mail ou senha incorretos!");
			result.redirectTo(this).login();
		} else {
			System.out.println("Logado!!");
			clienteWeb.login(carregado);
			result.redirectTo(IndexController.class).index();

			System.out.println(clienteWeb);
		}
	}

	@Path("/logout")
	public void logout() {
		clienteWeb.logout();
		result.redirectTo(this).login();
	}

	@Path("/lista")
	public ArrayList<Clientes> lista() {
		return dao.listaTodos();
	}

	@Path("/alteraFoto")
	public void alterarFoto(UploadedFile uploadedFile, Clientes cliente) {

		Clientes clienteUpload = dao.find(cliente);
		Clientes clienteRetorno = upload.uploadArquivoCliente(uploadedFile, clienteUpload);

		dao.saveOrUpdate(clienteRetorno);
		clienteWeb.logout();

		try {
			Thread.sleep(4000);

		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		result.include("confirmacao", "Foto de perfil alterada com sucesso!!");
		clienteWeb.login(clienteUpload);
		result.redirectTo(this).perfil();
	}

	@Open
	@Path("/esqueceuSenha")
	public void esqueceuSenha() {

	}

	@Open
	@Path("/dicaSenha")
	public void dicaSenha(Clientes cliente) {
		System.out.println(cliente.getEmail());
		Clientes clienteEmail = dao.dicaSenha(cliente.getEmail());
		result.include("dica", "Dica: " + clienteEmail.getDica());
		result.include("email", clienteEmail.getEmail());
		result.redirectTo(this).login();
	}

}
