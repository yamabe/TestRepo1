﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Menu : BaseForm
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ((YMasterPage)this.Master).IsDisplayMenu = false;
    }



    protected override void Search()
    {



    }

    protected override void ConditionClear()
    {
    }
}