package logica;

import java.sql.SQLException;

import dao.VehicleDAO;

public class Vehicle implements DUILogic {
	private int id;
	private String lock;
	private int transportationProviderId;

	public Vehicle(int id,String lock, int transportationProviderId) { // Constructor a nivel de base de datos
		this.id = id;
		this.lock = lock;
		this.transportationProviderId = transportationProviderId;
	}

	public Vehicle(String lock, int transportationProviderId) { // Constructor a nivel de logica
		this.lock = lock;
		this.transportationProviderId = transportationProviderId;
	}

	public Vehicle(String lock) { // Constructor Temporal
		this.lock = lock;
	}

	public String getLock() {
		return lock;
	}

	public void setLock(String lock) {
		this.lock = lock;
	}

	public int getTransportationProviderId() {
		return transportationProviderId;
	}

	public void setTransportationProviderId(int transportationProviderId) {
		this.transportationProviderId = transportationProviderId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public void insert() throws SQLException {
		this.id = VehicleDAO.getInstancie().insert(this);
	}

	@Override
	public void update() throws SQLException {
		VehicleDAO.getInstancie().update(this);
	}

	@Override
	public void delete() throws SQLException {
		VehicleDAO.getInstancie().delete(this.id);
	}

	public String toString () { // Metodo para definir como se va a mostrar la informacion de la clase
		return this.lock;
	}

}
