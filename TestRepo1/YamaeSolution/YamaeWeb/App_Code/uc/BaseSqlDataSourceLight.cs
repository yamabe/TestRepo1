﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Diagnostics;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace uc
{
    /// <summary>
    /// BaseSqlDataSource の概要の説明です
    /// </summary>
    public class BaseSqlDataSourceLight : SqlDataSource
    {

        private int _lastInsertId;

        public int LastInsertId
        {
            get { return _lastInsertId; }
        }

        public string OrderBy
        {
            get
            {
                object o = ViewState["OrderBy"];
                return (o == null) ? string.Empty : o.ToString();
            }
            set { ViewState["OrderBy"] = value; }
        }

        private int _userId;

        public BaseSqlDataSourceLight(int userId)
        {
            _userId = userId;

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

            //if (BaseForm.MainBaseGridView != null)
            //{
            //    if (!String.IsNullOrEmpty(BaseForm.MainBaseGridView.SortExpression))
            //    {
            //        if (!commandText.Contains("order by"))
            //        {
            //            command.CommandText += " order by 作成日時" + BaseForm.MainBaseGridView.SortExpression + " ";

            //            if (BaseForm.MainBaseGridView.SortDirection == SortDirection.Ascending)
            //            {
            //                command.CommandText += " asc";
            //            }
            //            else
            //            {
            //                command.CommandText += " desc";

            //            }
            //        }

            //    }
            //}


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

        public void AddSelectParameterOr(List<String> where, List<String> names, String value, String ope)
        {
            if (!String.IsNullOrEmpty(value))
            {
                List<String> orCondition = new List<String>();

                foreach (String n in names)
                {
                    StringBuilder sb = new StringBuilder();
                    sb.Append(n);
                    sb.Append(" ");
                    sb.Append(ope);
                    sb.Append(" ");
                    sb.Append("@");
                    sb.Append(n);
                    this.SelectParameters.Add(n, value);

                    orCondition.Add(sb.ToString());
                }

                String s = StringUtils.Join(orCondition, " or ");

                if (!String.IsNullOrEmpty(s))
                {
                    where.Add(" ( " + s + " ) ");
                }


            }
        }


        public void AddSelectParameterBetween(List<String> where, String name, String value1, String value2)
        {
            if (!String.IsNullOrEmpty(value1) && !String.IsNullOrEmpty(value2))
            {
                StringBuilder sb = new StringBuilder();

                sb.Append(" ");
                sb.Append(name);
                sb.Append(" between ");

                sb.Append("@");
                sb.Append(name + "_開始");
                sb.Append(" and ");

                sb.Append("@");
                sb.Append(name + "_終了");
                sb.Append(" ");

                where.Add(sb.ToString());

                this.SelectParameters.Add(name + "_開始", value1);
                this.SelectParameters.Add(name + "_終了", value2);
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

        //public void AddSelectParameterBetweenOr(List<String> where, List<String> names, String value1, String value2)
        //{
        //    if (!String.IsNullOrEmpty(value1) && !String.IsNullOrEmpty(value2))
        //    {

        //        List<String> orCondition = new List<String>();

        //        foreach (String n in names)
        //        {
        //            StringBuilder sb = new StringBuilder();


        //            sb.Append(" ");
        //            sb.Append(n);
        //            sb.Append(" between ");

        //            sb.Append("@");
        //            sb.Append(n + "_開始");
        //            sb.Append(" and ");

        //            sb.Append("@");
        //            sb.Append(n + "_終了");
        //            sb.Append(" ");


        //            this.SelectParameters.Add(n + "_開始", value1);
        //            this.SelectParameters.Add(n + "_終了", value2);

        //            orCondition.Add(sb.ToString());
        //        }

        //        where.Add( " ( " + StringUtils.Join(orCondition, " or ") + " ) ");

        //    }
        //    else if (!String.IsNullOrEmpty(value1))
        //    {
        //        AddSelectParameter(where, name, value1, " >= ");
        //    }
        //    else if (!String.IsNullOrEmpty(value2))
        //    {
        //        AddSelectParameter(where, name, value2, " <= ");
        //    }
        //}

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

        public void AddSelectParameterLikeOr(List<String> where, List<String> names, String value)
        {
            if (!String.IsNullOrEmpty(value))
            {
                List<String> orCondition = new List<String>();

                foreach (String n in names)
                {
                    StringBuilder sb = new StringBuilder();
                    sb.Append(n);
                    sb.Append(" like ");
                    sb.Append("@");
                    sb.Append(n);
                    this.SelectParameters.Add(n, "%" + value + "%");

                    orCondition.Add(sb.ToString());
                }
                String s = StringUtils.Join(orCondition, " or ");

                if (!String.IsNullOrEmpty(s))
                {
                    where.Add(" ( " + s + " ) ");
                }

            }
        }

        public void AddSelectParameterLikeOr(List<String> where, List<String> names, List<String> values)
        {
            if (values.Count > 0)
            {
                List<String> orCondition = new List<String>();

                foreach (String n in names)
                {
                    for (int i = 0; i < values.Count; i++) {
                        String v = values[i];

                        if (String.IsNullOrEmpty(v))
                        {
                            continue;
                        }

                        StringBuilder sb = new StringBuilder();
                        sb.Append(n);
                        sb.Append(" like ");
                        sb.Append("@");
                        sb.Append(n + "_" + i);
                        this.SelectParameters.Add(n + "_" + i, "%" + v + "%");

                        orCondition.Add(sb.ToString());
                    }
                }

                String s = StringUtils.Join(orCondition, " or ");

                if (!String.IsNullOrEmpty(s))
                {
                    where.Add(" ( " + s + " ) ");
                }

            }
        }

        void BaseSqlDataSource_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            //if (this.BaseForm.MainBaseGridView.Rows.Count <= 0)
            //{
            //    this.BaseForm.MainBaseFormView.PageIndex = -1;
            //}
            //else
            //{
            //    this.BaseForm.MainBaseFormView.PageIndex = 0;
            //}
        }

        void BaseSqlDataSource_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            String s = string.Empty;
            //throw new NotImplementedException();
        }

        void BaseSqlDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            long newID = ((MySqlCommand)e.Command).LastInsertedId;

            MySqlCommand cmd2 = new MySqlCommand("SELECT LAST_INSERT_ID()", (MySqlConnection)e.Command.Connection);

            object id = cmd2.ExecuteScalar();

            if (id != null)
            {
                if (int.TryParse(id.ToString(), out _lastInsertId))
                {

                }
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

            e.Command.Parameters["最終更新ユーザー"].Value = _userId;
            e.Command.Parameters["最終更新日時"].Value = DateTime.Now;
        }

        void BaseSqlDataSource_Inserting(object sender, SqlDataSourceCommandEventArgs e)
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

            if (!e.Command.Parameters.Contains("作成ユーザー"))
            {

                DbParameter p = e.Command.CreateParameter();
                p.DbType = System.Data.DbType.String;
                p.ParameterName = "作成ユーザー";
                e.Command.Parameters.Add(p);

            }

            if (!e.Command.Parameters.Contains("作成日時"))
            {

                DbParameter p = e.Command.CreateParameter();
                p.DbType = System.Data.DbType.DateTime;
                p.ParameterName = "作成日時";
                e.Command.Parameters.Add(p);

            }


            if (!e.Command.Parameters.Contains("削除フラグ"))
            {

                DbParameter p = e.Command.CreateParameter();
                p.DbType = System.Data.DbType.Boolean;
                p.ParameterName = "削除フラグ";
                e.Command.Parameters.Add(p);

            }





            if (e.Command.Parameters["削除フラグ"].Value != null && String.IsNullOrEmpty(e.Command.Parameters["削除フラグ"].Value.ToString()))
            {
                e.Command.Parameters["削除フラグ"].Value = Boolean.FalseString;
            }
            if (e.Command.Parameters["作成ユーザー"].Value != null && String.IsNullOrEmpty(e.Command.Parameters["作成ユーザー"].Value.ToString()))
            {
                e.Command.Parameters["作成ユーザー"].Value =  _userId;
            }
            e.Command.Parameters["作成日時"].Value = DateTime.Now;

            if (e.Command.Parameters["最終更新ユーザー"].Value != null && String.IsNullOrEmpty(e.Command.Parameters["最終更新ユーザー"].Value.ToString()))
            {
                e.Command.Parameters["最終更新ユーザー"].Value = _userId;
            }
            e.Command.Parameters["最終更新日時"].Value = DateTime.Now;
        }

    }
}