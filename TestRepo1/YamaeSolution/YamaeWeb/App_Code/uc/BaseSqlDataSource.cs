using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;
namespace uc
{
    /// <summary>
    /// BaseSqlDataSource の概要の説明です
    /// </summary>
    public class BaseSqlDataSource : SqlDataSource
    {
        public string OrderBy
        {
            get
            {
                object o = ViewState["OrderBy"];
                return (o == null) ? string.Empty : o.ToString();
            }
            set { ViewState["OrderBy"] = value; }
        }


        public BaseForm BaseForm
        {
            get { return (BaseForm)this.Page; }
        }

        public BaseSqlDataSource()
        {

            Inserting += BaseSqlDataSource_Inserting;
            Updating += BaseSqlDataSource_Updating;

            Inserted += BaseSqlDataSource_Inserted;
            Updated += BaseSqlDataSource_Updated;

            Deleted += BaseSqlDataSource_Deleted;

            Selecting += BaseSqlDataSource_Selecting;

        }

        void BaseSqlDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            // WHERE (`削除フラグ` is null or `削除フラグ` !=  'true')
            DbCommand command = e.Command;

            String commandText = command.CommandText.ToLower();

            if (!commandText.Contains("削除フラグ"))
            {
                if (commandText.Contains("where"))
                {
                    commandText += " and 削除フラグ <> 'True' ";
                }
                else
                {
                    commandText += " where 削除フラグ <> 'True' ";
                }
            }

            command.CommandText = commandText;

            if (BaseForm.MainBaseGridView != null)
            {
                if (!String.IsNullOrEmpty(BaseForm.MainBaseGridView.SortExpression))
                {
                    if (!commandText.Contains("order by"))
                    {
                        command.CommandText += " order by 作成日時" + BaseForm.MainBaseGridView.SortExpression + " ";

                        if (BaseForm.MainBaseGridView.SortDirection == SortDirection.Ascending)
                        {
                            command.CommandText += " asc";
                        }
                        else
                        {
                            command.CommandText += " desc";

                        }
                    }

                }
            }


            if ((command.CommandText.ToLower().Contains(" mコード ") || command.CommandText.ToLower().Contains("`mコード`")) && !command.CommandText.ToLower().Contains("join"))
            {

                if (!command.CommandText.ToLower().Contains("order by"))
                {
                    if (String.IsNullOrEmpty(OrderBy))
                    {
                        command.CommandText += " order by 順序";
                    }
                    else
                    {
                        command.CommandText += " order by " + OrderBy + ", 順序";
                    }
                }
            }
            else
            {
                if (!command.CommandText.ToLower().Contains("order by"))
                {
                    if (!String.IsNullOrEmpty(OrderBy))
                    {
                        command.CommandText += " order by " + OrderBy + " ";
                    }
                }
            }


        }


        public void AddSelectParameter(List<String> where, String name, String value)
        {
            if (!String.IsNullOrEmpty(value))
            {
                StringBuilder sb = new StringBuilder();

                sb.Append(" ");
                sb.Append(name);
                sb.Append(" = ");
                sb.Append("@");
                sb.Append(name);
                sb.Append(" ");

                where.Add(sb.ToString());

                this.SelectParameters.Add(name, value);
            }
        }

        public void AddSelectParameter(List<String> where, String name, String value, String ope)
        {
            if (!String.IsNullOrEmpty(value))
            {
                StringBuilder sb = new StringBuilder();

                sb.Append(" ");
                sb.Append(name);
                sb.Append(" ");
                sb.Append(ope);
                sb.Append(" ");

                sb.Append("@");
                sb.Append(name);
                sb.Append(" ");

                where.Add(sb.ToString());

                this.SelectParameters.Add(name, value);
            }
        }

        public void AddSelectParameter(List<String> where, String name, String name1, String name2, String value1, String value2)
        {
            if (!String.IsNullOrEmpty(value1) && !String.IsNullOrEmpty(value2))
            {
                StringBuilder sb = new StringBuilder();

                sb.Append(" ");
                sb.Append(name);
                sb.Append(" between ");

                sb.Append("@");
                sb.Append(name1);
                sb.Append(" and ");

                sb.Append("@");
                sb.Append(name2);
                sb.Append(" ");

                where.Add(sb.ToString());

                this.SelectParameters.Add(name1, value1);
                this.SelectParameters.Add(name2, value2);
            }
            else if (!String.IsNullOrEmpty(value1))
            {
                AddSelectParameter(where, name, value1, " >= ");
            }
            else if (!String.IsNullOrEmpty(value2))
            {
                AddSelectParameter(where, name, value2, " <= ");
            }
        }

        public void AddSelectParameterLike(List<String> where, String name, String value)
        {
            if (!String.IsNullOrEmpty(value))
            {
                StringBuilder sb = new StringBuilder();
                sb.Append(" ");
                sb.Append(name);
                sb.Append(" like ");
                sb.Append("@");
                sb.Append(name);
                sb.Append(" ");

                where.Add(sb.ToString());

                this.SelectParameters.Add(name, "%" + value + "%");
            }
        }

        void BaseSqlDataSource_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (this.BaseForm.MainBaseGridView.Rows.Count <= 0)
            {
                this.BaseForm.MainBaseFormView.PageIndex = -1;
            }
            else
            {
                this.BaseForm.MainBaseFormView.PageIndex = 0;
            }
        }

        void BaseSqlDataSource_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {

            //throw new NotImplementedException();
        }

        void BaseSqlDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Command.Parameters.IndexOf("@NewParameter") >= 0)
            {

                int ret = Convert.ToInt32(e.Command.Parameters["@NewParameter"].Value);
                string s = string.Empty;
            }
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }

        void BaseSqlDataSource_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            if (!e.Command.Parameters.Contains("最終更新ユーザー"))
            {

                DbParameter p = e.Command.CreateParameter();
                p.DbType = System.Data.DbType.String;
                p.ParameterName = "最終更新ユーザー";
                e.Command.Parameters.Add(p);

            }

            if (!e.Command.Parameters.Contains("最終更新日時"))
            {

                DbParameter p = e.Command.CreateParameter();
                p.DbType = System.Data.DbType.DateTime;
                p.ParameterName = "最終更新日時";
                e.Command.Parameters.Add(p);

            }

            e.Command.Parameters["最終更新ユーザー"].Value = BaseForm.UserId;
            e.Command.Parameters["最終更新日時"].Value = DateTime.Now;
        }

        void BaseSqlDataSource_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            if (e.Command.Parameters["削除フラグ"].Value != null && String.IsNullOrEmpty(e.Command.Parameters["削除フラグ"].Value.ToString()))
            {
                e.Command.Parameters["削除フラグ"].Value = Boolean.FalseString;
            }
            if (e.Command.Parameters["作成ユーザー"].Value != null && String.IsNullOrEmpty(e.Command.Parameters["作成ユーザー"].Value.ToString()))
            {
                e.Command.Parameters["作成ユーザー"].Value = BaseForm.UserId;
            }
            //
            e.Command.Parameters["作成日時"].Value = DateTime.Now;

            if (e.Command.Parameters["最終更新ユーザー"].Value != null && String.IsNullOrEmpty(e.Command.Parameters["最終更新ユーザー"].Value.ToString()))
            {
                e.Command.Parameters["最終更新ユーザー"].Value = BaseForm.UserId;
            }
            e.Command.Parameters["最終更新日時"].Value = DateTime.Now;
        }

    }
}