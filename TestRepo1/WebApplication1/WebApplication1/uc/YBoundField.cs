using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.ComponentModel;
using System.Drawing;

namespace yuc
{
    public class YBoundField : DataControlField
    {

        public bool IsDropDownList
        {
            get
            {
                object value = base.ViewState["IsDropDownList"];
                if (value != null)
                {
                    return Convert.ToBoolean(value);
                }
                else
                {
                    return false;
                }
            }
            set
            {
                base.ViewState["IsDropDownList"] = value;
                this.OnFieldChanged();
            }
        }

        public bool IsBoolean
        {
            get
            {
                object value = base.ViewState["IsBoolean"];
                if (value != null)
                {
                    return Convert.ToBoolean(value);
                }
                else
                {
                    return false;
                }
            }
            set
            {
                base.ViewState["IsBoolean"] = value;
                this.OnFieldChanged();
            }
        }


        public bool IsRequired
        {
            get
            {
                object value = base.ViewState["IsRequired"];
                if (value != null)
                {
                    return Convert.ToBoolean(value);
                }
                else
                {
                    return true;
                }
            }
            set
            {
                base.ViewState["IsRequired"] = value;
                this.OnFieldChanged();
            }
        }


        public bool IsInteger
        {
            get
            {
                object value = base.ViewState["IsInteger"];
                if (value != null)
                {
                    return Convert.ToBoolean(value);
                }
                else
                {
                    return true;
                }
            }
            set
            {
                base.ViewState["IsInteger"] = value;
                this.OnFieldChanged();
            }
        }

        public bool IsDate
        {
            get
            {
                object value = base.ViewState["IsDate"];
                if (value != null)
                {
                    return Convert.ToBoolean(value);
                }
                else
                {
                    return true;
                }
            }
            set
            {
                base.ViewState["IsDate"] = value;
                this.OnFieldChanged();
            }
        }



        public bool Editable
        {
            get
            {
                object value = base.ViewState["Editable"];
                if (value != null)
                {
                    return Convert.ToBoolean(value);
                }
                else
                {
                    return true;
                }
            }
            set
            {
                base.ViewState["Editable"] = value;
                this.OnFieldChanged();
            }
        }

        public bool ReadOnly
        {
            get
            {
                object value = base.ViewState["ReadOnly"];
                if (value != null)
                {
                    return Convert.ToBoolean(value);
                }
                else
                {
                    return true;
                }
            }
            set
            {
                base.ViewState["ReadOnly"] = value;
                this.OnFieldChanged();
            }
        }

        public string DataField
        {
            get
            {
                object value = base.ViewState["DataField"];
                if (value != null)
                {
                    return value.ToString();
                }
                else
                {
                    return string.Empty;
                }
            }
            set
            {
                base.ViewState["DataField"] = value;
                this.OnFieldChanged();
            }
        }

        public string DataFormatString
        {
            get
            {
                object value = base.ViewState["DataFormatString"];
                if (value != null)
                {
                    return value.ToString();
                }
                else
                {
                    return string.Empty;
                }
            }
            set
            {
                base.ViewState["DataFormatString"] = value;
                this.OnFieldChanged();
            }
        }



        protected override DataControlField CreateField()
        {

            return new YBoundField();
        }

        public override void InitializeCell(DataControlFieldCell cell, DataControlCellType cellType, DataControlRowState rowState, int rowIndex)
        {
            //Call the base method.
            base.InitializeCell(cell, cellType, rowState, rowIndex);

            switch (cellType)
            {
                case DataControlCellType.DataCell:
                    this.InitializeDataCell(cell, rowState);
                    break;
            }
        }

        protected void InitializeDataCell(DataControlFieldCell cell, DataControlRowState rowState)
        {
            //Check to see if the column is a editable and does not show the checkboxes.
            if ((rowState & DataControlRowState.Edit) != 0 ||
              (rowState & DataControlRowState.Insert) != 0)
            {
                if (IsBoolean)
                {
                    CheckBox chk = new CheckBox();
                    chk.ID = DataField;
                    chk.DataBinding += new EventHandler(chk_DataBinding);
                    cell.Controls.Add(chk);
                }
                else if (IsDropDownList)
                {
                    DropDownList ddl = new DropDownList();
                    ddl.ID = DataField;
                    
                }
                else
                {
                    YTextBox txtBox = new YTextBox();
                    txtBox.Columns = 5;
                    txtBox.ID = DataField;
                    txtBox.IsRequired = this.IsRequired;

                    txtBox.DataBinding += new EventHandler(txtBox_DataBinding);

                    cell.Controls.Add(txtBox);
                }
            }
            else
            {
                if (IsBoolean)
                {
                    CheckBox chk = new CheckBox();
                    chk.ID = DataField;
                    chk.Enabled = false;
                    chk.DataBinding += new EventHandler(chk_DataBinding);
                    cell.Controls.Add(chk);
                }
                else
                {
                    Label lblText = new Label();
                    lblText.ID = DataField;
                    lblText.DataBinding += new EventHandler(lblText_DataBinding);
                    cell.Controls.Add(lblText);
                }
            }
        }

