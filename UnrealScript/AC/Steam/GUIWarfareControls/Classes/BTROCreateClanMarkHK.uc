/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTROCreateClanMarkHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Properties:16
 *	Functions:8
 *
 *******************************************************************************/
class BTROCreateClanMarkHK extends RenderObject;

var bool bClanMarkSize128;
var int roClanMarkID;
var int roType1;
var int roType2;
var int LayerCount;
var int clanmarkid[3];
var int clanmarktype1[3];
var int clanmarktype2[3];
var bool bUseSellMark;
var int selltype[3];
var int DisplayOrder[3];
var string clanmarkresource32[3];
var string clanmarkresource128[3];
var Image Background;
var Image Layer[3];
var Image Status;

function Init();
function SetClanMarkID(int clanmarkid)
{
    roClanMarkID = clanmarkid;
}

function SetClanMarkType(int clanmarktype1, int clanmarktype2)
{
    roType1 = clanmarktype1;
    roType2 = clanmarktype2;
}

function SetClanMarkSize128()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x88 [While If]
    if(i < 3)
    {
        // End:0x64
        if(clanmarkresource128[i] != "")
        {
            Layer[i] = class'BTCustomDrawHK'.static.MakeImage(128, 128, 28, Material(DynamicLoadObject(clanmarkresource128[i], class'Material')));
        }
        // End:0x7e
        else
        {
            Layer[i] = class'BTUIResourcePoolHK'.default.empty;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    bClanMarkSize128 = true;
}

function SetClanMarkSize32()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x88 [While If]
    if(i < 3)
    {
        // End:0x64
        if(clanmarkresource32[i] != "")
        {
            Layer[i] = class'BTCustomDrawHK'.static.MakeImage(32, 32, 28, Material(DynamicLoadObject(clanmarkresource32[i], class'Material')));
        }
        // End:0x7e
        else
        {
            Layer[i] = class'BTUIResourcePoolHK'.default.empty;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    bClanMarkSize128 = false;
}

function SetData(int LayerIndex, int clanmarkid, int clanmarktype1, int clanmarktype2, int selltype, int DisplayOrder, string clanmarkresource32, string clanmarkresource128)
{
    // End:0x29
    if(LayerCount >= 3 || LayerIndex < 0 || LayerIndex >= 3)
    {
        return;
    }
    // End:0x48
    if(LayerCount == 0)
    {
        Background = class'BTUIResourcePoolHK'.default.img_make_clan;
    }
    // End:0x5e
    if(roClanMarkID == 0)
    {
        SetClanMarkID(clanmarkid);
    }
    // End:0x86
    if(roType1 == 0 && roType2 == 0)
    {
        SetClanMarkType(clanmarktype1, clanmarktype2);
    }
    self.clanmarkid[LayerIndex] = clanmarkid;
    self.clanmarktype1[LayerIndex] = clanmarktype1;
    self.clanmarktype2[LayerIndex] = clanmarktype2;
    self.selltype[LayerIndex] = selltype;
    // End:0xfe
    if(selltype == 2)
    {
        Status = class'BTUIResourcePoolHK'.default.icon_clan_free;
    }
    self.DisplayOrder[LayerIndex] = DisplayOrder;
    self.clanmarkresource32[LayerIndex] = clanmarkresource32;
    self.clanmarkresource128[LayerIndex] = clanmarkresource128;
    // End:0x165
    if(LayerIndex >= LayerCount)
    {
        LayerCount += LayerIndex - LayerCount + 1;
    }
}

function Update(optional Canvas C, optional float Delta);
function bool Render(Canvas C, optional float Delta)
{
    local FloatBox fb;

    fb.X1 = AWinPos.X1;
    fb.X2 = AWinPos.X2;
    fb.Y1 = AWinPos.Y1;
    fb.Y2 = AWinPos.Y2;
    // End:0xa5
    if(Background.Image != none)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, Background, fb.X1, fb.Y1, fb.X2, fb.Y2);
    }
    // End:0x161
    if(Layer[0].Image != none)
    {
        // End:0x11e
        if(bClanMarkSize128)
        {
            class'BTCustomDrawHK'.static.DrawImage(C, Layer[0], fb.X1 + float(10), fb.Y1 + float(10), fb.X2 - float(10), fb.Y2 - float(10));
        }
        // End:0x161
        else
        {
            class'BTCustomDrawHK'.static.DrawImage(C, Layer[0], fb.X1, fb.Y1, fb.X2, fb.Y2);
        }
    }
    // End:0x21d
    if(Layer[1].Image != none)
    {
        // End:0x1da
        if(bClanMarkSize128)
        {
            class'BTCustomDrawHK'.static.DrawImage(C, Layer[1], fb.X1 + float(10), fb.Y1 + float(10), fb.X2 - float(10), fb.Y2 - float(10));
        }
        // End:0x21d
        else
        {
            class'BTCustomDrawHK'.static.DrawImage(C, Layer[1], fb.X1, fb.Y1, fb.X2, fb.Y2);
        }
    }
    // End:0x2dc
    if(Layer[2].Image != none)
    {
        // End:0x298
        if(bClanMarkSize128)
        {
            class'BTCustomDrawHK'.static.DrawImage(C, Layer[2], fb.X1 + float(10), fb.Y1 + float(10), fb.X2 - float(10), fb.Y2 - float(10));
        }
        // End:0x2dc
        else
        {
            class'BTCustomDrawHK'.static.DrawImage(C, Layer[2], fb.X1, fb.Y1, fb.X2, fb.Y2);
        }
    }
    // End:0x33a
    if(bMouseOn || bFocused)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.list_serv_cli, fb.X1, fb.Y1, fb.X2, fb.Y2);
    }
}
