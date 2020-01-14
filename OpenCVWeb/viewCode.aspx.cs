using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace OpenCVWeb
{
    public partial class viewCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string dir1 = Server.MapPath("");
            string filename1 = Path.Combine(dir1, @"uploads/main.txt");
            TextReader r = new StreamReader(filename1);
            string tmp = r.ReadToEnd();
            r.Close();
            TextBox1.Text = tmp;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string dir2 = Server.MapPath("");
            string filename2 = Path.Combine(dir2, @"uploads/ImageProcess.txt");
            TextReader r = new StreamReader(filename2);
            string tmp = r.ReadToEnd();
            r.Close();
            TextBox2.Text = tmp;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string dir3 = Server.MapPath("");
            string filename3 = Path.Combine(dir3, @"uploads/Recognition.txt");
            TextReader r = new StreamReader(filename3);
            string tmp = r.ReadToEnd();
            r.Close();
            TextBox3.Text = tmp;
        }
    }
}