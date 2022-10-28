<%@ Control Language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.Skins" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<%@ Register TagPrefix="dnn" TagName="header" Src="IBEHeader.ascx" %>


<dnn:header runat="server"/>
<dnn:DnnJsInclude runat="server" FilePath="js/html5shiv.min.js" PathNameAlias="SkinPath" Priority="0" />
<dnn:DnnJsInclude runat="server" FilePath="js/respond.js" PathNameAlias="SkinPath" Priority="1" />


<div id="ContentPane" class="inner-page-style" runat="server" style="padding:20px;">
</div>
										