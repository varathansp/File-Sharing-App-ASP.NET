using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data; 

namespace TeamShare
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                userid.Text = "Employee "+Session["ID"].ToString();
                if (!IsPostBack)
                {
                    LoadData();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
          
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        { 
             if (FileUpload1.HasFile)
            {
               string fn= FileUpload1.FileName;
               int flag = 0;
               foreach (string file in Directory.GetFiles(Server.MapPath("~/Files/")))
               {
                   FileInfo fi = new FileInfo(file);
                   if (fi.Name == fn)
                   {
                       flag++;
                   }
               }
               if (flag == 0)
               {
                   FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Files/") + FileUpload1.FileName);
               }
               else 
               { 
                   Response.Write("<script>alert('File already exist');</script>");
               }
            }
            LoadData();
        }

        private void LoadData()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("File");
            dt.Columns.Add("Size");
            dt.Columns.Add("Type");
            foreach (string file in Directory.GetFiles(Server.MapPath("~/Files/")))
            {
                FileInfo fi = new FileInfo(file);
                dt.Rows.Add(fi.Name,GetFileSizeByLength(fi.Length), GetFileTypeByExtension(fi.Extension));
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
            
        }
       
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
            Response.Clear();
            Response.ContentType = "application/octet-stream";
           // FileInfo fileToDownload = new FileInfo("~/Files/" + e.CommandArgument);
           // Response.AddHeader("Content-Length", new FileInfo("~/Files/"+ e.CommandArgument.ToString()).Length.ToString());
            Response.AppendHeader("Content-Disposition", "filename=" + e.CommandArgument);
            Response.TransmitFile(Server.MapPath("~/Files/") + e.CommandArgument);
            Response.End();
            //HttpContext.Current.ApplicationInstance.CompleteRequest();
        }

        private string GetFileTypeByExtension(string fileExtension)
        {
            switch (fileExtension.ToLower())
            {
                case ".docx":
                case ".doc":
                    return "Microsoft Word Document";
                case ".xlsx":
                case ".xls":
                    return "Microsoft Excel Document";
                case ".txt":
                    return "Text Document";
                case ".jpg":
                case ".png":
                    return "Image";
                case ".exe":
                    return "Application";
                case ".zip":
                    return "Compressed Folder";
                case ".pptx":
                    return "Microsoft PowerPoint Document";
                case ".mp4":
                    return "Video File";
                default:
                    return "Unknown";
            }
        }
        
        private string GetFileSizeByLength(long sz)
        {
            string finalSize="";
            if (sz < 1024)
            {
                finalSize = sz.ToString() + " B";
            }
            else if (sz < 1024 * 1024)
            {
                finalSize = (sz / 1024).ToString() + " KB";
            }
            else
            {
                finalSize = (sz / 1048576).ToString() + " MB";
            }
            return finalSize;
        }

        protected void btnSerach_Click(object sender, EventArgs e)
        {
            string searchTerm= txtSearch.Text.ToLower();
            DataTable dt = new DataTable();
            dt.Columns.Add("File");
            dt.Columns.Add("Size");
            dt.Columns.Add("Type");
            foreach (string file in Directory.GetFiles(Server.MapPath("~/Files/")))
            {
                if (file.ToLower().Contains(searchTerm))
                {
                    FileInfo fi = new FileInfo(file);
                    dt.Rows.Add(fi.Name, GetFileSizeByLength(fi.Length), GetFileTypeByExtension(fi.Extension));
                }
                
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

       
        protected void BtnLogOut_Click(object sender, ImageClickEventArgs e)
        {
            Session["ID"] = null;
            Response.Redirect("Login.aspx");
        }

        

        protected void btnPasswordChange_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("PasswordReset.aspx");
        }
      
    }
}