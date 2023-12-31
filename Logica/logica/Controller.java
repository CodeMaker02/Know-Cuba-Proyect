package logica;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import dao.AdministratorDAO;
import dao.DependentDAO;
import dao.ManagerDAO;
import dao.PackageDesignerDAO;
import dao.RolDAO;


public class Controller {
	private static Controller controller; // Singlenton
	private User user; // atributo que representa al usuario logeado en el sistema
	private HashMap<Integer, ArrayList<User>> users; // atributo que representa los usuarios del sistema (Solo cargados con el Rol "Administrator")
	private ArrayList<Rol> roles; // atributo que representa los roles del sistema (Solo cargados con el Rol "Administrator")
	private TouristAgency touristAgency;
	private boolean confirmacion; // atributo especifico para obtener la confirmacion del usuario en las operaciones claves del sistema


	private Controller (User user) throws SQLException {
		this.user = user;
		if (this.user instanceof Administrator) {
			this.cargarUsuarios();
			this.cargarRoles();
		}
		this.touristAgency = new TouristAgency();
		
	}


	public static Controller getInstancie (User user) throws SQLException {
		if (controller == null)
			controller = new Controller(user);

		return controller;
	}

	public static Controller getInstancie ()  {

		return controller;
	}

	// Metodos de Carga de Informacion 


	public void cargarUsuarios () throws SQLException {
		this.users = new HashMap<Integer, ArrayList<User>>();
		this.users.put(User.administrator, new ArrayList<User>(AdministratorDAO.getInstancie().selectAll())); // se cargan los usuarios administradores de la base de datos
		this.users.put(User.dependent, new ArrayList<User>(DependentDAO.getInstancie().selectAll())); // se cargan los usuarios dependientes de la base de datos
		this.users.put(User.manager, new ArrayList<User>(ManagerDAO.getInstancie().selectAll())); // se cargan los usuarios managers de la base de datos
		this.users.put(User.packageDesigner, new ArrayList<User>(PackageDesignerDAO.getInstancie().selectAll())); // se cargan los usuarios diseñadores de paquete de la base de datos
	} 

	public void cargarRoles () throws SQLException {
		this.roles = new ArrayList<Rol>();
		this.roles = (ArrayList<Rol>) RolDAO.getInstancie().selectAll();
	}

	// Fin Metodos de Carga de Informacion

	// Metodos de inserccion

	public void addUser (User user) throws SQLException {
		user.insert(); // se inserta al usuario en la base de datos

		if (user instanceof Administrator) {
			this.users.get(User.administrator).add(user); // se inserta al usuario en la logica del negocio
		}
		else if (user instanceof Dependent) {
			this.users.get(User.dependent).add(user); // se inserta al usuario en la logica del negocio
		}
		else if (user instanceof Manager) {
			this.users.get(User.manager).add(user); // se inserta al usuario en la logica del negocio
		}
		else if (user instanceof PackageDesigner) {
			this.users.get(User.packageDesigner).add(user); // se inserta al usuario en la logica del negocio
		}


	}

	public void addRol (Rol rol) throws SQLException {
		rol.insert(); // se inserta el rol en la base de datos
		this.roles.add(rol);

	}

	// Fin Metodos de inserccion

	// Metodos de actualizacion

	public void updateUser (User user, String userName, String password, LocalDate stratDateConnection, LocalDate lastDateConnection, boolean isConnected) throws SQLException { // temporal
		// se actualiza la informacion del usuario a nivel de logica
		user.setUserName(userName);
		user.setPassword(password);
		if (user.getStartDateConnection() == null) user.setStartDateConnection(stratDateConnection);
		user.setLastDateConnection(lastDateConnection);
		user.setConnected(isConnected);
		user.update(); // se actualiza la informacion del usuario en la base de datos
	}


	public void updateRol (Rol rol, String name) throws SQLException {
		rol.setName(name); // se actualiza la informacion del rol a nivel de logica
		rol.update(); // se actualiza al rol en la base de datos
	}

	// Fin Metodos de actualizacion

	// Metodos de eliminacion

