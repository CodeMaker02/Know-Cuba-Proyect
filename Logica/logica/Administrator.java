package logica;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import dao.AdministratorDAO;


public class Administrator extends User {

	public Administrator(int id, String userName, String password, Rol rol, LocalDate startDateConnection,
			LocalDate lastDateConnection, boolean connected, ArrayList<Request> requests, boolean statePassword) {
		super(id, userName, password, rol, startDateConnection, lastDateConnection, connected, requests, statePassword);
		// TODO Auto-generated constructor stub
	} // constructor nivel de base de datos

	public Administrator(String userName, String password, Rol rol) {
		super( userName, password, rol);
		// TODO Auto-generated constructor stub
	} // constructor nivel de logica

	@Override
	public void update() throws SQLException {
		AdministratorDAO.getInstancie().update(this);
	}

	@Override
	public void insert() throws SQLException {
		
		this.id = AdministratorDAO.getInstancie().insert(this);
	}

	

}
