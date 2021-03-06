﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;//base de datos

namespace MURK_Rentas
{
    public partial class FormUsuarios : Form
    {
        public FormUsuarios()
        {
            InitializeComponent();
        }

        System.Data.SqlClient.SqlConnection con; //variable que lleva al servidor
        private void FormUsuarios_Load(object sender, EventArgs e)
        {
            timer1.Start();
            con = new System.Data.SqlClient.SqlConnection(); //llamar conexion al form load
            con.ConnectionString = "Data Source=ASUSTP300;Initial Catalog=MURK;Integrated Security=True";

        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand query = con.CreateCommand();//crea comando
                query.CommandType = CommandType.Text;
                query.CommandText = string.Format("INSERT INTO usuarios(codigo,nombres,apellidos,permisos) VALUES('" + textBox1.Text + "','" + textBox2.Text + "','" + textBox3.Text + "','" + textBox4.Text + "')");
                int result = query.ExecuteNonQuery();//Regresa valor binario si se ejecuta o no la consulta
                if (result > 0)
                {
                    MessageBox.Show("Registro almacenado exitosamente");
                    textBox1.Text = "";
                    textBox2.Text = "";
                    textBox3.Text = "";
                    textBox4.Text = "";
                }
                else
                {
                    MessageBox.Show("No se pudo almacenar el registro");
                }
            }
            catch
            {

            }
            finally
            {
                if (con.State != ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }
    }
}
