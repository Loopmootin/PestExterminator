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
    public partial class CreateCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                UpdateDropdown();
                Button1.Enabled = false;
            }

            DropDownListCustomers.AutoPostBack = true;
        }

        protected void ButtonSignup_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"data source = CHRISTOFFER-PC; integrated security = true; database = pest_exterminators");
            SqlCommand cmd = null;
            string sqlsel = "INSERT INTO customers(customer_firstname, customer_lastname, customer_address, customer_zip, customer_town, customer_email, customer_password) " +
                "VALUES(@firstname, @lastname, @address, @zip, @town, @email, @password)";

            try
            {
                conn.Open();

                cmd = new SqlCommand(sqlsel, conn);
 
                cmd.Parameters.Add("@firstname", SqlDbType.Text);
                cmd.Parameters.Add("@lastname", SqlDbType.Text);
                cmd.Parameters.Add("@address", SqlDbType.Text);
                cmd.Parameters.Add("@zip", SqlDbType.Int);
                cmd.Parameters.Add("@town", SqlDbType.Text);
                cmd.Parameters.Add("@email", SqlDbType.Text);
                cmd.Parameters.Add("@password", SqlDbType.Text);

                cmd.Parameters["@firstname"].Value = TextBoxFirstname.Text;
                cmd.Parameters["@lastname"].Value = TextBoxLastname.Text;
                cmd.Parameters["@address"].Value = TextBoxStreet.Text;
                cmd.Parameters["@zip"].Value = Convert.ToInt32(TextBoxZip.Text);
                cmd.Parameters["@town"].Value = TextBoxTown.Text;
                cmd.Parameters["@email"].Value = TextBoxEmail.Text;
                cmd.Parameters["@password"].Value = TextBoxPassword.Text;

                cmd.ExecuteNonQuery();

                LabelMessage.Text = "Succes! - Thank you for signing up.";
            }
            catch (Exception ex)
            {
                LabelMessage.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        public void UpdateDropdown()
        {
            SqlConnection conn = new SqlConnection(@"data source = CHRISTOFFER-PC; integrated security = true; database = pest_exterminators");
            SqlDataAdapter da = null;
            DataSet ds = null;
            DataTable dt = null;
            string sqlsel = "SELECT * FROM customers";

            try
            {
                // conn.Open();  SqlDataAdapter opens connection by itself

                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand(sqlsel, conn);

                ds = new DataSet();
                da.Fill(ds, "CustomerList");

                dt = ds.Tables["CustomerList"];

                DropDownListCustomers.DataSource = dt;
                DropDownListCustomers.DataTextField = "customer_email";
                DropDownListCustomers.DataValueField = "customer_id";
                DropDownListCustomers.DataBind();
                DropDownListCustomers.Items.Insert(0, "Select a Customer");

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

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"data source = CHRISTOFFER-PC; integrated security = true; database = pest_exterminators");
            SqlDataAdapter da = null;
            SqlCommandBuilder cb = null;
            DataSet ds = null;
            DataTable dt = null;
            string sqlsel = "SELECT * FROM customers";


            try
            {
                // conn.Open();  SqlDataAdapter opens connection by itself

                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand(sqlsel, conn);

                cb = new SqlCommandBuilder(da);

                ds = new DataSet();
                da.Fill(ds, "CustomerList");

                dt = ds.Tables["CustomerList"];

                foreach (DataRow myrow in dt.Select("customer_id =" + Convert.ToInt32(DropDownListCustomers.SelectedValue)))
                {
                    myrow.Delete();
                }

                da.Update(ds, "CustomerList");

                LabelMessage.Text = "CustomerID: " + DropDownListCustomers.SelectedValue + " deleted";
                Button1.Enabled = false;

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

        protected void DropDownListCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListCustomers.SelectedIndex != 0)
            {
                LabelMessage.Text = "You chose CustomerID: " + DropDownListCustomers.SelectedValue;
                Button1.Enabled = true;
            }
            else
            {
                LabelMessage.Text = "You chose none";
                Button1.Enabled = false;
            }
        }
    }
}