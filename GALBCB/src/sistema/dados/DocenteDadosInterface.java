package sistema.dados;

import java.util.List;
import sistema.negocio.Docente;

public interface DocenteDadosInterface {
    
    public void salvar(Docente docente);
    public void atualizar(Docente docente);
    public void deletar(String prontuario);
    public List<Docente> listarTodos();
    public List<Docente> pesquisarPorProntuario(String prontuario);
    
}
