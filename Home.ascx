<%@ Control Language="C#" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>

<%@ Register TagPrefix="dnn" TagName="footer" Src="Footer.ascx" %>
<%@ Register TagPrefix="dnn" TagName="header" Src="Header.ascx" %>
<%@ Register TagPrefix="dnn" TagName="navbar" Src="Navbar.ascx" %>

<dnn:header runat="server"/>
<dnn:navbar runat="server" />
<style>
    .white-background {
         background: #ffffff;
         padding-top: 50px;
         padding-bottom: 50px;
</style>
<div class="container-fluid content">

    <div id="ContentPane" runat="server">
    </div>

    <div class="row content-section-bg" id="DestinationFaresPanel" runat="server">
    </div>

    <div id="HighlightsPane" runat="server">
    </div>
    <div class="row white-background">
        <div class="grey-background-wrapper">
            <div class="col-lg-4  col-md-4 news" id="NewsPane" runat="server">
            </div>

            <div class="col-lg-8 col-md-8" id="NomadPane" runat="server">
            </div>
        </div>
    </div>
</div>
<dnn:footer runat="server"/>