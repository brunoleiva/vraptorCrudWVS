package br.com.wvs.infra;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Random;

import org.apache.commons.io.IOUtils;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.wvs.modelo.Carros;
import br.com.wvs.modelo.Clientes;

@Controller
public class Upload {

	Random gerador = new Random();

	@Path("upload/salvar")
	public void uploadArquivoCarro(UploadedFile uploadedFile, Carros carro) {
		String path = "C:\\Users\\Visitante\\Desktop\\Workspace\\projetoCrud\\src\\main\\webapp\\imagensCarros";
		File file = new File(path, carro.getId()+ ".jpg");
		InputStream stream = uploadedFile.getFile();
		try {
			file.createNewFile();
			IOUtils.copy(stream, new FileOutputStream(file));
		} catch (IOException e1) {
			e1.printStackTrace();
			System.out.println("Erro ao enviar arquivo");
		}
	}

	@Path("upload/cliente")
	public Clientes uploadArquivoCliente(UploadedFile uploadedFile, Clientes cliente) {
		String path = "C:\\Users\\Visitante\\Desktop\\Workspace\\projetoCrud\\src\\main\\webapp\\imagensClientes";
		String nomeArquivo = cliente.getId() + "-" + gerador.nextInt() + ".jpg";
		File file = new File(path, nomeArquivo);
		cliente.setUrl("/imagensClientes/" + nomeArquivo);
		InputStream stream = uploadedFile.getFile();
		try {
			file.createNewFile();
			IOUtils.copy(stream, new FileOutputStream(file));
			return cliente;
		} catch (IOException e1) {
			e1.printStackTrace();
			System.out.println("Erro ao enviar arquivo");
		}
		return cliente;
	}
}
