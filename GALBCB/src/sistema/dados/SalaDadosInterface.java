package sistema.dados;

import java.util.List;
import sistema.negocio.Equipamento;
import sistema.negocio.Sala;

public interface SalaDadosInterface {
    public void salvar(Sala sala);
    public void atualizar(Sala sala);
    public void deletar(String idSala);
    public List<Sala> listarTodos();
    public List<Sala> pesquisarPorId(String idSala);
    public void listarEquipamentos(String idSala);
    public void deletarEquipamentos(String idSala);
    
    
}
