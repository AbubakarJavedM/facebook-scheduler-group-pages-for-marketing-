<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" validateRequest="false" enableEventValidation="false" Inherits="WebApplication3.WebForm4" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.min.css"/>
    <link href="css/style.css" rel="stylesheet"/>
    <link href="css/style2.css" rel="stylesheet"/>

</head>
<body>
    
    
    <form id="form1" runat="server">
    <div class="container">

        <div class="wrapper">
        <div class="box">
            <div class="">
                <!-- /sidebar -->
                <!-- main right col -->
                <div class="column col-md-12 col-xs-12" id="main">

                    <!-- top nav -->
                    <div class="navbar navbar-blue navbar-static-top">
                        <div class="navbar-header">
                            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a href="WebForm2.aspx" class="navbar-brand mtt">facebook</a>
                        </div>
                        <nav class="collapse navbar-collapse" role="navigation">
                            
                            <ul class="nav navbar-nav">
                                <li>
                                    <asp:HyperLink href="WebForm2.aspx" runat="server"><i class="glyphicon glyphicon-home"></i>Home</asp:HyperLink>
                                </li>
                                <li>
                                    <asp:HyperLink href="WebForm3.aspx" runat="server"><i class="glyphicon glyphicon-plus"></i>Schedule Post</asp:HyperLink>
                                </li>

                                <li>
                                    <asp:HyperLink href="WebForm4.aspx" runat="server"><i class="glyphicon glyphicon-list"></i>Add Post</asp:HyperLink>
                                </li>
                                  <li>
                                    <asp:HyperLink href="WebForm6.aspx" runat="server"><i class="glyphicon glyphicon-list"></i>Settings</asp:HyperLink>
                                </li>
                            </ul>
                            <ul style="margin-right: 10px;"class="nav navbar-nav navbar-right">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i></a>
                                    <ul class="dropdown-menu">
                                        <asp:HyperLink href="WebForm1.aspx" runat="server">LOGOUT</asp:HyperLink>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <!-- /top nav -->

                    <div class="col-md-12">
                        <div class="profile clearfix">                            
                             <div class="image">
                                        <img id="coverphoto" runat="server" src="images/2.jpg" class="img-cover" />
                                    </div>
                                    <div class="user clearfix">
                                        <div class="avatar">
                                            <img id="profilepicture" runat="server" src="https://bootdey.com/img/Content/user-453533-fdadfd.png" class="img-thumbnail img-profile" />
                                        </div>           
                                  <h2>
                                    <asp:Label ID="naam" runat="server" Text="Label"></asp:Label>

                                </h2>                               
                                                                                                                         
                            </div>                                                       
                        </div>
                    </div>
                    

                    <div class="row">
                        <div class="col-md-12">
                        <div class="well" style="width: 90%; margin: 5px auto;"> 
                            <form class="form-horizontal" role="form">
                                    <h4 style="color:black;">What's New</h4>
                                     <div class="form-group" style="padding:14px; margin:0px;" >
                                      <asp:textbox ID="tb1" runat="server" class="form-control" placeholder="Update your status" Rows="7" Height="50px" ></asp:textbox>
                                    </div>
                                 <asp:Button ID="Button5" runat="server" class="btn btn-primary btn-responsive pull-right" type="button" Text="Save Post" OnClick="Button5_Click" />
                                <asp:FileUpload class="btn btn-responsive" ID="FileUpload1" runat="server" style="color:black;" />
                            </form>
                        </div>
                    </div>
                    </div>


                 </div>
                <!-- /main -->
                <div>

                </div>

            </div>
        </div>
    </div>

    </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"/>
            <asp:Timer ID="Timer1" OnTick="Timer1_Tick" runat="server" Interval="10000">
            </asp:Timer>
            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>

<script src="js/jquery.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>

    </form>
</body>
</html>
