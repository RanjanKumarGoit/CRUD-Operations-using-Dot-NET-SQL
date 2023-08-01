using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CrudOps_2
{
    public partial class _Default : Page
    {
        string con = ConfigurationManager.ConnectionStrings["CRUD"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecord();
            }
        }
       
        protected void Insert_values(object sender, EventArgs e)
        {
            
            SqlConnection db = new SqlConnection(con);
            db.Open();
            string insert = "INSERT INTO STUDENT (StudentName,Email,Address,Age,Contact) values ('"+StudentName.Text+ "','" + Email.Text + "','" + Address.Text+"','"+Age.Text+"','"+Contact.Text+"')";
            SqlCommand cmd = new SqlCommand(insert, db);
            int rowsAffected = cmd.ExecuteNonQuery();
            if(rowsAffected!=0)
            {
                Response.Write("<script>alert('Data Inserted Succesfully!!')</script>");
            }

            LoadRecord();
            db.Close();
        }

        protected void Update_Values(object sender, EventArgs e)
        {
            
            SqlConnection db = new SqlConnection(con);
            db.Open();
            string update = "UPDATE STUDENT SET Email='" + Email.Text + "', Address='" + Address.Text + "', Age='" + Age.Text + "', Contact='" + Contact.Text + "' WHERE StudentName='"+StudentName.Text.Replace("'", "''") + "'";            
            SqlCommand cmd = new SqlCommand(update, db);
            int rowsAffected = cmd.ExecuteNonQuery();
            if (rowsAffected != 0)
            {
                Response.Write("<script>alert('Data Updated Succesfully!!')</script>");
           }

            LoadRecord();
            db.Close();
        }

        protected void Delete_Values(object sender, EventArgs e)
        {
            SqlConnection db = new SqlConnection(con);
            db.Open();
            string delete = "DELETE FROM STUDENT WHERE StudentName='" + StudentName.Text + "'";
            SqlCommand cmd = new SqlCommand(delete, db);
            int rowsAffected = cmd.ExecuteNonQuery();
            if (rowsAffected != 0)
            {
                Response.Write("<script>alert('Data Deleted Succesfully!!')</script>");
            }

            LoadRecord();
            db.Close();
        }

        protected void Search_Values(object sender, EventArgs e)
        {
            SqlConnection db = new SqlConnection(con);
            db.Open();
            string search = "SELECT * FROM STUDENT WHERE StudentName='"+StudentName.Text+ "' OR Email='" + Email.Text + "'  OR Address='" + Address.Text+"' OR Age='"+Age.Text+"' OR Contact='"+Contact.Text+"'";
            SqlCommand cmd = new SqlCommand(search, db);
            //int rowsAffected = cmd.ExecuteNonQuery();
            SqlDataAdapter d = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();       
            db.Close();
        }
            
        void LoadRecord()
        {
            string con = @"data source=desktop-g3epcti; initial catalog=crud-2; integrated security=true";
            SqlConnection db = new SqlConnection(con);
            SqlCommand comma = new SqlCommand("select * from student", db);
            SqlDataAdapter d = new SqlDataAdapter(comma);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Clear_Labels(object sender, EventArgs e)
        {
            StudentName.Text = "";
            Address.Text = "";
            Age.Text = "";
            Contact.Text = "";
            Email.Text = "";
            LoadRecord();
        }
    }
}