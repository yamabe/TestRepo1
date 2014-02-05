using System;
using System.Collections.Generic;
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
            //
            // TODO: コンストラクター ロジックをここに追加します
            //


        }

        protected override void CreateChildControls()
        {
            base.CreateChildControls();
        }

        protected override void OnRowDataBound(GridViewRowEventArgs e)
        {
            base.OnRowDataBound(e);

            if (AllowRowClick)
            {
                e.Row.Attributes.Add("onclick", "(__doPostBack('mainGridView','ShowDetailUpdate$" + e.Row.RowIndex + "'))");
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
                    BaseForm.MainBaseFormView.ChangeModeToEdit(rowIndex);
                }
                else if (e.CommandName == "Copy")
                {
                    CopyRow(rowIndex, BaseForm.MainBaseSqlDataSource, BaseForm.MainBaseFormView);
                }
            }
        }

        protected override void OnRowEditing(GridViewEditEventArgs e)
        {
            base.OnRowEditing(e);

            BaseForm.MainBaseFormView.PageIndex = e.NewEditIndex;
        }

        public virtual void CopyRow(int rowIndex, BaseSqlDataSource mainDataSource, BaseFormView mainFormView)
        {
            GridViewRow row = this.Rows[rowIndex];

            object o = row.DataItem;
            foreach (Parameter p in mainDataSource.InsertParameters)
            {
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

                Control c = row.FindControl(p.Name);


                object value = String.Empty;
                if (c is Label)
                {
                    value = ((Label)c).Text;
                }
                else if (c is DataControlFieldCell)
                {
                    value = ((DataControlFieldCell)c).Text;

                }

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
                // TODO これでは、同時処理時に正しく処理されないよ。
                mainFormView.PageIndex = Rows.Count;
                mainFormView.ChangeMode(FormViewMode.Edit);
            }
        }
    }
}