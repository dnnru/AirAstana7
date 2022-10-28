<%@ Control Language="C#" CodeBehind="LanguageSelect.ascx.cs" Inherits="AirAstana.Themes.AirAstana7.SkinObjects.LanguageSelect" %>

<asp:PlaceHolder runat="server" ID="pnlLanguageSelect">
    <div class="aa-lang-select-ddl">
        <asp:DropDownList runat="server" ID="ddlPortals" CssClass="form-control" AutoPostBack="False" onchange="ddlPortalsChange(this);" />
    </div>
    <div class="aa-lang-list-wrap bs46">
        <asp:Repeater ID="rptLanguageItems" runat="server">
            <ItemTemplate>
                <div class="aa-lang-item mb-3" style="display: none;" data-portal-filter="<%# DataBinder.Eval(Container.DataItem, "PortalId") %>">
                    <a href="<%# DataBinder.Eval(Container.DataItem, "Url") %>" class="<%# DataBinder.Eval(Container.DataItem, "IsActive").ToString().ToLower() == "true" ? "text-reset text-decoration-none font-weight-bold" : "text-reset text-decoration-none" %>">
                        <img class="mr-3" alt="" src="<%# DataBinder.Eval(Container.DataItem, "CultureFlag") %>" />
                        <span><%# DataBinder.Eval(Container.DataItem, "CultureName") %></span>
                    </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <script type="text/javascript">
        function filterLanguageList(value) {
            let portalId = _.toSafeInteger(value);
            $(".aa-lang-list-wrap .aa-lang-item").hide();
            $(".aa-lang-list-wrap").find("div[data-portal-filter=" + portalId + "]").each(function () {
                $(this).show();
            });
        }        
        function ddlPortalsChange(sender) {
            filterLanguageList(sender.value);
        }
        
        $('#' + '<%= ddlPortals.ClientID %>' + ' option[value=<%= PortalSettings.PortalId %>]').prop('selected', true);
        filterLanguageList(<%= PortalSettings.PortalId %>);
    </script>
</asp:PlaceHolder>