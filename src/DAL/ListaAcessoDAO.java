package DAL;

import java.util.ArrayList;
import java.util.Random;

import model.ChaveAcesso;
import model.Pessoa;

/*
 * 
 * Classe responsável por criar as chaves e monitorar os acessos de usuário
 * A cada login feito, é gerado uma Chave De Acesso random com a informação
 * de ID de usuário inserida dentro.
 * 
 */
public class ListaAcessoDAO {
	
	private static ArrayList<ChaveAcesso> listAcesso = new ArrayList<>();
	
	public static String criarChaveAcesso(Pessoa p) {
		ChaveAcesso chave = new ChaveAcesso(getSaltString(),p);
		listAcesso.add(chave);
		return chave.getChave();		
	}
	
	public static void removerChaveAcesso(String key) {
		for(int i = 0; i < listAcesso.size(); i++) {
			if(listAcesso.get(i) != null) {
				if(key.equals(listAcesso.get(i).getChave())) listAcesso.remove(i);
			}
		}
	}
	
	public static String obterUsuarioPelaChave(String chave) {
		for(ChaveAcesso c : listAcesso) {
			if(c.getChave().equalsIgnoreCase(chave)) {
				return c.getPessoa().getId();
			}
		}
		return null;
	}
	
	/*
	 * Faz a criação de um Key random para ser utilizada na chave.
	 * https://stackoverflow.com/questions/20536566/creating-a-random-string-with-a-z-and-0-9-in-java
	 */
	protected static String getSaltString() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 24) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }

}
