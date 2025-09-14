class BTComboBoxMapHK extends BTComboBoxHK
    editinlinenew
    instanced;

var BTROMapInfoHK mapInfo;
var Material ImgSupply[3];
var int LastSelectedItem;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    mapInfo = new Class'GUIWarfareControls_Decompressed.BTROMapInfoHK';
    mapInfo.Init();
    //return;    
}
