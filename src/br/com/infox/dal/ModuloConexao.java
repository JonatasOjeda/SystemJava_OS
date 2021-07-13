package br.com.infox.dal;

import java.sql.*;

public class ModuloConexao {

    //Metodo responsavel por estabelecer a Conexão com o Banco 
    public static Connection conector() {
        java.sql.Connection conexao = null;
        // A Linha abaixo chama o Driver
        String driver = "com.mysql.jdbc.Driver";
        // Armazenando Informaçoes Referente ao Banco
        String url = "jdbc:mysql://localhost:3306/dbinfox";
        String user = "root";
        String password = "123456";
        // Estabelecendo a Conexao com o Banco
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, user, password);
            return conexao;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
