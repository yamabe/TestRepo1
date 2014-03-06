using System;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;

/// <summary>
/// SessionManager の概要の説明です
/// </summary>
public class SessionManager
{
    HttpContext _ctx;
    Page _page;


    public SessionManager(HttpContext ctx)
    {
        _ctx = ctx;
    }

    public SessionManager(Page page)
    {
        _page = page;
    }

    private HttpSessionState GetSession()
    {
        if (_ctx != null)
        {
            return _ctx.Session;
        }
        else if (_page != null)
        {

            return _page.Session;
        }


        return null;
    }


    public int UserId
    {
        set { GetSession()["UserID"] = value; }
        get
        {

            if (GetSession() == null || GetSession()["UserID"] == null)
            {
                return -1;
            }
            else
            {
                return Int32.Parse(GetSession()["UserID"].ToString());
            }
        }

    }

    public String UserName
    {
        set { GetSession()["UserName"] = value; }
        get
        {
            if (GetSession() == null || GetSession()["UserName"] == null)
            {
                return "{none user}";
            }
            else
            {
                return GetSession()["UserName"].ToString();
            }
        }
    }
}