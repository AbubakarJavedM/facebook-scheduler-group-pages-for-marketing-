using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication3
{

    public class DAO
    {
        public string connection;





        public MySqlConnection getConnection()
        {
            this.connection = "SERVER=154.0.170.55;Port=3306;username=mgyrj_t;password=ali@1234;database=mgyrjudd_fb";
            this.connection = "datasource=localhost;username=root;password=;database=fb";
            MySqlConnection con = new MySqlConnection(this.connection);
            return con;
        }
        public bool verifyLogin(string name)
        {
            this.connection = "SERVER=154.0.170.55;Port=3306;username=mgyrj_t;password=ali@1234;database=mgyrjudd_fb";
            MySqlConnection con = new MySqlConnection(connection);
            con.Open();
            string query = "SELECT * from user WHERE UserName=" + "'" + name + "'";
            MySqlCommand cmd = new MySqlCommand(query, con);
            MySqlDataReader rd = cmd.ExecuteReader();

            if (rd.HasRows == true)
            {
                con.Close();
                return true;
            }
            else
            {
                con.Close();
                return false;
            }
        }



        public string createUser(string name)
        {
            /// string result=null;
            this.connection = "SERVER=154.0.170.55;Port=3306;username=mgyrj_t;password=ali@1234;database=mgyrjudd_fb";
            MySqlConnection con = new MySqlConnection(this.connection);
            con.Open();
            string query = "insert into user(UserName) values(" + "'" + name + "')";
            try
            {
                MySqlCommand cmd = new MySqlCommand(query, con);
                MySqlDataReader rd = cmd.ExecuteReader();
                return "user added";
            }
            catch (Exception)
            {
                return "Error in adding record";
            }
            finally
            {
                con.Close();
            }


        }
        public void savePost(Post p)
        {
            this.connection = "SERVER=154.0.170.55;Port=3306;username=mgyrj_t;password=ali@1234;database=mgyrjudd_fb";
            MySqlConnection con = new MySqlConnection(this.connection);
            con.Open();
            string query = "insert into share(Post, ImageUrl,TimetoPost,GroupID,Frequency,TimeSpan,Status) values(" + "'" + p.post + "'," + "'" + p.imgurl + "'," + "'" + p.time + "'," + "'" + p.groupid + "'," + "'" + p.frequency + "','" + p.span + "','" + p.status + "')";
            MySqlCommand cmd = new MySqlCommand(query, con);
            MySqlDataReader rd = cmd.ExecuteReader();
            con.Close();

        }

        public List<Post> getPosts()
        {
            List<Post> P = new List<Post>();


            this.connection = "SERVER=154.0.170.55;Port=3306;username=mgyrj_t;password=ali@1234;database=mgyrjudd_fb";
            MySqlConnection con = new MySqlConnection(this.connection);
            con.Open();
            string query = "SELECT * from share WHERE Status='waiting'";
            MySqlCommand cmd = new MySqlCommand(query, con);
            MySqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                if (rd.HasRows == true)
                {
                    Post p = new Post();
                    p.ID = rd["ID"].ToString();
                    p.post = rd["Post"].ToString();
                    p.imgurl = rd["ImageUrl"].ToString();
                    p.time = rd["TimetoPost"].ToString();
                    p.groupid = rd["GroupID"].ToString();
                    p.span = rd["TimeSpan"].ToString();
                    p.status = rd["Status"].ToString();
                    p.frequency = rd["Frequency"].ToString();
                    P.Add(p);


                }



            }
            con.Close();
            return P;
        }


        public void updatePostStatus(Post p)
        {
            this.connection = "SERVER=154.0.170.55;Port=3306;username=mgyrj_t;password=ali@1234;database=mgyrjudd_fb";
            MySqlConnection con = new MySqlConnection(this.connection);
            con.Open();
            string query = "Update share SET Status='" + p.status + "', Frequency='" + p.frequency + "',TimetoPost='" + p.time + "'";
            MySqlCommand cmd = new MySqlCommand(query, con);
            MySqlDataReader rd = cmd.ExecuteReader();
            con.Close();
        }


        public void saveGroup(string username, string id, string groupname)
        {
            this.connection = "SERVER=154.0.170.55;Port=3306;username=mgyrj_t;password=ali@1234;database=mgyrjudd_fb";
            MySqlConnection con = new MySqlConnection(this.connection);
            con.Open();
            string query = "insert into groups(ID,UserName,Name) values(" + "'" + id + "','" + username + "','" + groupname + "') ";
            MySqlCommand cmd = new MySqlCommand(query, con);
            MySqlDataReader rd = cmd.ExecuteReader();
        }
        public List<Groups> getAllGroups(string uname)
        {
            List<Groups> P = new List<Groups>();


            this.connection = "SERVER=154.0.170.55;Port=3306;username=mgyrj_t;password=ali@1234;database=mgyrjudd_fb";
            MySqlConnection con = new MySqlConnection(this.connection);
            con.Open();
            string query = "SELECT * from groups WHERE UserName='" + uname + "'";
            MySqlCommand cmd = new MySqlCommand(query, con);
            MySqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                if (rd.HasRows == true)
                {
                    Groups p = new Groups();
                    p.id = rd["ID"].ToString();
                    p.name = rd["Name"].ToString();
                    P.Add(p);

                }



            }
            con.Close();
            return P;
        }
        public void updatePost(Post p)
        {
            this.connection = "SERVER=154.0.170.55;Port=3306;username=mgyrj_t;password=ali@1234;database=mgyrjudd_fb";
            MySqlConnection con = new MySqlConnection(this.connection);
            con.Open();
            string query = "Update share SET Status='" + p.status + "', Frequency='" + p.frequency + "',TimetoPost='" + p.time + "',TimeSpan='" + p.span + "',GroupID='" + p.groupid + "' WHERE Post='" + p.post + "'";
            MySqlCommand cmd = new MySqlCommand(query, con);
            MySqlDataReader rd = cmd.ExecuteReader();
            con.Close();
        }
    }///isse pehle sab functions rakhnay hain


}