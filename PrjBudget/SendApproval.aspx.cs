using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;


namespace PrjBudget
{
    public partial class SendApproval : System.Web.UI.Page
    {
        public string query;
        public string constr;
        public SqlCommand com;
        public SqlConnection con;

        public void connection()
        {

            constr = ConfigurationManager.ConnectionStrings["excelconn"].ToString();
            con = new SqlConnection(constr);
            con.Open();

        }
        protected void Page_Load(object sender, EventArgs e)
        {

            Label2.Visible = false;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Label2.Visible = true;
            string filePath = FileUpload1.PostedFile.FileName;
            string filename1 = Path.GetFileName(filePath);
            string ext = Path.GetExtension(filename1);
            string type = String.Empty;

            if (!FileUpload1.HasFile)
            {
                Label2.Text = "Please Select File";
            }
            else
            if (FileUpload1.HasFile)
            {

                try
                {

                    switch (ext)
                    {
                        case ".xls":

                            type = "application/vnd.ms-excel";

                            break;

                        case ".xlsx":
                            type = "application/vnd.ms-excel";

                            break;

                    }

                    if (type != String.Empty)
                    {
                        connection();
                        Stream fs = FileUpload1.PostedFile.InputStream;
                        BinaryReader br = new BinaryReader(fs);
                        Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        query = "insert into ExcelfileSave(Name,type,data)" + " values (@Name, @type, @Data)";
                        com = new SqlCommand(query, con);
                        com.Parameters.Add("@Name", SqlDbType.VarChar).Value = filename1;
                        com.Parameters.Add("@type", SqlDbType.VarChar).Value = type;
                        com.Parameters.Add("@Data", SqlDbType.Binary).Value = bytes;
                        com.ExecuteNonQuery();
                        Label2.ForeColor = System.Drawing.Color.Green;
                        Label2.Text = "File Uploaded Successfully";

                    }
                    else
                    {
                        Label2.ForeColor = System.Drawing.Color.Red;

                        Label2.Text = "Select Only Excel File having extension .xlsx or .xls ";


                    }
                }
                catch (Exception ex)
                {
                    Label2.Text = "Error: " + ex.Message.ToString();


                }

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            GridView1.Visible = true;

            connection();
            query = "Select *from ExcelfileSave";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();
            da.Fill(ds, "Excelfiledemo");
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
            con.Close();


        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {


            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["excelconn"].ToString()))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select Name,type,data from ExcelfileSave where id=@id", con);
                cmd.Parameters.AddWithValue("id", GridView1.SelectedRow.Cells[1].Text);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    Response.Clear();
                    Response.Buffer = true;

                    Response.ContentType = dr["type"].ToString();
                    Response.AddHeader("content-disposition", "attachment;filename=" + dr["Name"].ToString());
                    Response.Charset = "";
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.BinaryWrite((byte[])dr["data"]);

                    Response.End();

                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ExportPage.aspx");
        }
    }

}



















