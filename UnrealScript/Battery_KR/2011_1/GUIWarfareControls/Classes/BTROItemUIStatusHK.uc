class BTROItemUIStatusHK extends RenderObject;

var array<Text> textAmmosize;
var array<Text> textSkill;
var localized string strStatus[8];
var int HalfX;
var int StatusSX;
var int StatusEX;
var int GaugeSX;
var int GaugeEX;
var int ValueX;
var BTROWeaponUIGaugeHK WeaponStatus[8];
var int TopPad;
var int ItemHeight;
var int BottomPad;

function SetDamage(int Value, optional int Add)
{
    WeaponStatus[0].SetData(strStatus[0], Value, Add);
    //return;    
}

function SetSpread(int Value, optional int Add)
{
    WeaponStatus[1].SetData(strStatus[1], Value, Add);
    //return;    
}

function SetViewKick(int Value, optional int Add)
{
    WeaponStatus[2].SetData(strStatus[2], Value, Add);
    //return;    
}

function SetRateofFire(int Value, optional int Add)
{
    WeaponStatus[3].SetData(strStatus[3], Value, Add);
    //return;    
}

function SetMove(int Value, optional int Add)
{
    WeaponStatus[4].SetData(strStatus[4], Value, Add);
    //return;    
}

function SetRange(int Value, optional int Add)
{
    WeaponStatus[5].SetData(strStatus[5], Value, Add);
    //return;    
}

function SetAmmoSize(int clipsize, int MaxAmmo, optional int addopt1, optional int addopt2)
{
    WeaponStatus[6].SetData(strStatus[6], 0, 0);
    // End:0x39
    if(addopt1 == 0)
    {
        textAmmosize[1].Text = "";        
    }
    else
    {
        // End:0x82
        if(addopt1 > 0)
        {
            textAmmosize[1].Text = ("(+" $ string(addopt1)) $ ")";
            textAmmosize[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ItemUIStatus_Plus();            
        }
        else
        {
            textAmmosize[1].Text = ("(" $ string(addopt1)) $ ")";
            textAmmosize[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ItemUIStatus_Minus();
        }
    }
    // End:0xDA
    if(addopt2 == 0)
    {
        textAmmosize[3].Text = "";        
    }
    else
    {
        // End:0x125
        if(addopt2 > 0)
        {
            textAmmosize[3].Text = ("(+" $ string(addopt2)) $ ")";
            textAmmosize[3].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ItemUIStatus_Plus();            
        }
        else
        {
            textAmmosize[3].Text = ("(" $ string(addopt2)) $ ")";
            textAmmosize[3].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ItemUIStatus_Minus();
        }
    }
    textAmmosize[0].Text = string(clipsize + addopt1);
    textAmmosize[2].Text = "/" $ string(MaxAmmo + addopt2);
    //return;    
}

function SetSkill(string Skill, optional string mskill)
{
    WeaponStatus[7].SetData(strStatus[7], 0, 0);
    textSkill[0].Text = Skill;
    // End:0x6C
    if((mskill != "") && Skill != mskill)
    {
        textSkill[1].Text = (" (-" $ mskill) $ ")";        
    }
    else
    {
        textSkill[1].Text = "";
    }
    //return;    
}

function SetHeight(int TopPad, int ItemHeight, int BottomPad)
{
    self.TopPad = TopPad;
    self.ItemHeight = ItemHeight;
    self.BottomPad = BottomPad;
    bNeedUpdate = true;
    //return;    
}

function Init()
{
    local int i;

    StatusSX = 20;
    GaugeSX = 44;
    GaugeEX = 170;
    StatusEX = 190;
    i = 0;
    J0x27:

    // End:0x90 [Loop If]
    if(i < 8)
    {
        WeaponStatus[i] = new Class'GUIWarfareControls_Decompressed.BTROWeaponUIGaugeHK';
        WeaponStatus[i].Init();
        WeaponStatus[i].SetPos(StatusSX, GaugeSX, GaugeEX, StatusEX);
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    WeaponStatus[6].bHideAllExceptName = true;
    WeaponStatus[7].bHideAllExceptName = true;
    textAmmosize.Length = 4;
    textAmmosize[0] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 1, "-");
    textAmmosize[1] = Class'Engine.BTCustomDrawHK'.static.MakeTextColor(8, 1, "-", Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ItemUIStatus_Plus(), Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 100));
    textAmmosize[2] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 1, "-");
    textAmmosize[3] = Class'Engine.BTCustomDrawHK'.static.MakeTextColor(8, 1, "-", Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ItemUIStatus_Plus(), Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 100));
    textSkill.Length = 2;
    textSkill[0] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 1, "-");
    textSkill[1] = Class'Engine.BTCustomDrawHK'.static.MakeTextColor(8, 1, "-", Class'Engine.Canvas'.static.MakeColor(byte(255), 0, 0, byte(255)), Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 100));
    //return;    
}

