<%@ Control Language="C#" %>
<%@ Register TagPrefix="sfFields" Assembly="Telerik.Sitefinity" Namespace="Telerik.Sitefinity.Web.UI.Fields" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>

<div runat="server" id="controlWrapper">

    <a href="#" class="current-language" lang="<%= System.Threading.Thread.CurrentThread.CurrentUICulture.TwoLetterISOLanguageName %>" style="display:none;">
        <span><%= System.Threading.Thread.CurrentThread.CurrentUICulture.DisplayName %></span>
    </a>

    <sf:ConditionalTemplateContainer ID="sfLangSelectorConditionalTemplateContainer" runat="server">
        <Templates>
            <sf:ConditionalTemplate Left="SelectorType" Operator="Equal" Right="Horizontal" runat="server">
                <asp:Repeater ID="languagesRepeater_horizontal" runat="server">
                    <HeaderTemplate>
                        <ul class="sflanguagesHorizontalList">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li runat="server" id="langHolder" class="sflanguageItem">
                            <a runat="server" id="langLink" href="" class="sflanguageLnk"><span runat="server" id="langName"></span></a>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
            </sf:ConditionalTemplate>
            <sf:ConditionalTemplate Left="SelectorType" Operator="Equal" Right="Vertical" runat="server">
                <asp:Repeater ID="languagesRepeater_vertical" runat="server">
                    <HeaderTemplate>
                        <ul class="sflanguagesVerticalList">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li runat="server" id="langHolder" class="sflanguageItem">
                            <a runat="server" id="langLink" href="" class="sflanguageLnk"><span runat="server" id="langName"></span></a>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
            </sf:ConditionalTemplate>
            <sf:ConditionalTemplate Left="SelectorType" Operator="Equal" Right="DropDown" runat="server">
                <div class="sflanguagesDropDownList">
                    <asp:DropDownList runat="server" ID="langsSelect" CssClass="sflanguagesDropDown"></asp:DropDownList>
                </div>
            </sf:ConditionalTemplate>
        </Templates>
    </sf:ConditionalTemplateContainer>
</div>

<asp:Panel ID="errorsPanel" runat="server" CssClass="sfErrorSummary" />