	public void deleteUser (User user) throws SQLException {
		user.delete(); // se elimina de la base de datos al usuario

		if (user instanceof Administrator) {
			this.users.get(User.administrator).remove(user); // se elimina de la logica del negocio al usuario
		}
		else if (user instanceof Dependent) {
			this.users.get(User.dependent).remove(user); // se elimina de la logica del negocio al usuario	
		}
		else if (user instanceof Manager) {
			this.users.get(User.manager).remove(user); // se elimina de la logica del negocio al usuario	
		}
		else if (user instanceof PackageDesigner) {
			this.users.get(User.packageDesigner).remove(user); // se elimina de la logica del negocio al usuario	
		}
	}

	public void deleteRol (Rol rol) throws SQLException {
		rol.delete(); // se elimina de la base de datos al rol
		this.roles.remove(rol); // se elimina de la logica del negocio al rol
	}

	// Fin Metodos de eliminacion

	// Metodos de obtencion de datos

	public HashMap<Integer, ArrayList<User>> getUsers() { // niguno de los tres filtros adquiere valor
		return this.users;
	}

	public ArrayList<User> getUsers (String name, int typeOfUser, boolean connected) { // si los tres filtros adquieren valor
		ArrayList<User> users = new ArrayList<User>();

		for (User user : this.users.get(typeOfUser)) {
			if (user.connected == connected && user.isSameName(name))
				users.add(user);
		}

		return users;
	}

	public ArrayList<User> getUsers (int typeOfUser) {  // si solo adquiere valor el tipo
		return this.users.get(typeOfUser);
	}

	public ArrayList<User> getUsers (String name) {  // si solo adquiere valor nombre de usuario
		ArrayList<User> users = new ArrayList<User>();

		for (Integer i : User.getKeys()) { // se recorren las llaves del mapa
			for (User user : this.users.get(i)) { // se recorre la lista de la clave del mapa
				if (user.isSameName(name))
					users.add(user);
			}
		}
		return users;
	}

	public ArrayList<User> getUsers (boolean connected) { // // si solo adquiere valor nombre de usuario
		ArrayList<User> users = new ArrayList<User>();

		// se recorre el mapa

		for (Integer i : User.getKeys()) { // se recorren las llaves del mapa
			for (User user : this.users.get(i)) { // se recorre la lista de la clave del mapa
				if (user.connected == connected)
					users.add(user);
			}
		}

		return users;
	}

	public ArrayList<User> getUsers (String name, boolean connected) { // si solo adquiere valor el nombre de usuario y el estado de la connexion
		ArrayList<User> users = new ArrayList<User>();
		// se recorre el mapa

		for (Integer i : User.getKeys()) { // se recorren las llaves del mapa
			for (User user : this.users.get(i)) { // se recorre la lista de la clave del mapa
				if (user.connected == connected && user.isSameName(name))
					users.add(user);
			}
		}


		return users;
	}

	public ArrayList<User> getUsers (String name, int typeOfUser) { // si solo adquiere valor el nombre de usuario y tipo de connexion
		ArrayList<User> users = new ArrayList<User>();
		
		for (User user : this.users.get(typeOfUser)) {
			if (user.isSameName(name))
				users.add(user);
		}
		
		return users;
	}

	public ArrayList<User> getUsers (int typeOfUser, boolean connected) { // si solo adquiere valor el tipo de usuario y el estado de la connexion
		ArrayList<User> users = new ArrayList<User>();

		for (User user : this.users.get(typeOfUser)) { // se recorre la lista de la clave typeOfUser
			if (user.connected == connected)
				users.add(user);
		}

		return users ;
	}



	// Fin Metodos de obtencion de datos



	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setUsers(HashMap<Integer, ArrayList<User>> users) {
		this.users = users;
	}

	public ArrayList<Rol> getRoles() {
		return roles;
	}

	public void setRoles(ArrayList<Rol> roles) {
		this.roles = roles;
	}

	public TouristAgency getTouristAgency() {
		return touristAgency;
	}

	public void setTouristAgency(TouristAgency touristAgency) {
		this.touristAgency = touristAgency;
	}


	public static Controller getController() {
		return controller;
	}


	public static void setController(Controller controller) {
		Controller.controller = controller;
	}


	public boolean isConfirmacion() {
		return confirmacion;
	}


	public void setConfirmacion(boolean confirmacion) {
		this.confirmacion = confirmacion;
	}
	
}
