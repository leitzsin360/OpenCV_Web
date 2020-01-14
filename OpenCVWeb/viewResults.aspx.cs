using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpenCVWeb
{
    public partial class viewResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            LicensePlateDataContext lp = new LicensePlateDataContext();
            License license = new License();
            license.number = Request.QueryString["number"];
            license.time = Request.QueryString["time"];
            lp.License.InsertOnSubmit(license);
            lp.SubmitChanges();
            var data = from row in lp.License select row;
            GridView1.DataSource = data;
            GridView1.DataBind();
            Response.Write("<script>alert('数据库更新成功！')</script>");
        }
    }
}