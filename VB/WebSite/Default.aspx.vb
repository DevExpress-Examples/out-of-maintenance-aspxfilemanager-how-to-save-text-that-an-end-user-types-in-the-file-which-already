Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.IO

Partial Public Class _Default
	Inherits System.Web.UI.Page


	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub
	Protected Sub ASPxCallback1_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
		Dim RootFolder As String = Server.MapPath("~\")
		Dim overwrite As Boolean = e.Parameter = "1"
		Dim path1 As String = Path.Combine(fm.SelectedFolder.RelativeName, tbFileName.Text)
		path1 = Path.Combine(RootFolder, path1)
		If File.Exists(path1) AndAlso (Not overwrite) Then
			e.Result = "OVER"
		Else
			Try
				'File.WriteAllText(path1, ASPxMemo1.Text) Uncomment this line to save the file
                                                    Throw New Exception("Cannot save the file online ")
				e.Result = "OK"
			Catch exc As Exception
				e.Result = exc.Message
			End Try
		End If
	End Sub
End Class