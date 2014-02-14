using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class YMasterPage : System.Web.UI.MasterPage
{
    private bool _IsDisplayMenu = true;

    public bool IsDisplayMenu
    {
        set
        {
            _IsDisplayMenu = value;
        }
        get
        {
            return _IsDisplayMenu;
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
