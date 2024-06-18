using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication3
{
    public class Post
    {
        public Post()
        { }
        public Post(string post, string imgurl, string groupid, string time, string frequency, string span, string status)
        {
            this.post = post;
            this.imgurl = imgurl;
            this.groupid = groupid;
            this.time = time;
            this.frequency = frequency;
            this.span = span;
            this.status = status;
        }
        public string post { get; set; }
        public string imgurl { get; set; }
        public string groupid { get; set; }
        public string time { get; set; }
        public string frequency { get; set; }
        public string span { get; set; }
        public string status { get; set; }
        public string ID { get; set; }
    }
}