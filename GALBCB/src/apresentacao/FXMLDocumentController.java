/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import com.jfoenix.controls.JFXSpinner;
import com.jfoenix.controls.JFXToggleButton;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;



public class FXMLDocumentController implements Initializable {
    
    public static Stage janela;
    
    private Label label;
    @FXML
    private JFXToggleButton btnLigar;
    
        
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        
    }    

    @FXML
    private void handleButtonAction(MouseEvent event) throws IOException {
         Parent root = FXMLLoader.load(getClass().getResource("FXMLTelaCadastroController.fxml"));
         Scene scene = new Scene(root);
        
        janela.setScene(scene);
        janela.show();
    }
    
}
