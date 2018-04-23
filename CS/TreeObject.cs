using System;
using DevExpress.Xpo;

public class TreeObject : XPObject {
    public TreeObject(Session session) : base(session) { }
    private string _Name;
    public string Name {
        get { return _Name; }
        set { SetPropertyValue("Name", ref _Name, value); }
    }
    private TreeObject _Parent;
    [Association("Root-Children")]
    public TreeObject Parent {
        get { return _Parent; }
        set { SetPropertyValue("Parent", ref _Parent, value); }
    }
    [Association("Root-Children")]
    public XPCollection<TreeObject> Children {
        get {
            return GetCollection<TreeObject>("Children");
        }
    }
}