﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace MURK_Rentas
{
    public partial class Form1 : Form
    {
        System.Data.SqlClient.SqlConnection con; 
        string rfid_usuario = "";
        string tipo_usuario, status;
        string nombre = "";

        public Form1()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //botón salir
            serialPort1.Close();
            if (MessageBox.Show("Desea cerrar la aplicación", "MURK - Inicio de sesión", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                Application.Exit();
            }
            else {

            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //Abre modal de configuracion del puerto com para la utilzacion del arduino
            serialPort1.Close();
            Puertos set_port = new Puertos();
            this.Hide();
            set_port.ShowDialog();
            this.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //boton menú
            Menu menu = new Menu();
            menu.lbPort_menu.Text = lbPort.Text;
            menu.lbRFID_menu.Text = rfid_usuario;
            this.Hide();
            menu.ShowDialog();
            this.Close();          
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // carga de puerto y validacion del mismo
            timer1.Start();
            lbPort.Text = serialPort1.PortName;
            //Conexion a base de datos
            con = new System.Data.SqlClient.SqlConnection();
            con.ConnectionString = "Data Source=localhost;Initial Catalog=MURK;Integrated Security=True";
            //Abre puerto si esta disponible
            try
            {
                serialPort1.Open();
            }
            catch
            {
                lbPort.Text = "Puerto: No disponible";
            }
        }
        

        private void BuscarRfidUsuario()
        {
            //Busca el usuario con el codigo RFId leido
            try
            {
                con.Open();
                SqlCommand query = con.CreateCommand();
                query.CommandType = CommandType.Text;
                query.CommandText = string.Format("exec BuscarLogin '" + lbRFID.Text + "'");
                SqlDataReader busqueda;
                busqueda = query.ExecuteReader();                
                while (busqueda.Read() == true)
                {
                    String tipo_usuario = busqueda["[Id_tipo_usuario]"].ToString();
                    String status = busqueda["[Status]"].ToString();
                    lbNombre.Text = busqueda["[Nombre]"].ToString();
                }                
            }
            catch
            {
                MessageBox.Show("error");
            }
            finally
            {
                if (con.State != ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }
        
        private void serialPort1_DataReceived(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
        {
            //Trae el codigo rfid de la tarjeta leída
            rfid_usuario = serialPort1.ReadLine().Trim();
        }

        private void lbRFID_TextChanged(object sender, EventArgs e)
        {
            

        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            lbRFID.Text = rfid_usuario;
            BuscarRfidUsuario();
        }

        private void lbPort_TextChanged(object sender, EventArgs e)
        {
            // Muestra el puerto en uso
            serialPort1.PortName = lbPort.Text;
        }
    }
}
