<%@ Control Language="C#" %>
<%@ Register TagPrefix="sitefinity" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>

<asp:Panel ID="errorsPanel" runat="server" CssClass="sfErrorSummary" Visible="false" />
<div id="formFieldset" runat="server" class="sfnewsletterForm sfSubscribe">
    <sitefinity:SitefinityLabel id="widgetTitle" runat="server" WrapperTagName="h4" HideIfNoText="true" CssClass="sfnewsletterTitle" />
    <sitefinity:SitefinityLabel id="widgetDescription" runat="server" WrapperTagName="p" HideIfNoText="true" CssClass="sfnewsletterDescription" />
            <asp:Label Visible="false" ID="emailAddressLabel" runat="server" Text='<%$Resources:NewslettersResources, EmailAddress %>' AssociatedControlID="emailAddress" CssClass="sfTxtLbl" />
            <asp:TextBox ID="emailAddress" runat="server" CssClass="sfTxt" placeholder="Enter your email..." required />
            <asp:RequiredFieldValidator Visible="false" ID="emailValidator" runat="server" ControlToValidate="emailAddress" CssClass="sfErrorWrp" Display="Dynamic">
                <strong class="sfError"><asp:Literal runat="server" ID="lEmailIsRequired" Text='<%$Resources:NewslettersResources, EmailIsRequired %>' /></strong>
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator  Visible="false" 
                ID="emailRegExp" 
                runat="server" 
                ControlToValidate="emailAddress"
                ValidationExpression="[a-zA-Z0-9._%+-]+@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,4}" 
                Display="Dynamic" 
                CssClass="sfErrorWrp"
                ErrorMessage="<%$ Resources:ErrorMessages, EmailAddressViolationMessage %>">
                    <strong class="sfError"><asp:Literal ID="lEmailNotValid" runat="server" Text="<%$ Resources:ErrorMessages, EmailAddressViolationMessage %>" /></strong>
            </asp:RegularExpressionValidator>
        
        <li class="sfnewsletterField" runat="server" visible="false">
            <asp:Label ID="firstNameLabel" runat="server" Text='<%$Resources:NewslettersResources, FirstNamePublicForm %>' AssociatedControlID="firstName" CssClass="sfTxtLbl" />
            <asp:TextBox ID="firstName" runat="server" CssClass="sfTxt" />
        </li>
        <li class="sfnewsletterField" runat="server" visible="false">
            <asp:Label ID="lastNameLabel" runat="server" Text='<%$Resources:NewslettersResources, LastNamePublicForm %>' AssociatedControlID="lastName" CssClass="sfTxtLbl" />
            <asp:TextBox ID="lastName" runat="server" CssClass="sfTxt" />
        </li>
    <div class="sfnewsletterSubmitBtnWrp">
        <asp:Button ID="subscribeButton" runat="server" Text='<%$Resources:NewslettersResources, SubscribeToList %>' CssClass="sfnewsletterSubmitBtn" />
    </div>
    <sitefinity:Message ID="messageControl" runat="server" />
</div>

<asp:Panel ID="selectListInstructionPanel" runat="server">
    <asp:Literal ID="pleaseSelectList" runat="server" Text='<%$Resources:NewslettersResources, ClickEditAndSelectList %>' />
</asp:Panel>