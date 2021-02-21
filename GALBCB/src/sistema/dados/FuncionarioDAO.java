package sistema.dados;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sistema.negocio.Funcionario;

public class FuncionarioDAO implements FuncionarioDadosInterface {

    private Connection conexao;    
    
    @Override
    public void salvar(Funcionario funcionario) {        
        conexao = Conexao.abrir();
        String sql = "INSERT INTO funcionarios VALUES (?,?,?);";
        try {
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, funcionario.getId());
            stmt.setString(2, funcionario.getNome());
            stmt.setString(3, funcionario.getProfissao());
            stmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Conexao.fechar(conexao);        
    }
    
        public void atualizar(Funcionario funcionario) {        
        conexao = Conexao.abrir();
        String sql = "UPDATE funcionarios SET nome = ?, profissao = ? WHERE id = ?";
        try {
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, funcionario.getNome());
            stmt.setString(2, funcionario.getProfissao());
            stmt.setString(3, funcionario.getId());

            stmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Conexao.fechar(conexao);        
    }
        
    
        public void deletar(String id) {        
        conexao = Conexao.abrir();
        String sql = "DELETE FROM funcionarios WHERE id = ?";
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
    public List<Funcionario> listarTodos() { 
        conexao = Conexao.abrir();
        
        List<Funcionario> funcionariosEncontrados = new ArrayList<>();
        String sql = "SELECT * FROM funcionarios";
        try {
            PreparedStatement stmt = conexao.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Funcionario funcionario = new Funcionario(
                rs.getString("id"),
                rs.getString("nome"),
                rs.getString("profissao"));           
                funcionariosEncontrados.add(funcionario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Conexao.fechar(conexao);
        return funcionariosEncontrados;
    }
    
    @Override
    public List<Funcionario> pesquisarPorId(String id) {      
        conexao = Conexao.abrir();
        
        List<Funcionario> encontradosId = new ArrayList<>();
        String sql = "SELECT * FROM funcionarios WHERE id LIKE ?";
        try {
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, "%" + id + "%");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Funcionario funcionario = new Funcionario(
                rs.getString("id"),
                rs.getString("nome"),
                rs.getString("profissao"));           
                encontradosId.add(funcionario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Conexao.fechar(conexao);
        return encontradosId;
    }
}   