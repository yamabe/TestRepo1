using System;
using System.Collections.Generic;
using System.Web;
using uc;

/// <summary>
/// BaseForm の概要の説明です
/// </summary>
public abstract class BaseForm : System.Web.UI.Page
{
    public BaseForm()
    {
        //
        // TODO: コンストラクター ロジックをここに追加します
        //
    }

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

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        Search();
    }

    protected abstract void Search();
    protected abstract void ConditionClear();
}