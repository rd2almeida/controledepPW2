/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.FuncionarioDao;
import vo.FuncionarioVo;


/**
 *
 * @author Roberta
 */
public class FuncionarioService {

public FuncionarioService(){    
}
public void inserirFuncionario(FuncionarioVo funcionarioVo){
    try{
        FuncionarioDao funcionarioDao = new FuncionarioDao();
        funcionarioDao.inserirFuncionario(funcionarioVo);
    } catch (Exception ex){
        ex.printStackTrace();
    }
}
public void alterarFuncionario(FuncionarioVo funcionarioVo){
    try {
        FuncionarioDao funcionarioDao = new FuncionarioDao();
        funcionarioDao.alterarFuncionario(funcionarioVo);
    }catch (Exception ex){
        ex.printStackTrace();
    }
}
public FuncionarioVo[] pesquisarFuncionario(int id){
    FuncionarioVo[] funcionarioVo = null;
    FuncionarioDao funcionarioDao = null;
    try{
        funcionarioDao = new FuncionarioDao();
        funcionarioVo = funcionarioDao.pesquisarFuncionario(id);
    } catch (Exception ex){
        ex.printStackTrace();
    }
    return (funcionarioVo);
        }
public FuncionarioVo[] pesquisarFuncionarios(){
    FuncionarioVo funcionarioVo[] = null;
    try{
        FuncionarioDao funcionarioDao = new FuncionarioDao();
        funcionarioVo = funcionarioDao.pesquisarFuncionarios();
    } catch (Exception ex){
        ex.printStackTrace();
    }
    return (funcionarioVo);
}
public int excluirFuncionario(int id){
    int r = 0;
    try {
        FuncionarioDao funcionarioDao = new FuncionarioDao();
        r = funcionarioDao.excluirFuncionario(id);
    }catch (Exception ex){
        ex.printStackTrace();
    }
    return r;
}
public int pesquisarUltimoFuncionario(){
    FuncionarioDao funcionarioDao = null;
    int ultFun = 0;
    try{
        funcionarioDao = new FuncionarioDao();
        ultFun = funcionarioDao.pesquisarUltimoFuncionario();
    } catch (Exception ex){
        ex.printStackTrace();
    }
    return ultFun;

}
}