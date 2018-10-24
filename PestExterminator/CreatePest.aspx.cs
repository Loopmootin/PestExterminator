using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace PestExterminator
{
    public partial class CreatePest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                UpdateGridview();
                UpdateDropdown();
                ButtonDelete.Enabled = false;
            }

            DropDownListPests.AutoPostBack = true;

        }

        public void UpdateGridview()
        {
            SqlConnection conn = new SqlConnection(@"data source = CHRISTOFFER-PC; integrated security = true; database = pest_exterminators");
            SqlDataAdapter da = null;
            DataSet ds = null;
            DataTable dt = null;
            string sqlsel = "SELECT * FROM pests";

            try
            {
                // conn.Open();  SqlDataAdapter opens connection by itself

                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand(sqlsel, conn);

                ds = new DataSet();
                da.Fill(ds, "pests");

                dt = ds.Tables["pests"];

                GridViewPest.DataSource = dt;
                GridViewPest.DataBind();

            }
            catch (Exception ex)
            {
                LabelMessage.Text = ex.Message;
            }
            finally
            {
                conn.Close();  // SqlDataAdapter closes connection by itself; but can fail in case of errors
            }
        }

        public void UpdateDropdown()
        {
            SqlConnection conn = new SqlConnection(@"data source = CHRISTOFFER-PC; integrated security = true; database = pest_exterminators");
            SqlDataAdapter da = null;
            DataSet ds = null;
            DataTable dt = null;
            string sqlsel = "SELECT * FROM pests";

            try
            {
                // conn.Open();  SqlDataAdapter opens connection by itself

                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand(sqlsel, conn);

                ds = new DataSet();
                da.Fill(ds, "PestList");

                dt = ds.Tables["PestList"];

                GridViewPest.DataSource = dt;
                GridViewPest.DataBind();

                DropDownListPests.DataSource = dt;
                DropDownListPests.DataTextField = "pest_name";
                DropDownListPests.DataValueField = "pest_id";
                DropDownListPests.DataBind();
                DropDownListPests.Items.Insert(0, "Select a Pest");

            }
            catch (Exception ex)
            {
                LabelMessage.Text = ex.Message;
            }
            finally
            {
                conn.Close();  // SqlDataAdapter closes connection by itself; but can fail in case of errors
            }
        }

        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"data source = CHRISTOFFER-PC; integrated security = true; database = pest_exterminators");
            SqlDataAdapter da = null;
            DataSet ds = null;
            DataTable dt = null;
            SqlCommand cmd = null;
            string sqlsel = "SELECT * FROM pests";
            string sqlins = "INSERT INTO pests VALUES (@pest_name, @pest_price, @pest_url)";

            try
            {
                // conn.Open();  SqlDataAdapter opens connection by itself

                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand(sqlsel, conn);

                ds = new DataSet();
                da.Fill(ds, "pests");

                dt = ds.Tables["pests"];

                DataRow newrow = dt.NewRow();
                newrow["pest_name"] = TextBoxName.Text;
                newrow["pest_price"] = TextBoxPrice.Text;
                newrow["pest_url"] = TextBoxPicture.Text;
                dt.Rows.Add(newrow);

                cmd = new SqlCommand(sqlins, conn);
                cmd.Parameters.Add("@pest_name", SqlDbType.Text, 50, "pest_name");
                cmd.Parameters.Add("@pest_price", SqlDbType.Int, 50, "pest_price");
                cmd.Parameters.Add("@pest_url", SqlDbType.Text, 50, "pest_url");

                da.InsertCommand = cmd;
                da.Update(ds, "pests");

                LabelMessage.Text = "New Pest added";

            }
            catch (Exception ex)
            {
                LabelMessage.Text = ex.Message;
            }
            finally
            {
                conn.Close();  // SqlDataAdapter closes connection by itself; but can fail in case of errors
            }

            UpdateGridview();
            UpdateDropdown();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"data source = CHRISTOFFER-PC; integrated security = true; database = pest_exterminators");
            SqlDataAdapter da = null;
            SqlCommandBuilder cb = null;
            DataSet ds = null;
            DataTable dt = null;
            string sqlsel = "SELECT * FROM pests";


            try
            {
                // conn.Open();  SqlDataAdapter opens connection by itself

                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand(sqlsel, conn);

                cb = new SqlCommandBuilder(da);

                ds = new DataSet();
                da.Fill(ds, "PestList");

                dt = ds.Tables["PestList"];

                foreach (DataRow myrow in dt.Select("pest_id =" + Convert.ToInt32(DropDownListPests.SelectedValue)))
                {
                    myrow.Delete();
                }

                da.Update(ds, "PestList");

                LabelMessage.Text = "PestID: " + DropDownListPests.SelectedValue + " deleted";
                ButtonDelete.Enabled = false;

            }
            catch (Exception ex)
            {
                LabelMessage.Text = ex.Message;
            }
            finally
            {
                conn.Close();  // SqlDataAdapter closes connection by itself; but can fail in case of errors
            }

            UpdateDropdown();
        }

        protected void DropDownListPests_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListPests.SelectedIndex != 0)
            {
                LabelMessage.Text = "You chose PestID: " + DropDownListPests.SelectedValue;
                ButtonDelete.Enabled = true;
            }
            else
            {
                LabelMessage.Text = "You chose none";
                ButtonDelete.Enabled = false;
            }
        }
    }
}