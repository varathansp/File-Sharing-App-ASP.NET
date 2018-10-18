using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;

namespace TeamShare
{
    public partial class PasswordReset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            string strconnection = ConfigurationManager.ConnectionStrings["AccessConnectionString"].ToString();
            OleDbConnection connection = new OleDbConnection();

            connection.ConnectionString = strconnection.ToString();
            connection.Open();
            OleDbCommand command = new OleDbCommand();
            command.Connection = connection;
            command.CommandText = "select * from LoginCreds where Username='" + Session["ID"].ToString() + "'and Password='" + txtOldpassword.Text + "'";
            OleDbDataReader reader = command.ExecuteReader();
          
            string OldPassword="";
            while (reader.Read())
            {
                OldPassword = reader[2].ToString();
                
            }

         
           
            if (OldPassword == txtOldpassword.Text)
            {
                OleDbCommand passwordChangeCommand = new OleDbCommand("update LoginCreds set [Password]='" + txtNewpassword.Text + "' where [Username]='" + Session["ID"].ToString()+"'", connection);
                passwordChangeCommand.ExecuteNonQuery();
                lblError.Text = "Your password has been reset successfully";
            
            }
            else
            {
                lblError.Text = "Old password is incorrect";
                txtOldpassword.Text = "";
            }
            connection.Close();
        }
    }
}