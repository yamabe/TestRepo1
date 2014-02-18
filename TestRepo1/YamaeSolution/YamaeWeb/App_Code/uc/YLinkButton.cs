using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;


namespace uc
{/// <summary>
    /// YLinkButton の概要の説明です
    /// </summary>
    public class YLinkButton: LinkButton
    {

        private bool _isGrid;



        public bool IsGrid
        {
            set { this._isGrid = value; }
            get { return this._isGrid; }
        }


        public string Dir
        {
            get
            {
                object o = ViewState["Dir"];
                return (o == null) ? string.Empty : o.ToString();
            }
            set { ViewState["Dir"] = value; }
        }

        public string FileName
        {
            get
            {
                object o = ViewState["FileName"];
                return (o == null) ? string.Empty : o.ToString();
            }
            set { ViewState["FileName"] = value; }
        }


        public YLinkButton()
        {
            //
            // TODO: コンストラクター ロジックをここに追加します
            //
        }
    }
}