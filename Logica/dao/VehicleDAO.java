package dao;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import logica.Vehicle;
import utils.ConnectionDataBase;

public class VehicleDAO implements VehicleDAOInterface {
    private static VehicleDAO vehicleDAO;
    private HashMap<Integer, Vehicle> cache; // Atributo para guardar en cache cada referencia creada

    // PATRON SINGLENTON
    private VehicleDAO() {
        this.cache = new HashMap<Integer, Vehicle>();
    }

    public static VehicleDAO getInstancie() {
        if (vehicleDAO == null)
            vehicleDAO = new VehicleDAO();

        return vehicleDAO;
    }

    @Override
    public int insert(Vehicle vehicle) throws SQLException {
        CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{? = call insert_vehicle_into_transportation_provider(?, ?, ?, ?, ?, ?, ?)}");
        // se definen los parametros de la funcion
        cs.registerOutParameter(1, Types.INTEGER); // se registra el parametro de retorno
        cs.setString(2, vehicle.getLock());
        cs.setInt(3, vehicle.getTransportationProviderId());
        cs.setString(4, vehicle.getBrand());
        cs.setInt(5, vehicle.getCapacityWithoutLuggage());
        cs.setInt(6, vehicle.getCapacityWithLuggage());
        cs.setDate(7, Date.valueOf(vehicle.getDateOfProduction()));
        cs.setInt(8, vehicle.getTotalCapacity());
        cs.execute(); // se ejecuta la consulta de llamada a la funcion
        int idInsertado = cs.getInt(1);
        cs.close(); // se cierra la llamada a la funcion

        return idInsertado;
    }

    @Override
    public void delete(int idVehicle) throws SQLException {
        CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call delete_vehicle(?)}");
        cs.setInt(1, idVehicle); // se define el parametro de la funcion
        cs.execute(); // se ejecuta la consulta de llamada a la funcion
        cs.close(); // se cierra la llamada a la funcion
        this.cache.remove(idVehicle); // se elimina el vehiculo de cache
    }

    @Override
    public void update(Vehicle vehicle) throws SQLException {
        CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call update_vehicle(?, ?)}");
        // se definen los parametros de la funcion
        cs.setInt(1, vehicle.getId());
        cs.setString(2, vehicle.getLock());
        cs.execute(); // se ejecuta la consulta de llamada a la funcion
        cs.close(); // se cierra la llamada a la funcion

    }

    @Override
    public List<Vehicle> selectAll() throws SQLException {
        List<Vehicle> listVehicles = new ArrayList<Vehicle>();
        CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call get_all_vehicle()}");
        cs.execute(); // se ejecuta la consulta de llamada a la funcion
        // se crea la lista de vehiculos con la información obtenida de la base de datos
        while (cs.getResultSet().next()) {
            listVehicles.add(mapEntity(cs));
        }

        cs.close(); // se cierra la llamada a la funcion

        return listVehicles;
    }

    @Override
    public List<Vehicle> selectIntoTransportationProvider(int idTransportationProvider) throws SQLException {
        List<Vehicle> listVehicles = new ArrayList<Vehicle>();
        CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call get_vehicle_transportation_provider(?)}");
        cs.setInt(1, idTransportationProvider); // se define el parametro de la funcion
        cs.execute(); // se ejecuta la consulta de llamada a la funcion
        // se crea la lista de vehiculos con la información obtenida de la base de datos
        while (cs.getResultSet().next()) {
            listVehicles.add(mapEntity(cs));
        }

        cs.close(); // se cierra la llamada a la funcion

        return listVehicles;
    }


    @Override
    public Vehicle select(int idVehicle) throws SQLException {
        CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call get_vehicle(?)}");
        Vehicle vehicle = null;
        cs.setInt(1, idVehicle); // se define el parametro de la funcion
        cs.execute(); // se ejecuta la consulta de llamada a la funcion
        if (cs.getResultSet().next()) // se situa el puntero
            vehicle = mapEntity(cs);
        cs.close(); // se cierra la llamada a la funcion

        return vehicle;
    }

    @Override
    public List<Vehicle> selectIntoTransportModality(int idTransportModality) throws SQLException {
        List<Vehicle> listVehicles = new ArrayList<Vehicle>();
        CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call get_vehicle_transport_modality(?)}");
        cs.setInt(1, idTransportModality); // se define el parametro de la funcion
        cs.execute(); // se ejecuta la consulta de llamada a la funcion
        // se crea la lista de vehiculos con la información obtenida de la base de datos
        while (cs.getResultSet().next()) {
            listVehicles.add(mapEntity(cs));
        }

        cs.close(); // se cierra la llamada a la funcion

        return listVehicles;
    }

    @Override
    public void insertIntoTransportModality(int idTransportModality, int idVehicle) throws SQLException {
        CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call insert_vehicle_into_transport_modality(?, ?)}");
        // se definen los parametros de la funcion
        cs.setInt(1, idTransportModality);
        cs.setInt(2, idVehicle);
        cs.execute(); // se ejecuta la consulta de llamada a la funcion
        cs.close(); // se cierra la llamada a la funcion
    }

    @Override
    public void deleteIntoTransportModality(int idTransportModality, int idVehicle) throws SQLException {
        CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call delete_vehicle_from_transport_modality(?, ?)}");
        // se definen los parametros de la funcion
        cs.setInt(1, idTransportModality);
        cs.setInt(2, idVehicle);
        cs.execute(); // se ejecuta la consulta de llamada a la funcion
        cs.close(); // se cierra la llamada a la funcion
    }

    @Override
    public Vehicle mapEntity(CallableStatement cs) throws SQLException {
        Vehicle vehicle = this.cache.get(cs.getResultSet().getInt("id_vehicle"));

        if (vehicle == null) {
            vehicle = new Vehicle(cs.getResultSet().getInt("id_vehicle"), cs.getResultSet().getString("lock"), cs.getResultSet().getString("brand"), cs.getResultSet().getInt("transportation_provider_id"),
                    cs.getResultSet().getInt("capacity_without_luggage"), cs.getResultSet().getInt("capacity_with_luggage"), cs.getResultSet().getDate("date_of_production").toLocalDate(),
                    cs.getResultSet().getInt("total_capacity"));
            this.cache.put(vehicle.getId(), vehicle); // se alamacena la referencia del vehiculo en cache
        } else
            vehicle.actualizarCampos(cs.getResultSet().getString("lock"), cs.getResultSet().getString("brand"), cs.getResultSet().getInt("transportation_provider_id"),
                    cs.getResultSet().getInt("capacity_without_luggage"), cs.getResultSet().getInt("capacity_with_luggage"), cs.getResultSet().getDate("date_of_production").toLocalDate(),
                    cs.getResultSet().getInt("total_capacity"));

        return vehicle;
    }

}
