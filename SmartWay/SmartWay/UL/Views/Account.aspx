<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="SmartWay.UL.Views.Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="row my-2">
        <div class="col-lg-8 order-lg-2">
			
			<!--bootstrap navigation tabs at ttop of page--> 
            <ul class="nav nav-tabs">
				
                <li class="nav-item">
                    <a href="" data-target="#profile" data-toggle="tab" class="nav-link active">My profile</a>
				</li>
                <li class="nav-item">
                    <a href="" data-target="#edit" data-toggle="tab" class="nav-link">Edit</a>
                </li>
            </ul>
			
			<!---------- My Profile Tab Content ---------->
			
            <div class="tab-content py-4">
                <div class="tab-pane active" id="profile">
                    <h5 class="mb-3">User Profile</h5>
                    <div class="row">
                        <div class="col-md-6">
                            <h6>About</h6>
                            <p>
                                Web Designer????????
                            </p>
                        </div>
						
						<!---------- Recent Searches and History ---------->
						
                        <div class="col-md-6">
                            <h6>Recent Searches</h6>
                            <a href="#" class="badge badge-dark badge-pill">Washing Machine</a>
                            <a href="#" class="badge badge-dark badge-pill">Gardener</a>
                            <a href="#" class="badge badge-dark badge-pill">House Painter</a>
                            <a href="#" class="badge badge-dark badge-pill">Lawn Mower</a>

                            <hr>
							
                            <h6>Purcahse and Sale History</h6>
                            <span class="badge badge-primary"><i class="fa fa-user"></i>13 Sales</span>
                            <span class="badge badge-success"><i class="fa fa-cog"></i>2 Purchases</span>
                            <span class="badge badge-danger"><i class="fa fa-eye"></i>12 Reviews</span>

                        </div>
						
						<!---------- Recent Activity Content---------->
						
                        <div class="col-md-12">
                            <h5 class="mt-2">Recent Activity</h5>
                            <table class="table table-sm table-hover table-striped">
                                <tbody>                                    
                                    <tr>
                                        <td>
                                            <strong>Brock</strong> Searched for <strong>Washing Machines</strong> in <strong>Newcastle</strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Brock</strong> purchased a <strong>Lawn Mower</strong> from <strong>James Bailey</strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>James</strong> commented on your post in <strong>General Discussion</strong>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
					</div>               
                </div>
				
				<!---------- Edit Tab Content ---------->

                <div class="tab-pane" id="edit">
                    <form role="form">
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">First name</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="Brock">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Last name</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="Buttsworth">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Email</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="email" value="c3246694@uon.edu.au">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Address</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="" placeholder="Street">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label"></label>
                            <div class="col-lg-6">
                                <input class="form-control" type="text" value="" placeholder="City">
                            </div>
                            <div class="col-lg-3">
                                <input class="form-control" type="text" value="" placeholder="State">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Username</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Password</label>
                            <div class="col-lg-6">
                                <input class="form-control" type="password" value="123456789" readonly>
                            </div>
							<!---------- Change Password Button ---------->
						    <div class="col-lg-3">
                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#passwordModal">Change Password</button>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label"></label>
                            <div class="col-lg-3">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#saveModal">Save Changes</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
		
<!---------- Profile Picture and File Upload ---------->
		
        <div class="col-lg-4 order-lg-1 text-center">
            <img src="//placehold.it/150" class="mx-auto img-fluid img-circle d-block" alt="avatar">
            <h6 class="mt-2">Upload a different photo</h6>
            <label class="custom-file">
                <input type="file" id="file" class="custom-file-input">
                <span class="custom-file-control">Choose file</span>
            </label>
        </div>
    </div>
		
<!---------- Password Reset Modal ---------->
		
  <div class="modal fade" id="passwordModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Change Password</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<div class="form-group row">

            	<label class="col-lg-5 col-form-label form-control-label">Current Password: </label>

            		<div class="col-lg-7">

                    <input class="form-control" type="password" value="">

                    </div>

             </div>
			
			 <div class="form-group row">

            	<label class="col-lg-5 col-form-label form-control-label ">New Password: </label>

            		<div class="col-lg-7">

                    <input class="form-control" type="password" value="">

                    </div>

             </div>
			
			 <div class="form-group row">

            	<label class="col-lg-5 col-form-label form-control-label ">Confirm New Password: </label>

            		<div class="col-lg-7">

                    <input class="form-control" type="password" value="">

                    </div>

             </div>
			
			<hr>
			

        <!-- Modal footer -->
        <div class="modal-footer">
	                   	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmationModal" data-dismiss="modal">Save Password</button>
			   	<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#passwordResetModal" data-dismiss="modal" pull-left>Forgot Password</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        </div>
        </div>
		</div>
      </div>
    </div>
  </div>
		
				
		
<!---------- Save Changes Modal ---------->
		
  <div class="modal fade" id="saveModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Confirm Changes</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Are you sure you want to update your account information?
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Save Changes</button>
		<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
		
<!---------- Password Save Confirmation Modal ---------->
		
  <div class="modal fade" id="confirmationModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Password Saved</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Your password has been updated.
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
		<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
		
<!---------- Password Reset Modal ---------->
		
  <div class="modal fade" id="passwordResetModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Password Reset</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
			          	<div class="form-group row">

            	<label class="col-lg-12 col-form-label form-control-label ">Enter the email address you used to register your SmartWay account, we will send you a password reset email.</label>

             </div>
          	<div class="form-group row">

            	<label class="col-lg-3 col-form-label form-control-label ">Email: </label>

            		<div class="col-lg-9">

                    <input class="form-control" type="text" value="">

                    </div>

             </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#passwordResetConfirmationModal" data-dismiss="modal" pull-left>Send Password Reset</button>
		<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
	
<!---------- Password Reset Confirmation Modal ---------->
		
  <div class="modal fade" id="passwordResetConfirmationModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Password Reset</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        An email has been sent to your designated email address
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
		<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>

</div>
<hr>
</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
  <script src="../../Documents/js/jquery-3.2.1.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed --> 
  <script src="../../Documents/js/popper.min.js"></script>
  <script src="../../Documents/js/bootstrap-4.0.0.js"></script>
  </body>
</asp:Content>
