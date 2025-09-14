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

function Init()
{
    //return;    
}

function SetClanMarkID(int clanmarkid)
{
    roClanMarkID = clanmarkid;
    //return;    
}

function SetClanMarkType(int clanmarktype1, int clanmarktype2)
{
    roType1 = clanmarktype1;
    roType2 = clanmarktype2;
    //return;    
}

function SetClanMarkSize128()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x88 [Loop If]
    if(i < 3)
    {
        // End:0x64
        if(clanmarkresource128[i] != "")
        {
            Layer[i] = Class'Engine.BTCustomDrawHK'.static.MakeImage(128, 128, 28, Material(DynamicLoadObject(clanmarkresource128[i], Class'Engine.Material')));
            // [Explicit Continue]
            goto J0x7E;
        }
        Layer[i] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
        J0x7E:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    bClanMarkSize128 = true;
    //return;    
}

function SetClanMarkSize32()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x88 [Loop If]
    if(i < 3)
    {
        // End:0x64
        if(clanmarkresource32[i] != "")
        {
            Layer[i] = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 32, 28, Material(DynamicLoadObject(clanmarkresource32[i], Class'Engine.Material')));
            // [Explicit Continue]
            goto J0x7E;
        }
        Layer[i] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
        J0x7E:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    bClanMarkSize128 = false;
    //return;    
}

function SetData(int LayerIndex, int clanmarkid, int clanmarktype1, int clanmarktype2, int selltype, int DisplayOrder, string clanmarkresource32, string clanmarkresource128)
{
    // End:0x29
    if(((LayerCount >= 3) || LayerIndex < 0) || LayerIndex >= 3)
    {
        return;
    }
    // End:0x48
    if(LayerCount == 0)
    {
        Background = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_make_clan;
    }
    // End:0x5E
    if(roClanMarkID == 0)
    {
        SetClanMarkID(clanmarkid);
    }
    // End:0x86
    if((roType1 == 0) && roType2 == 0)
    {
        SetClanMarkType(clanmarktype1, clanmarktype2);
    }
    self.clanmarkid[LayerIndex] = clanmarkid;
    self.clanmarktype1[LayerIndex] = clanmarktype1;
    self.clanmarktype2[LayerIndex] = clanmarktype2;
    self.selltype[LayerIndex] = selltype;
    // End:0xFE
    if(selltype == 2)
    {
        Status = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_clan_free;
    }
    self.DisplayOrder[LayerIndex] = DisplayOrder;
    self.clanmarkresource32[LayerIndex] = clanmarkresource32;
    self.clanmarkresource128[LayerIndex] = clanmarkresource128;
    // End:0x165
    if(LayerIndex >= LayerCount)
    {
        LayerCount += ((LayerIndex - LayerCount) + 1);
    }
    //return;    
}

function Update(optional Canvas C, optional float Delta)
{
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    local FloatBox fb;

    fb.X1 = AWinPos.X1;
    fb.X2 = AWinPos.X2;
    fb.Y1 = AWinPos.Y1;
    fb.Y2 = AWinPos.Y2;
    // End:0xA5
    if(Background.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Background, fb.X1, fb.Y1, fb.X2, fb.Y2);
    }
    // End:0x161
    if(Layer[0].Image != none)
    {
        // End:0x11E
        if(bClanMarkSize128)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Layer[0], fb.X1 + float(10), fb.Y1 + float(10), fb.X2 - float(10), fb.Y2 - float(10));            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Layer[0], fb.X1, fb.Y1, fb.X2, fb.Y2);
        }
    }
    // End:0x21D
    if(Layer[1].Image != none)
    {
        // End:0x1DA
        if(bClanMarkSize128)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Layer[1], fb.X1 + float(10), fb.Y1 + float(10), fb.X2 - float(10), fb.Y2 - float(10));            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Layer[1], fb.X1, fb.Y1, fb.X2, fb.Y2);
        }
    }
    // End:0x2DC
    if(Layer[2].Image != none)
    {
        // End:0x298
        if(bClanMarkSize128)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Layer[2], fb.X1 + float(10), fb.Y1 + float(10), fb.X2 - float(10), fb.Y2 - float(10));            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Layer[2], fb.X1, fb.Y1, fb.X2, fb.Y2);
        }
    }
    // End:0x338
    if(bUseSellMark && Status.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Status, fb.X1, fb.Y1, fb.X2, fb.Y2);
    }
    // End:0x396
    if(bMouseOn || bFocused)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_serv_cli, fb.X1, fb.Y1, fb.X2, fb.Y2);
    }
    //return;    
}
