<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Comments.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" type="text/css" href="../css/StyleSheet.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SiteMapPath ID="SiteMapPath1" runat="server" CssClass="breadcrumb">
    </asp:SiteMapPath>
<form action method="post" class="comment">
    <fieldset>
        <legend>Comment</legend>
        <input id="hidden1" type="hidden" name="userID" value="<asp:LoginName ID='LoginName1' runat='server' />" />
        <textarea id="TextArea1" cols="80" rows="5"></textarea><br />
        <input id="Submit1" type="submit" value="Submit" />
    </fieldset>
</form>
</asp:Content>

