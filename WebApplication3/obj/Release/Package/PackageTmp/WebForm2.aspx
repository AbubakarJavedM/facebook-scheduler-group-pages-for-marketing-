<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication3.WebForm2" %>

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
                                        <img id="coverphoto" runat="server" src="" class="img-cover" />
                                    </div>
                                    <div class="user clearfix">
                                        <div class="avatar">
                                            <img id="profilepicture" runat="server" src="" class="img-thumbnail img-profile" />
                                        </div>                      
                                   <h2>
                                    <asp:Label ID="naam" runat="server" Text="Label"></asp:Label>

                                </h2>                                  
                                <!--<div class="actions">
                                    <div class="btn-group">
                                        <div class="btn-group btn-group-primary">
                                            <asp:DropDownList ID="DropDownList2" class="apt btn btn-default btn-lg tip btn-responsive" runat="server">
                                                <asp:ListItem>Select Page</asp:ListItem>
                                                <asp:ListItem>Page1</asp:ListItem>
                                                <asp:ListItem>Page2</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>-->                                                                                          
             
                            </div>                                                       
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-7">
                        <div class="clr-tt container">
	                        <div class="row">
                                <div class="col-md-12">
                                <h4 class="headt">Recent Posts</h4>
                                <div class="table-responsive">
                                      <table id="mytable1" class="table table-bordred table-striped">
                   
                                           <thead>
                                           <th>POST</th>
                                            <th>Group Name</th>
                                             <th>Likes</th>
                                             <th>Share</th>
                                           </thead>
                            <tbody>
    
                            <tr>
             
                            <td><asp:Label ID="Label3" runat="server">None</asp:Label></td>
                            <td><asp:Label ID="Label1" runat="server">None</asp:Label></td>
                            <td><asp:Label ID="Label2" runat="server">20</asp:Label></td>
                            <td><asp:Label ID="lbl1" runat="server">25</asp:Label></td>
                            </tr>

                            <tr>
                            
                            <td><asp:Label ID="Label16" runat="server">None</asp:Label></td>
                            <td><asp:Label ID="Label17" runat="server">None</asp:Label></td>
                            <td><asp:Label ID="Label18" runat="server">20</asp:Label></td>
                            <td><asp:Label ID="Label19" runat="server">25</asp:Label></td>
                            </tr>

                            <tr>
                            
                            <td><asp:Label ID="Label20" runat="server">None</asp:Label></td>
                            <td><asp:Label ID="Label21" runat="server">None</asp:Label></td>
                            <td><asp:Label ID="Label22" runat="server">20</asp:Label></td>
                            <td><asp:Label ID="Label23" runat="server">25</asp:Label></td>
                            </tr>

                            
                            </tbody>
        
                        </table>
                
                                    </div>
            
                                </div>
	                        </div>
                        </div>
                    </div>

                        <div class="col-md-5">
                        <div class="clr-tt container">
	                        <div class="row">
                                <div class="col-md-12">
                                <h4 class="headt">Recent Posts</h4>
                                <div class="table-responsive">
                
                                      <table id="mytable" class="table table-bordred table-striped">
                   
                                           <thead>
                                           <th>POST</th>
                                            <th>Group Name</th>
                                             <th>Likes</th>
                                             <th>Share</th>
                                           </thead>
                            <tbody>
                                <tr>
                                <td><asp:Label ID="Label4" runat="server">None</asp:Label></td>
                                <td><asp:Label ID="Label5" runat="server">None</asp:Label></td>
                                <td><asp:Label ID="Label6" runat="server">20</asp:Label></td>
                                <td><asp:Label ID="Label7" runat="server">25</asp:Label></td>
                                </tr>

                                <tr>
                                <td><asp:Label ID="Label8" runat="server">None</asp:Label></td>
                                <td><asp:Label ID="Label9" runat="server">None</asp:Label></td>
                                <td><asp:Label ID="Label10" runat="server">
                                  <!--  <div class=progress progress-success">
                                        <div runat="server" id="pbar" class="bar" style="width:30%;"></div>
                                    </div>-->20
                                    </asp:Label>
                                </td>
                                <td><asp:Label ID="Label11" runat="server">25</asp:Label></td>
                                </tr>

                                <tr>
                                <td><asp:Label ID="Label12" runat="server">Mohsin</asp:Label></td>
                                <td><asp:Label ID="Label13" runat="server">Mohsin</asp:Label></td>
                                <td><asp:Label ID="Label14" runat="server">20</asp:Label></td>
                                <td><asp:Label ID="Label15" runat="server">25</asp:Label></td>
                                </tr>

 
                            </tbody>
        
                        </table>
                
                                    </div>
            
                                </div>
	                        </div>
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

