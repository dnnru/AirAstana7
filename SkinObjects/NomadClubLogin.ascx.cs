#region

using System;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using DotNetNuke.UI.Skins;
using NomadClubModule;
using NomadClubModule.Controller;
using NomadClubModule.Model;

#endregion

namespace AirAstana.Themes.AirAstana7.SkinObjects
{
    public partial class NomadClubLogin : SkinObjectBase
    {
        public const string LocalResourceFile = "/Portals/_default/Skins/AirAstana7/SkinObjects/App_LocalResources/NomadClubLogin.ascx";

        protected HtmlGenericControl CoporateRow;
        protected Literal CorporateIdLiteral;
        protected Literal CorporateNameLiteral;
        protected LinkButton LogoutButton;
        protected Panel LogoutPanel;
        protected Literal MemberIdLiteral;
        protected Literal MemberNameLiteral;
        protected Literal MemberStatusLiteral;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                LogoutButton.Text = Localization.GetString("Logout.Text", LocalResourceFile);
                InitControls();
            }
            catch (Exception ex)
            {
                Exceptions.LogException(ex);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            NomadSessionUtil.LogoutUser();
            Response.Redirect(Request.RawUrl);
        }

        private void InitControls()
        {
            if (NomadSessionUtil.IsAuthenticated())
            {
                NomadClubController nomadClubController = new NomadClubController();
                NomadUserInfo userInfo = nomadClubController.GetUserInfo();
                NomadActivity activity = nomadClubController.GetActivity();
                MemberNameLiteral.Text = userInfo.Name;
                MemberStatusLiteral.Text = activity.StatusTier;
                MemberIdLiteral.Text = userInfo.MembershipNumber;
                if (!string.IsNullOrEmpty(userInfo.CorporateMembershipNumber) && userInfo.IsCorporateAdmin)
                {
                    CoporateRow.Visible = true;
                    CorporateIdLiteral.Text = userInfo.CorporateMembershipNumber;
                    CorporateNameLiteral.Text = userInfo.CorporateName;
                }
                else
                {
                    CoporateRow.Visible = false;
                }
                
                LogoutPanel.Visible = true;
            }
            else
            {
                LogoutPanel.Visible = false;
            }
        }
    }
}