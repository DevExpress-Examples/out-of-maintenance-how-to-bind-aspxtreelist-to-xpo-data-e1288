Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private workSession As Session
	Protected Overrides Sub OnInit(ByVal e As EventArgs)
		MyBase.OnInit(e)
		workSession = New Session()
		XpoDataSource1.Session = workSession
		ASPxTreeList1.KeyFieldName = "Oid"
		ASPxTreeList1.ParentFieldName = "Parent!Key"
		ASPxTreeList1.DataBind()
	End Sub
End Class