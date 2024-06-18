using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Facebook;
using System.Dynamic;
using System.IO;

namespace WebApplication3
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dynamic coverPhoto = new FacebookClient(Session["token"].ToString()).Get("me/?fields=cover");
            dynamic profilePhoto = new FacebookClient(Session["token"].ToString()).Get("me?fields=picture");
            dynamic naame = new FacebookClient(Session["token"].ToString()).Get("/me");
            naam.Text = naame.name;
            coverphoto.Src = coverPhoto.cover.source;
            string access_token = Session["token"].ToString();
            profilepicture.Src = profilePhoto.picture.data.url;
            chechAuthorization();

        }
        public void chechAuthorization()
        {
            try
            {
                FacebookClient fb = new FacebookClient(Session["token"].ToString());
                dynamic groupname = fb.Get("/me/groups");
                //  int i = 0;

                for (int i = 0; i < 1; i++)
                {
                    Label1.Text = groupname.data[i].name;
                    dynamic message = fb.Get(groupname.data[i].id + "/feed");
                    Label3.Text = message.data[0].message;
                    dynamic likes = fb.Get(message.data[0].id + "/likes");
                    int j = 0;
                    try
                    {
                        while (likes.data[j] != null) { j++; }
                    }
                    catch (Exception)
                    { }
                    Label2.Text = j.ToString();
                    j = 0;
                    dynamic shares = fb.Get(message.data[0].id + "?fields=shares");
                    try
                    {
                        while (shares.data[j] != null) { j++; }
                    }
                    catch (Exception) { }
                    lbl1.Text = j.ToString();
                    j = 0;

                }
                for (int i = 1; i < 2; i++)
                {
                    Label17.Text = groupname.data[i].name;
                    dynamic message = fb.Get(groupname.data[i].id + "/feed");
                    Label16.Text = message.data[0].message;
                    dynamic likes = fb.Get(message.data[0].id + "/likes");
                    int j = 0;
                    try
                    {
                        while (likes.data[j] != null) { j++; }
                    }
                    catch (Exception)
                    { }
                    Label18.Text = j.ToString();
                    j = 0;
                    dynamic shares = fb.Get(message.data[0].id + "?fields=shares");
                    try
                    {
                        while (shares.data[j] != null) { j++; }
                    }
                    catch (Exception) { }
                    Label19.Text = j.ToString();
                    j = 0;

                }
                for (int i = 2; i < 3; i++)
                {
                    Label21.Text = groupname.data[i].name;
                    dynamic message = fb.Get(groupname.data[i].id + "/feed");
                    Label20.Text = message.data[0].message;
                    dynamic likes = fb.Get(message.data[0].id + "/likes");
                    int j = 0;
                    try
                    {
                        while (likes.data[j] != null) { j++; }
                    }
                    catch (Exception)
                    { }
                    Label22.Text = j.ToString();
                    j = 0;
                    dynamic shares = fb.Get(message.data[0].id + "?fields=shares");
                    try
                    {
                        while (shares.data[j] != null) { j++; }
                    }
                    catch (Exception) { }
                    Label23.Text = j.ToString();
                    j = 0;

                }
                for (int i = 3; i < 4; i++)
                {
                    Label5.Text = groupname.data[i].name;
                    dynamic message = fb.Get(groupname.data[i].id + "/feed");
                    Label4.Text = message.data[0].message;
                    dynamic likes = fb.Get(message.data[0].id + "/likes");
                    int j = 0;
                    try
                    {
                        while (likes.data[j] != null) { j++; }
                    }
                    catch (Exception)
                    { }
                    Label6.Text = j.ToString();
                    j = 0;
                    dynamic shares = fb.Get(message.data[0].id + "?fields=shares");
                    try
                    {
                        while (shares.data[j] != null) { j++; }
                    }
                    catch (Exception) { }
                    Label7.Text = j.ToString();
                    j = 0;

                }
                for (int i = 4; i < 5; i++)
                {
                    Label9.Text = groupname.data[i].name;
                    dynamic message = fb.Get(groupname.data[i].id + "/feed");
                    Label8.Text = message.data[0].message;
                    dynamic likes = fb.Get(message.data[0].id + "/likes");
                    int j = 0;
                    try
                    {
                        while (likes.data[j] != null) { j++; }
                    }
                    catch (Exception)
                    { }
                    Label10.Text = j.ToString();
                    j = 0;
                    dynamic shares = fb.Get(message.data[0].id + "?fields=shares");
                    try
                    {
                        while (shares.data[j] != null) { j++; }
                    }
                    catch (Exception) { }
                    Label11.Text = j.ToString();
                    j = 0;

                }
                for (int i = 5; i < 6; i++)
                {
                    Label13.Text = groupname.data[i].name;
                    dynamic message = fb.Get(groupname.data[i].id + "/feed");
                    Label2.Text = message.data[0].message;
                    dynamic likes = fb.Get(message.data[0].id + "/likes");
                    int j = 0;
                    try
                    {
                        while (likes.data[j] != null) { j++; }
                    }
                    catch (Exception)
                    { }
                    Label14.Text = j.ToString();
                    j = 0;
                    dynamic shares = fb.Get(message.data[0].id + "?fields=shares");
                    try
                    {
                        while (shares.data[j] != null) { j++; }
                    }
                    catch (Exception) { }
                    Label15.Text = j.ToString();
                    j = 0;

                }
            }
            catch (Exception) { }
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