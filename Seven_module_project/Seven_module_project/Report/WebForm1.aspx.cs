using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seven_module_project.Report
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



           

            DataSet ds = getData();
           // ds.WriteXml(@"C:\Users\ESAD-CS\Desktop\Project7\Seven_module_project\Seven_module_project\Report\Report.xsd", XmlWriteMode.WriteSchema);

            ReportDocument rd = new ReportDocument();
            rd.Load(Server.MapPath("~/Report/CustomerReport.rpt"));
            rd.SetDataSource(ds);
            CrystalReportViewer1.ReportSource = rd;

        }
            private DataSet getData()
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter())
                    {
                        string sql = @"  select * from Customers";


                        da.SelectCommand = new SqlCommand(sql, conn);
                        da.SelectCommand.CommandType = CommandType.Text;



                       

                        DataSet ds = new DataSet();
                        da.Fill(ds, "Coss");



                        return ds;

                    }
                }
            }


        
    }
}