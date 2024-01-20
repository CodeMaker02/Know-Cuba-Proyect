package JPanels;

import javax.swing.JPanel;




import java.awt.Color;
import java.awt.SystemColor;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.SwingConstants;
import JFrames.FrameAdvertencia;
import JFrames.FrameDecisor;
import JFrames.FrameGerenteCreacionContratoAlojamiento;
import JFrames.FrameGerenteCreacionContratoServivio;
import JFrames.FrameGerenteCreacionContratoTransporte;
import JFrames.FramePrincipal;
import JFrames.FrameSeleccionCrearContrato;
import logica.AccommodationContract;
import logica.CarrierContract;
import logica.Contract;
import logica.Controller;
import logica.Provider;
import logica.ServiceContract;
import java.awt.BorderLayout;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import modelosTablas.ModeloTablaContract;
import utils.AusentFilter;
import utils.ConnectionDataBase;
import utils.ProviderAux;
import utils.Semaphore;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.SQLException;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.HashMap;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Cursor;
import javax.swing.border.LineBorder;
import java.awt.FlowLayout;
import javax.swing.border.MatteBorder;

import com.toedter.calendar.JDateChooser;

import javax.swing.BoxLayout;
import javax.swing.ImageIcon;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeEvent;


public class PanelGerenteCreacionContrato extends JPanel {

	private static final long serialVersionUID = 1L;
	private JPanel panelTable;
	private JScrollPane scrollPaneTable;
	private JTable tableContracts;
	private JComboBox<String> comboBoxTypeOfContrac;
	private JComboBox<String> comboBoxState;
	private JComboBox<Provider> comboBoxProvider;
	private JLabel lblNewLabel;
	private JPanel panelContenedorTable, panelStartDateConnection, panelLastDateConnection;
	private JPanel panelOpciones;
	private JPanel panelTitle;
	private JLabel lblTitleSeccion;
	private JPanel panelFiltros;
	private JPanel panelBotones;
	private JLabel lblAnnadir;
	private JLabel lblDelete;
	private JLabel lblUpdate, lblUsersStartDateConnectionMin, lblUsersStartDateConnectionMax, lblLastDateMin, lblLastDateMax;
	private JDateChooser dateChooserStratDateMin, dateChooserStratDateMax, dateChooserTerminationDateMin, dateChooserTerminationDateMax;
	private JPanel panelTypeOfContractFilter;
	private JPanel panelContractStateFilter;
	private JPanel panelProviderFilter;
	private JLabel lblRestore;
	private boolean isRestoreFilters;

	private class Eliminar extends Thread { // Hilo para la eliminacion

		public void run () {
			synchronized (Semaphore.samaphore) { 
				try {
					Semaphore.samaphore.wait(); // se duerme al hilo hasta esperar la confirmacion del usuario
					if (Controller.getInstancie().isConfirmacion()) { // si el usuario dió el consentimiento de realizar la operación
						deleteElements(); // se eliminan los elementos seleccionados
						actualizarTablaContracts(); // se actualiza la informacion de la tabla de contratos
						Controller.getInstancie().setConfirmacion(false); // se establece el estado de la confirmación por defecto
					}
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}
	}

	private void crearFrameDecisor () {
		FrameDecisor frameDecisor = new FrameDecisor(FramePrincipal.getIntancie(), "Seguro que desea eliminar");
		frameDecisor.setVisible(true);
		FramePrincipal.getIntancie().setEnabled(false); // se inhabilita el frame principal
	}

	private void crearFrameNotificacion () {
		FrameAdvertencia frameAdvertencia = new FrameAdvertencia("Han sido elimanado correctamente los contratos");
		frameAdvertencia.setVisible(true);
	}


	public PanelGerenteCreacionContrato() {
		this.isRestoreFilters = false;
		setBackground(SystemColor.inactiveCaptionBorder);
		setBounds(278, 63, 1274, 719);
		setLayout(new BorderLayout(0, 0));
		panelTitle = new JPanel();
		panelTitle.setBorder(new MatteBorder(0, 0, 2, 0, (Color) new Color(0, 0, 0)));
		panelTitle.setBackground(SystemColor.inactiveCaptionBorder);
		add(panelTitle, BorderLayout.NORTH);

		lblTitleSeccion = new JLabel("Contracts");
		lblTitleSeccion.setForeground(SystemColor.textText);
		lblTitleSeccion.setFont(new Font("Tahoma", Font.BOLD, 32));
		panelTitle.add(lblTitleSeccion);



		panelContenedorTable = new JPanel();
		panelContenedorTable.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				tableContracts.clearSelection();
				actualizarEstadoButtonDelete();
				actualizarEstadoButtonUpdate();
			}
		});
		panelContenedorTable.setBackground(new Color(5, 150, 177));
		add(panelContenedorTable);
		panelContenedorTable.setLayout(new BorderLayout(0, 0));

