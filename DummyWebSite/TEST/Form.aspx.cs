using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TEST_Form : System.Web.UI.Page
{
    public string Today = DateTime.Today.ToString("yyyy-MM-dd");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}