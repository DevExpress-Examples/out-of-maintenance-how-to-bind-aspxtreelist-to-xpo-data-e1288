<%@ Application Language="vb" %>

<script runat="server">
	Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
		Dim conn As String = CodeCentralDemo.CodeCentralExampleInMemoryDataStoreProvider.ConnectionString
		Dim dict As DevExpress.Xpo.Metadata.XPDictionary = New DevExpress.Xpo.Metadata.ReflectionDictionary()
		dict.GetDataStoreSchema(GetType(TreeObject).Assembly)
		Dim store As DevExpress.Xpo.DB.IDataStore = DevExpress.Xpo.XpoDefault.GetConnectionProvider(conn, DevExpress.Xpo.DB.AutoCreateOption.DatabaseAndSchema)
		DevExpress.Xpo.XpoDefault.DataLayer = New DevExpress.Xpo.ThreadSafeDataLayer(dict, store)
		CreateDemoData(DevExpress.Xpo.XpoDefault.Session)
		DevExpress.Xpo.XpoDefault.Session = Nothing
	End Sub
	Public Sub CreateDemoData(ByVal session As DevExpress.Xpo.Session)
		Dim root As TreeObject = session.FindObject(Of TreeObject)(DevExpress.Data.Filtering.CriteriaOperator.Parse("Name = ?", "Root"))
		If root Is Nothing Then
			root = New TreeObject(session)
			root.Name = "Root"
			Dim child1 As New TreeObject(session)
			child1.Name = "Child1"
			child1.Parent = root
			child1.Save()
			root.Save()
			Dim child2 As New TreeObject(session)
			child2.Name = "Child2"
			child2.Parent = child1
			child2.Save()
		End If
	End Sub
	Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
		'  Code that runs on application shutdown

	End Sub

	Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
		' Code that runs when an unhandled error occurs

	End Sub

	Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
		' Code that runs when a new session is started

	End Sub

	Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
		' Code that runs when a session ends. 
		' Note: The Session_End event is raised only when the sessionstate mode
		' is set to InProc in the Web.config file. If session mode is set to StateServer 
		' or SQLServer, the event is not raised.

	End Sub

</script>