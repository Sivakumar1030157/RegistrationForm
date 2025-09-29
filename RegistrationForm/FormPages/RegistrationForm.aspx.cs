using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;
using System.Configuration;
using System.Web.Services.Description;
using System.Data;

namespace RegistrationForm.FormPages
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string techItems = string.Empty;
            SqlCommand cmd = new SqlCommand("USP_StudentRegistrationForm", Con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            if (!string.IsNullOrEmpty(hidSNO.Value))
            {
                cmd.Parameters.AddWithValue("@Flag", "UPDATE");
                cmd.Parameters.AddWithValue("@StudentID", hidSNO.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Flag", "INSERT");
            }
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
            cmd.Parameters.AddWithValue("@Age", txtAge.Text);
            cmd.Parameters.AddWithValue("@Gender", rdnGender.SelectedValue);
            cmd.Parameters.AddWithValue("@Qualification", ddlQualifications.SelectedValue);
            foreach (ListItem listItem in chlTechnology.Items)
            {
                if (listItem.Selected)
                {
                    if (techItems != "")
                    {
                        techItems += ",";
                    }
                    techItems += listItem.Value;
                }
            }
            cmd.Parameters.AddWithValue("@Technology", techItems);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();

            dataCancel();
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            dataCancel();
        }

        protected void dataCancel()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtAge.Text = "";
            rdnGender.ClearSelection();
            ddlQualifications.ClearSelection();
            foreach (ListItem item in chlTechnology.Items)
            {
                item.Selected = false;
            }
            hidSNO.Value = "";
            GD.EditIndex = -1;
            GD.Visible = false;
        }
        protected void btnView_Click(object sender, EventArgs e)
        {
            dataview();
        }
        protected void dataview()
        {
            Con.Open();
            SqlCommand CMD = new SqlCommand("USP_StudentRegistrationForm", Con);
            CMD.CommandType = System.Data.CommandType.StoredProcedure;
            CMD.Parameters.AddWithValue("@Flag", "SELECT");
            SqlDataAdapter da = new SqlDataAdapter(CMD);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GD.DataSource = ds.Tables[0];
            GD.DataBind();
            Con.Close();
            GD.Visible = true;
        }
        protected void gdEdit(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gdRow = (GridViewRow)btn.NamingContainer;

            hidSNO.Value = gdRow.Cells[1].Text;
            txtFirstName.Text = gdRow.Cells[2].Text;
            txtLastName.Text = gdRow.Cells[3].Text;
            txtAge.Text = gdRow.Cells[4].Text;
            rdnGender.SelectedValue = gdRow.Cells[5].Text;
            ddlQualifications.SelectedValue = gdRow.Cells[6].Text;

            string[] techItems = gdRow.Cells[7].Text.Split(',');
            foreach (ListItem items in chlTechnology.Items)
            {
                items.Selected = techItems.Contains(items.Value);
            }
        }
        protected void gdDelete(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gdRow = (GridViewRow)btn.NamingContainer;
            SqlCommand cmd = new SqlCommand("USP_StudentRegistrationForm", Con);
            cmd.CommandType = CommandType.StoredProcedure;
            hidSNO.Value = gdRow.Cells[1].Text;
            cmd.Parameters.AddWithValue("@StudentID", hidSNO.Value);
            cmd.Parameters.AddWithValue("@Flag", "DELETE");
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();

            dataCancel();
            dataview();
        }
    }
}