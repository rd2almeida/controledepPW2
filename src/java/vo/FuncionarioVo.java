/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vo;

/**
 *
 * @author Roberta
 */
public class FuncionarioVo {
    private int ideFun;
    private String nomFun;
    private String telFun;
    private String carFun;
    private double salFun;
    private int ideDep;
    private DepartamentoVo departamento;
    
    public FuncionarioVo(){
        
    }

    public int getIdeFun() {
        return ideFun;
    }

    public String getNomFun() {
        return nomFun;
    }

    public String getTelFun() {
        return telFun;
    }

    public String getCarFun() {
        return carFun;
    }

    public double getSalFun() {
        return salFun;
    }

    public int getIdeDep() {
        return ideDep;
    }

    public DepartamentoVo getDepartamento() {
        return departamento;
    }

    public void setIdeFun(int ideFun) {
        this.ideFun = ideFun;
    }

    public void setNomFun(String nomFun) {
        this.nomFun = nomFun;
    }

    public void setTelFun(String telFun) {
        this.telFun = telFun;
    }

    public void setCarFun(String carFun) {
        this.carFun = carFun;
    }

    public void setSalFun(double salFun) {
        this.salFun = salFun;
    }

    public void setIdeDep(int ideDep) {
        this.ideDep = ideDep;
    }

    public void setDepartamento(DepartamentoVo departamento) {
        this.departamento = departamento;
    }
   
    
}
