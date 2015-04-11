<%@ Control Language="C#" %>
<%@ Import Namespace="Telerik.Sitefinity.Web.UI.NavigationControls.Extensions.LightNavigationControlTemplate" %>
<%@ Import Namespace="Telerik.Sitefinity.Web.UI.NavigationControls" %>

<%@ Register Assembly="Telerik.Sitefinity" TagPrefix="navigation" Namespace="Telerik.Sitefinity.Web.UI.NavigationControls" %>
<%@ Register Assembly="Telerik.Sitefinity" TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" %>

<sf:ResourceLinks id="resLinks" runat="server" UseEmbeddedThemes="true" Theme="Basic">
    <sf:ResourceFile Name="Telerik.Sitefinity.Resources.Themes.Basic.Styles.nav.widget.css" Static="true" />
    <sf:ResourceFile Name="Telerik.Sitefinity.Resources.Scripts.Kendo.styles.kendo_common_min.css" Static="true" />
    <sf:ResourceFile JavaScriptLibrary="JQuery" />
    <sf:ResourceFile JavaScriptLibrary="KendoWeb" />
</sf:ResourceLinks>

<a id="menu-toggle"><span>Menu</span></a>

<navigation:SitefinitySiteMapDataSource runat="server" ID="dataSource" />

<sf:SitefinityLabel id="title" runat="server" WrapperTagName="div" HideIfNoText="true" HideIfNoTextMode="Server" />
<nav class="<%= this.GetCssClass() %>">
    <%-- responsive design section - renders templates for the responsive design --%>
    <navigation:NavTransformationTemplate runat="server" TransformationName="ToToggleMenu" TemplateName="ToggleMenu" />
    <navigation:NavTransformationTemplate runat="server" TransformationName="ToDropDown" TemplateName="Dropdown" />
    <%-- end of the responsive design section --%>

    <ul runat="server" id="navigationUl">
        <navigation:NavigationContainer runat="server" DataSourceID="dataSource">
            <templates>
                <navigation:NavigationTemplate>
                    <Template>
                        <li>
                            <a runat="server" href='<%# NavigationUtilities.ResolveUrl(Container.DataItem) %>' target='<%# NavigationUtilities.GetLinkTarget(Container.DataItem) %>'><%# Eval("Title") %></a>
                            <ul runat="server" id="childNodesContainer"></ul>
                        </li>
                    </Template>
                    <SelectedTemplate>
                        <li class="sfSel">
                            <a runat="server" href='<%# NavigationUtilities.ResolveUrl(Container.DataItem) %>' target='<%# NavigationUtilities.GetLinkTarget(Container.DataItem) %>'><%# Eval("Title") %></a>
                            <ul runat="server" id="childNodesContainer"></ul>
                        </li>
                    </SelectedTemplate>
                </navigation:NavigationTemplate>
            </templates>
        </navigation:NavigationContainer>
    </ul>
</nav>

<%-- link to Kendo documentation http://demos.kendoui.com/web/menu/index.html
<script type="text/javascript">
    (function ($) {
        var whetherToOpenOnClick = true;

        var kendoMenu = $('.sfNavHorizontalDropDown').not('.k-menu').kendoMenu({
            animation: false,
            openOnClick: whetherToOpenOnClick,
            open: function (e) {
                if (window.DataIntelligenceSubmitScript) {
                    var item = $(e.item);

                    DataIntelligenceSubmitScript._client.sentenceClient.writeSentence({
                        predicate: "Toggle navigation",
                        object: item.find("a:first").text(),
                        objectMetadata: [
                                                    {
                                                        'K': 'PageTitle',
                                                        'V': document.title
                                                    },
                                                    {
                                                        'K': 'PageUrl',
                                                        'V': location.href
                                                    }
                        ]
                    });
                }
            }
        }).data('kendoMenu');

        if (whetherToOpenOnClick && kendoMenu) {
            jQuery(kendoMenu.element).find("li:has(ul) > a").attr("href", "javascript:void(0)");
        }
    })(jQuery);
</script>
 --%>