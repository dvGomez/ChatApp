package DAL;

import model.Mensagem;
import model.Sala;

public class MensagensDAO {
	
	public static int enviarMensagem(Mensagem mensagem, String inst, String idRoom) {
		
		if(mensagem.getTexto().isEmpty()) return 1;
		Sala sala = SalasDAO.getSalaByIds(inst, idRoom);
		if(sala == null) return 2;
		mensagem.setId(sala.getListMensagem().size() + "");
		sala.getListMensagem().add(mensagem);
		return 0;
	}

}
