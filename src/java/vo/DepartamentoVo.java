/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vo;
import java.util.List;

/**
 *
 * @author Roberta
 */
public class DepartamentoVo {
    private int ideDep;
    private String nomDep;
    private String telDep;
    private List funcionarios;
    
    public DepartamentoVo(){
        
    }

    public void setIdeDep(int ideDep) {
        this.ideDep = ideDep;
    }

    public void setNomDep(String nomDep) {
        this.nomDep = nomDep;
    }

    public void setTelDep(String telDep) {
        this.telDep = telDep;
    }

    public void setFuncionarios(List funcionarios) {
        this.funcionarios = funcionarios;
    }

    public int getIdeDep() {
        return ideDep;
    }

    public String getNomDep() {
        return nomDep;
    }

    public String getTelDep() {
        return telDep;
    }

    public List getFuncionarios() {
        return funcionarios;
    }
}
