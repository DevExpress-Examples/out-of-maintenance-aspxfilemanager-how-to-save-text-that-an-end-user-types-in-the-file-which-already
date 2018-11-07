<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxFileManager"
    TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.1" namespace="DevExpress.Web.ASPxCallback" tagprefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function showSaveAsDialog(s,e) {
            pcSaveAs.Show();
            fm.Refresh();
        }
        function fileSelectChanged(s,e) {
            var file = e.file;
            if(file) {
                tbFileName.SetText(file.name);
            }
        }
        function saveCallbackComplete(s, e) {
            var res = e.result;
            if(res == "OK") {
                alert("File saved");
                pcSaveAs.Hide();
            }
            else if(res == "OVER" && confirm("File already exists. Do you want to replace it?"))
                saveFile(true);
            else
                alert(res);
        }
        function saveFile(overwrite) {
            cb.PerformCallback(overwrite ? 1 : 0);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>
            <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="cb" 
                oncallback="ASPxCallback1_Callback">
                <ClientSideEvents CallbackComplete="saveCallbackComplete" />
            </dx:ASPxCallback>
            Editor</h1>
        <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="100px" Width="350px" Text="Some content...">
        </dx:ASPxMemo>
        <dx:ASPxButton ID="ASPxButton3" runat="server" Text="Save As..." AutoPostBack="false">
            <ClientSideEvents Click="showSaveAsDialog" />
        </dx:ASPxButton>
        <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="pcSaveAs"
            CloseAction="CloseButton" AllowDragging="true" PopupHorizontalAlign="WindowCenter"
            HeaderText="Save File As"
            PopupVerticalAlign="WindowCenter" Width="800px">
            <ContentStyle Paddings-Padding="1px">
<Paddings Padding="1px"></Paddings>
            </ContentStyle>
            <ContentCollection>
                <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxFileManager ID="fm" runat="server" Height="355px" Width="100%"
                        ClientInstanceName="fm">
                        <Border BorderWidth="0px" />
                        <Settings RootFolder="~\" ThumbnailFolder="~\Thumb\" />
                        <SettingsUpload Enabled="false"></SettingsUpload>
                        <ClientSideEvents SelectedFileChanged="fileSelectChanged" />
                    </dx:ASPxFileManager>
                    <table>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="File Name:">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="tbFileName" runat="server" Width="250px" CssClass="float" ClientInstanceName="tbFileName">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                    <table align="right">
                        <tr>
                            <td>
                                <dx:ASPxButton ID="btnOk" runat="server" Text="Save" AutoPostBack="false">
                                <ClientSideEvents Click="function() { saveFile(false); }" />
                                </dx:ASPxButton>
                            </td>
                            <td>
                                <dx:ASPxButton ID="btnCancel" runat="server" Text="Cancel" AutoPostBack="false">
                                    <ClientSideEvents Click="function() { pcSaveAs.Hide(); }"/>
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
  
    </form>
</body>
</html>
