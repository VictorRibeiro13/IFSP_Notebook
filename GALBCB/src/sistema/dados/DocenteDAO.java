package sistema.dados;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sistema.negocio.Docente;

public class DocenteDAO implements DocenteDadosInterface {

    private Connection conexao;    
    
    @Override
    public void salvar(Docente docente) {        
        conexao = Conexao.abrir();
        String sql = "INSERT INTO docentes VALUES (?,?,?);";
        try {
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, docente.getNome());
            stmt.setString(2, docente.getProntuario());
            stmt.setString(3, docente.getTurmaDiscente());
            stmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Conexao.fechar(conexao);        
    }
    
        public void atualizar(Docente docente) {        
        conexao = Conexao.abrir();
        String sql = "UPDATE docentes SET nome = ?, turma discente = ? WHERE prontuario = ?";
        try {
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, docente.getNome());
            stmt.setString(2, docente.getTurmaDiscente());
            stmt.setString(3, docente.getProntuario());

            stmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Conexao.fechar(conexao);        
    }
        
    
        public void deletar(String prontuario) {        
        conexao = Conexao.abrir();
        String sql = "DELETE FROM docentes WHERE prontuario = ?";
        try {
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, prontuario);
            stmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Conexao.fechar(conexao);        
    }

    @Override
    public List<Docente> listarTodos() { 
        conexao = Conexao.abrir();
        
        List<Docente> docentesEncontrados = new ArrayList<>();
        String sql = "SELECT * FROM docentes";
        try {
            PreparedStatement stmt = conexao.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Docente docente = new Docente(
                rs.getString("prontuario"),
                rs.getString("nome"),
                rs.getString("turma discente"));           
                docentesEncontrados.add(docente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Conexao.fechar(conexao);
        return docentesEncontrados;
    }
    
    @Override
    public List<Docente> pesquisarPorProntuario(String prontuario) {      
        conexao = Conexao.abrir();
        
        List<Docente> encontradosProntuario = new ArrayList<>();
        String sql = "SELECT * FROM docentes WHERE prontuario LIKE ?";
        try {
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, "%" + prontuario + "%");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Docente docente = new Docente(
                rs.getString("prontuario"),
                rs.getString("nome"),
                rs.getString("turma discente"));           
                encontradosProntuario.add(docente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Conexao.fechar(conexao);
        return encontradosProntuario;
    }
}   