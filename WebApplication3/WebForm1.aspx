<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/style.css" rel="stylesheet"/>
</head>
<body>
    
    
    <form id="form1" runat="server">
    
   <div class="container">


    <div class="col-md-12">
        <div class="profile clearfix">                            
            <div class="image">
                <img src="images/11.jpg" class="img-cover"/>
            </div>                            
            <div class="user clearfix">
                <div class="avatar">
                    <img src="https://bootdey.com/img/Content/user-453533-fdadfd.png" class="img-thumbnail img-profile"/>
                </div>                                
                <h2>John Doe</h2>                                
                <div class="actions">
                    <div class="btn-group">
                        <asp:Button ID="Button4" runat="server" class="btn btn-default btn-lg tip btn-responsive" title="" data-original-title="Add to friends" Text="DashBoard" />
                        <asp:Button ID="Button1" runat="server" class="btn btn-default btn-lg tip btn-responsive" title="" data-original-title="Add to friends" Text="Page Insights" />
                        <asp:Button ID="Button2" runat="server" class="btn btn-default btn-lg tip btn-responsive" title="" data-original-title="Add to friends" Text="FaceBook Post" />
                        <asp:Button ID="Button3" runat="server" class="btn btn-default btn-lg tip btn-responsive" title="" data-original-title="Add to friends" Text="Group Sharing" />
                        <div class="btn-group btn-group-primary">
                            <asp:DropDownList ID="DropDownList2" class="apt btn btn-default btn-lg tip btn-responsive" runat="server">
                                <asp:ListItem>Select Page</asp:ListItem>
                                <asp:ListItem>Page1</asp:ListItem>
                                <asp:ListItem>Page2</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>                                                                                                
             
            </div>                                                       
        </div>
    </div>
    <div class="col-md-12">
            <div class="col-md-3">

                <ul class="nav nav-pills nav-stacked">
                    <li class="mt"><a href="#">Home</a></li>
                    <li class="mt active" ><a href="#">Schedule Post</a></li>
                    <li class="mt"><a href="#">Pages</a></li>
                    <li class="mt"><a href="#">Videos</a></li>
                    <li class="mt"><a href="#">Settings</a></li>
                </ul>
            </div>
            <div class="col-md-9 ">
            
            </div>
        </div>
    </div>
<script src="js/jquery.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
    </form>
</body>
</html>