		panelTable = new JPanel();
		panelContenedorTable.add(panelTable);
		panelTable.setLayout(new BorderLayout(0, 0));

		scrollPaneTable = new JScrollPane();
		panelTable.add(scrollPaneTable, BorderLayout.CENTER);

		tableContracts = new JTable();
		tableContracts.setRowHeight(30);
		tableContracts.setFont(new Font("Tahoma", Font.PLAIN, 18));
		tableContracts.getTableHeader().setFont(new Font("Arial", Font.BOLD, 18));
		tableContracts.getTableHeader().setForeground(Color.black);
		tableContracts.getTableHeader().setBackground(SystemColor.black);
		tableContracts.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				actualizarEstadoButtons();
			}
		});
		tableContracts.setModel(new ModeloTablaContract());
		scrollPaneTable.setViewportView(tableContracts);
		scrollPaneTable.getViewport().setBackground(SystemColor.inactiveCaptionBorder);

		panelOpciones = new JPanel();
		panelOpciones.setBackground(new Color(18, 95, 115));
		panelContenedorTable.add(panelOpciones, BorderLayout.NORTH);
		panelOpciones.setLayout(new BorderLayout(0, 0));

		panelFiltros = new JPanel();
		FlowLayout flowLayout = (FlowLayout) panelFiltros.getLayout();
		flowLayout.setAlignment(FlowLayout.LEFT);
		panelFiltros.setBackground(new Color(18, 95, 115));
		panelOpciones.add(panelFiltros, BorderLayout.CENTER);

		panelBotones = new JPanel();
		panelBotones.setBackground(new Color(18, 95, 115));
		panelOpciones.add(panelBotones, BorderLayout.EAST);

		lblAnnadir = new JLabel("");
		lblAnnadir.setOpaque(true);
		lblAnnadir.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		lblAnnadir.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				FrameSeleccionCrearContrato frameSeleccionCrearContrato = new FrameSeleccionCrearContrato(PanelGerenteCreacionContrato.this);
				frameSeleccionCrearContrato.setVisible(true);
				FramePrincipal.getIntancie().setEnabled(false); // se inhabilita el frame principal
			}
			@Override
			public void mouseEntered(MouseEvent e) {
				if (lblAnnadir.isEnabled()) 
					lblAnnadir.setBackground(SystemColor.activeCaptionBorder);
			}
			@Override
			public void mouseExited(MouseEvent e) {
				if (lblAnnadir.isEnabled()) 
					lblAnnadir.setBackground(new Color(18, 95, 115));
			}
		});
		lblAnnadir.setIcon(new ImageIcon(PanelGerenteCreacionContrato.class.getResource("/images/Plus.png")));
		lblAnnadir.setHorizontalAlignment(SwingConstants.CENTER);
		lblAnnadir.setFont(new Font("Arial Black", Font.PLAIN, 11));
		lblAnnadir.setBackground(new Color(18, 95, 115));
		panelBotones.add(lblAnnadir);

		lblDelete = new JLabel("");
		lblDelete.setOpaque(true);
		lblDelete.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		lblDelete.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				if (lblDelete.isEnabled()) {
					Eliminar eliminar = new Eliminar(); // se crea el nuevo hilo
					eliminar.start(); // se ejecuta el nuevo hilo
					crearFrameDecisor(); // se crea el frame decisor, donde el usuario dará su confirmación

				}
			}
			@Override
			public void mouseEntered(MouseEvent e) {
				if (lblDelete.isEnabled()) 
					lblDelete.setBackground(SystemColor.activeCaptionBorder);
			}
			@Override
			public void mouseExited(MouseEvent e) {
				if (lblDelete.isEnabled()) 
					lblDelete.setBackground(new Color(18, 95, 115));
			}
		});
		lblDelete.setIcon(new ImageIcon(PanelGerenteCreacionContrato.class.getResource("/images/Trash.png")));
		lblDelete.setHorizontalAlignment(SwingConstants.CENTER);
		lblDelete.setFont(new Font("Arial Black", Font.PLAIN, 11));
		lblDelete.setBackground(new Color(18, 95, 115));
		panelBotones.add(lblDelete);

		lblUpdate = new JLabel("");
		lblUpdate.setOpaque(true);
		lblUpdate.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		lblUpdate.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				if (lblUpdate.isEnabled()) {
					Contract contract = ((ModeloTablaContract) tableContracts.getModel()).getElement(tableContracts.getSelectedRow()); // se obtiene el contrato seleccionado
					JFrame frameUpdate = null;
					if (contract instanceof ServiceContract) 
						frameUpdate = new FrameGerenteCreacionContratoServivio(PanelGerenteCreacionContrato.this, (ServiceContract) contract);  // se crea una instancia del frame de update para el contrato de servicio

					else if (contract instanceof CarrierContract) 
						frameUpdate = new FrameGerenteCreacionContratoTransporte(PanelGerenteCreacionContrato.this, (CarrierContract) contract); // se crea una instancia del frame de update para el contrato de transporte

					else if (contract instanceof AccommodationContract)
						frameUpdate = new FrameGerenteCreacionContratoAlojamiento(PanelGerenteCreacionContrato.this, (AccommodationContract) contract); // se crea una instancia del frame de update para el contrato de alojamiento

					frameUpdate.setVisible(true);
					FramePrincipal.getIntancie().setEnabled(false); // se inhabilita el frame principal

				}
			}
			@Override
			public void mouseEntered(MouseEvent e) {
				if (lblUpdate.isEnabled()) 
					lblUpdate.setBackground(SystemColor.activeCaptionBorder);
			}
			@Override
			public void mouseExited(MouseEvent e) {
				if (lblUpdate.isEnabled()) 
					lblUpdate.setBackground(new Color(18, 95, 115));
			}
		});
		lblUpdate.setIcon(new ImageIcon(PanelGerenteCreacionContrato.class.getResource("/images/Edit.png")));
		lblUpdate.setHorizontalAlignment(SwingConstants.CENTER);
		lblUpdate.setFont(new Font("Arial Black", Font.PLAIN, 11));
		lblUpdate.setBackground(new Color(18, 95, 115));
		panelBotones.add(lblUpdate);


		this.addFiltres();
		this.actualizarEstadoButtonDelete();
		this.actualizarEstadoButtonUpdate();
		this.actualizarTablaContracts(); // se actualiza la informacion de la tabla de contratos
	}

	private void llenarComboBoxProviders () {
		HashMap<Integer, ArrayList<Provider>> providers = Controller.getInstancie().getTouristAgency().getProviders(); // se obtienen todos los provedores del sistema
		ArrayList<Integer> keys = Provider.getKeys(); // se obtienen las llaves del mapa

		comboBoxProvider.addItem(new ProviderAux("All"));
		// Se itera el mapa
		for (Integer i : keys) {
			for (Provider provider : providers.get(i)) { // se itera la lista correspondiente a cada clave del mapa
				comboBoxProvider.addItem(provider);
			}
		}

	}

	private void llenarComboboxStateContract () {
		comboBoxState.addItem("All");
		comboBoxState.addItem("Close");
		comboBoxState.addItem("In Procesing");
	}


	private void llenarComboBoxTypeOfContract () {
		comboBoxTypeOfContrac.addItem("All");
		comboBoxTypeOfContrac.addItem("Accommodation Contract");
		comboBoxTypeOfContrac.addItem("Service Contract");
		comboBoxTypeOfContrac.addItem("Carrier Contract");
	}

	private void actualizarEstadoButtons () {
		this.actualizarEstadoButtonDelete();
		this.actualizarEstadoButtonUpdate();
	}

	private void actualizarEstadoButtonDelete () {
		if (tableContracts.getSelectedRowCount() != 0)
			lblDelete.setEnabled(true);
		else
			lblDelete.setEnabled(false);
	}

	private void actualizarEstadoButtonUpdate () {
		if (tableContracts.getSelectedRowCount() != 0)
			lblUpdate.setEnabled(true);
		else
			lblUpdate.setEnabled(false);
	}

	private void addFiltres () {

		panelTypeOfContractFilter = new JPanel();
		panelTypeOfContractFilter.setBackground(new Color(18, 95, 115));
		panelFiltros.add(panelTypeOfContractFilter);
		panelTypeOfContractFilter.setLayout(new BoxLayout(panelTypeOfContractFilter, BoxLayout.Y_AXIS));

		panelContractStateFilter = new JPanel();
		panelContractStateFilter.setBackground(new Color(18, 95, 115));
		panelFiltros.add(panelContractStateFilter);

		panelProviderFilter = new JPanel();
		panelProviderFilter.setBackground(new Color(18, 95, 115));
		panelFiltros.add(panelProviderFilter);

		panelStartDateConnection = new JPanel();
		panelStartDateConnection.setBackground(new Color(18, 95, 115));
		panelFiltros.add(panelStartDateConnection);
		panelStartDateConnection.setLayout(new BoxLayout(panelStartDateConnection, BoxLayout.Y_AXIS));

		lblUsersStartDateConnectionMin = new JLabel("Start Date Min:");
		lblUsersStartDateConnectionMin.setHorizontalAlignment(SwingConstants.CENTER);
		lblUsersStartDateConnectionMin.setForeground(SystemColor.textHighlightText);
		lblUsersStartDateConnectionMin.setFont(new Font("Dialog", Font.BOLD, 21));
		panelStartDateConnection.add(lblUsersStartDateConnectionMin);

		dateChooserStratDateMin = new JDateChooser();
		dateChooserStratDateMin.addPropertyChangeListener(new PropertyChangeListener() {
			public void propertyChange(PropertyChangeEvent e) {
				if (e.getPropertyName().equals("date"))
					actualizarTablaContracts(); // se actualiza la informacion de los contratos
			}
		});

		panelStartDateConnection.add(dateChooserStratDateMin);

		lblUsersStartDateConnectionMax = new JLabel("Start Date Max:");
		lblUsersStartDateConnectionMax.setHorizontalAlignment(SwingConstants.CENTER);
		lblUsersStartDateConnectionMax.setForeground(SystemColor.textHighlightText);
		lblUsersStartDateConnectionMax.setFont(new Font("Dialog", Font.BOLD, 21));
		panelStartDateConnection.add(lblUsersStartDateConnectionMax);

		dateChooserStratDateMax = new JDateChooser();
		dateChooserStratDateMax.addPropertyChangeListener(new PropertyChangeListener() {
			public void propertyChange(PropertyChangeEvent e) {
				if (e.getPropertyName().equals("date"))
					actualizarTablaContracts(); // se actualiza la informacion de los contratos
			}
		});

		panelStartDateConnection.add(dateChooserStratDateMax);

		panelLastDateConnection = new JPanel();
		panelLastDateConnection.setBackground(new Color(18, 95, 115));
		panelFiltros.add(panelLastDateConnection);
		panelLastDateConnection.setLayout(new BoxLayout(panelLastDateConnection, BoxLayout.Y_AXIS));

		lblLastDateMin = new JLabel("Termination Date Min:");
		lblLastDateMin.setHorizontalAlignment(SwingConstants.CENTER);
		lblLastDateMin.setForeground(SystemColor.textHighlightText);
		lblLastDateMin.setFont(new Font("Dialog", Font.BOLD, 21));
		panelLastDateConnection.add(lblLastDateMin);

		dateChooserTerminationDateMin = new JDateChooser();
		dateChooserTerminationDateMin.addPropertyChangeListener(new PropertyChangeListener() {
			public void propertyChange(PropertyChangeEvent e) {
				if (e.getPropertyName().equals("date"))
					actualizarTablaContracts(); // se actualiza la informacion de los contratos
			}
		});

		panelLastDateConnection.add(dateChooserTerminationDateMin);

		lblLastDateMax = new JLabel("Termination Date Max:");
		lblLastDateMax.setHorizontalAlignment(SwingConstants.CENTER);
		lblLastDateMax.setForeground(SystemColor.textHighlightText);
		lblLastDateMax.setFont(new Font("Dialog", Font.BOLD, 21));
		panelLastDateConnection.add(lblLastDateMax);

		dateChooserTerminationDateMax = new JDateChooser();
		dateChooserTerminationDateMax.addPropertyChangeListener(new PropertyChangeListener() {
			public void propertyChange(PropertyChangeEvent e) {
				if (e.getPropertyName().equals("date"))
					actualizarTablaContracts(); // se actualiza la informacion de los contratos
			}
		});

		panelLastDateConnection.add(dateChooserTerminationDateMax);

		lblRestore = new JLabel("  Restore");
		lblRestore.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				restoreFilters();
			}
		});
		lblRestore.setHorizontalAlignment(SwingConstants.LEFT);
		lblRestore.setForeground(SystemColor.textHighlightText);
		lblRestore.setFont(new Font("Dialog", Font.BOLD, 21));
		panelFiltros.add(lblRestore);



		this.addTypeOfContractFilter();
		this.addContractStateFilter();
		this.addProviderFilter();


	}

	private void deleteElements () {
		try {
			deleteElementsTable(); // se eliminan los elementos seleccionados
			ConnectionDataBase.commit(); // se confirman las operaciones realizadas a la base de datos
			crearFrameNotificacion(); // se crea el frame que notifica que la operacion han sido efectuados con exito
		} catch (SQLException e) {
			try {
				ConnectionDataBase.roolback(); // se cancelan las operaciones realizadas a la base de datos
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}  
			e.printStackTrace();
		}
	}

	private void restoreFilters () {
		this.isRestoreFilters = true; // se define el estado de restuaracion de los filtros para evitar llamadas innecesarias a los metodos de actualizar
		// Se restuaran los filtros por defecto
		this.comboBoxProvider.setSelectedIndex(0);
		this.comboBoxState.setSelectedIndex(0);
		this.comboBoxTypeOfContrac.setSelectedIndex(0);
		this.dateChooserStratDateMax.setDate(null);
		this.dateChooserStratDateMin.setDate(null);
		this.dateChooserTerminationDateMax.setDate(null);
		this.dateChooserTerminationDateMin.setDate(null);
		this.isRestoreFilters = false; // se notifica de la finalizacion del proceso de restauracion
		this.actualizarTablaContracts(); // se actualiza la información de la tabla de contratos
	}

	private void addTypeOfContractFilter () {
		comboBoxTypeOfContrac = new JComboBox<String>();
		comboBoxTypeOfContrac.setFont(new Font("Dialog", Font.PLAIN, 21));
		comboBoxTypeOfContrac.setBorder(new LineBorder(new Color(0, 0, 0)));
		this.llenarComboBoxTypeOfContract();
		comboBoxTypeOfContrac.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				actualizarTablaContracts(); // se actualiza la información de la tabla de contratos
			}
		});

		JLabel lblTypeOfContract = new JLabel("Type Of Contract");
		lblTypeOfContract.setForeground(SystemColor.textHighlightText);
		lblTypeOfContract.setHorizontalAlignment(SwingConstants.LEFT);
		lblTypeOfContract.setFont(new Font("Dialog", Font.BOLD, 21));
		lblTypeOfContract.setBounds(61, 24, 138, 14);
		panelTypeOfContractFilter.add(lblTypeOfContract);
		comboBoxTypeOfContrac.setBounds(61, 49, 138, 22);
		panelTypeOfContractFilter.add(comboBoxTypeOfContrac);
	}

	private void addContractStateFilter () {
		panelContractStateFilter.setLayout(new BoxLayout(panelContractStateFilter, BoxLayout.Y_AXIS));
		JLabel lblNewLabel_1 = new JLabel("Contract State");
		lblNewLabel_1.setForeground(SystemColor.textHighlightText);
		lblNewLabel_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_1.setFont(new Font("Dialog", Font.BOLD, 21));
		lblNewLabel_1.setBounds(522, 24, 119, 14);
		panelContractStateFilter.add(lblNewLabel_1);

		comboBoxState = new JComboBox<String>();
		comboBoxState.setFont(new Font("Dialog", Font.PLAIN, 21));
		comboBoxState.setBorder(new LineBorder(new Color(0, 0, 0)));
		this.llenarComboboxStateContract();
		comboBoxState.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				actualizarTablaContracts(); // se actualiza la información de la tabla de contratos
			}
		});
		comboBoxState.setBounds(522, 49, 119, 22);
		panelContractStateFilter.add(comboBoxState);
	}

	private void addProviderFilter () {
		comboBoxProvider = new JComboBox<Provider>();
		comboBoxProvider.setFont(new Font("Dialog", Font.PLAIN, 21));
		comboBoxProvider.setBorder(new LineBorder(new Color(0, 0, 0)));
		this.llenarComboBoxProviders();
		comboBoxProvider.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				actualizarTablaContracts(); // se actualiza la información de la tabla de contratos
			}
		});
		panelProviderFilter.setLayout(new BoxLayout(panelProviderFilter, BoxLayout.Y_AXIS));

		lblNewLabel = new JLabel("Provider");
		lblNewLabel.setForeground(SystemColor.textHighlightText);
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setFont(new Font("Dialog", Font.BOLD, 21));
		lblNewLabel.setBounds(301, 24, 119, 14);
		panelProviderFilter.add(lblNewLabel);
		comboBoxProvider.setBounds(301, 49, 119, 22);
		panelProviderFilter.add(comboBoxProvider);
	}


	public void actualizarTablaContracts () {

		this.actualizarTablaContracts(Controller.getInstancie().getTouristAgency().getContracts(this.definirTypeContract(), 
				(this.comboBoxProvider.getSelectedItem() instanceof ProviderAux) ? null : (Provider) this.comboBoxProvider.getSelectedItem(), 
						this.definirStateContract(), (this.dateChooserStratDateMin.getDate() != null) ? this.dateChooserStratDateMin.getDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate() : null, 
								(this.dateChooserStratDateMax.getDate() != null) ? this.dateChooserStratDateMax.getDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate() : null, 
										(this.dateChooserTerminationDateMin.getDate() != null) ? this.dateChooserTerminationDateMin.getDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate() : null, 
												(this.dateChooserTerminationDateMax.getDate() != null) ? this.dateChooserTerminationDateMax.getDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate() : null));
		this.actualizarEstadoButtons();


	}

	private int definirTypeContract () { // Metodo para definir el tipo de contrato seleccionado
		int typeContract = 0;
		String typeContractSelected = (String) this.comboBoxTypeOfContrac.getSelectedItem();

		if (typeContractSelected.equalsIgnoreCase("Accommodation Contract"))
			typeContract = Contract.accommodationContract; // se define el tipo como contrato de alojamiento
		else if (typeContractSelected.equalsIgnoreCase("Service Contract"))
			typeContract = Contract.serviceContract; // se define el tipo como contrato de servicio
		else if (typeContractSelected.equalsIgnoreCase("Carrier Contract"))
			typeContract = Contract.carrierContract; // se define el tipo como contrato de transporte
		else
			typeContract = -1;

		return typeContract;
	}


	private int definirStateContract () {
		int stateContract = 0;
		String state = (String) this.comboBoxState.getSelectedItem();
		if (state.equalsIgnoreCase("All"))
			stateContract = AusentFilter.stateLess;
		else if (state.equalsIgnoreCase("Close"))
			stateContract = Contract.closeState;
		else if (state.equalsIgnoreCase("In Procesing"))
			stateContract = Contract.earringState;

		return stateContract;

	}


	private void actualizarTablaContracts(HashMap<Integer, ArrayList<Contract>> contracts){
		ArrayList<Integer> keys = Contract.getKeys(); // se obtienen las cavles del mapa
		reiniciarTable(this.tableContracts);

		for (Integer k : keys) {
			for (Contract contract : contracts.get(k)) {
				((ModeloTablaContract) tableContracts.getModel()).addElement(contract);
			}
		}
	}




	public void deleteElementsTable () throws SQLException {
		int [] rows = tableContracts.getSelectedRows();

		for (int i = 0; i < rows.length; i++) {
			Controller.getInstancie().getTouristAgency().deleteContract(((ModeloTablaContract) tableContracts.getModel()).getElement(rows[i])); // se elimina el contrato de la base de datos y de la logica del negocio
		}

		this.actualizarTablaContracts();
	}

	private void reiniciarTable(JTable table){

		for(int i=0;table.getRowCount()!=0;i++){
			i=0;
			((ModeloTablaContract) table.getModel()).deleteElement(i);
		}
	}
}
