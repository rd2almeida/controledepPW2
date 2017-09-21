/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.DepartamentoDao;
import vo.DepartamentoVo;


/**
 *
 * @author Roberta
 */
public class DepartamentoService {

public DepartamentoService(){    
}
public void inserirDepartamento(DepartamentoVo departamentoVo){
    try{
        DepartamentoDao departamentoDao = new DepartamentoDao();
        departamentoDao.inserirDepartamento(departamentoVo);
    } catch (Exception ex){
        ex.printStackTrace();
    }
}
public void alterarDepartamento(DepartamentoVo departamentoVo){
    try {
        DepartamentoDao departamentoDao = new DepartamentoDao();
        departamentoDao.alterarDepartamento(departamentoVo);
    }catch (Exception ex){
        ex.printStackTrace();
    }
}
public DepartamentoVo[] pesquisarDepartamento(int id){
    DepartamentoVo[] departamentoVo = null;
    DepartamentoDao departamentoDao = null;
    try{
        departamentoDao = new DepartamentoDao();
        departamentoVo = departamentoDao.pesquisarDepartamento(id);
    } catch (Exception ex){
        ex.printStackTrace();
    }
    return (departamentoVo);
        }
public DepartamentoVo[] pesquisarDepartamentos(){
    DepartamentoVo departamentoVo[] = null;
    try{
        DepartamentoDao departamentoDao = new DepartamentoDao();
        departamentoVo = departamentoDao.pesquisarDepartamento();
    } catch (Exception ex){
        ex.printStackTrace();
    }
    return (departamentoVo);
}
public int excluirDepartamento(int id){
    int r = 0;
    try {
        DepartamentoDao departamentoDao = new DepartamentoDao();
        r = departamentoDao.excluirDepartamento(id);
    }catch (Exception ex){
        ex.printStackTrace();
    }
    return r;
}
public int pesquisarUltimoDepartamento(){
    DepartamentoDao departamentoDao = null;
    int ultDep = 0;
    try{
        departamentoDao = new DepartamentoDao();
        ultDep = departamentoDao.pesquisarUltimoDepartamento();
    } catch (Exception ex){
        ex.printStackTrace();
    }
    return ultDep;

}
}