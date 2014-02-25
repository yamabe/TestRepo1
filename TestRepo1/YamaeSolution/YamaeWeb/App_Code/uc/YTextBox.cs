﻿using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace uc
{

    /// <summary>
    /// YTextBox の概要の説明です
    /// </summary>
    public class YTextBox : TextBox
    {
        private bool _isRequired;
        private bool _isDate;
        private bool _isGrid;
        private String _dataFormatString;

        private bool _isInteger;

        private RequiredFieldValidator _required;
        private CalendarExtender _calendar;
        private NumericUpDownExtender _numericUpDown;
        private Label _label;

        private String _validationGroup;

        private String _labelText;
        private string _innerLabelText;

        public bool IsGrid
        {
            set { this._isGrid = value; }
            get { return this._isGrid; }
        }
        public bool IsRequired
        {
            set { this._isRequired = value; }
            get { return this._isRequired; }
        }
        public bool IsInteger
        {
            set { this._isInteger = value; }
            get { return this._isInteger; }
        }

        public bool IsDate
        {
            set { this._isDate = value; }
            get { return this._isDate; }
        }


        public string Label
        {
            set {

                this._labelText = value; 
            
            }
            get { return this._labelText; }
        }

        public CalendarExtender CalenderEx
        {
            get { return this._calendar; }
        }

        public string DataFormatString
        {
            set { this._dataFormatString = value; }
            get { return this._dataFormatString; }
        }

        protected override void OnTextChanged(EventArgs e)
        {
            base.OnTextChanged(e);
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

            this.Enabled = !this.ReadOnly;
            if (!ReadOnly)
            {

                if (this._isRequired)
                {
                    _required = new RequiredFieldValidator();

                    _required.ErrorMessage = this._innerLabelText + "は必須入力です";
                    //if (this.IsGrid)
                    //{
                    //    _required.Text = _required.ErrorMessage;
                    //}
                    //else
                    //{
                        _required.Text = "*";
                    //}
                    _required.ForeColor = Color.Red;
                    _required.ControlToValidate = this.ID;
                    _required.ValidationGroup = ValidationGroup;

                    base.Controls.Add(_required);
                }

                if (this._isInteger)
                {
                    _numericUpDown = new NumericUpDownExtender();
                    _numericUpDown.TargetControlID = this.ID;
                    _numericUpDown.Step = 1;
                    _numericUpDown.Minimum = 0;
                    _numericUpDown.Maximum = 9999999;
                    _numericUpDown.Width = (int)this.Width.Value + 25;
                    
                    this.Style.Add(HtmlTextWriterStyle.TextAlign, "Right");

                    base.Controls.Add(_numericUpDown);
                }

                if (this._isDate)
                {
                    _calendar = new CalendarExtender();
                    _calendar.TargetControlID = this.ID;
                    _calendar.Format = "yyyy/MM/dd";

                    base.Controls.Add(_calendar);
                }
            }

            if (!this._isGrid)
            {
                _label = new Label();
                _label.Text = this._innerLabelText;

                base.Controls.Add(_label);
            }


            //string[] splits = { "【", "】" };
            //string[] ret = this.Label.Split(splits, StringSplitOptions.None);

            //string unit = ret[ret.Length - 1];


        }

        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {

            if (_isGrid)
            {
                base.Render(writer);

                if (_required != null)
                {
                    _required.RenderControl(writer);
                }
                if (_calendar != null)
                {
                    _calendar.RenderControl(writer);
                }

                if (_numericUpDown != null)
                {
                    _numericUpDown.RenderControl(writer);
                }
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

                StringBuilder sb = new StringBuilder();
                sb.Append(this.CssClass);
                if (IsInteger)
                {
                    sb.Append(" numeric");
                }

                writer.AddAttribute(HtmlTextWriterAttribute.Class, sb.ToString());
                
                writer.RenderBeginTag(HtmlTextWriterTag.Td);

                base.Render(writer);
                writer.RenderEndTag();

                if (_required != null)
                {
                    writer.RenderBeginTag(HtmlTextWriterTag.Td);
                    _required.RenderControl(writer);
                    writer.RenderEndTag();
                }
                if (_numericUpDown != null)
                {
                    _numericUpDown.RenderControl(writer);
                }
                if (_calendar != null)
                {
                    writer.RenderBeginTag(HtmlTextWriterTag.Td);
                    _calendar.RenderControl(writer);
                    writer.RenderEndTag();
                }
                writer.RenderEndTag();
            }





        }

    }
}