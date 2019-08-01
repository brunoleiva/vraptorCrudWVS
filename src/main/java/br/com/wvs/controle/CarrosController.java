package br.com.wvs.controle;

import java.util.ArrayList;
import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.wvs.dao.CarroDao;
import br.com.wvs.dao.MarcaDao;
import br.com.wvs.dao.ModeloDao;
import br.com.wvs.infra.Upload;
import br.com.wvs.modelo.Carros;
import br.com.wvs.modelo.Marca;
import br.com.wvs.modelo.Modelo;

@Controller
public class CarrosController {
	private CarroDao dao;
	private ModeloDao daoModelo;
	private MarcaDao daoMarca;
	private Result result;
	private Upload upload;

	/*
	 * @Inject public CarrosController(CarroDao dao, Result result) { this.dao =
	 * dao; this.result = result; }
	 */

	protected CarrosController() {

	}

	@Inject
	public CarrosController(Result result, CarroDao dao, MarcaDao daoMarca, ModeloDao daoModelo, Upload upload) {
		this.result = result;
		this.dao = dao;
		this.daoMarca = daoMarca;
		this.daoModelo = daoModelo;
		this.upload = upload;
	}

	@Path("carros/cadastro")
	public void cadastroCarro() {
		result.include("listaModelo", daoModelo.listaModelos());
		result.include("listaMarca", daoMarca.listaMarcas());
		result.include("tipoForm", "Formulário de cadastro de carro:");
	}

	@Path("carros/formulario/{carro.id}")
	public void formularioAlteracao(Carros carro) {
		result.include("carro", dao.find(carro.getId()));
		result.include("tipoForm", "Formulário de alteração de carro:");
	}

	@Path("carros/cadastrados")
	public void cadastrados() {
		result.include("lista", lista());
	}

	@Path("carros/saveorupdate")
	public void saveOrUpdate(UploadedFile uploadedFile, Carros carro) {
		Modelo inserido = daoModelo.find(carro.getModelo().getId());
		carro.setModelo(inserido);
		Marca inserida = daoMarca.find(carro.getModelo().getMarca().getId());
		carro.getModelo().setMarca(inserida);
		
		
		carro.setUrl("/imagensCarros/" + carro.getId() + ".jpg");
		
		dao.saveOrUpdate(carro);
		upload.uploadArquivoCarro(uploadedFile, carro);
		
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		result.include("aparecer", "show");
		result.include("confirmacao", "Carro de modelo " + carro.getModelo().getNome() + " e placa " + carro.getPlaca()
				+ " foi alterado com sucesso!!");
		result.redirectTo(this).cadastrados();
	}

	@Path("carros/add")
	public void add(Carros carro, UploadedFile uploadedFile) {
		
		Modelo inserido = daoModelo.find(carro.getModelo().getId());
		carro.setModelo(inserido);
		
		Marca inserida = daoMarca.find(carro.getModelo().getMarca().getId());
		carro.getModelo().setMarca(inserida);
		
		
		Carros ultimoInserido = dao.ultimoId();
		
		Carros validaPlaca = dao.validaPlaca(carro.getPlaca());
		
		
		carro.setUrl("/imagensCarros/" + (ultimoInserido.getId()+1) + ".png");
		if (validaPlaca == null) {
			dao.add(carro);
			upload.uploadArquivoCarro(uploadedFile, carro);
			
			try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			
			result.include("aparecer", "show");
			result.include("confirmacao", "Carro de modelo " + carro.getModelo().getNome() + " e placa "
					+ carro.getPlaca() + " foi cadastrado sucesso!!");
			result.redirectTo(this).cadastrados();

		} else {
			result.include("jaExiste", "Placa já existente!");
			result.redirectTo(this).cadastroCarro();

		}
	}

	@Delete("carros/delete")
	public void remove(final Carros carro) {
		Carros carro2 = dao.find(carro.getId());
		dao.remove(carro2);
		result.include("aparecer", "show");
		result.include("confirmacao",
				"Carro de código " + carro2.getId() + " e placa " + carro2.getPlaca() + " foi deletado com sucesso!!");
		result.redirectTo(this).cadastrados();
	}

	@Path("carros/lista")
	public ArrayList<Carros> lista() {
		return dao.listaTodos();
	}

	/*
	 * @Path("carros/buscaModelo") public void busca(String modelo) {
	 * result.include("busca", modelo); result.include("tipo", "modelo");
	 * result.include("lista", dao.buscaModelo(modelo)); }
	 * 
	 * @Path("carros/buscaPlaca") public void busca(String placa, int id) {
	 * result.include("busca", placa); result.include("tipo", "placa");
	 * result.include("lista", dao.buscaPlaca(placa)); }
	 */

}
