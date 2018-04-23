<%@ Application Language="C#" %>

<script runat="server">
    void Application_Start(object sender, EventArgs e) {
        string conn = CodeCentralDemo.CodeCentralExampleInMemoryDataStoreProvider.ConnectionString;
        DevExpress.Xpo.Metadata.XPDictionary dict = new DevExpress.Xpo.Metadata.ReflectionDictionary();
        dict.GetDataStoreSchema(typeof(TreeObject).Assembly);
        DevExpress.Xpo.DB.IDataStore store = DevExpress.Xpo.XpoDefault.GetConnectionProvider(conn, DevExpress.Xpo.DB.AutoCreateOption.DatabaseAndSchema);
        DevExpress.Xpo.XpoDefault.DataLayer = new DevExpress.Xpo.ThreadSafeDataLayer(dict, store);
        CreateDemoData(DevExpress.Xpo.XpoDefault.Session);
        DevExpress.Xpo.XpoDefault.Session = null;
    }
    public void CreateDemoData(DevExpress.Xpo.Session session){
        TreeObject root = session.FindObject<TreeObject>(DevExpress.Data.Filtering.CriteriaOperator.Parse("Name = ?", "Root"));
        if (root == null) {
            root = new TreeObject(session);
            root.Name = "Root";
            TreeObject child1 = new TreeObject(session);
            child1.Name = "Child1";
            child1.Parent = root;
            child1.Save();
            root.Save();
            TreeObject child2 = new TreeObject(session);
            child2.Name = "Child2";
            child2.Parent = child1;
            child2.Save();
        }
    }
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
