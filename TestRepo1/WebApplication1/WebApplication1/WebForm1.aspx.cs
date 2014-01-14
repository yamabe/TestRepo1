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

            DataTable table = new DataTable();


            DataColumn c1 = new DataColumn("data1",  System.Type.GetType("System.DateTime"));
            DataColumn c2 = new DataColumn("data2",  System.Type.GetType("System.DateTime"));


            table.Columns.Add(c1);
            table.Columns.Add(c2);
            DataRow row1 = table.NewRow();
            row1["data1"] = DateTime.UtcNow;
            row1["data2"] = DateTime.Now;
            table.Rows.Add(row1);

            DataRow row2 = table.NewRow();
            row2["data1"] = DateTime.UtcNow;
            row2["data2"] = DateTime.Now;
            table.Rows.Add(row2);

            this.GridView1.DataSource = table;
           
            this.GridView1.DataBind();
        }
    }
}