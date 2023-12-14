package dao;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import logica.Hotel;
import logica.MealPlan;
import logica.TypeOfRoom;
import utils.ConnectionDataBase;

public class HotelDAO implements HotelDAOInterface {
	private static HotelDAO hotelDAO;
	private HashMap<Integer, Hotel> cache; // Atributo para guardar en cache cada referencia creada

	// PATRON SINGLENTON
	private HotelDAO () {
		this.cache = new HashMap<Integer, Hotel>();
	}

	public static HotelDAO getInstancie () {
		if (hotelDAO == null)
			hotelDAO = new HotelDAO();

		return hotelDAO;
	}
	@Override
	public int insert(Hotel hotel) throws SQLException {
		CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{? = call insert_hotel(?, ?, ?, ?, ?)}");
		// se definen los parametros de la funcion
		cs.setString(1, hotel.getName());
		cs.setString(2, hotel.getHotelChain());
		cs.setString(3, hotel.getProvince());
		cs.setString(4, hotel.getAddress());
		cs.setInt(5, hotel.getHotelCategory());
		cs.execute(); // se ejecuta la consulta de llamada a la funcion
		int idInsertado = cs.getInt(1); // se obtiene el valor de retorno de la funcion
		cs.close(); // se cierra la llamada a la funcion

		return idInsertado;
	}

	@Override
	public void delete(int idHotel) throws SQLException {
		CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call delete_provider(?)}");
		cs.setInt(1, idHotel); // se define el parametro de la funcion
		cs.execute(); // se ejecuta la consulta de llamada a la funcion
		cs.close(); // se cierra la llamada a la funcion
	}

	@Override
	public void update(Hotel hotel) throws SQLException {
		CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call insert_hotel(?, ?, ?, ?, ?, ?)}");
		// se definen los parametros de la funcion
		cs.setInt(1, hotel.getId());
		cs.setString(2, hotel.getName());
		cs.setString(3, hotel.getHotelChain());
		cs.setString(4, hotel.getProvince());
		cs.setString(5, hotel.getAddress());
		cs.setInt(6, hotel.getHotelCategory());
		cs.execute(); // se ejecuta la consulta de llamada a la funcion
		cs.close(); // se cierra la llamada a la funcion
	}


	@Override
	public List<Hotel> selectAll() throws SQLException {
		List<Hotel> listHotels = new LinkedList<Hotel>();
		CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call get_all_hotel()}");
		cs.execute(); // se ejecuta la consulta de llamada a la funcion

		// se crea la lista de hoteles con la información obtenida de la base de datos
		while (cs.getResultSet().next()) {
			listHotels.add(mapEntity(cs));
		}

		cs.close(); // se cierra la llamada a la funcion

		return listHotels;
	}

	@Override
	public Hotel select(int idHotel) throws SQLException {
		CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call get_hotel(?)}");
		Hotel hotel = null;
		cs.setInt(1, idHotel); // se define el parametro de la funcion
		cs.execute(); // se ejecuta la consulta de llamada a la funcion
		if(cs.getResultSet().next()) // se situa el puntero
			hotel = mapEntity(cs);

		cs.close(); // se cierra la llamada a la funcion

		return hotel;
	}

	@Override
	public Hotel mapEntity(CallableStatement cs) throws SQLException {
		Hotel hotel = this.cache.get(cs.getResultSet().getInt("id"));

		if (hotel == null) {
			hotel = new Hotel(cs.getResultSet().getInt("id"), cs.getResultSet().getString("name"), cs.getResultSet().getString("province"),
					cs.getResultSet().getString("hotel_chain"), cs.getResultSet().getInt("hote_category"), cs.getResultSet().getString("address"), 
					(ArrayList<TypeOfRoom>)TypeOfRoomDAO.getInstancie().selectTypeOfRoomIntoHotel(cs.getResultSet().getInt("id")), (ArrayList<MealPlan>)MealPlanDAO.getInstancie().selectMealPlanIntoHotel(cs.getResultSet().getInt("id")));

			this.cache.put(hotel.getId(), hotel); // se almacena en chace la referencia del hotel
		}

		return hotel;
	}

}
