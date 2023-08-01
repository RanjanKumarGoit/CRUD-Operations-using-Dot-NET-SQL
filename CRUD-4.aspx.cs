using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;



namespace CrudOps_2
{
    public partial class CRUD_4 : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["CRUD"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            bool isPost = IsPostBack;
            if (!IsPostBack)
            {
                GetDataGrid();
            }
        }

        private void GetDataGrid()
        {
            SqlConnection sqlConnection = new SqlConnection(con);
            SqlCommand cmd = new SqlCommand("GetData", sqlConnection);
            sqlConnection.Open();
            empGrid.DataSource = cmd.ExecuteReader();
            empGrid.DataBind();
            sqlConnection.Close();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection db = new SqlConnection(con);
            string fname = txtfname.Text;
            string lname = txtlname.Text;
            int age = Convert.ToInt32(txtage.Text);
            int salary = Convert.ToInt32(xtxtsalary.Text);
            SqlCommand cmd = new SqlCommand("spInsert", db);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            //Pass the parameters to the table using below method 
            cmd.Parameters.AddWithValue("@fname", fname);
            cmd.Parameters.AddWithValue("@lname", lname);
            cmd.Parameters.AddWithValue("@age", age);
            cmd.Parameters.AddWithValue("@salary", salary);

            db.Open();
            cmd.ExecuteNonQuery();
            db.Close();

            lblmsg.Text = "Data Inserted Successfully";
            txtfname.Text = "";
            txtlname.Text = "";
            txtage.Text = "";
            xtxtsalary.Text = "";
            GetDataGrid();
        }
        protected void empgrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(empGrid.DataKeys[e.RowIndex].Value);
            SqlConnection db = new SqlConnection(con);
            SqlCommand cmd = new SqlCommand("deleteData", db);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("EmpID", id);
            db.Open();
            if (cmd.ExecuteNonQuery() != 0)
            {
                Response.Write("Data deleted successfully!");
            }
            db.Close();
            GetDataGrid();
        }

        protected void empGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            empGrid.EditIndex = e.NewEditIndex;
            GetDataGrid();
        }

        protected void empGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            empGrid.EditIndex = -1;
            GetDataGrid();
        }

        protected void empGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection db = new SqlConnection(con);
            int id = Convert.ToInt32(empGrid.DataKeys[e.RowIndex].Value);
            string fname = (empGrid.Rows[e.RowIndex].FindControl("txtFname1") as TextBox).Text;
            string lname = (empGrid.Rows[e.RowIndex].FindControl("txtLname1") as TextBox).Text;
            int age = Convert.ToInt32((empGrid.Rows[e.RowIndex].FindControl("txtAge1") as TextBox).Text);
            int salary = Convert.ToInt32((empGrid.Rows[e.RowIndex].FindControl("txtSalary1") as TextBox).Text);
            SqlCommand cmd = new SqlCommand("updateData", db);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            //Pass the parameters to the table using below method 
            // sp_SaveUserInformation

            cmd.Parameters.AddWithValue("@fname", fname);
            cmd.Parameters.AddWithValue("@lname", lname);
            cmd.Parameters.AddWithValue("@age", age);
            cmd.Parameters.AddWithValue("@salary", salary);
            cmd.Parameters.AddWithValue("@id", id);
            db.Open();
            cmd.ExecuteNonQuery();
            db.Close();

            lblmsg.Text = "Data Updated Successfully";
            ClearControl();
            empGrid.EditIndex = -1;
            GetDataGrid();
        }

        protected void btnclear_Click(object sender, EventArgs e)
        {
            ClearControl();
            GetDataGrid();
        }

        private void ClearControl()
        {
            txtfname.Text = "";
            txtlname.Text = "";
            txtage.Text = "";
            xtxtsalary.Text = "";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(searchFirstName.Text))
            {
                SqlConnection sqlConnection = new SqlConnection(con);
                string fname = searchFirstName.Text;
                SqlCommand cmd = new SqlCommand("SearchData", sqlConnection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("firstName", fname);
                sqlConnection.Open();
                empGrid.DataSource = cmd.ExecuteReader();
                empGrid.DataBind();
                sqlConnection.Close();
            }
        }

        protected void btnClear1_Click(object sender, EventArgs e)
        {
            btnClear();
            GetDataGrid();
        }

        private void btnClear()
        {
            searchFirstName.Text = "";
            
        }
    }
}