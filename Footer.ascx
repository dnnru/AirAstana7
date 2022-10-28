<%@ Control Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="AirAstana.Themes.AirAstana7.Components" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<script runat="server">
   string LocalResourceFile = "/DesktopModules/AirAstana/SkinResourceFiles/Footer/" + Utils.GetPortalRootName().ToLower() + "/Footer.ascx";
   string Language = Utils.GetCurrentCulture().ToLower();
   string Portal = Utils.GetPrimaryPortalUrl(Utils.GetCurrentPortalId());
</script>
<div class="container-fluid aa-footer">
   <div class="row">
      <div class="aa-footer-wrapper">
         <div class=" col-lg-4 col-md-4 footer-social">
            <h4><%= Localization.GetString("Social.Header", LocalResourceFile)%></h4>
            <p><%= Localization.GetString("SocialFollowUs.Text", LocalResourceFile)%></p>
            <div class="row social-icons">
               <ul class="list-inline">
                  <li><a href="<%= Localization.GetString("Facebook.Link", LocalResourceFile)%>" target="_blank"><i class="fa fa-facebook-square fa-3x"></i><br>Facebook</a></li>
                  <li><a href="https://twitter.com/airastana" target="_blank"><i class="fa fa-twitter fa-3x"></i><br>Twitter</a></li>
                  <li><a href="<%= Localization.GetString("Instagram.Link", LocalResourceFile)%>" target="_blank"><i class="fa fa-instagram fa-3x"></i><br>Instagram</a></li>
               </ul>
            </div>
            <div class="row social-icons">
               <ul class="list-inline">
                  <li><a href="https://www.youtube.com/channel/UCWPus-Qax-reGVAinAbq1lA" target="_blank"><i class="fa fa-youtube-play fa-3x"></i><br>Youtube</a></li>
                  <li><a href="https://t.me/AirAstanaofficial" target="_blank"><i class="fa fa-telegram fa-3x"></i><br>Telegram</a></li>
                  <li><a href="https://vk.com/airastanakazakhstan" target="_blank"><i class="fa fa-vk fa-3x"></i><br>VK</a></li>
               </ul>
            </div>            
         </div>
         <div class="col-lg-4 col-md-4 footer-newsletter">
            <h4><%= Localization.GetString("Newsletter.Header", LocalResourceFile)%></h4>
            <p><%= Localization.GetString("NewsletterSubscribe.Text", LocalResourceFile)%></p>
            <div class="form-inline newsletter-form" role="form">
               <div class="row">
                  <div class="col-xs-8">
                     <input type="email" class="form-control input-lg" id="SubscribeEmailValue" placeholder="<%= Localization.GetString("NewsletterEnterEmail.Placeholder", LocalResourceFile)%>">
                  </div>
                  <div class="col-xs-4">
                     <div type="button" class="submit btn btn-blue btn-lg" id="SubmitEmailButton">
                        <%= Localization.GetString("NewsletterSignUp.Text", LocalResourceFile)%>
                     </div>
                  </div>
               </div>
            </div>
            <a href='http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("AirAstanaPrivacyPolicy.Link", LocalResourceFile)%>'>
            <%= Localization.GetString("AirAstanaPrivacyPolicy.Text", LocalResourceFile)%>
            </a>
         </div>
         <div class="col-lg-2 col-md-2">
            <h4><%= Localization.GetString("QuickLinks.Header", LocalResourceFile)%></h4>
            <ul class="list-unstyled footer-lists">
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("QuickLinks1.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("QuickLinks1.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("QuickLinks2.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("QuickLinks2.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("QuickLinks3.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("QuickLinks3.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("QuickLinks4.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("QuickLinks4.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("QuickLinks5.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("QuickLinks5.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("QuickLinks6.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("QuickLinks6.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("QuickLinks7.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("QuickLinks7.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("QuickLinks8.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("QuickLinks8.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("QuickLinks9.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("QuickLinks9.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("QuickLinks10.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("QuickLinks10.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("QuickLinks11.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("QuickLinks11.Text", LocalResourceFile) %>
                  </a>
               </li>
            </ul>
         </div>
         <div class="col-lg-2 col-md-2">
            <h4><%= Localization.GetString("TopDestination.Header", LocalResourceFile) %></h4>
            <ul class="list-unstyled footer-lists">
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("TopDestination1.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("TopDestination1.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("TopDestination2.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("TopDestination2.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("TopDestination3.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("TopDestination3.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("TopDestination4.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("TopDestination4.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("TopDestination5.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("TopDestination5.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("TopDestination6.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("TopDestination6.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("TopDestination7.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("TopDestination7.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("TopDestination8.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("TopDestination8.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("TopDestination9.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("TopDestination9.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("TopDestination10.Link", LocalResourceFile) %>">
                  <i class="fa fa-arrow-right"></i>
                  <%= Localization.GetString("TopDestination10.Text", LocalResourceFile) %>
                  </a>
               </li>
            </ul>
         </div>
      </div>
   </div>
   <!-- end row -->
</div>
<div class="container-fluid aa-copyright">
   <div class="row">
      <div class="aa-copyright-wrapper">
         <div class=" col-lg-6 col-md-6">
            <ul class="list-inline">
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("TermsConditions.Link", LocalResourceFile) %>">
                  <%= Localization.GetString("TermsConditions.Text", LocalResourceFile) %>
                  </a>
               </li>
               <li>
                  <a href="http://<%= Portal %>/<%= Language %>/<%= Localization.GetString("PrivacyPolicy.Link", LocalResourceFile) %>">
                  <%= Localization.GetString("PrivacyPolicy.Text", LocalResourceFile) %>
                  </a>
               </li>
            </ul>
         </div>
         <div class="col-lg-6 col-md-6">
            <footer>
               <p>
                  <%= Localization.GetString("Copyright.Text", LocalResourceFile) %>
               </p>
            </footer>
         </div>
      </div>
   </div>
</div>
<!-- Send email value to the page by click and enter key pressing. Redirected page depends on language-->
<script>
	$("#SubmitEmailButton").click(function () {
		if ($('#SubscribeEmailValue').valid()){
			/*var subscribeUri = '<%= Localization.GetString("SubscribeSpecialOffers.Link", LocalResourceFile) %>';
			if (subscribeUri.length < 1) window.location.reload;*/

			var SubscriveLink = "https://<%= Portal %>/<%= Language %>/<%= Localization.GetString("SubscribeSpecialOffers.Link", LocalResourceFile) %>";
			// send email by POST-request to Subscription Page
			// do not use GET, because it generates a lot of different usrls with GET parameters
			var form = $('<form id="subscriptionForm" action="'+ SubscriveLink +'" method="POST" style="display:none;"><input type="hidden" name="email" value="'+$('#SubscribeEmailValue').val()+'"/></form>');
			$("body").append(form); form.submit();
		}
	});
   
   $('#SubscribeEmailValue').keypress(function (e) {
       var key = e.which;
       if (key == 13)  // the enter key code
       {
           $("#SubmitEmailButton").click();
           return false;
       }
   });
</script>