function Update(optional Canvas C, optional float Delta)
{
    local int i, ReduceGX, ItemPad;

    HalfX = int(AWinPos.X2 - AWinPos.X1) / 2;
    WeaponStatus[0].AWinPos.X1 = AWinPos.X1;
    WeaponStatus[0].AWinPos.X2 = AWinPos.X1 + float(HalfX);
    WeaponStatus[1].AWinPos.X1 = AWinPos.X1;
    WeaponStatus[1].AWinPos.X2 = AWinPos.X1 + float(HalfX);
    WeaponStatus[2].AWinPos.X1 = AWinPos.X1;
    WeaponStatus[2].AWinPos.X2 = AWinPos.X1 + float(HalfX);
    WeaponStatus[3].AWinPos.X1 = AWinPos.X1;
    WeaponStatus[3].AWinPos.X2 = AWinPos.X1 + float(HalfX);
    WeaponStatus[4].AWinPos.X1 = AWinPos.X1 + float(HalfX);
    WeaponStatus[4].AWinPos.X2 = AWinPos.X2;
    WeaponStatus[5].AWinPos.X1 = AWinPos.X1 + float(HalfX);
    WeaponStatus[5].AWinPos.X2 = AWinPos.X2;
    WeaponStatus[6].AWinPos.X1 = AWinPos.X1 + float(HalfX);
    WeaponStatus[6].AWinPos.X2 = AWinPos.X2;
    WeaponStatus[7].AWinPos.X1 = AWinPos.X1 + float(HalfX);
    WeaponStatus[7].AWinPos.X2 = AWinPos.X2;
    // End:0x297
    if(StatusEX > HalfX)
    {
        ReduceGX = HalfX - StatusEX;
    }
    i = 0;
    J0x29E:

    // End:0x2EB [Loop If]
    if(i < 8)
    {
        WeaponStatus[i].SetPos(StatusSX, GaugeSX, GaugeEX - ReduceGX, ValueX - ReduceGX);
        i++;
        // [Loop Continue]
        goto J0x29E;
    }
    ItemPad = (((int(AWinPos.Y2 - AWinPos.Y1) - TopPad) - BottomPad) - (ItemHeight * 4)) / 3;
    i = 0;
    J0x32D:

    // End:0x4BB [Loop If]
    if(i < (8 / 2))
    {
        WeaponStatus[i].AWinPos.Y1 = ((AWinPos.Y1 + float(TopPad)) + float(i * ItemHeight)) + float(i * ItemPad);
        WeaponStatus[i].AWinPos.Y2 = ((AWinPos.Y1 + float(TopPad)) + float((i + 1) * ItemHeight)) + float(i * ItemPad);
        WeaponStatus[i].bNeedUpdate = true;
        WeaponStatus[i + 4].AWinPos.Y1 = ((AWinPos.Y1 + float(TopPad)) + float(i * ItemHeight)) + float(i * ItemPad);
        WeaponStatus[i + 4].AWinPos.Y2 = ((AWinPos.Y1 + float(TopPad)) + float((i + 1) * ItemHeight)) + float(i * ItemPad);
        WeaponStatus[i + 4].bNeedUpdate = true;
        i++;
        // [Loop Continue]
        goto J0x32D;
    }
    //return;    
}

function SetPos(int StatusSX, int GaugeSX, int GaugeEX, int ValueX, int StatusEX)
{
    self.StatusSX = StatusSX;
    self.GaugeSX = GaugeSX;
    self.GaugeEX = GaugeEX;
    self.StatusEX = StatusEX;
    self.ValueX = ValueX;
    bNeedUpdate = true;
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    local int i;

    // End:0x18
    if(super.Render(C, Delta) == false)
    {
        return false;
    }
    i = 0;
    J0x1F:

    // End:0x54 [Loop If]
    if(i < 8)
    {
        WeaponStatus[i].Render(C, Delta);
        i++;
        // [Loop Continue]
        goto J0x1F;
    }
    Class'Engine.BTCustomDrawHK'.static.DrawTextArray(C, textAmmosize, 4, 0, WeaponStatus[6].AWinPos.X1, WeaponStatus[6].AWinPos.Y1, WeaponStatus[6].AWinPos.X2, WeaponStatus[6].AWinPos.Y2);
    Class'Engine.BTCustomDrawHK'.static.DrawTextArray(C, textSkill, 4, 2, WeaponStatus[7].AWinPos.X1, WeaponStatus[7].AWinPos.Y1, WeaponStatus[7].AWinPos.X2, WeaponStatus[7].AWinPos.Y2);
    return true;
    //return;    
}

defaultproperties
{
    strStatus[0]="???"
    strStatus[1]="???"
    strStatus[2]="???"
    strStatus[3]="???"
    strStatus[4]="???"
    strStatus[5]="???"
    strStatus[6]="???"
    strStatus[7]="??"
}