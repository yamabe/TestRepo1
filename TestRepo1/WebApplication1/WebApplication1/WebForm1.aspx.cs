using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
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

            detailsView1.SetPageIndex(e.NewEditIndex);
            detailsView1.ChangeMode(DetailsViewMode.Edit);

        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            GridView1.EditIndex = -1;
            detailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        }
    }
}