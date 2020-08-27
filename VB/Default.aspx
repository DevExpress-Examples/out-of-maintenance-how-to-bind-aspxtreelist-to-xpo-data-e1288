<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>

<%@ Register Assembly="DevExpress.Xpo.v13.1.Web, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Xpo" TagPrefix="dxxpo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Untitled Page</title>
</head>
<body>
	<form id="form1" runat="server">
	<div>
	<dxwtl:ASPxTreeList ID="ASPxTreeList1" runat="server" DataSourceID="XpoDataSource1" Width="238px" AutoGenerateColumns="False" KeyFieldName="Oid">
		<Columns>
			<dxwtl:TreeListTextColumn FieldName="Name" VisibleIndex="0">
			</dxwtl:TreeListTextColumn>
		</Columns>
	</dxwtl:ASPxTreeList>
	<dxxpo:XpoDataSource ID="XpoDataSource1" runat="server" TypeName="TreeObject">
	</dxxpo:XpoDataSource>
	</div>
	</form>
</body>
</html>