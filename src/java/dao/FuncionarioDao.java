/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import vo.FuncionarioVo;

/**
 *
 * @author Roberta
 */
public class FuncionarioDao {
    static final String url ="jdbc:mysql:localhost:3311/controle";
    static final String driver = "com.mysql.jdbc.Driver";
    static final String usuario ="root";
    static final String senha ="root";
    static final String sqlPesquisarFuncionarios = "select IdeFun, NomFun, TelFun from tabFuncionario";
    static final String sqlInserirFuncionario = "insert into tabFuncionario (IdeFun, NomFun, TelFun)"
            + "values (?,?,?)";
    static final String sqlAlterarFuncionario = "update tabFuncionario set NomFun =?, "
            + "TelFun =? where IdeFun = ?";
    static final String sqlPesquisarFuncionario = "select * from tabFuncionario where IdeFun =?";
    static final String sqlExcluirFuncionario = "delete from tabFuncionario where IdeFun = ?";
    static final String sqlPesquisarUltimoFuncionario = "select max(IdeFun) from tabFuncionario";
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public FuncionarioVo[] pesquisarFuncionarios(){
        FuncionarioVo funcionarioVo =null;
        ArrayList al = null;
        try {
            conectar();
            ps = conn.prepareStatement(sqlPesquisarFuncionarios);
            rs = ps.executeQuery();
            al = new ArrayList();
            while (rs.next()){
            funcionarioVo = new FuncionarioVo();
            funcionarioVo.setIdeFun(rs.getInt(1));
            funcionarioVo.setNomFun(rs.getString(2));
            funcionarioVo.setTelFun(rs.getString(3));
            al.add(funcionarioVo);
        }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            desconectar();
        }
        FuncionarioVo funVo[] =null;
        funVo = (FuncionarioVo[]) al.toArray(new FuncionarioVo[al.size()]);
        return (funVo);
        
    }
    public void inserirFuncionario (FuncionarioVo funcionarioVo){
        try{
            conectar();
            ps =conn.prepareStatement(sqlInserirFuncionario);
            ps.setInt(1, funcionarioVo.getIdeFun());
            ps.setInt(2, funcionarioVo.getIdeDep());
            ps.setString(3, funcionarioVo.getNomFun());
            ps.setString(4, funcionarioVo.getTelFun());
            ps.setString(5, funcionarioVo.getCarFun());
            ps.setDouble(6, funcionarioVo.getSalFun());
            
            ps.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }finally{
            desconectar();
        }
    }
          public void alterarFuncionario(FuncionarioVo funcionarioVo){
              try{
            conectar();
            ps =conn.prepareStatement(sqlAlterarFuncionario);
            ps.setInt(1, funcionarioVo.getIdeDep());
            ps.setString(2, funcionarioVo.getNomFun());
            ps.setString(3, funcionarioVo.getTelFun());
            ps.setString(4, funcionarioVo.getCarFun());
            ps.setDouble(5, funcionarioVo.getSalFun());
            ps.setInt(6, funcionarioVo.getIdeFun());
            ps.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }finally{
            desconectar();
        }
          }
          public int excluirFuncionario(int id){
              int r = 0;
              try{
            conectar();
            ps =conn.prepareStatement(sqlExcluirFuncionario);
            ps.setInt(1, id);
            r = ps.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally{
            desconectar();
        }
              return r;
          }
          
          public FuncionarioVo[] pesquisarFuncionario(int id){
              FuncionarioVo funcionarioVo = null;
              ArrayList al = null;
              try{
            conectar();
            ps =conn.prepareStatement(sqlPesquisarFuncionario);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            al = new ArrayList();
            while (rs.next()){
                funcionarioVo = new FuncionarioVo();
                funcionarioVo.setIdeFun(rs.getInt(1));
                funcionarioVo.setIdeDep(rs.getInt(2));
                funcionarioVo.setNomFun(rs.getString(3));
                funcionarioVo.setTelFun(rs.getString(4));
                funcionarioVo.setCarFun(rs.getString(5));
                funcionarioVo.setSalFun(rs.getDouble(6));
                al.add(funcionarioVo);
            }
            
        }catch (SQLException e){
            e.printStackTrace();
        }finally{
            desconectar();
        }
              FuncionarioVo funVo[] =null;
              funVo = (FuncionarioVo[]) al.toArray(new FuncionarioVo[al.size()]);
              return (funVo);
           }
         
          public void conectar(){
              try{
                  Class.forName(driver);
                  conn = DriverManager.getConnection(url, usuario, senha);
              }catch (SQLException ex){
                  ex.printStackTrace();
              }catch (ClassNotFoundException ex){
                  ex.printStackTrace();
              }
          }
         public void desconectar(){
             try{
                 conn.close();
                 ps.close();
             }catch (SQLException el){
                 el.printStackTrace();
             }
         }
         public int pesquisarUltimoFuncionario(){
             int ultFun = 0;
             try {
                 conectar();
                 ps = conn.prepareStatement(sqlPesquisarUltimoFuncionario);
                 rs = ps.executeQuery();
                 rs.first();
                 ultFun = rs.getInt(1);
                 desconectar();
             }catch (SQLException ex){
                 ex.printStackTrace();
             }
             return ultFun;
         }
}

