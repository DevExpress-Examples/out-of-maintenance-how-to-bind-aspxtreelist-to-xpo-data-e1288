using System;
using DevExpress.Xpo;
using DevExpress.Data.Filtering;

public partial class _Default : System.Web.UI.Page {
    private Session session;
    protected override void OnInit(EventArgs e) {
        base.OnInit(e);
        session = new Session();
        XpoDataSource1.Session = session;
        ASPxTreeList1.KeyFieldName = "Oid";
        ASPxTreeList1.ParentFieldName = "Parent!Key";
        ASPxTreeList1.DataBind();
    }
}