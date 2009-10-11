<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LogDemerits.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Log A Demerit | Demerit Log</title>
<link rel="Stylesheet" type="text/css" href="../css/StyleSheet.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SiteMapPath ID="SiteMapPath1" runat="server" CssClass="breadcrumb">
    </asp:SiteMapPath>
    <form action="" method="post" class="logdem">
        <fieldset>
            <legend>Log a Demerit</legend>
            <ul>
                <li><input id="Checkbox1" type="checkbox" name="tardy" /><label for="tardy">Tardy</label></li>
                <li><input id="Checkbox2" type="checkbox" name="food" /><label for="food">Food</label></li>
                <li><input id="Checkbox3" type="checkbox" name="behavior" /><label for="behavior">Behavior</label></li>
                <li><input id="Checkbox4" type="checkbox" name="disrespect" /><label for="dis">Disrespect</label></li>
                <li><input id="Checkbox5" type="checkbox" name="preparation" /><label for="prep">Preparation</label></li>
                <li><input id="Checkbox6" type="checkbox" name="hallway" /><label for="hall">Hallway</label></li>
                <li><input id="Checkbox7" type="checkbox" name="vandalism" /><label for="vandal">Vandalism</label></li>
                <li><input id="Checkbox8" type="checkbox" name="violence" /><label for="vio">Violence</label></li>
                <li><input id="Checkbox9" type="checkbox" name="materials" /><label for="mat">Materials</label></li>
                <li><input id="Checkbox10" type="checkbox" name="cheating" /><label for="cheat">Cheating</label></li>
                <li><input id="Checkbox11" type="checkbox" name="skipping" /><label for="skip">Skipping</label></li>
                <li><input id="Checkbox12" type="checkbox" name="drugsalcohol" /><label for="dna">Drugs & Alcohol</label></li>
                <li><input id="Checkbox13" type="checkbox" name="other" /><label for="">Other</label>&nbsp;<input type="text" id="text1" name="othertext" /></li>
            </ul>            
            <legend>Comments</legend>
            <textarea id="commentarea" cols="35" rows="5" name="comments"></textarea>
            <input id="Submit1" type="submit" value="Submit" />&nbsp;&nbsp;&nbsp;<input id="Reset1" type="reset" value="Reset" />
        </fieldset>
    </form>

</asp:Content>

