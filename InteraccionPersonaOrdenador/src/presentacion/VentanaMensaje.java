package presentacion;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;

public class VentanaMensaje extends JFrame {

	private JPanel contentPane;
	private JLabel lblToDo;

	/**
	 * Launch the application.
	 */
	
	 
	public VentanaMensaje() {
		setResizable(false);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);
		{
			lblToDo = new JLabel("TO DO");
			contentPane.add(lblToDo, BorderLayout.CENTER);
		}
	}

}
