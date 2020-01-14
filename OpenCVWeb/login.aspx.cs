using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpenCVWeb
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (username.Text.Trim() == string.Empty)
            {
                Response.Write("<script>alert('请输入用户名！')</script>");
                return;
            }
            if (password.Text != "123456")
            {
                Response.Write("<script>alert('密码不正确！')</script>");
                return;
            }
            Session["username"] = username.Text;
            Session["password"] = password.Text;
            string str = "<script>alert('欢迎你！";
            str += Session["Username"];
            str += "');window.location.href='openImage.aspx'</script>";
            Response.Write(str);
        }
    }
}