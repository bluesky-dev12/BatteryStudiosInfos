/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTItemListMenuBtn.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:11
 *	Functions:3
 *
 *******************************************************************************/
class BTItemListMenuBtn extends RenderObject;

enum MenuType
{
    MT_REPAIR,
    MT_MODIFY,
    MT_SELL,
    MT_GIFT,
    MT_PURCHASE,
    MT_COAST,
    MT_EXTEND,
    MT_PCOIN,
    MT_CCOIN,
    MT_POINT,
    MT_NONE
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
    // End:0x52 [While If]
    if(i < 11)
    {
        MenuText[i] = class'BTCustomDrawHK'.static.MakeText(9, 4, MenuName[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x10;
    }
    ButtonColor[0] = 0;
    ButtonColor[1] = 1;
    ButtonColor[2] = 0;
    ButtonColor[3] = 0;
    ButtonColor[4] = 1;
    ButtonColor[5] = 0;
    ButtonColor[6] = 0;
    ButtonColor[7] = 0;
    ButtonColor[8] = 0;
    ButtonColor[9] = 1;
}

function SetButtonType(int enableT, bool bDisable)
{
    enableType = enableT;
    disableBtn = bDisable;
}

function RenderButton(Canvas C, optional float Delta)
{
    local Image disableImg, normalImg, onImg, focusImg, clickImg;

    // End:0x12
    if(!Render(C))
    {
        return;
    }
    // End:0x38c
    if(enableType != 10)
    {
        C.Style = 5;
        // End:0xa9
        if(ButtonColor[enableType] == 0)
        {
            disableImg = class'BTUIResourcePoolHK'.default.Inven_ItemList_GreenBtn_Disable;
            normalImg = class'BTUIResourcePoolHK'.default.Inven_ItemList_GreenBtn_n;
            onImg = class'BTUIResourcePoolHK'.default.Inven_ItemList_GreenBtn_on;
            focusImg = class'BTUIResourcePoolHK'.default.Inven_ItemList_GreenBtn_cli;
            clickImg = class'BTUIResourcePoolHK'.default.Inven_ItemList_GreenBtn_cli;
        }
        // End:0x10d
        else
        {
            disableImg = class'BTUIResourcePoolHK'.default.Inven_ItemList_YellowBtn_Disable;
            normalImg = class'BTUIResourcePoolHK'.default.Inven_ItemList_YellowBtn_n;
            onImg = class'BTUIResourcePoolHK'.default.Inven_ItemList_YellowBtn_on;
            focusImg = class'BTUIResourcePoolHK'.default.Inven_ItemList_YellowBtn_cli;
            clickImg = class'BTUIResourcePoolHK'.default.Inven_ItemList_YellowBtn_cli;
        }
        // End:0x1d8
        if(disableBtn)
        {
            class'BTCustomDrawHK'.static.DrawImage(C, disableImg, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            MenuText[enableType].DrawColor = class'BTUIColorPoolHK'.static.DefaultGray();
            // End:0x1d5
            if(MenuText[enableType].Text != "")
            {
                class'BTCustomDrawHK'.static.DrawText(C, MenuText[enableType], AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
        }
        // End:0x38c
        else
        {
            class'BTCustomDrawHK'.static.DrawImage(C, normalImg, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            // End:0x263
            if(bMouseOn)
            {
                class'BTCustomDrawHK'.static.DrawImage(C, onImg, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x2ad
            if(bFocused)
            {
                class'BTCustomDrawHK'.static.DrawImage(C, focusImg, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x2f7
            if(bMouseClick)
            {
                class'BTCustomDrawHK'.static.DrawImage(C, clickImg, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x38c
            if(MenuText[enableType].Text != "")
            {
                class'BTCustomDrawHK'.static.DrawString(C, MenuText[enableType].Text, MenuText[enableType].FontDrawType, float(MenuText[enableType].FontSize), AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2, MenuText[enableType].DrawShadowColor);
            }
        }
    }
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
    MenuName[7]="W Coin(P)"
    MenuName[8]="W Coin(C)"
    MenuName[9]="Point"
}