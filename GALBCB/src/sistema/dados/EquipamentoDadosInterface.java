package sistema.dados;

import java.util.List;
import sistema.negocio.Equipamento;

public interface EquipamentoDadosInterface {
    
    public void salvar(Equipamento equipamento);
    public void atualizar(Equipamento equipamento);
    public void deletar(String id);
    public List<Equipamento> listarTodos();
    public List<Equipamento> pesquisarPorId(String id);
    
}