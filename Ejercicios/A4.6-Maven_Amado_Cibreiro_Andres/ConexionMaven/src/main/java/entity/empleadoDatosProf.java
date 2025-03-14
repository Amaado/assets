package entity;

public class empleadoDatosProf {
    private String dni;
    private String categoria;
    private double sueldoBrutoAnual;

    public empleadoDatosProf(){}

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public double getSueldoBrutoAnual() {
        return sueldoBrutoAnual;
    }

    public void setSueldoBrutoAnual(double sueldoBrutoAnual) {
        this.sueldoBrutoAnual = sueldoBrutoAnual;
    }
}
