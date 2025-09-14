class BTROPointBoxHK extends BTROItemBoxHK;

function SetPoint(int Point)
{
    ItemInfo = new Class'Engine.wItemBoxHK';
    ItemImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_Item_FT_point;
    ItemName = Class'Engine.BTCustomDrawHK'.static.MakeText(10, 0, string(Point) @ strPoint);
    ChangeState(11);
    //return;    
}
