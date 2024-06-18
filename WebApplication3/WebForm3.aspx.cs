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
    public partial class WebForm3 : System.Web.UI.Page
    {
        //string uname;
        List<Groups> G = new List<Groups>(); 
        protected void Page_Load(object sender, EventArgs e)
        {
           /// if (!IsPostBack)
           // {
               // CheckBoxList1.Items.Clear();
              //  CheckBoxList2.Items.Clear();
            //}
            /*   dynamic coverPhoto = new FacebookClient(Session["token"].ToString()).Get("me/?fields=cover");
               dynamic profilePhoto=new  FacebookClient(Session["token"].ToString()).Get("me?fields=albums{picture}");
               coverphoto.Src =coverPhoto.cover.source;
               string access_token = Session["token"].ToString();
               dynamic naame = new FacebookClient(Session["token"].ToString()).Get("/me");
               naam.Text = naame.name;
               profilepicture.Src = profilePhoto.albums.data[0].picture.data.url;
               dynamic res = new FacebookClient(access_token).Get("/me");
               string uname = res.name;
               */
            dynamic coverPhoto = new FacebookClient(Session["token"].ToString()).Get("me/?fields=cover");
            dynamic profilePhoto = new FacebookClient(Session["token"].ToString()).Get("me?fields=picture");
            dynamic naame = new FacebookClient(Session["token"].ToString()).Get("/me");
            naam.Text = naame.name;
            coverphoto.Src = coverPhoto.cover.source;
            string access_token = Session["token"].ToString();
            profilepicture.Src = profilePhoto.picture.data.url;
            var client = new FacebookClient(access_token);
            DAO db = new DAO();
           string uname = naame.name;
            G = db.getAllGroups(uname);
            for (int i = 0; i < G.Count; i++)
            {

                //  mtb.InnerHtml = "<tr><td>" + G[i].name + "</td></tr>";
                CheckBoxList2.Items.Add(G[i].name);
            }
            List<Post> P = new List<Post>();
            P = new DAO().getPosts();
            for (int i = 0; i < P.Count; i++)
            {

                CheckBoxList1.Items.Add(P[i].post);
            }
        }


        protected void schedulePost(object sender, EventArgs e)
        {
            
                string access_token = Session["token"].ToString();
                List<string> id = new List<string>();
                List<Post> pp = new List<Post>();
                pp = new DAO().getPosts();
                dynamic res = new FacebookClient(access_token).Get("/me");
                 string uname = res.name;

                
                for (int i = 0; i < CheckBoxList2.Items.Count; i++)
                {
                    if (CheckBoxList2.Items[i].Selected == true)
                    {
                        string x = CheckBoxList2.Items[i].Value;
                        List<Groups> Gr = new List<Groups>();
                        Gr= new DAO().getAllGroups(uname);
                        id.Add(Gr[i].id);

                    }
                }
                for (int i = 0; i < id.Count; i++)
                {
                    for (int j = 0; j < CheckBoxList1.Items.Count; j++)
                    {
                        if (CheckBoxList1.Items[j].Selected == true)
                        {
                            Post p = new Post();
                            pp[j].time = time.Text;
                            pp[j].frequency = freq.Text;
                            pp[j].span = delay.Text;
                            pp[j].groupid = id[i];
                            ///  p = new Post(tb1.Text.ToString(), "noimg", id[i], time.Text, freq.Text, delay.Text, "waiting");

                            DAO db = new DAO();

                            db.updatePost(pp[j]);
                        }
                    }
                }
            
            CheckBoxList1.Items.Clear();
            CheckBoxList2.Items.Clear();
            List<Groups> GGG = new List<Groups>();
            GGG=new DAO().getAllGroups(uname);
            for (int i = 0; i < G.Count; i++)
            {

                //  mtb.InnerHtml = "<tr><td>" + G[i].name + "</td></tr>";
                CheckBoxList2.Items.Add(G[i].name);
            }
            List<Post> P = new List<Post>();
            P = new DAO().getPosts();
            for (int i = 0; i < P.Count; i++)
            {

                CheckBoxList1.Items.Add(P[i].post);
            }

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

    }////isseuparupar

}