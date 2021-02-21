/*
*
 -------------------------------------------------------------------
*                  IFSP - Instituto Federal de São Paulo             *
*                    Técnico Integrado em Informática                *  
*                      Projeto Integrado - Turma 213                 *
--------------------------------------------------------------------
*                   Autor: Big Car Boy's                                *
*                        data:01/11/2017                             *
*                                                                    *
*                    Id da Classe:  Conexao                                 *
* Descrição:                                                         *
*    Classe que estabelece conexão como  banco de dados           *
--------------------------------------------------------------------  
*/


package sistema.dados;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;




public class Conexao {
    
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/projeto";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    
    public static Connection abrir() {
        
        try {
            Class.forName(DRIVER);
            return DriverManager.getConnection(URL, USER, PASSWORD);            
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }
    
    public static void fechar (Connection conexao) {
        try {
            conexao.close();
        } catch (SQLException e) {
            throw new RuntimeException (e.getMessage()); 
        }
    }
}
