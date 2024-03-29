package dao;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import logica.AccommodationContract;
import logica.Season;
import utils.ConnectionDataBase;

public class AccommodationContractDAO implements AccommodationContractDAOInterface {
	private static AccommodationContractDAO accommodationContractDAO;
	private HashMap<Integer, AccommodationContract> cache; // Atributo para guardar en cache cada referencia creada

	// PATRON SINGLENTON
	private AccommodationContractDAO () {
		this.cache = new HashMap<Integer, AccommodationContract>();
	}

	public static AccommodationContractDAO getInstancie () {
		if (accommodationContractDAO == null)
			accommodationContractDAO = new AccommodationContractDAO();

		return accommodationContractDAO;
	}

	@Override
	public int insert(AccommodationContract accommodationContract) throws SQLException {
		CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{? = call insert_accommodation_contract(?, ?, ?, ?, ?, ?)}");
		// Se definen los parametros de la funcion
		cs.registerOutParameter(1, Types.INTEGER); // se registra el parametro de retorno
		cs.setDate(2, Date.valueOf(accommodationContract.getStartDate()));
		cs.setDate(3, Date.valueOf(accommodationContract.getTerminationDate()));
		cs.setString(4, accommodationContract.getDescription());
		cs.setString(5, accommodationContract.getTypeOfContract());
		cs.setInt(6, accommodationContract.getProviderId());
		cs.setDouble(7, accommodationContract.getSurcharge());
		cs.execute(); // se ejecuta la consulta de llamada a la funcion
		int idInsertado = cs.getInt(1); // se obtiene el id autoincrementable generado
		cs.close(); // se cierra la llamada a la funcion

		return idInsertado;
	}

	@Override
	public void delete(int idAccommodationContract) throws SQLException {
		ContractDAO.getInstancie().delete(idAccommodationContract);
		this.cache.remove(idAccommodationContract); // Se elimina el contrato de cache
	}

	@Override
	public void update(AccommodationContract accommodationContract) throws SQLException {
		CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call update_accommodation_contract(?, ?, ?, ?, ?)}");
		// Se definen los parametros de la funcion
		cs.setDate(1, Date.valueOf(accommodationContract.getStartDate()));
		cs.setDate(2, Date.valueOf(accommodationContract.getTerminationDate()));
		cs.setString(3, accommodationContract.getDescription());
		cs.setInt(4, accommodationContract.getId());
		cs.setDouble(5, accommodationContract.getSurcharge());
		cs.execute(); // se ejecuta la consulta de llamada a la funcion
		cs.close(); // se cierra la llamada a la funcion
	}

	@Override
	public AccommodationContract select(int idAccommodationContract) throws SQLException  {
		CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call get_accommodation_contract(?)}");
		AccommodationContract accommodationContract = null;
		cs.setInt(1, idAccommodationContract); // se define el parametro de la funcion
		cs.execute(); // se ejecuta la consulta de llamada a la funcion
		if(cs.getResultSet().next()) // se situa el puntero
		accommodationContract = mapEntity(cs);
		cs.close(); // se cierra la llamada a la funcion

		return accommodationContract;
	}

	@Override
	public List<AccommodationContract> selectAll() throws SQLException  {
		List<AccommodationContract> listAccommodationContract = new ArrayList<AccommodationContract>();
		CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call get_all_accommodation_contract()}");
		cs.execute(); // se ejecuta la consulta de llamada a la funcion

		while (cs.getResultSet().next()) {
			listAccommodationContract.add(mapEntity(cs));
		}

		cs.close(); // se cierra la llamada a la funcion

		return listAccommodationContract;
	}

	@Override
	public AccommodationContract mapEntity(CallableStatement cs) throws SQLException {
		AccommodationContract accommodationContract = this.cache.get(cs.getResultSet().getInt("id_contract"));

		if (accommodationContract == null) {
			if (cs.getResultSet().getDate("contract_reconcilation_date") != null)
			accommodationContract = new AccommodationContract(cs.getResultSet().getInt("id_contract"), cs.getResultSet().getDate("contract_start_date").toLocalDate(), 
					cs.getResultSet().getDate("contract_termination_date").toLocalDate(), cs.getResultSet().getDate("contract_reconcilation_date").toLocalDate(), cs.getResultSet().getString("contract_description"), 
					HotelDAO.getInstancie().select(cs.getResultSet().getInt("hotel_id")), 
					cs.getResultSet().getBoolean("state"), cs.getResultSet().getString("type_of_contract"), 
					cs.getResultSet().getDouble("surcharge"), (ArrayList<Season>) SeasonDAO.getInstancie().selectIntoAccommodationContract(cs.getResultSet().getInt("id_contract")));
			else
				accommodationContract = new AccommodationContract(cs.getResultSet().getInt("id_contract"), cs.getResultSet().getDate("contract_start_date").toLocalDate(), 
						cs.getResultSet().getDate("contract_termination_date").toLocalDate(), null, cs.getResultSet().getString("contract_description"), 
						HotelDAO.getInstancie().select(cs.getResultSet().getInt("hotel_id")), 
						cs.getResultSet().getBoolean("state"), cs.getResultSet().getString("type_of_contract"), 
						cs.getResultSet().getDouble("surcharge"), (ArrayList<Season>) SeasonDAO.getInstancie().selectIntoAccommodationContract(cs.getResultSet().getInt("id_contract")));

			this.cache.put(accommodationContract.getId(), accommodationContract); // se almacena en cache la referencia del contrato de alojamiento
		}

		return accommodationContract;
	}
	
	

}
