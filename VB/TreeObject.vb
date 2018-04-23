Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Xpo

Public Class TreeObject
	Inherits XPObject
	Public Sub New(ByVal session As Session)
		MyBase.New(session)
	End Sub
	Private _Name As String
	Public Property Name() As String
		Get
			Return _Name
		End Get
		Set(ByVal value As String)
			SetPropertyValue("Name", _Name, value)
		End Set
	End Property
	Private _Parent As TreeObject
	<Association("Root-Children")> _
	Public Property Parent() As TreeObject
		Get
			Return _Parent
		End Get
		Set(ByVal value As TreeObject)
			SetPropertyValue("Parent", _Parent, value)
		End Set
	End Property
	<Association("Root-Children")> _
	Public ReadOnly Property Children() As XPCollection(Of TreeObject)
		Get
			Return GetCollection(Of TreeObject)("Children")
		End Get
	End Property
End Class