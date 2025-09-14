class BTCashBoxHK extends FloatingImage
    editinlinenew
    instanced;

var int imgW;
var Text SavePoint;
var localized string strCash;

function SetData(BtrDouble Point)
{
    local string strBDPoint;

    strBDPoint = string(int(__NFUN_918__(Point)));
    SavePoint = Class'Engine.BTCustomDrawHK'.static.MakeText(12, 3, (" " $ Class'Engine.BTCustomDrawHK'.static.ToWonString(strBDPoint)) $ strCash);
    SavePoint.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Cash();
    imgW = int(Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_point_b.width);
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local float W, HT, SaveXPos;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.BtrTextSize(SavePoint.Text, SavePoint.FontSize, W, HT);
    SaveXPos = ((AWinPos.X2 - AWinPos.X1) - (float(imgW) + W)) / float(2);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_point_b, AWinPos.X1 + SaveXPos, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    Class'Engine.BTCustomDrawHK'.static.DrawText(C, SavePoint, (AWinPos.X1 + SaveXPos) + float(imgW), AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    //return;    
}

defaultproperties
{
    strCash="DE"
    OnRendered=BTCashBoxHK.Internal_OnRendered
}