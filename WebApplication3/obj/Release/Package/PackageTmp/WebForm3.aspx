<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="WebApplication3.WebForm3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.min.css" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/style2.css" rel="stylesheet" />
    <style>
        .tyt {
            color: black;
            font-family: Oswald-Bold;
            font-size: 25px;
            margin-left: 10px;
        }
        #time {
            margin-left: 20px;
            width: 150px;
            font-size: 20px;
            color:black;
        }
        #delay {
            margin-left: 20px;
            width: 200px;
            font-size: 20px;
            color:black;
        }
        #freq {
            margin-left: 20px;
            width: 200px;
            font-size: 20px;
            color:black;
        }
    </style>

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
                                    <ul style="margin-right: 10px;" class="nav navbar-nav navbar-right">
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

                            <div class="row" >

                                <div class="col-md-12" style="margin:10px 0px;">
                                    <asp:Label ID="Label2" Class="tyt" runat="server" Text="Time for Post" ></asp:Label>
                                    <asp:TextBox ID="time" runat="server" TextMode="Time"/>
                                    <asp:Label ID="Label3" Class="tyt" runat="server" Text="Delay"></asp:Label>
                                    <asp:TextBox ID="delay" runat="server" TextMode="Number"/>
                                    <asp:Label ID="Label4" Class="tyt" runat="server" Text="How many Times"></asp:Label>
                                    <asp:TextBox ID="freq" runat="server" TextMode="Number"/>
                                    <asp:Button ID="Button2" runat="server" Class="btn btn-danger btn-lg pull-right" Style="margin-right:10px;" OnClick="schedulePost" Text="Submit"  Width="110px" />
                                </div>

                                <div class="col-md-6">
                                    <div class="">
                                                <h3 style="color:black;">POSTS</h3>
                                                <div class="table-responsive">


                                                   <table id="mytable" style="width:100%;color:black;" class="table table-bordred table-striped">

                                                        <thead>

                                    
                                                            <th>POST</th>
                                                            
                                                        </thead>
                                                        <tbody id="mtb" runat="server">

                                                            <tr>
                                                                <td width="100%">
                                                                    <asp:CheckBoxList ID="CheckBoxList1" runat="server"></asp:CheckBoxList>
                                                                </td>
                                                             </tr>
                                                         
                                                        </tbody>

                                                    </table>

                                                </div>

                                            </div>

                                </div>

                                <div class="col-md-6">
                                    <div class="">
                                                <h3 style="color:black;">GROUPS</h3>
                                                <div class="table-responsive">


                                                    <table id="mytable" style="width:100%;color:black;" class="table table-bordred table-striped">

                                                        <thead>
                                                            <th>Group Name</th>
                                                            
                                                        </thead>
                                                        <tbody>

                                                            <tr>
                                                                <td>
                                                                    <asp:CheckBoxList ID="CheckBoxList2" runat="server"></asp:CheckBoxList>
                                                                    </td>
                                                                   
                                                               </tr>


                                                        </tbody>

                                                    </table>

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

        <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
      </div>
          <div class="modal-body">
          <div class="form-group">
        <input class="form-control " type="text" placeholder="Mohsin">
        </div>
        <div class="form-group">
        
        <input class="form-control " type="text" placeholder="Irshad">
        </div>
        <div class="form-group">
        <textarea rows="2" class="form-control" placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>
    
        
        </div>
      </div>
          <div class="modal-footer ">
        <button type="button" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    
    
    
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
      </div>
          <div class="modal-body">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
       
      </div>
        <div class="modal-footer ">
        <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
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
