using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            

            String s = string.Empty;

        }

        protected void SqlDataSource1_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {

            String s = string.Empty;

        }

        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {

            String s = string.Empty;

        }

        protected void Unnamed1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {

        }

        protected void Unnamed1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

            FormView1.PageIndex = e.NewEditIndex;
            //detailsView1.ChangeMode(DetailsViewMode.Edit);

        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            GridView1.EditIndex = -1;
            FormView1.ChangeMode(FormViewMode.ReadOnly);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = int.Parse(e.CommandArgument.ToString());
            if (e.CommandName == "Copy")
            {

                GridViewRow row = GridView1.Rows[index];

                object o = row.DataItem;
                foreach (Parameter p in SqlDataSource1.InsertParameters)
                {

                    Control c = row.FindControl(p.Name);

                    object value = String.Empty;
                    if (c is Label)
                    {
                        value = ((Label)c).Text;
                    } 



                    if (p.Type == TypeCode.Int32 )
                    {
                        value = value.ToString().Replace(",", "");
                        value = value.ToString().Replace("\\", "");
                        if (!String.IsNullOrEmpty(value.ToString()))
                        {
                            value = int.Parse(value.ToString());
                        }
                    }
                    else if ( p.Type == TypeCode.Decimal)
                    {
                        value = value.ToString().Replace(",", "");
                        value = value.ToString().Replace("\\", "");
                        if (!String.IsNullOrEmpty(value.ToString()))
                        {
                            value = decimal.Parse(value.ToString());
                        }
                    }

                    else if (p.Type == TypeCode.DateTime)
                    {
                        if (!String.IsNullOrEmpty(value.ToString()))
                        {
                            value = DateTime.Parse(value.ToString());
                        }
                    }

                    p.DefaultValue = value.ToString();
                }

                SqlDataSource1.Insert();
            }
        }
    }
}