class BTItemListMenuBtn extends RenderObject;

enum MenuType
{
    MT_REPAIR,                      // 0
    MT_MODIFY,                      // 1
    MT_SELL,                        // 2
    MT_GIFT,                        // 3
    MT_PURCHASE,                    // 4
    MT_COAST,                       // 5
    MT_EXTEND,                      // 6
    MT_PCOIN,                       // 7
    MT_CCOIN,                       // 8
    MT_POINT,                       // 9
    MT_NONE                         // 10
};

var int ClickBtnIndex;
var int enableType;
var bool disableBtn;
var int ButtonColor[10];
var localized string MenuName[10];
var GUIController PController;
var array<Text> MenuText;
var BtrDouble dbUniqID;
var int nSkillID;
var int ItemID;
var BTROItemBoxHK ro;

function Init()
{
    local int i;

    MenuText.Length = 7;
    i = 0;
    J0x10:

    // End:0x52 [Loop If]
    if(i < int(11))
    {
        MenuText[i] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 4, MenuName[i]);
        i++;
        // [Loop Continue]
        goto J0x10;
    }
    ButtonColor[int(0)] = 0;
    ButtonColor[int(1)] = 1;
    ButtonColor[int(2)] = 0;
    ButtonColor[int(3)] = 0;
    ButtonColor[int(4)] = 1;
    ButtonColor[int(5)] = 0;
    ButtonColor[int(6)] = 0;
    ButtonColor[int(7)] = 0;
    ButtonColor[int(8)] = 0;
    ButtonColor[int(9)] = 1;
    //return;    
}

function SetButtonType(int enableT, bool bDisable)
{
    enableType = enableT;
    disableBtn = bDisable;
    //return;    
}

function RenderButton(Canvas C, optional float Delta)
{
    local Image disableImg, normalImg, onImg, focusImg, clickImg;

    // End:0x12
    if(!Render(C))
    {
        return;
    }
    // End:0x38C
    if(enableType != int(10))
    {
        C.Style = 5;
        // End:0xA9
        if(ButtonColor[enableType] == 0)
        {
            disableImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_GreenBtn_Disable;
            normalImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_GreenBtn_n;
            onImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_GreenBtn_on;
            focusImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_GreenBtn_cli;
            clickImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_GreenBtn_cli;            
        }
        else
        {
            disableImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_YellowBtn_Disable;
            normalImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_YellowBtn_n;
            onImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_YellowBtn_on;
            focusImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_YellowBtn_cli;
            clickImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_YellowBtn_cli;
        }
        // End:0x1D8
        if(disableBtn)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, disableImg, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            MenuText[enableType].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultGray();
            // End:0x1D5
            if(MenuText[enableType].Text != "")
            {
                Class'Engine.BTCustomDrawHK'.static.DrawText(C, MenuText[enableType], AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, normalImg, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            // End:0x263
            if(bMouseOn)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, onImg, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x2AD
            if(bFocused)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, focusImg, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x2F7
            if(bMouseClick)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, clickImg, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x38C
            if(MenuText[enableType].Text != "")
            {
                Class'Engine.BTCustomDrawHK'.static.DrawString(C, MenuText[enableType].Text, MenuText[enableType].FontDrawType, float(MenuText[enableType].FontSize), AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2, MenuText[enableType].DrawShadowColor);
            }
        }
    }
    //return;    
}

defaultproperties
{
    ClickBtnIndex=-1
    MenuName[0]="Repair"
    MenuName[1]="Modify"
    MenuName[2]="Sell"
    MenuName[3]="Gift"
    MenuName[4]="Purchase"
    MenuName[6]="Extend"
    MenuName[7]="Coin(P)"
    MenuName[8]="Coin(C)"
    MenuName[9]="Point"
}