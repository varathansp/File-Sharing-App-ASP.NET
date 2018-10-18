using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.OleDb;
using System.Web.Security;

namespace TeamShare
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.Cookies["UserName"] != null)
            {
                txtUsername.Text = Request.Cookies["UserName"].Value;
                txtPassword.Text = Request.Cookies["Password"].Value;
            }
          
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (CheckBoxRemember.Checked)
            {
                Response.Cookies["UserName"].Value = txtUsername.Text.Trim();
                Response.Cookies["Password"].Value = txtPassword.Text.Trim();

                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
            }
            else
            {
                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

            }
            
            string strconnection = ConfigurationManager.ConnectionStrings["AccessConnectionString"].ToString();
            OleDbConnection connection = new OleDbConnection();

            connection.ConnectionString = strconnection.ToString();
            connection.Open();
            OleDbCommand command = new OleDbCommand();
            command.Connection = connection;
            command.CommandText = "select * from LoginCreds where Username='" + txtUsername.Text + "'and Password='" + txtPassword.Text + "'";
            OleDbDataReader reader = command.ExecuteReader();
            int count = 0;
            while (reader.Read())
            {
                count++;
            }
            string name = txtUsername.Text.Trim();
            Session["ID"] = name;
            if (count == 1)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                Errormsg.Text = "Wrong username or password";
            }
            connection.Close();
        }
    }
}