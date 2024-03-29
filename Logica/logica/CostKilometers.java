package logica;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.CostKilometersDAO;

public class CostKilometers extends TransportModality {
    private double costKilometersGoing;
    private double costKilometersLap;
    private double costHoursWait;


    public CostKilometers(int id, Contract contract, String typeOfModality, ArrayList<Vehicle> vehicles,
                          String typeTransportModality, double costKilometersGoing, double costKilometersLap, double costHoursWait) { // constructor a nivel de base de datos
        super(id, contract, typeOfModality, vehicles, typeTransportModality);
        this.costKilometersGoing = costKilometersGoing;
        this.costKilometersLap = costKilometersLap;
        this.costHoursWait = costHoursWait;
    }

    public CostKilometers(Contract contract, ArrayList<Vehicle> vehicles, double costKilometersGoing, double costKilometersLap, double costHoursWait) { // constructor a nivel de logica
        super(contract, vehicles);
        this.costKilometersGoing = costKilometersGoing;
        this.costKilometersLap = costKilometersLap;
        this.costHoursWait = costHoursWait;
        this.typeTransportModality = "Cost Kilometers";
    }

    public CostKilometers(ArrayList<Vehicle> vehicles, double costKilometersGoing, double costKilometersLap, double costHoursWait) { // Constructor a nivel de logica (proceso de creacion del objeto)
        super(vehicles);
        this.costKilometersGoing = costKilometersGoing;
        this.costKilometersLap = costKilometersLap;
        this.costHoursWait = costHoursWait;
        this.typeTransportModality = "Cost Kilometers";
    }

    public CostKilometers () { // constructor para crear una instancia temporal
        super();
        this.typeTransportModality = "Cost Kilometers";
    }

    public  void actualizarCampos (Contract contract, String typeOfModality, ArrayList<Vehicle> vehicles,
                                      String typeTransportModality, double costKilometersGoing, double costKilometersLap, double costHoursWait ) { // Metodo para actualizar los atributos de la clase
        super.actualizarCampos(contract, typeOfModality, vehicles, typeTransportModality);
        this.costKilometersGoing = costKilometersGoing;
        this.costKilometersLap = costKilometersLap;
        this.costHoursWait = costHoursWait;
    }

    public double getCostKilometersGoing() {
        return costKilometersGoing;
    }

    public void setCostKilometersGoing(double costKilometersGoing) {
        this.costKilometersGoing = costKilometersGoing;
    }

    public double getCostKilometersLap() {
        return costKilometersLap;
    }

    public void setCostKilometersLap(double costKilometersLap) {
        this.costKilometersLap = costKilometersLap;
    }

    public double getCostHoursWait() {
        return costHoursWait;
    }

    public void setCostHoursWait(double costHoursWait) {
        this.costHoursWait = costHoursWait;
    }

    @Override
    public void insert() throws SQLException {
        this.id = CostKilometersDAO.getInstancie().insert(this);
        this.insertVehiclesIntoTransportModality(); // Se insertan todos los vehiculos asignados como parte de esta modalidad en la base de datos
    }

    @Override
    public void update() throws SQLException {
        CostKilometersDAO.getInstancie().update(this);
    }

    //Operaciones

    public double price() {
        return this.costHoursWait + this.costKilometersGoing + this.costKilometersLap;
    }

    //Fin de Operaciones

}
