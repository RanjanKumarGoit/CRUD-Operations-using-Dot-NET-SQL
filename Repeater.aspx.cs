using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace CrudOps_2
{
    public partial class Repeater : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet dataSet = LoadData();

            GridView1.DataSource = dataSet;
            GridView1.DataBind();

            Repeater1.DataSource = dataSet;
            Repeater1.DataBind();
        }
        private DataSet LoadData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["CRUD"].ConnectionString;
            using (SqlConnection sqlConnection = new SqlConnection(connectionString))
            {
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select * from Emp_details", sqlConnection);
                DataSet dataSet = new DataSet();
                sqlDataAdapter.Fill(dataSet);
                return dataSet;
                
            }
        }

    }
}