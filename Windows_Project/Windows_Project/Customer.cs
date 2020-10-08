using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;

namespace Windows_Project
{
    public partial class Customer : Form
    {
        string connnn = @"Data Source=.\SQLEXPRESS;Initial Catalog=SalesInvoices;Integrated Security=True";
        
        public Customer()
        {
            InitializeComponent();
        }

        private void Customer_Load(object sender, EventArgs e)
        {
            display();
        }

        private void display()
        {
            SqlConnection con = new SqlConnection(connnn);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from Customers";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            con.Close();
        }

        private void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(connnn);

            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "INSERT into Customers values ('" + textBox2.Text + "','"+textBox3.Text+"')";
            cmd.ExecuteNonQuery();
            con.Close(); MessageBox.Show(" inserted a row");
            display();



        }

        private void Button2_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(connnn);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "update Customers  set CustomerName ='" + textBox2.Text + "' where CustomerID  = '" + textBox1.Text + "'";
            cmd.ExecuteNonQuery();
            con.Close();
            MessageBox.Show(" Updated a row");
            display();


        }

        private void Button3_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(connnn);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "delete from Customers where CustomerID = '" + textBox1.Text + "'";
            cmd.ExecuteNonQuery();
            con.Close();
            MessageBox.Show(" Deleted a row");
            display();


        }
    }
}  
    

