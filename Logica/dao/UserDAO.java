package dao;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;

import logica.User;
import utils.ConnectionDataBase;

public class UserDAO implements UserDAOInterface {
    private static UserDAO userDAO;

    // PATRON SINGLENTON
    private UserDAO() {

    }


    public static UserDAO getInstancie() {
        if (userDAO == null)
            userDAO = new UserDAO();

        return userDAO;
    }

    @Override
    public void delete(int idUser) throws SQLException {
        CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call delete_user(?)}");
        cs.setInt(1, idUser); // se define el parametro de la funcion
        cs.execute(); // se ejecuta la llamada a la funcion
        cs.close(); // se cierra la llamada a la funcion
    }

    @Override
    public User select(String userName, String password) throws SQLException {
        CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call get_user(?, ?)}");
        User user = null;
        // se definen los parametros de la funcion
        cs.setString(1, userName);
        cs.setString(2, password);
        cs.execute(); // se ejecuta la llamada a la funcion
        if (cs.getResultSet().next()) { // se situa el puntero
            if (cs.getResultSet().getInt("id_rol") == 1) // usuario con rol Administrator
                user = AdministratorDAO.getInstancie().select(cs.getResultSet().getInt("id_user"));
            else if (cs.getResultSet().getInt("id_rol") == 2)
                user = ManagerDAO.getInstancie().select(cs.getResultSet().getInt("id_user"));
            else if (cs.getResultSet().getInt("id_rol") == 3)
                user = DependentDAO.getInstancie().select(cs.getResultSet().getInt("id_user"));
            else if (cs.getResultSet().getInt("id_rol") == 4)
                user = PackageDesignerDAO.getInstancie().select(cs.getResultSet().getInt("id_user"));
        }

        cs.close(); // se cierra la llamada a la funcion

        return user;
    }


    @Override
    public User select(String userName) throws SQLException {
        CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{call get_user(?)}");
        User user = null;
        // se definen los parametros de la funcion
        cs.setString(1, userName);
        cs.execute(); // se ejecuta la llamada a la funcion
        if (cs.getResultSet().next()) { // se situa el puntero
            if (cs.getResultSet().getInt("id_rol") == 1) // usuario con rol Administrator
                user = AdministratorDAO.getInstancie().select(cs.getResultSet().getInt("id_user"));
            else if (cs.getResultSet().getInt("id_rol") == 2)
                user = ManagerDAO.getInstancie().select(cs.getResultSet().getInt("id_user"));
            else if (cs.getResultSet().getInt("id_rol") == 3)
                user = DependentDAO.getInstancie().select(cs.getResultSet().getInt("id_user"));
            else if (cs.getResultSet().getInt("id_rol") == 4)
                user = PackageDesignerDAO.getInstancie().select(cs.getResultSet().getInt("id_user"));
        }

        cs.close(); // se cierra la llamada a la funcion

        return user;
    }

    @Override
    public String changeStatePassword(int idUser, String newPassword, boolean state) throws SQLException {
        String passwordEncript = null;
        CallableStatement cs = ConnectionDataBase.getConnectionDataBase().prepareCall("{? = call change_state_password_user(?, ?, ?)}");
        // Se definen los parametros de la funcion
        cs.registerOutParameter(1, Types.VARCHAR); // se registra el parametro de retorno
        cs.setInt(2, idUser);
        cs.setBoolean(3, state);
        cs.setString(4, newPassword);
        cs.execute(); // se ejecuta la llamada a la funcion
        passwordEncript = cs.getString(1); // se obtiene el parametro de retorno de la funcion
        cs.close(); // se cierra la llamada a la funcion

        return passwordEncript;
    }

}
