<%@ Control Language="C#" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>

<%@ Register TagPrefix="dnn" TagName="AIRASTANA_SOCIAL_METADATA" Src="~/DesktopModules/AirAstana/AirAstana.Dnn.Components/SocialMetadataObject.ascx" %>
<%@ Register TagPrefix="dnn" TagName="footer" Src="Footer.ascx" %>
<%@ Register TagPrefix="dnn" TagName="header" Src="Header.ascx" %>
<%@ Register TagPrefix="dnn" TagName="navbar" Src="Navbar.ascx" %>

<dnn:AIRASTANA_SOCIAL_METADATA runat="server" ID="SocialMetadata"/>

<dnn:header runat="server"/>
<dnn:navbar runat="server"/>

<div class="container-fluid content">


    <div class="container subpage-content">
        <div class="row">
            <div class="col-lg-12">
                <div id="ContentPane" class="inner-page-style" runat="server">
                </div>
            </div>
        </div>
    </div>


</div>

<dnn:footer runat="server"/>