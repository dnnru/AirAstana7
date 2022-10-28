<%@ Control Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="AirAstana.Themes.AirAstana7.Components" %>
<%@ Import Namespace="DotNetNuke.Entities.Portals" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="NomadClubModule" %>
<%@ Register TagPrefix="ddr" TagName="MENU" Src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="AIRASTANALANG" Src="SkinObjects/LanguageSelect.ascx" %>
<%@ Register TagPrefix="dnn" TagName="AIRASTANALOGIN" Src="SkinObjects/NomadClubLogin.ascx" %>
<script runat="server">
    private const string LocalResourceFile = "/Portals/_default/Skins/AirAstana7/App_LocalResources/Navbar.ascx";
</script>
<nav class="navbar yamm aa-main-bar" role="navigation" style="padding:8px 0px">
    <div class="container-fluid aa-main-menu">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="modal" data-target="#aa-navigation-mobile-modal">
                <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/menu.svg" alt="">
            </button>
            <% if (NomadSessionUtil.IsAuthenticated())
               { %>
                <a class="navbar-toggle collapsed aa-user-login" href="#" data-toggle="modal" data-target="#aa-login-mobile-modal">
                    <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/user-logged-in.svg" alt="">
                </a>
            <% }
               else
               { %>
                <a class="navbar-toggle collapsed aa-user-login" href="<%= Utils.ConstructCurrentUrl(Localization.GetString("ManageAccount.Url", LocalResourceFile)) %>">
                    <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/user.svg" alt="">
                </a>
            <% } %>
            <button type="button" id="aa-language-mobile-button" class="navbar-toggle collapsed" data-region="<%= PortalSettings.Current.PortalId %>" data-toggle="modal" data-target="#aa-language-mobile-modal">
                <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/globe.svg" alt="">
            </button>
            <a class="brand logo-big" href="<%= Utils.GetHomeTabUrl(PortalSettings.Current) %>">
                <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/logo-full.svg" alt="Air Astana">
            </a>
            <a class="brand logo-small" href="<%= Utils.GetHomeTabUrl(PortalSettings.Current) %>">
                <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/logo-mini.svg" alt="Air Astana">
            </a>
        </div>
        <div class="collapse navbar-collapse" id="aa-navbar">
            <ddr:menu ID="navigationMenu" MenuStyle="AirAstanaMenu" runat="server" NodeManipulator="AirAstana.Themes.AirAstana7.Components.NodeManipulator, AirAstana.Themes.AirAstana7"></ddr:menu>
            <ul class="nav navbar-nav navbar-right aa-navbar-controls navbar-hide-small">
                <li id="search-input-form">
                    <a id="search-input-anchor" href="#" data-target="#aa-search-modal" data-toggle="modal">
                        <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/search.svg" alt="">
                    </a>
                </li>
                <li class="dropdown aa-lang-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/globe.svg" alt="">
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="aa-lang-select-wrap">
                                <h5><%= Localization.GetString("SelectLanguage.Text", LocalResourceFile) %></h5>
                                <dnn:AIRASTANALANG runat="server" ID="aaLanguageSelect" />
                            </div>
                        </li>
                    </ul>
                </li>
                <% if (NomadSessionUtil.IsAuthenticated())
                   { %>
                    <li class="dropdown aa-login-menu">
                        <a href="#" class="dropdown-toggle aa-user-login" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/user-logged-in.svg" alt="">
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="aa-login-full-wrap">
                                    <dnn:AIRASTANALOGIN runat="server" ID="aaLoginFull" />
                                </div>
                            </li>
                        </ul>
                    </li>
                <% }
                   else
                   { %>
                    <li>
                        <a href="<%= Utils.ConstructCurrentUrl(Localization.GetString("ManageAccount.Url", LocalResourceFile)) %>" class="aa-user-login">
                            <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/user.svg" alt="">
                        </a>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>
<div class="modal" id="aa-search-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="input-group">
                    <span class="input-group-btn">
                        <button class="btn btn-default" id="executeSearch">
                            <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/search.svg" alt="<%= Localization.GetString("Search.Text", LocalResourceFile) %>">
                        </button>
                    </span>
                    <input type="text" class="form-control" placeholder="<%= Localization.GetString("Search.Text", LocalResourceFile) %>" id="searchQuerySmall" />
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
                            <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/close-small.svg" alt="">
                        </button>
                    </span>
                </div>
                <%--
                <h6><%= Localization.GetString("ItMightHelp.Text", LocalResourceFile) %></h6>
                --%>
                <div class="bs46" style="padding: 30px 15px 15px 58px">
                    <div class="mb-3 search-help-block"><%= Localization.GetString("SearchHelp1.Text", LocalResourceFile) %></div>
                    <div class="mb-3 search-help-block"><%= Localization.GetString("SearchHelp2.Text", LocalResourceFile) %></div>
                    <div class="mb-3 search-help-block"><%= Localization.GetString("SearchHelp3.Text", LocalResourceFile) %></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal aa-mobile-modal" id="aa-navigation-mobile-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="clearfix">
                    <div class="pull-left">
                        <a class="brand logo-big" href="<%= Utils.GetHomeTabUrl(PortalSettings.Current) %>">
                            <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/logo-full.svg" alt="Air Astana">
                        </a>
                    </div>
                    <div class="pull-right">
                        <a href="#" data-dismiss="modal" aria-label="Close">
                            <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/close-small.svg" alt="">
                        </a>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <div class="input-group aa-mobile-modal-search">
                    <span class="input-group-btn">
                        <button class="btn btn-default" id="executeSearchOverlay">
                            <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/search.svg" alt="<%= Localization.GetString("Search.Text", LocalResourceFile) %>">
                        </button>
                    </span>
                    <input type="text" class="form-control" placeholder="<%= Localization.GetString("Search.Text", LocalResourceFile) %>" id="searchQuery" />
                </div>
                <div id="aa-navigation-mobile-root" class="bs46"></div>
            </div>
        </div>
    </div>
</div>
<div class="modal aa-mobile-modal" id="aa-login-mobile-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="clearfix">
                    <div class="pull-left">
                        <h4><%= Localization.GetString("Profile.Text", LocalResourceFile) %></h4>
                    </div>
                    <div class="pull-right">
                        <a href="#" data-dismiss="modal" aria-label="Close">
                            <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/close-small.svg" alt="">
                        </a>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <div id="aa-login-mobile-root">
                    <dnn:AIRASTANALOGIN runat="server" ID="aaLoginMobile" />
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal aa-mobile-modal" id="aa-navigation-mobile-modal-pages" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="clearfix">
                    <div class="pull-left">
                        <a href="#" onclick="showNavigationMobileModal();">
                            <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/chevron-large-left.svg" alt="">
                        </a>
                    </div>
                    <div class="pull-right">
                        <a href="#" data-dismiss="modal" aria-label="Close">
                            <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/close-small.svg" alt="">
                        </a>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <div id="aa-navigation-mobile-pages-root" class="bs46"></div>
            </div>
        </div>
    </div>
</div>
<div class="modal aa-mobile-modal" id="aa-language-mobile-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="clearfix">
                    <div class="pull-left">
                        <h4><%= Localization.GetString("SelectLanguage.Text", LocalResourceFile) %></h4>
                    </div>
                    <div class="pull-right">
                        <a href="#" data-dismiss="modal" aria-label="Close">
                            <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/close-small.svg" alt="">
                        </a>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <div id="aa-language-mobile-modal-root" class="bs46"></div>
            </div>
        </div>
    </div>
</div>
<div class="modal aa-mobile-modal" id="aa-region-mobile-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="clearfix">
                    <div class="pull-left">
                        <h4><%= Localization.GetString("Region.Text", LocalResourceFile) %></h4>
                    </div>
                    <div class="pull-right">
                        <a href="#" data-dismiss="modal" aria-label="Close">
                            <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/close-small.svg" alt="">
                        </a>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <div id="aa-region-mobile-modal-root" class="bs46"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/x-template" id="aa-navigation-mobile-modal-template">
<div class="mh-100" style="overflow-y: scroll;">
{{ _.forEach(nodes, function(node) { }}
{{ if(node.Keywords === ADDITIONAL_NODE_MOBILE_FIRST) { }}
<div class="mb-3 w-100 chevron-large-right-bg"><a href="{{= node.Url }}" class="text-reset text-decoration-none w-100 aa-display-block"><img src="{{= node.Icon }}" alt="" class="mr-3" />{{= node.Text }}</a></div>
{{ }else{ }}
<h4 class="font-weight-bold">{{= node.Text }}</h4>
{{ } }}
{{ if(node.Keywords === ADDITIONAL_NODE_MOBILE_FIRST && node.Separator) { }}
<hr class="w-100" />
{{ } }}
{{ if(node.Children.length > 0) { _.forEach(node.Children, function(child) { }}
{{ if(child.Keywords === ADDITIONAL_NODE) { }}
<div class="mb-3 pl-3 w-100 chevron-large-right-bg"><a href="{{= child.Url }}" class="text-reset text-decoration-none w-100 aa-display-block"><img src="{{= child.Icon }}" alt="" class="mr-3" />{{= child.Text }}</a></div>
{{ }else{ }}
<div class="mb-3 pl-3 w-100 chevron-large-right-bg"><a href="#" class="text-reset text-decoration-none w-100 aa-display-block" data-tabid="{{= child.TabId }}" data-toggle="modal" data-target="#aa-navigation-mobile-modal-pages">{{= child.Text }}</a></div>
{{ } }}
{{ }); }}
{{ } }}  
{{ }); }}
</div>
</script>

<script type="text/x-template" id="aa-navigation-mobile-modal-pages-template">
<h4 class="font-weight-bold mb-3">{{= rootNode.Text }}</h4>
{{ _.forEach(rootNode.Children, function(node) { }}
<div class="mb-3 pl-3 w-100"><a href="{{= node.Url }}" class="text-reset text-decoration-none w-100 aa-display-block">{{= node.Text }}</a></div>  
{{ }); }}
</script>

<script type="text/x-template" id="aa-language-mobile-modal-template">
<div class="mb-3 p-3 w-100 chevron-small-down-bg" data-region="{{= region.PortalId }}" data-toggle="modal" data-target="#aa-region-mobile-modal">
<img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/globe.svg" alt="" class="mr-3"><span>{{= region.PortalName }}</span>
</div>
{{ _.forEach(region.Locales, function(locale) { }}
<div class="mb-3">
{{ if(locale.IsActive) { }}
<a href="{{= locale.Url }}" class="text-reset text-decoration-none font-weight-bold">
<img class="mr-3" alt="" src="{{= locale.CultureFlag }}" />
<span>{{= locale.CultureName }}</span>
</a>
{{ }else{ }}
<a href="{{= locale.Url }}" class="text-reset text-decoration-none">
<img class="mr-3" alt="" src="{{= locale.CultureFlag }}" />
<span>{{= locale.CultureName }}</span>
</a>
{{ } }}     
</div> 
{{ }); }}
</script>

<script type="text/x-template" id="aa-region-mobile-modal-template">
{{ _.forEach(regions, function(region) { }}
<div class="mb-3">
{{ if(region.IsCurrent) { }}
<a href="#" class="text-reset text-decoration-none font-weight-bold" data-region="{{= region.PortalId }}" data-toggle="modal" data-target="#aa-language-mobile-modal">{{= region.PortalName }}</a>
{{ }else{ }}
<a href="#" class="text-reset text-decoration-none" data-region="{{= region.PortalId }}" data-toggle="modal" data-target="#aa-language-mobile-modal">{{= region.PortalName }}</a>
{{ } }} 
</div>  
{{ }); }}
</script>

<script type="text/javascript">
_.templateSettings = {
    evaluate: /\{\{(.+?)\}\}/g,
    interpolate: /\{\{=(.+?)\}\}/g,
    escape: /\{\{-(.+?)\}\}/g
};

var ADDITIONAL_NODE_MOBILE_FIRST = "<%= AirAstana.Themes.AirAstana7.Components.Constants.ADDITIONAL_NODE_MOBILE_FIRST %>";
var ADDITIONAL_NODE = "<%= AirAstana.Themes.AirAstana7.Components.Constants.ADDITIONAL_NODE %>";
var airAstanaPortalLocales = JSON.parse('<%= Utils.GetAllPortalLocalesJson(PortalSettings.Current) %>');
var airAstanaMobileMenuNodes = JSON.parse('<%= Utils.GetMobileMenuNodesJson(PortalSettings.Current) %>');

function showNavigationMobileModal(){
    $('#aa-navigation-mobile-modal-pages').modal('hide');
    $('#aa-navigation-mobile-modal').modal('show');
}
jQuery(function ($) {
    let airAstanaMobileRootMenuNodes = _.filter(airAstanaMobileMenuNodes.Children, function (o) {
        return o.Depth === 0;
    });
    
    $(".search-help-block").click(function (){
        let text = $(this).text();
        $("#searchQuerySmall").val(text);
    });

    $('#aa-navigation-mobile-modal').on('show.bs.modal', function (event) {
        $('#aa-navigation-mobile-modal .modal-body').css('height', $(window).height() * 0.9);
        let modal = $(this);
        let template = $('#aa-navigation-mobile-modal-template').html();
        let compiled = _.template(template);
        modal.find('#aa-navigation-mobile-root').html(compiled({
                'nodes': airAstanaMobileRootMenuNodes
            }));
    });
        
    $('#aa-navigation-mobile-modal-pages').on('show.bs.modal', function (event) {
        $('#aa-navigation-mobile-modal').modal('hide');
        let button = $(event.relatedTarget);
        let tabid = button.data('tabid');
        let rootNode = _(airAstanaMobileRootMenuNodes).thru(function (c) {
                return _.union(c, _.map(c, 'Children') || []);
            }).flatten().find({TabId: tabid});
        let modal = $(this);
        let template = $('#aa-navigation-mobile-modal-pages-template').html();
        let compiled = _.template(template);
        modal.find('#aa-navigation-mobile-pages-root').html(compiled({
                'rootNode': rootNode
            }));
    });
    
    $('#aa-language-mobile-modal').on('show.bs.modal', function (event) {
        $('#aa-region-mobile-modal').modal('hide');
        let button = $(event.relatedTarget);
        let regionId = button.data('region');
        let region = _.find(airAstanaPortalLocales, function (r){
            return  r.PortalId === regionId;
        });
        let modal = $(this);
        let template = $('#aa-language-mobile-modal-template').html();
        let compiled = _.template(template);
        modal.find('#aa-language-mobile-modal-root').html(compiled({
                'region': region
            }));        
    });
    
    $('#aa-region-mobile-modal').on('show.bs.modal', function (event) {
        $('#aa-language-mobile-modal').modal('hide');
        let modal = $(this);
        let template = $('#aa-region-mobile-modal-template').html();
        let compiled = _.template(template);
        modal.find('#aa-region-mobile-modal-root').html(compiled({
                'regions': airAstanaPortalLocales
            }));        
    });    
});
</script>