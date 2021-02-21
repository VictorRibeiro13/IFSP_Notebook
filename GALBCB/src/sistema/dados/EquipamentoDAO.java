package sistema.dados;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sistema.negocio.Equipamento;

public class EquipamentoDAO implements EquipamentoDadosInterface {

    private Connection conexao;    
    
    @Override
    public void salvar(Equipamento equipamento) {        
        conexao = Conexao.abrir();
        String sql = "INSERT INTO equipamentos VALUES (?,?,?,?);";
        try {
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, equipamento.getId());
            stmt.setString(2, equipamento.getNomeEquipamento());
            stmt.setString(3, equipamento.getTipoEquipamento());
            stmt.setString(4, equipamento.getDescricao());
           stmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Conexao.fechar(conexao);        
    }
    
        public void atualizar(Equipamento equipamento) {        
        conexao = Conexao.abrir();
        String sql = "UPDATE equipamentos SET nome = ?, tipo = ?, descricao = ?, quantidade=? WHERE id = ?";
        try {
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, equipamento.getNomeEquipamento());
            stmt.setString(2, equipamento.getTipoEquipamento());
            stmt.setString(3, equipamento.getDescricao());
            stmt.setString(4, equipamento.getId());

            stmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Conexao.fechar(conexao);        
    }
        
        public void deletar(String id) {        
        conexao = Conexao.abrir();
        String sql = "DELETE FROM equipamentos WHERE id = ?";
        try {
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, id);
            stmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Conexao.fechar(conexao);        
    }

    @Override
    public List<Equipamento> listarTodos() { 
        conexao = Conexao.abrir();
        
        List<Equipamento> equipamentosEncontrados = new ArrayList<>();
        String sql = "SELECT * FROM equipamentos";
        try {
            PreparedStatement stmt = conexao.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Equipamento equipamento = new Equipamento(
                rs.getString("id"),
                rs.getString("nome"),
                rs.getString("tipo"),
                rs.getString("descricao"));      
                equipamentosEncontrados.add(equipamento);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Conexao.fechar(conexao);
        return equipamentosEncontrados;
    }
    
    @Override
    public List<Equipamento> pesquisarPorId(String id) {      
        conexao = Conexao.abrir();
        
        List<Equipamento> encontradosId = new ArrayList<>();
        String sql = "SELECT * FROM equipamentos WHERE id LIKE ?";
        try {
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, "%" + id + "%");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Equipamento equipamento = new Equipamento(
                rs.getString("id"),
                rs.getString("nome"),
                rs.getString("tipo"),           
                rs.getString("descricao")
                );           
                encontradosId.add(equipamento);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Conexao.fechar(conexao);
        return encontradosId;
    }
}   