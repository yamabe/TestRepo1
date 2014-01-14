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
            if (Editable)
            {
                string ID = Guid.NewGuid().ToString();
                TextBox txtBox = new TextBox();
                txtBox.Columns = 5;
                txtBox.ID = ID;
                txtBox.DataBinding += new EventHandler(txtBox_DataBinding);

                cell.Controls.Add(txtBox);
            }
            else
            {
                    Label lblText = new Label();
                    lblText.DataBinding += new EventHandler(lblText_DataBinding);
                    cell.Controls.Add(lblText);
            }
        }

        void txtBox_DataBinding(object sender, EventArgs e)
        {
            // get a reference to the control that raised the event
            TextBox target = (TextBox)sender;
            Control container = target.NamingContainer;

            // get a reference to the row object
            object dataItem = DataBinder.GetDataItem(container);

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
                target.Text = String.Format(DataFormatString, dataFieldValue);
            }
        }

        void lblText_DataBinding(object sender, EventArgs e)
        {
            // get a reference to the control that raised the event
            Label target = (Label)sender;
            Control container = target.NamingContainer;

            // get a reference to the row object
            object dataItem = DataBinder.GetDataItem(container);

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
                target.Text = String.Format(DataFormatString, dataFieldValue);
            }
        }
    
    }
}