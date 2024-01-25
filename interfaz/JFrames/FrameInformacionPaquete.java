package JFrames;

import java.awt.Color;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import logica.Controller;
import logica.Modality;
import logica.TouristPackage;
import utils.ConnectionDataBase;
import javax.swing.JLabel;
import java.awt.Font;
import java.awt.SystemColor;
import javax.swing.SwingConstants;
import javax.swing.ImageIcon;
import java.awt.Cursor;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;
import java.sql.SQLException;
import java.time.ZoneId;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;
import javax.swing.JSpinner;
import com.toedter.calendar.JDateChooser;
import JPanels.PanelDisennadorPaqueteTuristicoModalidadAlojamientoAnnadir;
import JPanels.PanelDisennadorPaqueteTuristicoModalidadServicioAnnadir;
import JPanels.PanelDisennadorPaqueteTuristicoModalidadTransporteAnnadir;
import JPanels.PanelGestionPaquetesTuristicos;

import javax.swing.JTextPane;
import java.awt.Insets;
import javax.swing.JSeparator;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeEvent;
import javax.swing.border.MatteBorder;
import javax.swing.SpinnerNumberModel;

public class FrameInformacionPaquete extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JLabel lblOperation;
	private JLabel lblModalities;
	private JLabel lblAccommodationModalitys;
	private JLabel lblTransportModalitys;
	private JLabel lblServiceModalitys;
	private JPanel panelInformacionPaquetes;
	private JLabel lblTitleFrame;
	private TouristPackage touristPackage;
	private JLabel lblName;
	private JTextField textFieldName;
	private JLabel lblX;
	private int mouseX, mouseY;
	private JDateChooser dateChooserTerminationDate;
	private JDateChooser dateChooserStratDate;
	private JSpinner spinnerCantPax;
	private PanelGestionPaquetesTuristicos panelGestionPaquetesTuristicos;


	public TouristPackage getTouristPackage() {
		return touristPackage;
	}



	public void setTouristPackage(TouristPackage touristPackage) {
		this.touristPackage = touristPackage;
	}


	public JPanel getPanelInformacionPaquetes() {
		return panelInformacionPaquetes;
	}



	public void setPanelInformacionPaquetes(JPanel panelInformacionPaquetes) {
		this.panelInformacionPaquetes = panelInformacionPaquetes;
	}



	public FrameInformacionPaquete(PanelGestionPaquetesTuristicos p, TouristPackage t) {
		this.touristPackage = t;
		this.panelGestionPaquetesTuristicos = p;
		setUndecorated(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 971, 591);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
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
		setContentPane(contentPane);
		contentPane.setLayout(null);
		setLocationRelativeTo(null);
		panelInformacionPaquetes = new JPanel();
		panelInformacionPaquetes.setBorder(new MatteBorder(3, 3, 3, 3, (Color) new Color(0, 0, 0)));
		panelInformacionPaquetes.setBounds(0, 0, 971, 591);
		panelInformacionPaquetes.setBackground(new Color(18, 95, 115));
		contentPane.add(panelInformacionPaquetes);
		panelInformacionPaquetes.setLayout(null);

		lblModalities = new JLabel("MODALITIES ");
		lblModalities.setForeground(SystemColor.textHighlightText);
		lblModalities.setFont(new Font("Arial Black", Font.PLAIN, 19));
		lblModalities.setBounds(410, 132, 151, 30);
		panelInformacionPaquetes.add(lblModalities);

		lblX = new JLabel("X");
		lblX.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				if (touristPackage.getId() != -1) { // Update
					try {
						ConnectionDataBase.roolback(); // se cancelan las operaciones realizadas en la base de datos
						touristPackage.actualizarDatos(); // se actualizan los datos del paquete turistico para evitar inconsistencias
					} catch (SQLException e1) {
						e1.printStackTrace();
					}

				}
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
		lblX.setBounds(933, 0, 38, 38);
		panelInformacionPaquetes.add(lblX);

		lblAccommodationModalitys = new JLabel("");
		lblAccommodationModalitys.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				cambioDePanel(new PanelDisennadorPaqueteTuristicoModalidadAlojamientoAnnadir(FrameInformacionPaquete.this));
			}
			@Override
			public void mouseEntered(MouseEvent e) {

			}
			@Override
			public void mouseExited(MouseEvent e) {

			}
		});
		lblAccommodationModalitys.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		lblAccommodationModalitys.setIcon(new ImageIcon(FrameInformacionPaquete.class.getResource("/images/Home Page.png")));
		lblAccommodationModalitys.setOpaque(true);
		lblAccommodationModalitys.setHorizontalAlignment(SwingConstants.CENTER);
		lblAccommodationModalitys.setBackground(new Color(18, 95, 115));
		lblAccommodationModalitys.setBounds(134, 192, 109, 87);
		panelInformacionPaquetes.add(lblAccommodationModalitys);

		lblTransportModalitys = new JLabel("");
		lblTransportModalitys.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				cambioDePanel(new PanelDisennadorPaqueteTuristicoModalidadTransporteAnnadir(FrameInformacionPaquete.this));
			}
			@Override
			public void mouseEntered(MouseEvent e) {

			}
			@Override
			public void mouseExited(MouseEvent e) {

			}
		});
		lblTransportModalitys.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		lblTransportModalitys.setIcon(new ImageIcon(FrameInformacionPaquete.class.getResource("/images/Car.png")));
		lblTransportModalitys.setOpaque(true);
		lblTransportModalitys.setHorizontalAlignment(SwingConstants.CENTER);
		lblTransportModalitys.setBackground(new Color(18, 95, 115));
		lblTransportModalitys.setBounds(712, 192, 181, 87);
		panelInformacionPaquetes.add(lblTransportModalitys);

		lblServiceModalitys = new JLabel("");
		lblServiceModalitys.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				if (touristPackage.verificarIntervaloFecha()) // se verifica que las fechas seleccionadas sean correctas
					cambioDePanel(new PanelDisennadorPaqueteTuristicoModalidadServicioAnnadir(FrameInformacionPaquete.this));
			}
			@Override
			public void mouseEntered(MouseEvent e) {

			}
			@Override
			public void mouseExited(MouseEvent e) {

			}
		});
		lblServiceModalitys.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		lblServiceModalitys.setIcon(new ImageIcon(FrameInformacionPaquete.class.getResource("/images/Food Service.png")));
		lblServiceModalitys.setOpaque(true);
		lblServiceModalitys.setHorizontalAlignment(SwingConstants.CENTER);
		lblServiceModalitys.setBackground(new Color(18, 95, 115));
		lblServiceModalitys.setBounds(395, 192, 181, 87);
		panelInformacionPaquetes.add(lblServiceModalitys);

		lblOperation = new JLabel();
		lblOperation.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {

				if (verificarCampos()) {

					if (touristPackage.getId() == -1) { // add
						try {
							addTouristPackage();
							ConnectionDataBase.getConnectionDataBase().commit(); // se confirman las operaciones realizadas en la base de datos
							FramePrincipal.mostarFrameNotificacion("Se ha añadido correctamente el paquete");
							panelGestionPaquetesTuristicos.actualizarPanelPaquetes(); // se actualiza la informacion de los paquetes turisticos
							cerrarFrame(); // se cierra el frame actual
						} catch (SQLException e1) {
							try {
								ConnectionDataBase.getConnectionDataBase().rollback(); // se cancelan los cambios realizados a la base de datos
							} catch (SQLException e2) {

								e2.printStackTrace();
							} 
							e1.printStackTrace();
						}
					}
					else { // update
						try {
							updateTouristPackage();
							ConnectionDataBase.getConnectionDataBase().commit(); // se confirman las operaciones realizadas en la base de datos
							FramePrincipal.mostarFrameNotificacion("Se ha modficado correctamente la información del paquete turistico");
							panelGestionPaquetesTuristicos.actualizarPanelPaquetes(); // se actualiza la informacion de los paquetes turisticos
							cerrarFrame(); // se cierra el frame actual
						} catch (SQLException e1) {
							try {
								ConnectionDataBase.getConnectionDataBase().rollback(); // se cancelan los cambios realizados a la base de datos
							} catch (SQLException e2) {
								e2.printStackTrace();
							} 
							e1.printStackTrace();
						}
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
		lblOperation.setOpaque(true);
		lblOperation.setHorizontalAlignment(SwingConstants.CENTER);
		lblOperation.setFont(new Font("Arial Black", Font.PLAIN, 11));
		lblOperation.setBackground(SystemColor.info);
		lblOperation.setBounds(368, 525, 235, 35);
		panelInformacionPaquetes.add(lblOperation);

		lblTitleFrame = new JLabel();
		lblTitleFrame.setForeground(SystemColor.textHighlightText);
		lblTitleFrame.setFont(new Font("Dialog", Font.BOLD, 26));
		lblTitleFrame.setBounds(27, 11, 477, 30);
		panelInformacionPaquetes.add(lblTitleFrame);

		lblName = new JLabel("Name");
		lblName.setHorizontalAlignment(SwingConstants.LEFT);
		lblName.setForeground(SystemColor.textHighlightText);
		lblName.setFont(new Font("Arial Black", Font.PLAIN, 19));
		lblName.setBounds(10, 53, 71, 30);
		panelInformacionPaquetes.add(lblName);

		textFieldName = new JTextField();
		textFieldName.setBounds(10, 83, 170, 20);
		panelInformacionPaquetes.add(textFieldName);
		textFieldName.setColumns(10);

		JLabel lblCantpax = new JLabel("Cant.PAX");
		lblCantpax.setHorizontalAlignment(SwingConstants.LEFT);
		lblCantpax.setForeground(SystemColor.textHighlightText);
		lblCantpax.setFont(new Font("Arial Black", Font.PLAIN, 19));
		lblCantpax.setBounds(237, 52, 109, 30);
		panelInformacionPaquetes.add(lblCantpax);

		spinnerCantPax = new JSpinner();
		spinnerCantPax.setModel(new SpinnerNumberModel(Integer.valueOf(0), Integer.valueOf(0), null, Integer.valueOf(1)));
		spinnerCantPax.setBounds(237, 83, 109, 20);
		panelInformacionPaquetes.add(spinnerCantPax);

		JLabel lblStartDate = new JLabel("Start Date");
		lblStartDate.setHorizontalAlignment(SwingConstants.LEFT);
		lblStartDate.setForeground(SystemColor.textHighlightText);
		lblStartDate.setFont(new Font("Arial Black", Font.PLAIN, 19));
		lblStartDate.setBounds(418, 53, 109, 30);
		panelInformacionPaquetes.add(lblStartDate);

		dateChooserStratDate = new JDateChooser();
		dateChooserStratDate.setFont(new Font("Dialog", Font.PLAIN, 13));
		dateChooserStratDate.addPropertyChangeListener(new PropertyChangeListener() {
			public void propertyChange(PropertyChangeEvent e) {
				if (e.getPropertyName().equals("date"))
					touristPackage.setStartDate(dateChooserStratDate.getDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate());

			}
		});
		dateChooserStratDate.setBounds(417, 83, 134, 20);
		panelInformacionPaquetes.add(dateChooserStratDate);

		JLabel lblTermintationDate = new JLabel("Termintation Date");
		lblTermintationDate.setHorizontalAlignment(SwingConstants.LEFT);
		lblTermintationDate.setForeground(SystemColor.textHighlightText);
		lblTermintationDate.setFont(new Font("Arial Black", Font.PLAIN, 19));
		lblTermintationDate.setBounds(612, 53, 203, 30);
		panelInformacionPaquetes.add(lblTermintationDate);

		dateChooserTerminationDate = new JDateChooser();
		dateChooserTerminationDate.setFont(new Font("Dialog", Font.PLAIN, 13));
		dateChooserTerminationDate.addPropertyChangeListener(new PropertyChangeListener() {
			public void propertyChange(PropertyChangeEvent e) {
				if (e.getPropertyName().equals("date"))
					touristPackage.setTerminationDate(dateChooserTerminationDate.getDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate());
			}
		});
		dateChooserTerminationDate.setBounds(646, 83, 134, 20);
		panelInformacionPaquetes.add(dateChooserTerminationDate);

		JTextPane textPaneDescription = new JTextPane();
		textPaneDescription.setMargin(new Insets(8, 8, 8, 8));
		textPaneDescription.setForeground(SystemColor.textText);
		textPaneDescription.setFont(new Font("Dialog", Font.PLAIN, 18));
		textPaneDescription.setBorder(new LineBorder(new Color(0, 0, 0)));
		textPaneDescription.setBackground(SystemColor.inactiveCaptionBorder);
		textPaneDescription.setBounds(10, 331, 951, 168);
		panelInformacionPaquetes.add(textPaneDescription);

		JLabel lblDescription = new JLabel("DESCRIPTION");
		lblDescription.setForeground(SystemColor.textHighlightText);
		lblDescription.setFont(new Font("Dialog", Font.BOLD, 18));
		lblDescription.setBounds(27, 290, 124, 30);
		panelInformacionPaquetes.add(lblDescription);

		JSeparator separator = new JSeparator();
		separator.setForeground(SystemColor.textText);
		separator.setBackground(SystemColor.textText);
		separator.setBounds(0, 288, 971, 2);
		panelInformacionPaquetes.add(separator);

		JSeparator separator_1 = new JSeparator();
		separator_1.setForeground(SystemColor.textText);
		separator_1.setBackground(SystemColor.textText);
		separator_1.setBounds(0, 173, 971, 2);
		panelInformacionPaquetes.add(separator_1);



		this.definirTexto();

	}



	private void definirTexto () {
		this.definirTextoLblTitle();
		this.definirTextoLblOperation();
	}

	private void definirTextoLblTitle () {
		String text = "";
		if (touristPackage.getId() == -1) // add
			text = "ADD TOURIST PACKAGE";	
		else
			text = "UPDATE TOURIST PACKAGE: " + this.touristPackage.getId();	

		this.lblTitleFrame.setText(text);



	}

	private boolean verificarCampos () {
		return (!this.textFieldName.getText().equalsIgnoreCase("") && (Integer) this.spinnerCantPax.getValue() != 0 && this.touristPackage.verificarIntervaloFecha() && this.touristPackage.verificarPaquete());
	}

	private void addTouristPackage () throws SQLException {
		Controller.getInstancie().getTouristAgency().addTouristPackage(new TouristPackage(textFieldName.getText(), (Integer) this.spinnerCantPax.getValue(), 
				this.dateChooserStratDate.getDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate(), this.dateChooserTerminationDate.getDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate() ,
				this.touristPackage.getModalitys(Modality.accommodationModality), 
				this.touristPackage.getModalitys(Modality.serviceModality), this.touristPackage.getModalitys(Modality.costKilometers), this.touristPackage.getModalitys(Modality.hoursKilometers), 
				this.touristPackage.getModalitys(Modality.establishedRoute)));
	}

	private void updateTouristPackage () throws SQLException {
		Controller.getInstancie().getTouristAgency().updateTouristPackage(this.touristPackage, textFieldName.getText(), (Integer) this.spinnerCantPax.getValue());
	}

	private void definirTextoLblOperation () {
		String text = "";
		if (touristPackage.getId() == -1) // add
			text = "CREATE";	
		else
			text = "UPDATE";	

		this.lblOperation.setText(text);
	}

	public void cambioDePanel (JPanel panel) {
		this.contentPane.remove(this.contentPane.getComponentCount() - 1); // se elimina el ultimo componente insertado (Anterior Panel)
		this.contentPane.add(panel);
		this.repintarFrame();
	}

	private void repintarFrame () {
		repaint();
		revalidate();
	}


	private void cerrarFrame () {
		FramePrincipal.getIntancie().setEnabled(true);
		dispose();
	}
}
