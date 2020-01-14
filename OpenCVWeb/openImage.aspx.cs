using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpenCVWeb
{
    public partial class openImage : System.Web.UI.Page
    {
        private string uploadDir;

        protected void Page_Load(object sender, EventArgs e)
        {
            uploadDir = Path.Combine(Request.PhysicalApplicationPath, "uploads");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.PostedFile.FileName == "")
                Response.Write("<script>alert('没有图片上传！')</script>");
            else{
                if (FileUpload1.PostedFile.ContentLength > 204800)//200KB
                    Response.Write("<script>alert('图片大小不能超过200KB！')</script>");
                else{
                    string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                    switch (extension.ToLower()){
                        case ".jpg":case ".png":case ".jpeg":break;
                        default:
                            Response.Write("<script>alert('图片格式必须为jpg、png或jpeg！')</script>");
                            return;
                    }
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string fullPath = Path.Combine(uploadDir, fileName);
                    try{
                        FileUpload1.PostedFile.SaveAs(fullPath);
                        Image1.ImageUrl = "~/uploads/" + fileName;
                        savePathToTxt(fileName);
                        Button2.Visible = true;
                        Response.Write("<script>alert('图片成功上传！')</script>");
                    }catch (Exception){
                        Response.Write("<script>alert('图片上传失败！')</script>");
                    }
                }
            }
        }

        private void savePathToTxt(string imgname)
        {
            string dir1 = Server.MapPath("");
            string filename = Path.Combine(dir1, @"uploads/img.txt");
            TextWriter sw = new StreamWriter(filename);
            sw.Write("D://OpenCV_Web//OpenCVWeb//uploads//" + imgname);
            sw.Flush();
            sw.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("LicensePlate://runExe");
            string dir = Server.MapPath("");
            string filename = Path.Combine(dir, @"~/uploads/buffer.txt");
            if(File.Exists(filename))
            {
                TextReader tr = new StreamReader(filename);
                string number = tr.ReadToEnd();
                tr.Close();
                Response.Write("<script>alert('" + number + "')</script>");
                string url = "viewResults.aspx?number=" + number + "&time=" + DateTime.Now.ToString();
                Response.Redirect(url);
            }
            else Response.Write("<script>alert('buffer.txt不存在！')</script>");
        }
    }
}