﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uc;

/// <summary>
/// BaseForm の概要の説明です
/// </summary>
public abstract class BaseForm : System.Web.UI.Page
{
    protected String _originalSelectCommand = string.Empty;
    protected ParameterCollection _selectCollection;

    private bool _isCheckAuth = true;
    public bool IsCheckAuth
    {
        set { _isCheckAuth = value; }
        get
        {
            return _isCheckAuth;
        }

    }

    //public String Hostname
    //{
    //    get { return Environment.MachineName.ToLower(); }
    //}

    public int UserId
    {
        set { Session["UserID"] = value; }
        get
        {
            if (Session["UserID"] == null)
            {
                return -1;
            }
            else
            {
                return Int32.Parse(Session["UserID"].ToString());
            }
        }

    }

    public String UserName
    {
        set { Session["UserName"] = value; }
        get
        {
            if (Session["UserName"] == null)
            {
                return "{none user}";
            }
            else
            {
                return Session["UserName"].ToString();
            }
        }
    }

    private BaseGridView _mainBaseGridView;

    public BaseGridView MainBaseGridView
    {
        set
        {
            _mainBaseGridView = value;
        }
        get
        {
            return _mainBaseGridView;
        }
    }

    private BaseSqlDataSource _mainBaseSqlDataSource;

    public BaseSqlDataSource MainBaseSqlDataSource
    {
        set
        {
            _mainBaseSqlDataSource = value;
        }
        get
        {
            return _mainBaseSqlDataSource;
        }
    }

    private BaseFormView _mainBaseFormView;

    public BaseFormView MainBaseFormView
    {
        set
        {
            _mainBaseFormView = value;
        }
        get
        {
            return _mainBaseFormView;
        }
    }



    public BaseForm()
    {
        //
        // TODO: コンストラクター ロジックをここに追加します
        //

        MaintainScrollPositionOnPostBack = true;

        




    }


   

    protected override void OnLoadComplete(EventArgs e)
    {

        Button search = this.FindControl("検索") as Button;
        Button clear = this.FindControl("Clear") as Button;

        if (search != null)
        {
            search.Click += 検索_Click;
        }
        if (clear != null)
        {
            clear.Click += Clear_Click;
        }

        YDropDownList pageSize = this.Master.FindControl("Main").FindControl("ページサイズ") as YDropDownList;

        if (pageSize != null)
        {
            if (pageSize.Items.Count <= 0)
            {
                if (!IsPostBack)
                {
                    pageSize.Items.Add("12");
                    pageSize.Items.Add("30");
                    pageSize.Items.Add("60");
                    pageSize.Items.Add("すべて");
                    pageSize.Items[3].Selected = true;

                    //MainBaseGridView.PageSize = 12;
                    MainBaseGridView.AllowPaging = false;

                    pageSize.AutoPostBack = true;
                    pageSize.SelectedIndexChanged += pageSize_SelectedIndexChanged;
                }
            }

        }

        base.OnLoadComplete(e);
    }

    protected void pageSize_SelectedIndexChanged(object sender, EventArgs e)
    {

        YDropDownList pageSize = (YDropDownList)sender;

        String value = pageSize.SelectedValue;

        int iPageSize = 0;

        if (int.TryParse(value, out iPageSize))
        {
            MainBaseGridView.AllowPaging = true;
            MainBaseGridView.PageSize = iPageSize;
        }
        else
        {
            MainBaseGridView.AllowPaging = false;
        }

    }

    protected void 検索_Click(object sender, EventArgs e)
    {
        Search();
    }


    protected void Clear_Click(object sender, EventArgs e)
    {
        ConditionClear();
        Search();

        this.MainBaseGridView.PageIndex = 0;
    }

    public bool ConvertToBoolean(object myValue)
    {
        if (myValue == null)
        {
            return false;
        }

        bool ret = false;

        if (Boolean.TryParse(myValue.ToString(), out ret))
        {
            return ret;
        }

        return ret;
    }

    //protected DataRowView GetHostName()
    //{
    //    // 未認証 Sessionが動いていないぞ。
    //    ConnectionStringSettings connString = ConfigurationManager.ConnectionStrings["mysqlConLocal"];

    //    BaseSqlDataSource ds = new BaseSqlDataSource();
    //    ds.Page = this;
    //    ds.ConnectionString = connString.ConnectionString;
    //    ds.ProviderName = connString.ProviderName;

    //    ds.SelectCommand = @"SELECT * FROM `mユーザー` WHERE ホスト名 = @ホスト名";

    //    ds.SelectParameters.Add("ホスト名", this.Hostname);

    //    DataSourceSelectArguments arg = new DataSourceSelectArguments();
    //    DataView view = (DataView)ds.Select(arg);

    //    if (view.Count > 0)
    //    {
    //        DataRowView row = view[0];
    //        return row; 
    //    }

    //    return null;

    //}

    protected override void OnLoad(EventArgs e)
    {

        if (this._isCheckAuth)
        {
            if (this.UserId == -1)
            {
                //DataRowView row = GetHostName();

                //if (row != null)
                //{
                //    this.UserId = int.Parse(row["ユーザーID"].ToString());
                //    this.UserName = row["ユーザー名"].ToString();
                //}
                //else
                //{
                    // データなし。Login.aspxへ遷移。
                    Response.Redirect("Login.aspx");
                //}
            }
        }

        base.OnLoad(e);


        Search();
    }

    protected abstract void Search();
    protected abstract void ConditionClear();
}