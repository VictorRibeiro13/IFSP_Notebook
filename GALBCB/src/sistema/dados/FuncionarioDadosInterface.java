package sistema.dados;

import java.util.List;
import sistema.negocio.Funcionario;

public interface FuncionarioDadosInterface {
    
    public void salvar(Funcionario funcionario);
    public void atualizar(Funcionario funcionario);
    public void deletar(String id);
    public List<Funcionario> listarTodos();
    public List<Funcionario> pesquisarPorId(String id);
    
}
