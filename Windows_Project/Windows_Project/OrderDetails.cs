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

namespace Windows_Project
{
    public partial class OrderDetails : Form
    {
        string connection = @"Data Source=.\SQLEXPRESS;Initial Catalog=SalesInvoices;Integrated Security=True";
        public OrderDetails()
        {
            InitializeComponent();
        }

        private void OrderDetails_Load(object sender, EventArgs e)
        {


            DataTable dtCusotmer = fillData("select CustomerID , CustomerName from dbo.Customers");

            comboBox1.DataSource = dtCusotmer;
            comboBox1.DisplayMember = "CustomerName";
            comboBox1.ValueMember = "CustomerID";

            DataTable dtVichele = fillData("select VehicleId , VehicleName from dbo.Vehicles");

            comboBox2.DataSource = dtVichele;
            comboBox2.DisplayMember = "VehicleName";
            comboBox2.ValueMember = "VehicleId";


            DataTable dt = fillData(@"  SELECT  v.VehicleName
      ,c.CustomerName
      ,o.[QTY]
      ,o.[TotalPrice]
       FROM[SalesInvoices].[dbo].[OrderDetails]  o inner join SalesInvoices.dbo.Vehicles  v  on o.VehicleId = v.VehicleId
       inner join SalesInvoices.dbo.Customers c on o.CustomerID = c.CustomerID");

            dataGridView1.DataSource = dt;

        }

        private DataTable fillData(string query)
        {

            using (System.Data.SqlClient.SqlConnection conn = new SqlConnection(connection))
            {
                using (SqlDataAdapter da = new SqlDataAdapter())
                {

                    da.SelectCommand = new SqlCommand(query, conn);
                    da.SelectCommand.CommandType = CommandType.Text;

                    DataSet ds = new DataSet();
                    try
                    {
                        da.Fill(ds, "CustomerGender");
                    }
                    catch (Exception ee)
                    {

                    }

                    if (ds.Tables.Count == 0)
                    {
                        DataTable dt = new DataTable();
                        ds.Tables.Add(dt);
                    }
                    return ds.Tables[0];

                }
            }
        }

        private void Button1_Click(object sender, EventArgs e)
        {


            DataTable InsertTable = fillData(@" INSERT INTO [dbo].[OrderDetails]    ([VehicleId]          ,[CustomerID]        ,[QTY]           ,[TotalPrice])VALUES  ( " + comboBox1.SelectedValue + " , " + comboBox2.SelectedValue + ", " + textBox1.Text + " , " + textBox2.Text + ")") ;

            DataTable dt = fillData(@"  SELECT  v.VehicleName
      ,c.CustomerName
      ,o.[QTY]
      ,o.[TotalPrice]
       FROM[SalesInvoices].[dbo].[OrderDetails]  o inner join SalesInvoices.dbo.Vehicles  v  on o.VehicleId = v.VehicleId
       inner join SalesInvoices.dbo.Customers c on o.CustomerID = c.CustomerID");

            dataGridView1.DataSource = dt;

        }

        private void Button2_Click(object sender, EventArgs e)
        {
            Customer orderDetails = new Customer();
            orderDetails.Show();
        }
    }
}
