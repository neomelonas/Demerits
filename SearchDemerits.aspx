<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchDemerits.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Search Demerits | Demerits Log</title>
    <link rel="Stylesheet" type="text/css" href="../css/StyleSheet.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SiteMapPath ID="SiteMapPath1" runat="server" CssClass="breadcrumb">
    </asp:SiteMapPath>
<form action="SearchDemerits.aspx" method="get" class="searchdem">
    <fieldset>
        <legend>Search Demerits</legend>
        <label for="userName">Name:</label><input id="Text1" type="text" name="name"/>
        <label for="userHomeroom">Homeroom:</label><select><optgroup label="Teachers"><option>Teacher1</option><option>Teacher2</option></optgroup></select>
        <label for="dateofD">Date:</label>DATEGOESHERE
        <input id="Submit1" type="submit" value="Submit" />&nbsp;<input id="Reset1" type="reset" value="Reset" />
    </fieldset>
</form>
    <table id="demeritlist">
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>

</asp:Content>

