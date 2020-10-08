using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Windows_Project
{
   
    public partial class Vehicles : Form
    {
     

        public Vehicles()
        {
            InitializeComponent();
        }

        private void  Form1_Load(object sender, EventArgs e)
        {


            

          }


        private void Button5_Click(object sender, EventArgs e)
        {

            OrderDetails od = new OrderDetails();
            od.Show();

        }

        private void Button4_Click(object sender, EventArgs e)
        {
            
            
        }
    }
}
