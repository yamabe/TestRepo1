using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace uc
{
    /// <summary>
    /// YDropDownList の概要の説明です
    /// </summary>
    public class YDropDownList : DropDownList
    {
        public YDropDownList()
        {
            
            //selectedV
        }

        //private string _defaultValue = string.Empty;


        private bool _isGrid;
        private bool _readOnly;
        private Label _label;

        private String _labelText;
        private string _innerLabelText;

        private bool _addEmptyItem;

        //public string DefaultValue
        //{
        //    set
        //    {
        //        this._defaultValue = value;
        //    }
        //    get { return this._defaultValue; }
        //}

        public bool AddEmptyItem
        {
            set
            {
                this._addEmptyItem = value;
            }
            get { return this._addEmptyItem; }
        }


        public bool ReadOnly
        {
            set { 
                this._readOnly = value;
                this.Enabled = !this.ReadOnly;
            }
            get { return this._readOnly; }
        }

        public bool IsGrid
        {
            set { this._isGrid = value; }
            get { return this._isGrid; }
        }
        public string Label
        {
            set { this._labelText = value; }
            get { return this._labelText; }
        }

        protected override void CreateChildControls()
        {

            if (String.IsNullOrEmpty(this._labelText))
            {
                this._innerLabelText = this.ID;
            }
            else
            {
                this._innerLabelText = this._labelText;
            }

            base.CreateChildControls();

            if (!this._isGrid)
            {
                _label = new Label();
                _label.Text = this._innerLabelText;

                

                //base.Controls.Add(_label);
            }
        }

        public override void DataBind()
        {
            if (AddEmptyItem)
            {
                DropDownList ddl = this;
                ListItem li;

                //ここにはデータがないとき表示させる文字を適当に入れておく
                li = new ListItem("(選択)", String.Empty);

                ddl.Items.Insert(0, li);

            }
            if (AppendDataBoundItems)
            {
                //DropDownList ddl = this;
                //ListItem li;

                //ここにはデータがないとき表示させる文字を適当に入れておく
                //li = new ListItem("(選択)", this.DefaultValue);

                //ddl.Items.Insert(0, li);

                //GridViewRow dtv = (GridViewRow)ddl.NamingContainer;

                //if (dtv.DataItem != null)
                //{

                //    string tantousya = ((DataRowView)dtv.DataItem)[ID].ToString();
                //    ddl.ClearSelection();

                //    li = ddl.Items.FindByValue(tantousya);

                //    if (li != null) li.Selected = true;

                //}
            }


            try
            {

                base.DataBind();
            }
            catch
            {
                String s = string.Empty;
            }
        }

        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {

            if (_isGrid)
            {
                base.Render(writer);
            }
            else
            {
                writer.AddAttribute(HtmlTextWriterAttribute.Class, "DetailRow");
                writer.RenderBeginTag(HtmlTextWriterTag.Tr);

                if (_label != null)
                {
                    writer.AddAttribute(HtmlTextWriterAttribute.Class, this.CssClass);
                    writer.AddAttribute(HtmlTextWriterAttribute.Nowrap, "nowrap");
                    writer.RenderBeginTag(HtmlTextWriterTag.Td);
                    _label.RenderControl(writer);
                    writer.RenderEndTag();
                }

                writer.AddAttribute(HtmlTextWriterAttribute.Class, this.CssClass);
                writer.RenderBeginTag(HtmlTextWriterTag.Td);

                base.Render(writer);
                writer.RenderEndTag();

                writer.RenderEndTag();
            }
        }

        public String GetInternalValue()
        {
            if (this.SelectedItem == null) return null;
            return this.SelectedItem.Value;
        }

        public String GetDisplayText()
        {
            return this.SelectedItem.Text;
        }
    }
}