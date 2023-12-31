package logica;


public abstract class TransportModality extends Modality{
	protected Vehicle vehicle;
	protected String typeTransportModality;
	
	public TransportModality(int id, Contract contract, String typeOfModality, Vehicle vehicle,
			String typeTransportModality) { // constructor a nivel de base de datos
		super(id, contract, typeOfModality);
		this.vehicle = vehicle;
		this.typeTransportModality = typeTransportModality;
	}
	
	public TransportModality(Contract contract, Vehicle vehicle) { // constructor a nivel de logica
		super(contract);
		this.vehicle = vehicle;
		this.typeOfModality = "Transport Modality";
	}
	
	public TransportModality(Vehicle vehicle) { // constructor a nivel de logica (proceso de creacion del objeto)
		super();
		this.vehicle = vehicle;
		this.typeOfModality = "Transport Modality";
	}

	public Vehicle getVehicle() {
		return vehicle;
	}

	public int getVehicleId () {
		return this.vehicle.getId();
	}
	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}
	public String getTypeTransportModality() {
		return typeTransportModality;
	}
	public void setTypeTransportModality(String typeTransportModality) {
		this.typeTransportModality = typeTransportModality;
	}
	
	
}