        void chk_DataBinding(object sender, EventArgs e)
        {
            // get a reference to the control that raised the event
            CheckBox target = (CheckBox)sender;
            Control container = target.NamingContainer;

            // get a reference to the row object
            object dataItem = DataBinder.GetDataItem(container);

            if (dataItem == null)
            {
                return;
            }

            // get the row's value for the named data field only use Eval when it is neccessary
            // to access child object values, otherwise use GetPropertyValue. GetPropertyValue
            // is faster because it does not use reflection
            object dataFieldValue = null;

            if (this.DataField.Contains("."))
            {
                dataFieldValue = DataBinder.Eval(dataItem, this.DataField);
            }
            else
            {
                dataFieldValue = DataBinder.GetPropertyValue(dataItem, this.DataField);
            }

            // set the table cell's text. check for null values to prevent ToString errors
            if (dataFieldValue != null)
            {
                Boolean value = false;

                if (Boolean.TryParse(dataFieldValue.ToString(), out value))
                {
                    target.Checked = value;
                }

            }
        }

        public override void ExtractValuesFromCell(System.Collections.Specialized.IOrderedDictionary dictionary, DataControlFieldCell cell, DataControlRowState rowState, bool includeReadOnly)
        {
            base.ExtractValuesFromCell(dictionary, cell, rowState, includeReadOnly);
            string value = null;

            if (cell.Controls.Count > 0)
            {
                Control control = cell.Controls[0];
                if (control == null)
                    throw new InvalidOperationException("The control cannot be extracted");

                if (control is TextBox)
                {
                    value = ((TextBox)control).Text;
                }
                else if (control is CheckBox)
                {
                    value = ((CheckBox)control).Checked.ToString();
                }
                else if (control is Label)
                {
                    value = ((Label)control).Text;
                }
            }

            if (dictionary.Contains(this.DataField))
                dictionary[this.DataField] = value;
            else
                dictionary.Add(this.DataField, value);
        }

        void txtBox_DataBinding(object sender, EventArgs e)
        {
            // get a reference to the control that raised the event
            TextBox target = (TextBox)sender;
            Control container = target.NamingContainer;

            // get a reference to the row object
            object dataItem = DataBinder.GetDataItem(container);

            if (dataItem == null)
            {
                return;
            }

            // get the row's value for the named data field only use Eval when it is neccessary
            // to access child object values, otherwise use GetPropertyValue. GetPropertyValue
            // is faster because it does not use reflection
            object dataFieldValue = null;

            if (this.DataField.Contains("."))
            {
                dataFieldValue = DataBinder.Eval(dataItem, this.DataField);
            }
            else
            {
                dataFieldValue = DataBinder.GetPropertyValue(dataItem, this.DataField);
            }

            // set the table cell's text. check for null values to prevent ToString errors
            if (dataFieldValue != null)
            {
                if (String.IsNullOrEmpty(DataFormatString))
                {
                    target.Text = dataFieldValue.ToString();
                }
                else
                {
                    target.Text = String.Format(DataFormatString, dataFieldValue);
                }
            }
        }

        void lblText_DataBinding(object sender, EventArgs e)
        {
            // get a reference to the control that raised the event
            Label target = (Label)sender;
            Control container = target.NamingContainer;

            // get a reference to the row object
            object dataItem = DataBinder.GetDataItem(container);

            if (dataItem == null)
            {
                return;
            }

            // get the row's value for the named data field only use Eval when it is neccessary
            // to access child object values, otherwise use GetPropertyValue. GetPropertyValue
            // is faster because it does not use reflection
            object dataFieldValue = null;

            if (this.DataField.Contains("."))
            {
                dataFieldValue = DataBinder.Eval(dataItem, this.DataField);
            }
            else
            {
                dataFieldValue = DataBinder.GetPropertyValue(dataItem, this.DataField);
            }

            // set the table cell's text. check for null values to prevent ToString errors
            if (dataFieldValue != null)
            {
                if (String.IsNullOrEmpty(DataFormatString))
                {
                    target.Text = dataFieldValue.ToString();
                }
                else
                {
                    target.Text = String.Format(DataFormatString, dataFieldValue);
                }
            }
        }

    }
}