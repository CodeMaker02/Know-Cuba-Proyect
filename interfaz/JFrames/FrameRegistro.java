package JFrames;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import java.awt.Font;
import java.awt.SystemColor;
import javax.swing.JTextField;
import javax.swing.JCheckBox;
import javax.swing.SwingConstants;

public class FrameRegistro extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JTextField textFieldUserName;
	private JTextField textFieldPassword;

	
	public FrameRegistro() {
		setUndecorated(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 396, 353);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JPanel panel = new JPanel();
		panel.setBounds(0, 0, 396, 353);
		panel.setBackground(new Color(18, 95, 115));
		contentPane.add(panel);
		panel.setLayout(null);
		
		JLabel labelUserName = new JLabel("Username");
		labelUserName.setForeground(SystemColor.info);
		labelUserName.setFont(new Font("Arial Black", Font.PLAIN, 14));
		labelUserName.setBounds(37, 70, 325, 21);
		panel.add(labelUserName);
		
		textFieldUserName = new JTextField();
		textFieldUserName.setOpaque(false);
		textFieldUserName.setColumns(10);
		textFieldUserName.setBorder(null);
		textFieldUserName.setBounds(37, 102, 288, 20);
		panel.add(textFieldUserName);
		
		JLabel labelBarraUserName = new JLabel("________________________________________________");
		labelBarraUserName.setBounds(37, 112, 325, 21);
		panel.add(labelBarraUserName);
		
		JLabel labelPassword = new JLabel("Password");
		labelPassword.setForeground(SystemColor.info);
		labelPassword.setFont(new Font("Arial Black", Font.PLAIN, 14));
		labelPassword.setBounds(37, 167, 325, 21);
		panel.add(labelPassword);
		
		JCheckBox checkBoxShowPassword = new JCheckBox("Show password");
		checkBoxShowPassword.setOpaque(false);
		checkBoxShowPassword.setFont(new Font("Segoe UI", Font.PLAIN, 11));
		checkBoxShowPassword.setBounds(37, 236, 121, 23);
		panel.add(checkBoxShowPassword);
		
		JLabel labelAceptar = new JLabel("ACCEPT");
		labelAceptar.setOpaque(true);
		labelAceptar.setHorizontalAlignment(SwingConstants.CENTER);
		labelAceptar.setFont(new Font("Arial Black", Font.PLAIN, 11));
		labelAceptar.setBackground(SystemColor.info);
		labelAceptar.setBounds(40, 288, 138, 35);
		panel.add(labelAceptar);
		
		textFieldPassword = new JTextField();
		textFieldPassword.setOpaque(false);
		textFieldPassword.setColumns(10);
		textFieldPassword.setBorder(null);
		textFieldPassword.setBounds(37, 199, 288, 20);
		panel.add(textFieldPassword);
		
		JLabel labelBarraPassword = new JLabel("________________________________________________");
		labelBarraPassword.setBounds(37, 208, 325, 21);
		panel.add(labelBarraPassword);
		
		JLabel lblCancelar = new JLabel("CANCEL");
		lblCancelar.setOpaque(true);
		lblCancelar.setHorizontalAlignment(SwingConstants.CENTER);
		lblCancelar.setFont(new Font("Arial Black", Font.PLAIN, 11));
		lblCancelar.setBackground(SystemColor.info);
		lblCancelar.setBounds(218, 288, 138, 35);
		panel.add(lblCancelar);
		
		JLabel lblRegistro = new JLabel("To Register :");
		lblRegistro.setFont(new Font("Arial Black", Font.PLAIN, 19));
		lblRegistro.setBounds(26, 11, 152, 30);
		panel.add(lblRegistro);
		
		JLabel lblX = new JLabel("X");
		lblX.setHorizontalAlignment(SwingConstants.CENTER);
		lblX.setForeground(Color.BLACK);
		lblX.setFont(new Font("Arial Black", Font.PLAIN, 20));
		lblX.setBackground(SystemColor.menu);
		lblX.setBounds(358, 0, 38, 38);
		panel.add(lblX);
	}
}
