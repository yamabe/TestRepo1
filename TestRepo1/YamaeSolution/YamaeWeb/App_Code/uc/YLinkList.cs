using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace uc
{

    /// <summary>
    /// YLinkList の概要の説明です
    /// </summary>
    public class YLinkList : Control
    {

        private bool _isGrid;


        public bool IsGrid
        {
            set { this._isGrid = value; }
            get { return this._isGrid; }
        }

        private string _cssClass;


        public string CssClass
        {
            set { this._cssClass = value; }
            get { return this._cssClass; }
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

        public YLinkList()
        {
        }

        private List<YLinkButton> buttons;
        private List<YLinkButton> delButtons;

        protected override void CreateChildControls()
        {
            base.CreateChildControls();
            buttons = new List<YLinkButton>();
            delButtons = new List<YLinkButton>();

            DirectoryInfo di = new DirectoryInfo(this.Dir);

            if (di.Exists)
            {
                foreach (FileInfo fi in di.GetFiles())
                {
                    {
                        YLinkButton btn = new YLinkButton();

                        btn.Dir = Dir;
                        btn.FileName = fi.FullName;
                        btn.Text = fi.Name;

                        //btn.PostBackUrl = "./Download.aspx?FILE_NAME=" + fi.FullName;
                        string client = btn.ResolveClientUrl("./Download.aspx?FILE_NAME=" + HttpUtility.UrlEncode(fi.FullName));
                        btn.Attributes.Add("target", fi.Name);
                        btn.Attributes.Add("href", client);

                        base.Controls.Add(btn);
                        buttons.Add(btn);
                    }

                    {
                        YLinkButton btn2 = new YLinkButton();

                        btn2.Text = "削除";

                        string client2 = btn2.ResolveClientUrl("./Delete.aspx?FILE_NAME=" + HttpUtility.UrlEncode(fi.FullName));
                        btn2.Attributes.Add("target", "del");
                        
                        //client2 = "javascript:window.open('" + client2 + "');__doPostback('','');";
                        btn2.Attributes.Add("href", client2);
                        btn2.Attributes.Add("onclick", "if( confirm('削除します。よろしいですか?')) { __doPostBack('',''); return true;} else { return false; }");

                        base.Controls.Add(btn2);
                        delButtons.Add(btn2);
                    }



                }
            }

        }

        protected override void Render(HtmlTextWriter writer)
        {
            if (_isGrid)
            {
                for (int i = 0; i < buttons.Count; i++)
                {
                    YLinkButton b = buttons[i];
                    YLinkButton delb = delButtons[i];
                    b.RenderControl(writer);
                    delb.RenderControl(writer);

                    writer.RenderBeginTag(HtmlTextWriterTag.Br);
                }
            }
            else
            {

                for (int i = 0; i < buttons.Count; i++)
                {
                    YLinkButton b = buttons[i];
                    YLinkButton delb = delButtons[i];
                    writer.AddAttribute(HtmlTextWriterAttribute.Class, "DetailRow");
                    writer.RenderBeginTag(HtmlTextWriterTag.Tr);


                    writer.AddAttribute(HtmlTextWriterAttribute.Class, this.CssClass);
                    writer.AddAttribute(HtmlTextWriterAttribute.Colspan, "2");

                    writer.RenderBeginTag(HtmlTextWriterTag.Td);
                    b.RenderControl(writer);

                    //writer.RenderBeginTag(HtmlTextWriterTag.Span);
                    writer.WriteLine("　");
                    //writer.RenderEndTag(HtmlTextWriterTag.Span);
                    

                    delb.RenderControl(writer);

                    writer.RenderEndTag();

                    writer.RenderEndTag();

                }
            }
        }


    }
}