using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace uc
{

    /// <summary>
    /// YCheckBox の概要の説明です
    /// </summary>
    public class YCheckBox : CheckBox
    {

        private bool _isGrid;
        private bool _readOnly;
        private Label _label;

        private String _labelText;
        private string _innerLabelText;

        public bool ReadOnly
        {
            set
            {
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

                base.Controls.Add(_label);

                this.CheckedChanged += YCheckBox_CheckedChanged;


            }
        }

        void YCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            Text = this.Checked.ToString();
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
                    writer.AddAttribute(HtmlTextWriterAttribute.Nowrap, "nowrap");

                    writer.AddAttribute(HtmlTextWriterAttribute.Class, this.CssClass);
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

    }
}