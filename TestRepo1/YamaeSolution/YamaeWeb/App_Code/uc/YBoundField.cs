using MySql.Data.Types;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace uc
{
    /// <summary>
    /// YBoundField の概要の説明です
    /// </summary>
    public class YBoundField : DataControlField
    {
        private bool _insertMode = false;

        public string DataField
        {
            get
            {
                object o = ViewState["DataField"];
                return (o == null) ? string.Empty : o.ToString();
            }
            set { ViewState["DataField"] = value; }
        }

        public string DataFormatString
        {
            get
            {
                object o = ViewState["DataFormatString"];
                return (o == null) ? string.Empty : o.ToString();
            }
            set { ViewState["DataFormatString"] = value; }
        }

        public string DataFormatStringEditing
        {
            get
            {
                object o = ViewState["DataFormatStringEditing"];
                return (o == null) ? string.Empty : o.ToString();
            }
            set { ViewState["DataFormatStringEditing"] = value; }
        }
        protected bool InsertMode
        {
            get { return _insertMode; }
        }

        public bool IsDropDownList
        {
            get
            {
                object o = ViewState["IsDropDownList"];
                return (o == null) ? false : (bool)o;
            }
            set { ViewState["IsDropDownList"] = value; }
        }

        public bool AppendDataBoundItems
        {
            get
            {
                object o = ViewState["AppendDataBoundItems"];
                return (o == null) ? false : (bool)o;
            }
            set { ViewState["AppendDataBoundItems"] = value; }
        }



        public string DataSourceID
        {
            get
            {
                object o = ViewState["DataSourceID"];
                return (o == null) ? string.Empty : o.ToString();
            }
            set { ViewState["DataSourceID"] = value; }
        }

        public string DataTextField
        {
            get
            {
                object o = ViewState["DataTextField"];
                return (o == null) ? string.Empty : o.ToString();
            }
            set { ViewState["DataTextField"] = value; }
        }

        public string DataValueField
        {
            get
            {
                object o = ViewState["DataValueField"];
                return (o == null) ? string.Empty : o.ToString();
            }
            set { ViewState["DataValueField"] = value; }
        }

        public bool IsBoolean
        {
            get
            {
                object o = ViewState["IsBoolean"];
                return (o == null) ? false : (bool)o;
            }
            set { ViewState["IsBoolean"] = value; }
        }

        public bool ReadOnly
        {
            get
            {
                object o = ViewState["ReadOnly"];
                return (o == null) ? false : (bool)o;
            }
            set { ViewState["ReadOnly"] = value; }
        }

        public int Columns
        {
            get
            {
                object o = ViewState["Columns"];
                return (o == null) ? 0 : (int)o;
            }
            set { ViewState["Columns"] = value; }
        }

        public int MaximumLength
        {
            get
            {
                object o = ViewState["MaximumLength"];
                return (o == null) ? 0 : (int)o;
            }
            set { ViewState["MaximumLength"] = value; }
        }

        public int Rows
        {
            get
            {
                object o = ViewState["Rows"];
                return (o == null) ? 0 : (int)o;
            }
            set { ViewState["Rows"] = value; }
        }

        public TextBoxMode TextMode
        {
            get
            {
                object o = ViewState["TextMode"];
                return (o == null) ? TextBoxMode.SingleLine : (TextBoxMode)o;
            }
            set { ViewState["TextMode"] = value; }
        }


        public bool IsRequired
        {
            get
            {
                object o = ViewState["IsRequired"];
                return (o == null) ? false : (bool)o;
            }
            set { ViewState["IsRequired"] = value; }
        }
        public bool IsDate
        {
            get
            {
                object o = ViewState["IsDate"];
                return (o == null) ? false : (bool)o;
            }
            set { ViewState["IsDate"] = value; }
        }
        public bool IsInteger
        {
            get
            {
                object o = ViewState["IsInteger"];
                return (o == null) ? false : (bool)o;
            }
            set { ViewState["IsInteger"] = value; }
        }



        public YBoundField()
        {
            //
            // TODO: コンストラクター ロジックをここに追加します
            //
        }



        protected override DataControlField CreateField()
        {
            return new YBoundField();
        }

        public override void ExtractValuesFromCell(System.Collections.Specialized.IOrderedDictionary dictionary, DataControlFieldCell cell, DataControlRowState rowState, bool includeReadOnly)
        {
            base.ExtractValuesFromCell(dictionary, cell, rowState, includeReadOnly);
            string value = null;

            if (cell.Controls.Count > 0)
            {
                System.Web.UI.Control control = cell.Controls[0];
                //If the control is null, throw an error
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
                else if (control is YDropDownList)
                {
                    value = ((YDropDownList)control).GetInternalValue();
                }

            }

            //If the key exists, update the value
            if (dictionary.Contains(this.DataField))
                dictionary[this.DataField] = value;
            //Add a new entry to the dictionary
            else
                dictionary.Add(this.DataField, value);
        }

        public override void InitializeCell(DataControlFieldCell cell, DataControlCellType cellType, DataControlRowState rowState, int rowIndex)
        {
            base.InitializeCell(cell, cellType, rowState, rowIndex);
            System.Web.UI.Control control = null;

            if (cellType == DataControlCellType.DataCell)
            {
                if (this.IsReadMode(rowState))
                {
                    if (IsBoolean)
                    {
                        YCheckBox chk = new YCheckBox();
                        chk.IsGrid = true;
                        chk.Enabled = false;
                        chk.ID = DataField;
                        control = chk;
                        cell.Controls.Add(chk);

                    }
                    else if (IsDropDownList)
                    {
                        YDropDownList ddl = new YDropDownList();
                        ddl.AppendDataBoundItems = true;
                        ddl.IsGrid = true;
                        ddl.Enabled = false;
                        ddl.ID = DataField;
                        ddl.DataSourceID = DataSourceID;
                        ddl.DataValueField = DataValueField;
                        ddl.DataTextField = DataTextField;
                        cell.Controls.Add(ddl);

                        //If we have a data field, bind to the data binding event later
                        if (!string.IsNullOrEmpty(this.DataField))
                            control = ddl;
                    }
                    else
                    {
                        cell.PreRender += cell_PreRender;
                        control = cell;
                        control.ID = DataField;
                    }
                }
                else
                {
                    if (IsBoolean)
                    {
                        YCheckBox chk = new YCheckBox();
                        chk.IsGrid = true;
                        chk.ID = DataField;
                        cell.Controls.Add(chk);

                        //If we have a data field, bind to the data binding event later
                        if (!string.IsNullOrEmpty(this.DataField))
                            control = chk;
                    }
                    else if (IsDropDownList)
                    {
                        YDropDownList ddl = new YDropDownList();
                        ddl.AppendDataBoundItems = true;
                        ddl.IsGrid = true;
                        ddl.ID = DataField;
                        ddl.DataSourceID = DataSourceID;
                        ddl.DataValueField = DataValueField;
                        ddl.DataTextField = DataTextField;
                        //if (this.IsInteger)
                        //{
                        //    ddl.DefaultValue = "0";
                        //}


                        cell.Controls.Add(ddl);

                        //If we have a data field, bind to the data binding event later
                        if (!string.IsNullOrEmpty(this.DataField))
                            control = ddl;
                    }
                    else
                    {
                        YTextBox box = new YTextBox();
                        box.IsGrid = true;
                        // TODO ReadOnlyの判定はチェックが必要
                        box.ReadOnly = this.ReadOnly;

                        box.TextMode = this.TextMode;
                        box.Rows = this.Rows;
                        box.Columns = this.Columns;
                        box.MaxLength = this.MaximumLength;
                        box.ToolTip = this.HeaderText;
                        //box.ID = Guid.NewGuid().ToString();
                        box.ID = this.DataField;
                        box.IsRequired = this.IsRequired;
                        box.IsDate = this.IsDate;
                        box.IsInteger = this.IsInteger;

                        if (Rows >= 2)
                        {
                            box.TextMode = TextBoxMode.MultiLine;
                        }
                        box.Rows = Rows;
                        //box.ValidationGroup = "Update";

                        cell.Controls.Add(box);

                        //If we have a data field, bind to the data binding event later
                        if (!string.IsNullOrEmpty(this.DataField))
                            control = box;
                    }
                }
            }

            //Capture the data binding event when data binding
            if (control != null && this.Visible)
            {
                if (control is YDropDownList)
                {
                    ((YDropDownList)control).DataBound += new EventHandler(control_DataBinding);
                }
                else
                {
                    control.DataBinding += new EventHandler(control_DataBinding);
                }
            }
        }

        void cell_PreRender(object sender, EventArgs e)
        {
            if (sender is TableCell)
            {

                TableCell cell = (TableCell)sender;

                if (cell.Text.StartsWith("No"))
                {
                    string s1 = cell.Text.Replace(Environment.NewLine, "<br/>");
                    string s2 = cell.Text.Replace(Environment.NewLine, "<br/>");
                    string s3 = string.Empty;
                }

                cell.Text = cell.Text.Replace(Environment.NewLine, "<br/>");
            }
        }

        protected bool IsReadMode(DataControlRowState rowState)
        {
            return (rowState == DataControlRowState.Normal || rowState == DataControlRowState.Alternate || rowState == DataControlRowState.Selected);
        }


        void control_DataBinding(object sender, EventArgs e)
        {
            Control ctl = sender as Control;

            object dataItem = DataBinder.GetDataItem(ctl.NamingContainer);
            String propertyValue = string.Empty;

            //if (ctl is YDropDownList)
            //{
            //    propertyValue = ((YDropDownList)ctl).DefaultValue;
            //}
            

            if (sender is TableCell)
            {
                propertyValue = GetPropertyValue(dataItem, DataFormatString, DataField);
            }
            else
            {
                propertyValue = GetPropertyValue(dataItem, DataFormatStringEditing, DataField);
            }

            if (sender is TableCell)
            {
                TableCell cell = sender as TableCell;
                cell.Text = propertyValue;
            }
            else if (sender is YTextBox)
            {
                YTextBox box = sender as YTextBox;
                //If in insert mode, no text should appear
                if (!this.InsertMode)
                {
                    box.Text = propertyValue;
                }
            }
            else if (sender is YCheckBox)
            {
                YCheckBox target = sender as YCheckBox;

                Boolean value = false;

                if (Boolean.TryParse(propertyValue, out value))
                {
                    target.Checked = value;
                }
            }
            else if (sender is YDropDownList)
            {
                YDropDownList target = sender as YDropDownList;

                ListItem item = target.Items.FindByValue(propertyValue);
                if (item != null)
                {
                    item.Selected = true;
                }
            }
        }

        private String GetPropertyValue(object dataItem, string format, string dataField)
        {
            String ret = String.Empty;

            if (dataItem == null) return string.Empty;

            if (String.IsNullOrEmpty(format))
            {
                return DataBinder.GetPropertyValue(dataItem, dataField, null);
            }
            else
            {
                object objVal = DataBinder.GetPropertyValue(dataItem, dataField);
                if (objVal == null) return string.Empty;

                if (IsDate)
                {
                    if (objVal.GetType() == typeof(MySqlDateTime))
                    {
                        // MySqlDateTimeはおそらくデッドコード
                        MySqlDateTime val = (MySqlDateTime)objVal;

                        if (val.IsValidDateTime && !val.IsNull)
                        {
                            ret = String.Format(format, val.GetDateTime());
                        }
                        else
                        {
                            ret = "";
                        }
                    }
                    else if (objVal is DateTime)
                    {
                        DateTime dt = (DateTime)objVal;
                        ret = String.Format(format, dt);
                    }

                    return ret;
                }
                else
                {
                    ret = String.Format(format, objVal);

                    return ret;
                }
            }
        }
    }
}