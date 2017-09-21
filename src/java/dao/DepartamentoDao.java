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
import java.sql.Array;
import java.sql.SQLException;
import java.util.ArrayList;
import vo.DepartamentoVo;

/**
 *
 * @author Roberta
 */
public class DepartamentoDao {
    static final String url ="jdbc:mysql:localhost:3311/controle";
    static final String driver = "com.mysql.jdbc.Driver";
    static final String usuario ="root";
    static final String senha ="root";
    static final String sqlPesquisarDepartamentos = "select IdeDep, NomDep, TelDep from tabDeparmento";
    static final String sqlInserirDepartamento = "insert into tabDepartamento (IdeDep, NomDep, TelDep)"
            + "values (?,?,?)";
    static final String sqlAlterarDepartamento = "update tabDepartamento set NomDep =?, "
            + "TelDep =? where IdeDep = ?";
    static final String sqlPesquisarDepartamento = "select * from tabDepartamento where IdeDep =?";
    static final String sqlExcluirDepartamento = "delete from tabDepartamento where IdeDep = ?";
    static final String sqlPesquisarUltimoDepartamento = "select max(IdeDep) from tabDepartamento";
    static final String sqlPesquisarUltimoFuncionario = "select max(IdeFun from tabFuncionario";
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public DepartamentoVo[] pesquisarDepartamento() throws SQLException{
        DepartamentoVo departamentoVo =null;
        ArrayList al = null;
        try {
            conectar();
            ps = conn.prepareStatement(sqlPesquisarDepartamentos);
            rs = ps.executeQuery();
            al = new ArrayList();
            while (rs.next()){
            departamentoVo = new DepartamentoVo();
            departamentoVo.setIdeDep(rs.getInt(1));
            departamentoVo.setNomDep(rs.getString(2));
            departamentoVo.setTelDep(rs.getString(3));
            al.add(departamentoVo);
        }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            desconectar();
        }
        DepartamentoVo dpVo[] =null;
        dpVo = (DepartamentoVo[]) al.toArray(new DepartamentoVo[al.size()]);
        return (dpVo);
        
    }
    public void inserirDepartamento (DepartamentoVo departamentoVo){
        try{
            conectar();
            ps =conn.prepareStatement(sqlInserirDepartamento);
            ps.setInt(1, departamentoVo.getIdeDep());
            ps.setString(2, departamentoVo.getNomDep());
            ps.setString(3, departamentoVo.getTelDep());
            ps.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }finally{
            desconectar();
        }
    }
          public void alterarDepartamento(DepartamentoVo departamentoVo){
              try{
            conectar();
            ps =conn.prepareStatement(sqlAlterarDepartamento);
            ps.setString(1, departamentoVo.getNomDep());
            ps.setString(2, departamentoVo.getTelDep());
            ps.setInt(3, departamentoVo.getIdeDep());
            ps.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }finally{
            desconectar();
        }
          }
          public int excluirDepartamento(int id){
              int r = 0;
              try{
            conectar();
            ps =conn.prepareStatement(sqlExcluirDepartamento);
            ps.setInt(1, id);
            r = ps.executeUpdate();
            
        }catch (SQLException e){
            e.printStackTrace();
        }finally{
            desconectar();
        }
              return r;
          }
          
          public DepartamentoVo[] pesquisarDepartamento(int id){
              DepartamentoVo departamentoVo = null;
              ArrayList al = null;
              try{
            conectar();
            ps =conn.prepareStatement(sqlPesquisarDepartamento);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            al = new ArrayList();
            while (rs.next()){
                departamentoVo = new DepartamentoVo();
                departamentoVo.setIdeDep(rs.getInt(1));
                departamentoVo.setNomDep(rs.getString(2));
                departamentoVo.setTelDep(rs.getString(3));
                al.add(departamentoVo);
            }
            
        }catch (SQLException e){
            e.printStackTrace();
        }finally{
            desconectar();
        }
              DepartamentoVo dpVo[] = (DepartamentoVo[]) al.toArray(new DepartamentoVo[al.size()]);
              return (dpVo);
              
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
         public int pesquisarUltimoDepartamento(){
             int ultDep = 0;
             try {
                 conectar();
                 ps = conn.prepareStatement(sqlPesquisarUltimoDepartamento);
                 rs = ps.executeQuery();
                 rs.first();
                 ultDep = rs.getInt(1);
                 desconectar();
             }catch (SQLException ex){
                 ex.printStackTrace();
             }
             return ultDep;
         }
}

