using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// FormatParam の概要の説明です
/// </summary>
public class FormatParam
{
    private String _key;
    private String _formatDisplayGrid;
    private String _formatEditGrid;
    private String _formatDisplayDetail;
    private String _formatEditDetail;

    public String Key
    {
        set { _key = value; }
        get { return _key; }
    }

    public String FormatDisplayGrid
    {
        set { _formatDisplayGrid = value; }
        get { return _formatDisplayGrid; }
    }


    public String FormatEditGrid
    {
        set { _formatEditGrid = value; }
        get { return _formatEditGrid; }
    }


    public String FormatDisplayDetail
    {
        set { _formatDisplayDetail = value; }
        get { return _formatDisplayDetail; }
    }


    public String FormatEditDetail
    {
        set { _formatEditDetail = value; }
        get { return _formatEditDetail; }
    }

    public FormatParam(String key, String formatDisplayGrid, String formatEditGrid, String formatDisplayDetail, String formatEditDetail)
	{
        _formatDisplayGrid = formatDisplayGrid;
        _formatEditGrid = formatEditGrid;
        _formatDisplayDetail = formatDisplayDetail;
        _formatEditDetail = formatEditDetail;
    }
}