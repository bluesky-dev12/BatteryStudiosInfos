class BTItemListMenuBtn extends RenderObject;

var bool bModify;
var bool bDisModi;
var bool bRepair;
var bool bDisRepair;
var bool bSell;
var bool bDisSell;
var bool bGift;
var bool bDisgift;
var bool bBuy;
var bool bDisBuy;
var bool bCoast;
var bool bDelay;
var bool bDisDelay;
var GUIController PController;
var array<Text> MenuText;
var BtrDouble dbUniqID;
var int nSkillID;
var int ItemID;
var int ClickBtnIndex;
var BTROItemBoxHK ro;
var localized string MenuName[7];

function Init()
{
    MenuText.Length = 7;
    MenuText[0] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 4, MenuName[0]);
    MenuText[0].DrawColor = Class'Engine.Canvas'.static.MakeColor(172, byte(255), 252, byte(255));
    MenuText[1] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 4, MenuName[1]);
    MenuText[1].DrawColor = Class'Engine.Canvas'.static.MakeColor(172, byte(255), 252, byte(255));
    MenuText[2] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 4, MenuName[2]);
    MenuText[2].DrawColor = Class'Engine.Canvas'.static.MakeColor(172, byte(255), 252, byte(255));
    MenuText[3] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 4, MenuName[3]);
    MenuText[3].DrawColor = Class'Engine.Canvas'.static.MakeColor(172, byte(255), 252, byte(255));
    MenuText[4] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 4, MenuName[4]);
    MenuText[4].DrawColor = Class'Engine.Canvas'.static.MakeColor(172, byte(255), 252, byte(255));
    MenuText[5] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 4, "");
    MenuText[5].DrawColor = Class'Engine.Canvas'.static.MakeColor(172, byte(255), 252, byte(255));
    MenuText[6] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 4, MenuName[6]);
    MenuText[6].DrawColor = Class'Engine.Canvas'.static.MakeColor(172, byte(255), 252, byte(255));
    //return;    
}

function bool RenderRepair(Canvas C, optional float Delta)
{
    // End:0x13
    if(Render(C) == false)
    {
        return true;
    }
    C.Style = 5;
    C.DrawColor.R = byte(255);
    C.DrawColor.G = byte(255);
    C.DrawColor.B = byte(255);
    C.DrawColor.A = byte(255);
    // End:0x2A7
    if(bRepair)
    {
        // End:0xE3
        if(bDisRepair)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_Disable, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            // End:0x180
            if(bMouseOn)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x1D3
            if(bFocused)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x226
            if(bMouseClick)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
        }
        // End:0x2A7
        if(MenuText[0].Text != "")
        {
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, MenuText[0].Text, MenuText[0].FontDrawType, float(MenuText[0].FontSize), AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2, MenuText[0].DrawShadowColor);
        }
    }
    return true;
    //return;    
}

function bool RenderGift(Canvas C, optional float Delta)
{
    // End:0x13
    if(Render(C) == false)
    {
        return true;
    }
    C.Style = 5;
    C.DrawColor.R = byte(255);
    C.DrawColor.G = byte(255);
    C.DrawColor.B = byte(255);
    C.DrawColor.A = byte(255);
    // End:0x2AB
    if(bGift)
    {
        // End:0xE3
        if(bDisgift)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_Disable, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            // End:0x180
            if(bMouseOn)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x1D3
            if(bFocused)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x226
            if(bMouseClick)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
        }
        // End:0x2AB
        if(MenuText[3].Text != "")
        {
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, MenuText[3].Text, MenuText[3].FontDrawType, float(MenuText[0].FontSize), AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2, MenuText[3].DrawShadowColor);
        }
    }
    return true;
    //return;    
}

function bool RenderModify(Canvas C, optional float Delta)
{
    // End:0x13
    if(Render(C) == false)
    {
        return true;
    }
    C.Style = 5;
    // End:0x247
    if(bModify)
    {
        // End:0x83
        if(bDisModi)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_Disable, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            // End:0x120
            if(bMouseOn)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x173
            if(bFocused)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x1C6
            if(bMouseClick)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
        }
        // End:0x247
        if(MenuText[1].Text != "")
        {
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, MenuText[1].Text, MenuText[1].FontDrawType, float(MenuText[1].FontSize), AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2, MenuText[1].DrawShadowColor);
        }
    }
    return true;
    //return;    
}

function bool RenderBuy(Canvas C, optional float Delta)
{
    // End:0x13
    if(Render(C) == false)
    {
        return true;
    }
    C.Style = 5;
    // End:0x24C
    if(bBuy)
    {
        // End:0x83
        if(bDisBuy)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_Disable, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            // End:0x120
            if(bMouseOn)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x173
            if(bFocused)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x1C6
            if(bMouseClick)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
        }
        // End:0x24C
        if(MenuText[4].Text != "")
        {
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, MenuText[4].Text, MenuText[4].FontDrawType, float(MenuText[4].FontSize), AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2, MenuText[4].DrawShadowColor);
        }
    }
    return true;
    //return;    
}

function bool RenderSell(Canvas C, optional float Delta)
{
    // End:0x13
    if(Render(C) == false)
    {
        return true;
    }
    C.Style = 5;
    // End:0x2C1
    if(bSell)
    {
        // End:0xF8
        if(bDisSell)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_Disable, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            MenuText[2].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeShop_DurabilityX();
            // End:0xF5
            if(MenuText[2].Text != "")
            {
                Class'Engine.BTCustomDrawHK'.static.DrawText(C, MenuText[2], AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_sel_btn_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            // End:0x195
            if(bMouseOn)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_sel_btn_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x1E8
            if(bFocused)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_sel_btn_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x23B
            if(bMouseClick)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_sel_btn_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x2C1
            if(MenuText[2].Text != "")
            {
                Class'Engine.BTCustomDrawHK'.static.DrawString(C, MenuText[2].Text, MenuText[2].FontDrawType, float(MenuText[2].FontSize), AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2, MenuText[2].DrawShadowColor);
            }
        }
    }
    return true;
    //return;    
}

function bool RenderDelay(Canvas C, optional float Delta)
{
    // End:0x13
    if(Render(C) == false)
    {
        return true;
    }
    C.Style = 5;
    // End:0x24C
    if(bDelay)
    {
        // End:0x83
        if(bDisDelay)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_Disable, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            // End:0x120
            if(bMouseOn)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x173
            if(bFocused)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x1C6
            if(bMouseClick)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_btn_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
        }
        // End:0x24C
        if(MenuText[6].Text != "")
        {
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, MenuText[6].Text, MenuText[6].FontDrawType, float(MenuText[6].FontSize), AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2, MenuText[6].DrawShadowColor);
        }
    }
    return true;
    //return;    
}

function bool RenderCoast(Canvas C, optional float Delta)
{
    // End:0x13
    if(Render(C) == false)
    {
        return true;
    }
    C.Style = 5;
    // End:0xE9
    if(bCoast)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_ItemList_sel_btn_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, MenuText[5].Text, MenuText[5].FontDrawType, float(MenuText[5].FontSize), AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2, MenuText[5].DrawShadowColor);
    }
    return true;
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
}