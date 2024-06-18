﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="WebApplication3.WebForm5" %>

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
                            <div class="col-lg-12 ">  
                                <div class="table-responsive">  
                                    <asp:GridView ID="grdCustomer" runat="server" Width="100%" style="color:black;" CssClass="table table-striped table-hover" AutoGenerateColumns="False" DataKeyNames="CustomerID" EmptyDataText="There are no data records to display.">  
                                        <Columns>  
                                            <asp:BoundField DataField="CustomerID" HeaderText="POST" ReadOnly="True" SortExpression="CustomerID" />  
                                            <asp:BoundField DataField="CompanyName" HeaderText="Group Name" SortExpression="CompanyName" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />  
                                            <asp:BoundField DataField="ContactName" HeaderText="Likes" SortExpression="ContactName" ItemStyle-CssClass="visible-xs" HeaderStyle-CssClass="visible-xs" />  
                                            <asp:BoundField DataField="ContactTitle" HeaderText="Share" SortExpression="ContactTitle" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />  
                                        </Columns> 
                                        
                                    </asp:GridView>  
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
