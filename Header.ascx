<%@ Control Language="C#" AutoEventWireup="true"%>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="AirAstana.Themes.AirAstana7.Components" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" TagName="Meta" Src="~/Admin/Skins/Meta.ascx" %>
<dnn:Meta runat="server" Name="viewport" Content="initial-scale=1.0,width=device-width" />

<script runat="server">
	string LocalResourceFile = "/DesktopModules/AirAstana/SkinResourceFiles/Header/Header.ascx";
</script>

<!-- Google Tag Manager -->
<script></script>
<!-- End Google Tag Manager -->

<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KNJPXCK"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	ga('create', 'UA-670944-14', 'auto', {'allowLinker': true});
	ga('require', 'linker');
	ga('linker:autoLink', ['booking.airastana.com'] );
	ga('send', 'pageview');
</script>

<!-- Facebook Pixel Code -->
<!--
<script>
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
  n.callMethod.apply(n,arguments):n.queue.push(arguments)};
  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
  n.queue=[];t=b.createElement(e);t.async=!0;
  t.src=v;s=b.getElementsByTagName(e)[0];
  s.parentNode.insertBefore(t,s)}(window, document,'script',
  'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '1670417229908561');
  fbq('track', 'PageView');
</script>
-->
<!--
<noscript><img height="1" width="1" style="display:none"
  src="https://www.facebook.com/tr?id=1670417229908561&ev=PageView&noscript=1"
/></noscript>
-->
<!-- End Facebook Pixel Code -->



<script type="text/javascript">
    

    var validationMessages = [];

    validationMessages['required'] = '<%= Localization.GetString("required.text", LocalResourceFile)%>';
    validationMessages['numbersOnly'] = '<%= Localization.GetString("numbersOnly.text", LocalResourceFile)%>';
    validationMessages['charLimits'] = '<%= Localization.GetString("charLimits.text", LocalResourceFile)%>';
    validationMessages['charExact'] = '<%= Localization.GetString("charExact.text", LocalResourceFile)%>';
    validationMessages['notEqual'] = '<%= Localization.GetString("notEqual.text", LocalResourceFile)%>';
    validationMessages['invalidDate'] = '<%= Localization.GetString("invalidDate.text", LocalResourceFile)%>';
    validationMessages['dateWithinYear'] = '<%= Localization.GetString("dateWithinYear.text", LocalResourceFile)%>';
    validationMessages['dateBirtday'] = '<%= Localization.GetString("dateBirtday.text", LocalResourceFile)%>';
    validationMessages['passwordAA'] = '<%= Localization.GetString("passwordAA.text", LocalResourceFile)%>';
    validationMessages['tcRequired'] = '<%= Localization.GetString("tcRequired.text", LocalResourceFile)%>';
    validationMessages['arrivlaDate'] = '<%= Localization.GetString("arrivlaDate.text", LocalResourceFile)%>';
    validationMessages['maxPax'] = '<%= Localization.GetString("maxPax.text", LocalResourceFile)%>';
    validationMessages['optionRequired'] = '<%= Localization.GetString("optionRequired.text", LocalResourceFile)%>';
    validationMessages['lettersOnly'] = '<%= Localization.GetString("lettersOnly.text", LocalResourceFile)%>';
    validationMessages['numberOfDigits'] = '<%= Localization.GetString("numberOfDigits.text", LocalResourceFile)%>';
    validationMessages['equalTo'] = '<%= Localization.GetString("equalTo.text", LocalResourceFile)%>';
    validationMessages['email'] = '<%= Localization.GetString("email.text", LocalResourceFile)%>';
    validationMessages['emailEqualTo'] = "<%= Localization.GetString("emailEqualTo.text", LocalResourceFile)%>";
    
    var AA_PORTAL_ROOT = '<%= Utils.ConstructCurrentUrl("/") %>';
    var AA_PORTAL_ID = '<%= Utils.GetCurrentPortalId() %>';
    var AA_PORTAL_LANG = '<%= Utils.GetCurrentCulture() %>';
    var AA_PORTAL_LANG_DXB = '<%= Utils.GetCurrentLanguageNameForDxb() %>';
    var AA_AMADEUS_LANG = '<%= Utils.GetCurrentAmadeusLanguageCode() %>';
	
	 document.cookie = 'timezoneOffset=' + new Date().getTimezoneOffset() * -1 + "; path=/";

</script>

<dnn:DnnJsInclude runat="server" FilePath="js/conditionizr.min.js" PathNameAlias="SkinPath" Priority="0" />
<dnn:DnnJsInclude runat="server" FilePath="js/modernizr.js" PathNameAlias="SkinPath" Priority="2" />
<dnn:DnnJsInclude runat="server" FilePath="js/lodash.min.js" PathNameAlias="SkinPath" Priority="4" />
<dnn:DnnJsInclude runat="server" FilePath="js/bootstrap.min.js" PathNameAlias="SkinPath" Priority="10" />
<dnn:DnnJsInclude runat="server" FilePath="js/bootstrap-select.js" PathNameAlias="SkinPath" Priority="20" />
<dnn:DnnJsInclude runat="server" FilePath="js/prefixfree.js" PathNameAlias="SkinPath" Priority="30" />
<dnn:DnnJsInclude runat="server" FilePath="js/moment.js" PathNameAlias="SkinPath" Priority="40" />
<dnn:DnnJsInclude runat="server" FilePath="js/xdate.js" PathNameAlias="SkinPath" Priority="41" />
<dnn:DnnJsInclude runat="server" FilePath="js/xdate.i18n.js" PathNameAlias="SkinPath" Priority="42" />
<dnn:DnnJsInclude runat="server" FilePath="js/bootstrap-datetimepicker.js" PathNameAlias="SkinPath" Priority="50" />
<dnn:DnnJsInclude runat="server" FilePath="js/jquery.mobile.custom.js" PathNameAlias="SkinPath" Priority="51" />
<dnn:DnnJsInclude runat="server" FilePath="js/mobipick.js" PathNameAlias="SkinPath" Priority="52" />
<dnn:DnnJsInclude runat="server" FilePath="js/selectize.min.js" PathNameAlias="SkinPath" Priority="55" />
<dnn:DnnJsInclude runat="server" FilePath="js/jquery.validate.min.js" PathNameAlias="SkinPath" Priority="57" />
<dnn:DnnJsInclude runat="server" FilePath="js/additional-methods.js" PathNameAlias="SkinPath" Priority="58" />
<dnn:DnnJsInclude runat="server" FilePath="js/air-astana.js" PathNameAlias="SkinPath" Priority="60" />
<dnn:DnnCssInclude runat="server" FilePath="css/skin/skin1.css" PathNameAlias="SkinPath" Priority="102" />
<dnn:DnnCssInclude runat="server" FilePath="css/skin/skin2.css" PathNameAlias="SkinPath" Priority="103" />
<dnn:DnnCssInclude runat="server" FilePath="css/skin/skin3.css" PathNameAlias="SkinPath" Priority="104" />
<dnn:DnnCssInclude runat="server" FilePath="css/bs46.css" PathNameAlias="SkinPath" Priority="110" />
<dnn:DnnCssInclude runat="server" FilePath="css/airastana7.css" PathNameAlias="SkinPath" Priority="120" />
<!--<script type="text/javascript">
	// live chat 
	var __lc = {};
	__lc.license = 1835582;
	__lc.skill = 3;
	if (AA_PORTAL_LANG == 'ru-RU'){
		__lc.skill = 2;
	}else if(AA_PORTAL_LANG == 'kk-KZ'){
		__lc.skill = 1;
	}

	(function() {
	var lc = document.createElement('script'); lc.type = 'text/javascript'; lc.async = true;
	lc.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'cdn.livechatinc.com/tracking.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(lc, s);
	})();
</script>-->