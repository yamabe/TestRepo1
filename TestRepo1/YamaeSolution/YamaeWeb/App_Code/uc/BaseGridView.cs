using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace uc
{
    /// <summary>
    /// BaseGridView の概要の説明です
    /// </summary>
    public class BaseGridView : GridView
    {


        public int ScrollHeight
        {
            get
            {
                object o = ViewState["ScrollHeight"];
                return (o == null) ? 0 : (int)o;
            }
            set { ViewState["ScrollHeight"] = value; }
        }


        public bool AllowRowClick
        {
            get
            {
                object o = ViewState["AllowRowClick"];
                return (o == null) ? true : (bool)o;
            }
            set { ViewState["AllowRowClick"] = value; }
        }



        public BaseForm BaseForm
        {
            get { return (BaseForm)this.Page; }
        }

        public BaseGridView()
        {
            AllowRowClick = true;
            if (ScrollHeight == 0)
            {
                ScrollHeight = 420;
            }
        }

        protected override void CreateChildControls()
        {
            AllowSorting = false;

            base.CreateChildControls();
        }

        protected override void Render(HtmlTextWriter writer)
        {
            //ScrollHeight<div id="freezingDiv" style="OVERFLOW: auto; HEIGHT: 250px"> </div>
            writer.AddAttribute("id", "freezingDiv");
            writer.AddStyleAttribute(HtmlTextWriterStyle.Overflow, "auto");
            writer.AddStyleAttribute(HtmlTextWriterStyle.Height, ScrollHeight + "px");
            writer.RenderBeginTag(HtmlTextWriterTag.Div);
           
            base.Render(writer);

            writer.RenderEndTag();
        }

        protected override void OnRowDataBound(GridViewRowEventArgs e)
        {
            base.OnRowDataBound(e);

            if (AllowRowClick)
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                    {
                        e.Row.Attributes.Add("onclick", "__doPostBack('" + this.ClientID.Replace(this.ClientIDSeparator, '$') + "','ShowDetailUpdate$" + e.Row.RowIndex + "')");
                    }
                }
            }
        }

        protected override void OnRowCommand(GridViewCommandEventArgs e)
        {
            base.OnRowCommand(e);
            
            int rowIndex = -1;
            if (Int32.TryParse((String)e.CommandArgument, out rowIndex))
            {
                if (rowIndex < 0)
                {
                    return;
                }

                if (e.CommandName == "ShowDetailUpdate")
                {
                    if (this.PageIndex == 0)
                    {
                        BaseForm.MainBaseFormView.DataBind();
                        GridViewRow row = this.Rows[rowIndex];

                        BaseForm.MainBaseFormView.ChangeModeToEdit(row.DataItemIndex);
                    }
                    else
                    {
                        BaseForm.MainBaseFormView.DataBind();
                        GridViewRow row = this.Rows[rowIndex];

                        BaseForm.MainBaseFormView.ChangeModeToEdit(row.DataItemIndex);
                    }
                }
                else if (e.CommandName == "Copy")
                {
                    CopyRow(rowIndex, BaseForm.MainBaseSqlDataSource, BaseForm.MainBaseFormView);
                }
            }
        }

        protected override void OnSorting(GridViewSortEventArgs e)
        {
            base.OnSorting(e);
        }

        protected override void OnSorted(EventArgs e)
        {
            base.OnSorted(e);

            //BaseForm.MainBaseSqlDataSource.DataBind();
            //BaseForm.MainBaseFormView.DataBind();
           

        }
        protected override void OnRowEditing(GridViewEditEventArgs e)
        {
            base.OnRowEditing(e);

            BaseForm.MainBaseFormView.PageIndex = e.NewEditIndex;
        }

        public virtual void CopyRow(int rowIndex, BaseSqlDataSource mainDataSource, BaseFormView mainFormView)
        {
            GridViewRow row = this.Rows[rowIndex];

            DataView view = mainDataSource.Select(DataSourceSelectArguments.Empty) as DataView;

            DataRowView rowView = view[rowIndex];



            row.DataBind();
            object o = row.DataItem;
            foreach (Parameter p in mainDataSource.InsertParameters)
            {
                if (p.Direction == ParameterDirection.Output || p.Direction == ParameterDirection.ReturnValue)
                {
                    continue;
                }
                Boolean isPrimaryKey = false;
                foreach (string k in this.DataKeyNames)
                {
                    if (p.Name.ToLower() == k.ToLower())
                    {
                        isPrimaryKey = true;
                        break;
                    }
                }

                if (isPrimaryKey) continue;

                object value = rowView[p.Name];
                //Control c = row.FindControl(p.Name);


                //object value = String.Empty;
                //if (c is Label)
                //{
                //    value = ((Label)c).Text;
                //}
                //else if (c is DataControlFieldCell)
                //{
                //    value = ((DataControlFieldCell)c).Text;

                //}
                //else if (c is YDropDownList)
                //{
                //    YDropDownList ddl = c as YDropDownList;
                //    value = ddl.GetInternalValue();
                //}
                //else if (c is YCheckBox)
                //{
                //    YCheckBox check = c as YCheckBox;

                //    value = check.Checked.ToString();
                //}

                if (p.Type == TypeCode.Int32)
                {
                    if (!String.IsNullOrEmpty(value.ToString()))
                    {
                        value = int.Parse(value.ToString(), NumberStyles.AllowCurrencySymbol | NumberStyles.Number);
                    }
                }
                else if (p.Type == TypeCode.Decimal)
                {
                    if (!String.IsNullOrEmpty(value.ToString()))
                    {
                        value = decimal.Parse(value.ToString(), NumberStyles.AllowCurrencySymbol | NumberStyles.Number);
                    }
                }

                else if (p.Type == TypeCode.DateTime)
                {
                    if (!String.IsNullOrEmpty(value.ToString()))
                    {
                        value = DateTime.Parse(value.ToString());
                    }
                }

                p.DefaultValue = value.ToString();
            }

            int ret = mainDataSource.Insert();

            if (ret >= 0)
            {
                mainFormView.PageIndex = 0;
                mainFormView.ChangeMode(FormViewMode.Edit);
            }
        }
    }
}