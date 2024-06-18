using Facebook;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            dynamic coverPhoto = new FacebookClient(Session["token"].ToString()).Get("me/?fields=cover");
            dynamic profilePhoto = new FacebookClient(Session["token"].ToString()).Get("me?fields=albums{picture}");
            coverphoto.Src = coverPhoto.cover.source;
            string access_token = Session["token"].ToString();
            profilepicture.Src = profilePhoto.albums.data[0].picture.data.url;
            dynamic naame = new FacebookClient(Session["token"].ToString()).Get("/me");
            naam.Text = naame.name;
            */
            dynamic coverPhoto = new FacebookClient(Session["token"].ToString()).Get("me/?fields=cover");
            dynamic profilePhoto = new FacebookClient(Session["token"].ToString()).Get("me?fields=picture");
            dynamic naame = new FacebookClient(Session["token"].ToString()).Get("/me");
            naam.Text = naame.name;
            coverphoto.Src = coverPhoto.cover.source;
            string access_token = Session["token"].ToString();
            profilepicture.Src = profilePhoto.picture.data.url;
        }
        
        protected void Button5_Click(object sender, EventArgs e)
        {

            Post p = new Post();
            string post = tb1.Text;
            string imgurl;
            if (FileUpload1.HasFile == true)
            {
                FileUpload1.PostedFile.SaveAs(Server.MapPath("/uploads/") + FileUpload1.FileName.ToString());
                imgurl = FileUpload1.FileName.ToString();
                ////flag = true;
            }
            else { imgurl = "noimg"; }

            p.time = "-1:-1";
            p.groupid = "-1";
            p.status = "waiting";
            p.post = post;
            p.imgurl = imgurl;
            p.span = "0";
            new DAO().savePost(p);

        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            string access_token = Session["token"].ToString();
            //     Label5.Text = "changed";
            //  Label2.Text = "UpdatePanel1 refreshed at: " +
            ///DateTime.Now.ToLongTimeString();
            //   Label2.Text = "UpdatePanel2 refreshed at: " +
            string current = DateTime.Now.ToString("%H:%m");
            // string vals = time.Text;
            string[] words = current.Split(':');

            int hours = int.Parse(words[0]);
            int minutes = int.Parse(words[1]);

            List<Post> p = new DAO().getPosts();
            for (int i = 0; i < p.Count; i++)
            {
                // var imagestream = File.OpenRead("C:\\Users\\Abubakar javaid\\Documents\\visual studio 2015\\Projects\\WebApplication3\\WebApplication3\\uploads\\IMG_0003.JPG");
                string[] word = p[i].time.Split(':');
                int hrs = int.Parse(word[0]);
                int mins = int.Parse(word[1]);
                if ((hours == hrs) && (minutes == mins))
                {
                    var client = new FacebookClient(access_token);
                    if (p[i].imgurl.CompareTo("noimg") == 0)
                    {
                        client.Post(p[i].groupid + "/feed/", new { message = p[i].post });
                    }
                    else
                    {
                        dynamic parameters = new ExpandoObject();
                        parameters.message = p[i].post;
                        parameters.file = new FacebookMediaObject
                        {
                            ContentType = "image/jpeg",
                            FileName = p[i].imgurl
                        }.SetValue(File.ReadAllBytes(Server.MapPath("/uploads/" + p[i].imgurl)));

                        client.Post(p[i].groupid + "/photos/", parameters);
                    }
                    int gg = int.Parse(p[i].span.ToString());
                    gg = gg + hrs;
                    if (gg >= 24)
                    {
                        gg = gg % 24;
                    }
                    p[i].time = gg.ToString() + ":" + word[1];
                    int g = int.Parse(p[i].frequency.ToString());
                    g = g - 1;
                    if (g > 0)
                    {
                        p[i].frequency = g.ToString();
                    }
                    else
                    {
                        g = 0;
                        p[i].frequency = g.ToString();
                        p[i].status = "posted";
                    }
                    new DAO().updatePostStatus(p[i]);


                }
            }
        }
    }
}