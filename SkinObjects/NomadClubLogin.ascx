<%@ Control Language="C#" CodeBehind="NomadClubLogin.ascx.cs" Inherits="AirAstana.Themes.AirAstana7.SkinObjects.NomadClubLogin" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="AirAstana.Themes.AirAstana7.Components" %>

<div class="bs46">
    <asp:Panel runat="server" ID="LogoutPanel" CssClass="m-4">
        <div class="mb-3">
            <a href="<%= Utils.ConstructCurrentUrl(Localization.GetString("ManageAccount.Url", LocalResourceFile)) %>" class="text-reset text-decoration-none">
                <div class="row">
                    <div class="col-2">
                        <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/i-user.svg" alt="">
                    </div>
                    <div class="col-8">
                        <h5>
                            <asp:Literal ID="MemberNameLiteral" runat="server" />
                        </h5>
                        <div class="text-muted">
                            <%= Localization.GetString("ID.Text", LocalResourceFile) %>: <asp:Literal ID="MemberIdLiteral" runat="server" /> (<asp:Literal ID="MemberStatusLiteral" runat="server" />)
                        </div>
                    </div>
                    <div class="col-2 text-right">
                        <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/chevron-large-right.svg" alt="">
                    </div>
                </div>
            </a>
            <hr />
        </div>
        <div runat="server" id="CoporateRow" class="mb-3">
            <a href="<%= Utils.ConstructCurrentUrl(Localization.GetString("CorporateAccount.Url", LocalResourceFile)) %>" class="text-reset text-decoration-none">
                <div class="row">
                    <div class="col-2">
                        <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/i-corp.svg" alt="">
                    </div>
                    <div class="col-8">
                        <h5>
                            <asp:Literal ID="CorporateNameLiteral" runat="server" />
                        </h5>
                        <div class="text-muted">
                            <%= Localization.GetString("ID.Text", LocalResourceFile) %>: <asp:Literal ID="CorporateIdLiteral" runat="server" />
                        </div>
                    </div>
                    <div class="col-2 text-right">
                        <img src="<%= AirAstana.Themes.AirAstana7.Components.Constants.SKIN_PATH %>/svg/chevron-large-right.svg" alt="">
                    </div>
                </div>
            </a>
            <hr />
        </div>
        <div class="mt-4">
            <asp:LinkButton ID="LogoutButton" CssClass="btn btn-light btn-lg text-center w-100" runat="server" OnClick="btnLogout_Click" />
        </div>
    </asp:Panel>
</div>