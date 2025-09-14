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

function OnComboListDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    local int i;
    local wMapInfo mInfo;

    C.Style = 5;
    C.DrawColor = FontColor[int(self.MenuState)];
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, combBackImg, X, Y, X + W, Y + HT);
    // End:0x25D
    if(bSelected)
    {
        // End:0x175
        if(LastSelectedItem != Item)
        {
            mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(ComboBox.List.GetExtraAtIndex(Item));
            i = 0;
            J0xD8:

            // End:0x13F [Loop If]
            if(i < 3)
            {
                // End:0x105
                if(mInfo.ResourceSupplyImages[i] == "")
                {
                    // [Explicit Break]
                    goto J0x13F;
                    // [Explicit Continue]
                    goto J0x135;
                }
                ImgSupply[i] = Material(DynamicLoadObject(mInfo.ResourceSupplyImages[i], Class'Engine.Material'));
                J0x135:

                i++;
                // [Loop Continue]
                goto J0xD8;
            }
            J0x13F:

            i = 3;
            J0x147:

            // End:0x16A [Loop If]
            if(i < 3)
            {
                ImgSupply[i] = none;
                i++;
                // [Loop Continue]
                goto J0x147;
            }
            LastSelectedItem = Item;
        }
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, combSelectImg, X, Y, X + W, Y + HT);
        mapInfo.SetData(ComboBox.GetItem(Item), Material(ComboBox.GetItemObject(Item)), ImgSupply[0], ImgSupply[1], ImgSupply[2]);
        mapInfo.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(X - float(320), Y - float(20), X, Y + float(240));
        mapInfo.Render(C);
    }
    Class'Engine.BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, ComboBox.GetItem(Item), FontDrawType, float(FontSize[int(self.MenuState)]), 0.9000000, X, Y, X + W, Y + HT, FontPadding[0], FontPadding[1], FontPadding[2], FontPadding[3], FontShadowColor[int(self.MenuState)]);
    // End:0x38D
    if(bShowExtraData)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, ComboBox.List.GetExtraAtIndex(Item), ExtraDataFontDrawType, float(FontSize[int(self.MenuState)]), 0.9000000, X, Y, X + W, Y + HT, FontPadding[0], FontPadding[1], FontPadding[2], FontPadding[3]);
    }
    //return;    
}
