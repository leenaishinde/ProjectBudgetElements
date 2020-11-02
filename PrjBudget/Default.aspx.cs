using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;

namespace PrjBudget
{
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=(local)\SQLEXPRESS;Initial Catalog=CRUDDB;Integrated Security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Clear();
                GridFill();
                btnDelete.Enabled = false;
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtName.Text == "" || txtAmount.Text == "" || txtUser.Text == "")
                lblErrorMessage.Text = "Please Fill Mandatory Fields";          
            else
            {

                if (sqlCon.State == ConnectionState.Closed)
                    sqlCon.Open();
                string ElementID = hfElementID.Value;                    
                SqlCommand sqlCmd = new SqlCommand("ElementsCreateOrUpdate", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@ElementID", Convert.ToInt32(hfElementID.Value == "" ? "0" : hfElementID.Value));
                sqlCmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Comments", txtComments.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Amount", Convert.ToInt32(txtAmount.Text.Trim()));
                if (ElementID == "")
                {
                    sqlCmd.Parameters.AddWithValue("@CreatedUser", txtUser.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ModifiedUser", txtUser.Text.Trim());
                }
                else
                {
                    sqlCmd.Parameters.AddWithValue("@CreatedUser", "");
                    sqlCmd.Parameters.AddWithValue("@ModifiedUser", txtUser.Text.Trim());
                }
                sqlCmd.ExecuteNonQuery();
                sqlCon.Close();
              
                Clear();
                if (ElementID == "")
                    lblSuccessMessage.Text = "Saved Successfully";
                else
                    lblSuccessMessage.Text = "Updated Successfully";
                GridFill();
            }
        }

        void GridFill()
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();

            SqlDataAdapter sqlDa = new SqlDataAdapter("ElementsViewAll", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            gvElement.DataSource = dtbl;
            gvElement.DataBind();
        }
        void Clear()
        {
            hfElementID.Value = "";
            txtName.Text = txtComments.Text = txtUser.Text= txtAmount.Text = "";
            btnSave.Text = "Save";            
            btnDelete.Enabled = false;
            lblErrorMessage.Text = lblSuccessMessage.Text = "";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();

            SqlCommand sqlCmd = new SqlCommand("ElementsDeleteByID", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@ElementID", Convert.ToInt32(hfElementID.Value));
            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            Clear();
            GridFill();
            lblSuccessMessage.Text = "Deleted Successfully";
        }

        protected void lnkSelect_OnClick(object sender, EventArgs e)
        {
            int ElementID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();

            SqlDataAdapter sqlDa = new SqlDataAdapter("ElementsViewByID", sqlCon);
            sqlDa.SelectCommand.Parameters.AddWithValue("@ElementID", ElementID);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();

            txtName.Text = dtbl.Rows[0][1].ToString();
            txtComments.Text = dtbl.Rows[0][2].ToString();
            txtAmount.Text = dtbl.Rows[0][3].ToString();
            txtUser.Text = dtbl.Rows[0][4].ToString();
            hfElementID.Value = dtbl.Rows[0][0].ToString();

            btnSave.Text = "Update";
            btnDelete.Enabled = true;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
       
        protected void btnExport_Click(object sender, EventArgs e)
        {
            Response.Redirect("ExportPage.aspx");
        }
    }
}