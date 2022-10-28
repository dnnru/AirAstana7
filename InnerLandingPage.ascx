<%@ Control Language="C#" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="ddr" TagName="MENU" Src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="AIRASTANA_SOCIAL_METADATA" Src="~/DesktopModules/AirAstana/AirAstana.Dnn.Components/SocialMetadataObject.ascx" %>
<%@ Register TagPrefix="dnn" TagName="footer" Src="Footer.ascx" %>
<%@ Register TagPrefix="dnn" TagName="header" Src="Header.ascx" %>
<%@ Register TagPrefix="dnn" TagName="navbar" Src="Navbar.ascx" %>


<dnn:AIRASTANA_SOCIAL_METADATA runat="server" ID="SocialMetadata"/>
<dnn:header runat="server"/>
<dnn:navbar runat="server"/>
<dnn:DnnCssInclude runat="server" FilePath="css/skin/innerlanding.css" PathNameAlias="SkinPath" Priority="110" />


<div class="container-fluid content">


    <div class="container subpage-content">
        <div class="row">
            <div class="col-lg-3">
                <div id="sidemenucont">
                    <h2><%= ((DotNetNuke.Entities.Tabs.TabInfo)PortalSettings.ActiveTab.BreadCrumbs[0]).Title %></h2>
                    <ddr:MENU ID="dnnSideMenu" MenuStyle="AASideMenu" NodeSelector="+0" runat="server"></ddr:MENU>
                </div>

            </div>
            <div class="col-lg-9">
                <div id="LeftPane" runat="server" class="inner-page-style">
                </div>
                <!----Pane Grid --->
                <div class="md-body-wrapper">
                    <section class="container">
                        <div class="md-body md-accomodation">
                            <section class="md-accomodation-content">
                                <div class="row clearfix">
                                    <div class="grid_4">
                                        <article class="media">
                                            <figure>
                                                <div class="inner-page-style" style="" id="ContentPane" runat="server"></div>
                                            </figure>
                                        </article>
                                    </div>
                                    <div class="grid_4">
                                        <article class="media">
                                            <figure>
                                                <div class="inner-page-style" style="" id="ContentPane2" runat="server"></div>
                                            </figure>
                                        </article>
                                    </div>
                                    <div class="grid_4">
                                        <article class="media">
                                            <figure>
                                                <div class="inner-page-style" style="" id="ContentPane3" runat="server"></div>
                                            </figure>
                                        </article>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="grid_4">
                                        <article class="media">
                                            <figure>
                                                <div class="inner-page-style" style="" id="ContentPane4" runat="server"></div>
                                            </figure>
                                        </article>
                                    </div>
                                    <div class="grid_4">
                                        <article class="media">
                                            <figure>
                                                <div class="inner-page-style" style="" id="ContentPane5" runat="server"></div>
                                            </figure>

                                        </article>
                                    </div>
                                    <div class="grid_4">
                                        <article class="media">
                                            <figure>
                                                <div class="inner-page-style" style="" id="ContentPane6" runat="server"></div>
                                            </figure>
                                        </article>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="grid_4">
                                        <article class="media">
                                            <figure>
                                                <div class="inner-page-style" style="" id="ContentPane7" runat="server"></div>
                                            </figure>
                                        </article>
                                    </div>
                                    <div class="grid_4">
                                        <article class="media">
                                            <figure>
                                                <div class="inner-page-style" style="" id="ContentPane8" runat="server"></div>
                                            </figure>

                                        </article>
                                    </div>
                                    <div class="grid_4">
                                        <article class="media">
                                            <figure>
                                                <div class="inner-page-style" style="" id="ContentPane9" runat="server"></div>
                                            </figure>
                                        </article>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="grid_4">
                                        <article class="media">
                                            <figure>
                                                <div class="inner-page-style" style="" id="ContentPane10" runat="server"></div>
                                            </figure>
                                        </article>
                                    </div>
                                    <div class="grid_4">
                                        <article class="media">
                                            <figure>
                                                <div class="inner-page-style" style="" id="ContentPane11" runat="server"></div>
                                            </figure>

                                        </article>
                                    </div>
                                    <div class="grid_4">
                                        <article class="media">
                                            <figure>
                                                <div class="inner-page-style" style="" id="ContentPane12" runat="server"></div>
                                            </figure>
                                        </article>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="grid_4">
                                        <article class="media">
                                            <figure>
                                                <div class="inner-page-style" style="" id="ContentPane13" runat="server"></div>
                                            </figure>
                                        </article>
                                    </div>
                                    <div class="grid_4">
                                        <article class="media">
                                            <figure>
                                                <div class="inner-page-style" style="" id="ContentPane14" runat="server"></div>
                                            </figure>

                                        </article>
                                    </div>
                                    <div class="grid_4">
                                        <article class="media">
                                            <figure>
                                                <div class="inner-page-style" style="" id="ContentPane15" runat="server"></div>
                                            </figure>
                                        </article>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </section>
                </div>
                <!------------->
            </div>
        </div>
    </div>
</div>

<dnn:footer runat="server"/>