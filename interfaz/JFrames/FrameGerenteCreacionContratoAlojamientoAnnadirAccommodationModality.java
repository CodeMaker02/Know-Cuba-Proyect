package JFrames;

import java.awt.Color;

import javax.swing.JFrame;
import javax.swing.JPanel;
import JPanels.PanelCreacionContratoAlojamientoAccommodationModality;
import logica.AccommodationContract;
import logica.AccommodationModality;
import logica.HotelModality;
import logica.MealPlan;
import logica.TypeOfRoom;
import utils.ConnectionDataBase;
import utils.Operations;

import javax.swing.JLabel;
import java.awt.SystemColor;
import java.awt.Font;
import javax.swing.SwingConstants;
import javax.swing.JComboBox;
import javax.swing.JSpinner;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.SpinnerNumberModel;
import javax.swing.border.MatteBorder;
import java.awt.Cursor;

public class FrameGerenteCreacionContratoAlojamientoAnnadirAccommodationModality extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private PanelCreacionContratoAlojamientoAccommodationModality panelCreacionContratoAlojamientoAccommodationModality;
	private FrameGerenteCreacionContratoAlojamiento frameGerenteCreacionContratoAlojamiento;
	private AccommodationContract accommodationContract;
	private JComboBox <TypeOfRoom> comboBoxTypeOfRoom;
	private JComboBox <MealPlan> comboBoxMealPlan;
	private JSpinner spinnerCantDays;
	private JSpinner spinnerPrice;
	private JLabel lblAdd;
	private int mouseX, mouseY;
	private JLabel lblX;
	private JComboBox<HotelModality> comboBoxHotelModality;
	private AccommodationModality accommodationModality;
	private JLabel lblRestore;



	public FrameGerenteCreacionContratoAlojamientoAnnadirAccommodationModality(PanelCreacionContratoAlojamientoAccommodationModality am, AccommodationModality a) {
		this.panelCreacionContratoAlojamientoAccommodationModality = am;
		this.accommodationContract = this.panelCreacionContratoAlojamientoAccommodationModality.getAccommodationContract();
		this.frameGerenteCreacionContratoAlojamiento = this.panelCreacionContratoAlojamientoAccommodationModality.getFrameGerenteCreacionContratoAlojamiento();
		this.accommodationModality = a;
		
		setUndecorated(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 350);
		contentPane = new JPanel();
		contentPane.addMouseMotionListener(new MouseMotionAdapter() {
			@Override
			public void mouseDragged(MouseEvent e) {
				int x= e.getXOnScreen();
				int y= e.getYOnScreen();

				setLocation(x - mouseX , y - mouseY );
			}
		});
		contentPane.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				mouseX = e.getX();
				mouseY = e.getY();
			}
		});
		contentPane.setBorder(new MatteBorder(3, 3, 3, 3, (Color) new Color(0, 0, 0)));
		contentPane.setBackground(new Color(18, 95, 115));
		setLocationRelativeTo(null);
		setContentPane(contentPane);
		contentPane.setLayout(null);

		lblX = new JLabel("X");
		lblX.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				cerrarFrame();
			}
			@Override
			public void mouseEntered(MouseEvent e) {
				lblX.setForeground(SystemColor.red);
			}
			@Override
			public void mouseExited(MouseEvent e) {
				lblX.setForeground(SystemColor.textHighlightText);
			}
		});
		lblX.setHorizontalAlignment(SwingConstants.CENTER);
		lblX.setForeground(SystemColor.textHighlightText);
		lblX.setFont(new Font("Arial Black", Font.PLAIN, 20));
		lblX.setBackground(SystemColor.menu);
		lblX.setBounds(412, 0, 38, 38);
		contentPane.add(lblX);

		JLabel lblRoomType = new JLabel("ROOM TYPE :");
		lblRoomType.setForeground(SystemColor.textHighlightText);
		lblRoomType.setFont(new Font("Arial Black", Font.PLAIN, 16));
		lblRoomType.setBounds(72, 63, 119, 23);
		contentPane.add(lblRoomType);

		JLabel lblMealPlan = new JLabel("MEAL PLAN :");
		lblMealPlan.setForeground(SystemColor.textHighlightText);
		lblMealPlan.setFont(new Font("Arial Black", Font.PLAIN, 16));
		lblMealPlan.setBounds(72, 150, 119, 23);
		contentPane.add(lblMealPlan);

		JLabel lblNumberOfDays = new JLabel("ACCOMMODATIONS DAYS :");
		lblNumberOfDays.setForeground(SystemColor.textHighlightText);
		lblNumberOfDays.setFont(new Font("Arial Black", Font.PLAIN, 16));
		lblNumberOfDays.setBounds(72, 192, 249, 23);
		contentPane.add(lblNumberOfDays);

		JLabel lblPrice = new JLabel("PRICE :");
		lblPrice.setForeground(SystemColor.textHighlightText);
		lblPrice.setFont(new Font("Arial Black", Font.PLAIN, 16));
		lblPrice.setBounds(72, 234, 119, 23);
		contentPane.add(lblPrice);

		lblAdd = new JLabel();
		lblAdd.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		lblAdd.setText("ADD");
		lblAdd.setBorder(new MatteBorder(2, 2, 2, 2, (Color) new Color(0, 0, 0)));
		lblAdd.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				if (accommodationModality == null) { // Add
					try {
						addAccommodationModality();
						panelCreacionContratoAlojamientoAccommodationModality.actualizarTablaModalitys(); // se actualiza la informacion de las modalidades en la tabla de modalidades
						FramePrincipal.mostarFrameNotificacion("It has been added successfully the modality"); // se notifica de la accion realiza al usuario
						cerrarFrame();
					} catch (SQLException e1) {

						e1.printStackTrace();
					}
				}
				else { // Update
					try {
						updateAccommodationModality();
						panelCreacionContratoAlojamientoAccommodationModality.actualizarTablaModalitys(); // se actualiza la informacion de las modalidades en la tabla de modalidades
						FramePrincipal.mostarFrameNotificacion("It has been successfully modified the modality"); // se notifica de la accion realiza al usuario
						cerrarFrame();
					} catch (SQLException e1) {

						e1.printStackTrace();
					}
				}
			}
			@Override
			public void mouseEntered(MouseEvent e) {
			}
			@Override
			public void mouseExited(MouseEvent e) {
			}
		});
		lblAdd.setOpaque(true);
		lblAdd.setHorizontalAlignment(SwingConstants.CENTER);
		lblAdd.setFont(new Font("Arial Black", Font.PLAIN, 16));
		lblAdd.setBackground(SystemColor.info);
		lblAdd.setBounds(107, 291, 235, 35);
		contentPane.add(lblAdd);

		JLabel lblTransportationMode = new JLabel("HOTEL PLAN");
		lblTransportationMode.setForeground(SystemColor.textHighlightText);
		lblTransportationMode.setFont(new Font("Dialog", Font.BOLD, 26));
		lblTransportationMode.setBounds(31, 8, 178, 30);
		contentPane.add(lblTransportationMode);

		comboBoxTypeOfRoom = new JComboBox <TypeOfRoom>();
		comboBoxTypeOfRoom.setFont(new Font("Tahoma", Font.PLAIN, 14));
		comboBoxTypeOfRoom.setBounds(247, 64, 161, 22);
		contentPane.add(comboBoxTypeOfRoom);

		comboBoxMealPlan = new JComboBox <MealPlan>();
		comboBoxMealPlan.setFont(new Font("Tahoma", Font.PLAIN, 14));
		comboBoxMealPlan.setBounds(247, 151, 161, 22);
		contentPane.add(comboBoxMealPlan);

		spinnerCantDays = new JSpinner();
		spinnerCantDays.setFont(new Font("Tahoma", Font.PLAIN, 14));
		Operations.crearJSpinnerNumericoInteger(spinnerCantDays, new SpinnerNumberModel(Integer.valueOf(1), Integer.valueOf(1), null, Integer.valueOf(1)));
		spinnerCantDays.setBounds(325, 196, 83, 20);
		contentPane.add(spinnerCantDays);

		spinnerPrice = new JSpinner();
		spinnerPrice.setFont(new Font("Tahoma", Font.PLAIN, 14));
		Operations.crearJSpinnerNumericoDouble(spinnerPrice, new SpinnerNumberModel(Double.valueOf(1), Double.valueOf(1), null, Double.valueOf(1)));
		spinnerPrice.setBounds(308, 236, 100, 20);
		contentPane.add(spinnerPrice);

		comboBoxHotelModality = new JComboBox<HotelModality>();
		comboBoxHotelModality.setFont(new Font("Tahoma", Font.PLAIN, 14));
		comboBoxHotelModality.setBounds(247, 109, 161, 22);
		contentPane.add(comboBoxHotelModality);

		JLabel lblHotelModality = new JLabel("HOTEL MODALITY :");
		lblHotelModality.setForeground(SystemColor.textHighlightText);
		lblHotelModality.setFont(new Font("Arial Black", Font.PLAIN, 16));
		lblHotelModality.setBounds(72, 108, 178, 23);
		contentPane.add(lblHotelModality);


		this.llenarComboBoxTypeOfRoom();
		this.llenarComboBoxMealPlan();
		this.llenarComboBoxHotelModality();
		this.addComponenetes();
		this.definirTextos();
	}

	private void addComponenetes () {
		if (this.accommodationModality != null) // Update
			this.addLblRestore();
	}

	private void addLblRestore () {

		lblRestore = new JLabel("Restore");
		lblRestore.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				restoreInformation();
			}
			@Override
			public void mouseEntered(MouseEvent e) {

			}
			@Override
			public void mouseExited(MouseEvent e) {

			}
		});
		lblRestore.setForeground(SystemColor.textHighlightText);
		lblRestore.setFont(new Font("Dialog", Font.BOLD, 18));
		lblRestore.setBounds(206, 8, 76, 30);
		contentPane.add(lblRestore);
	}

	private void restoreInformation () {
		this.definirTextos();
	}

	private void definirTextos () {
		if (this.accommodationModality != null) { // Update
			this.comboBoxHotelModality.setSelectedItem(this.accommodationModality.getHotelModality());
			this.comboBoxMealPlan.setSelectedItem(this.accommodationModality.getMealPlanSelect());
			this.comboBoxTypeOfRoom.setSelectedItem(this.accommodationModality.getTypeOfModality());
			this.spinnerCantDays.setValue(this.accommodationModality.getCantDaysAccommodation());
			this.spinnerPrice.setValue(this.accommodationModality.getPrice());
			this.lblAdd.setText("UPDATE");
		}
		else // Add
			this.lblAdd.setText("ADD");
	}

	private void llenarComboBoxTypeOfRoom () {
		ArrayList<TypeOfRoom> typesOfRooms = this.accommodationContract.getTypesOfRoomsHotel(); // se obtienen los tipos de habitacion del hotel

		for (TypeOfRoom typeOfRoom : typesOfRooms) {
			this.comboBoxTypeOfRoom.addItem(typeOfRoom);
		}
	}

	private void llenarComboBoxMealPlan () {
		ArrayList<MealPlan> mealPlans = this.accommodationContract.getMealPlansHotel(); // se obtienen los planes alimenticios del hotel

		for (MealPlan mealPlan : mealPlans) {
			this.comboBoxMealPlan.addItem(mealPlan);
		}
	}

	private void llenarComboBoxHotelModality () {
		ArrayList<HotelModality> hotelsModalitys = this.accommodationContract.getHotelsModalitiesHotel(); // se obtienen las modalidades hoteleras del hotel seleccionado en el contrato de alojamiento

		for (HotelModality hotelModality : hotelsModalitys) {
			this.comboBoxHotelModality.addItem(hotelModality);
		}
	}

	private void addAccommodationModality () throws SQLException {
		if (this.accommodationContract.getId() != -1) { // si es distinto de -1 se trata de un objeto real, entonces se adiciona a la logica del negocio a la base de datos
			this.accommodationContract.addModality(new AccommodationModality(accommodationContract, (TypeOfRoom) comboBoxTypeOfRoom.getSelectedItem(), (HotelModality) this.comboBoxHotelModality.getSelectedItem(), 
					(MealPlan) comboBoxMealPlan.getSelectedItem(), 
					(Integer) spinnerCantDays.getValue(), (Double) spinnerPrice.getValue()));
		}
		else { // se forma contraria se almacena solo en la logica del negocio
			this.accommodationContract.addModalityLogic(new AccommodationModality((TypeOfRoom) comboBoxTypeOfRoom.getSelectedItem(), (MealPlan) comboBoxMealPlan.getSelectedItem(), 
					(HotelModality) this.comboBoxHotelModality.getSelectedItem(), (Integer) spinnerCantDays.getValue(), (Double) spinnerPrice.getValue()));
		}

	}

	private void updateAccommodationModality () throws SQLException {
		if (this.accommodationContract.getId() != -1) { // si es distinto de -1 se trata de un objeto real, entonces se adiciona a la logica del negocio a la base de datos
			this.accommodationContract.updateAccommodationModality(this.accommodationModality, (TypeOfRoom) comboBoxTypeOfRoom.getSelectedItem(), (HotelModality) this.comboBoxHotelModality.getSelectedItem(), 
					(MealPlan) comboBoxMealPlan.getSelectedItem(), 
					(Double) spinnerPrice.getValue(), (Integer) spinnerCantDays.getValue());
		}
		else { // se forma contraria se almacena solo en la logica del negocio
			this.accommodationContract.updateAccommodationModalityLogic(this.accommodationModality, (TypeOfRoom) comboBoxTypeOfRoom.getSelectedItem(), (HotelModality) this.comboBoxHotelModality.getSelectedItem(), 
					(MealPlan) comboBoxMealPlan.getSelectedItem(), 
					(Double) spinnerPrice.getValue(), (Integer) spinnerCantDays.getValue());
		}

	}

	private void cerrarFrame () {
		frameGerenteCreacionContratoAlojamiento.setEnabled(true); // se vuelve a habilitar el frame
		dispose(); // se cierra el frame actual
	}

}
