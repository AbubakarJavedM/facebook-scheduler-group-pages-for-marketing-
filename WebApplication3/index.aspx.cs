using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class fbwrite : System.Web.UI.Page
    {
        string sub;
        protected void Page_Load(object sender, EventArgs e)
        {
            string app_id = "118016668919326";
            string app_secret = "8f3d054f04d488019d09b689b46bcdaf";
            string scope = "manage_pages,user_managed_groups,publish_actions";

            if (Request["code"] == null)
            {
                Response.Redirect(string.Format(
                    "https://graph.facebook.com/oauth/authorize?client_id={0}&redirect_uri={1}&scope={2}",
                    app_id, Request.Url.AbsoluteUri, scope));
            }
            else
            {

                Dictionary<string, string> tokens = new Dictionary<string, string>();

                string url = string.Format("https://graph.facebook.com/oauth/access_token?client_id={0}&redirect_uri={1}&scope={2}&code={3}&client_secret={4}",
                    app_id, Request.Url.AbsoluteUri, scope, Request["code"].ToString(), app_secret);

                HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;

                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    StreamReader reader = new StreamReader(response.GetResponseStream());

                    string vals = reader.ReadToEnd();


                    foreach (string token in vals.Split('&'))
                    {
                        // Console.WriteLine(token.ToString());
                        //meh.aspx?token1=steve&token2=jake&...
                        //  tokens.Add(token.Substring(0, token.IndexOf(":")),
                        //    token.Substring(token.IndexOf(":") + 2, token.Length - token.IndexOf("D")+1));

                        sub = token.Substring(token.IndexOf(":") + 2, token.IndexOf("token_type"));
                        sub = sub.Substring(0, sub.IndexOf(",") - 1);

                    }
                    Session["token"] = sub;

                }

                //    tokens.Clear();
                /*        string access_token = sub;
                      //  string tokenn = access_token.ToString();
                        //tokenn[1];
                       var client = new FacebookClient(access_token);
                        //  client.Post("/me/feed", new { message = "ikjvS<bkj" });
                     dynamic group= client.Get("/me?fields=groups");
                        // string str = Request.Form["TextBox1"];
                        ArrayList myArrayList = new ArrayList();
                        int i = 0;
                        while (group.groups.data[i] != null)
                        {
                            Groups g = new Groups();
                            g.id = group.groups.data[i].id;
                            g.name = group.groups.data[i].name;
                            myArrayList.Add(group.groups.data[i]);
                            i++;
                        }
                    //    client.Post("/"+name+"/feed", new { message =str });*/
            }

            dynamic res=new Facebook.FacebookClient(sub).Get("me/");
            string name = res.name;
          bool flag = new DAO().verifyLogin(name.ToString());
            if (flag)
            {
                Response.Redirect("WebForm2.aspx");
            }
            else {
                Response.Write("You are not allowed to access this webiste");
            }
        }
    }
}