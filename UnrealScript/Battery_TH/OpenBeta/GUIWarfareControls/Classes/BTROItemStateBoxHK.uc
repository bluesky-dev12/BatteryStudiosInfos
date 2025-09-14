class BTROItemStateBoxHK extends RenderObject;

var BTROWeaponStatusBarHK WeaponState[6];
var Text textForm;
var array<Text> textAmmosize;
var array<Text> textSkill;
var Color plus_c;
var Color minus_c;
var localized string strDamage;
var localized string strSpread;
var localized string strViewKick;
var localized string strRateofFire;
var localized string strMove;
var localized string strRange;
var localized string strAmmoSize;
var localized string strSkill;
var int X[4];

function Init()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x47 [Loop If]
    if(i < 6)
    {
        WeaponState[i] = new Class'GUIWarfareControls_Decompressed.BTROWeaponStatusBarHK';
        WeaponState[i].Init();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    plus_c = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ItemUIStatus_Plus();
    minus_c = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ItemUIStatus_Minus();
    textForm = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, "");
    textAmmosize.Length = 4;
    textAmmosize[0] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 1, "-");
    textAmmosize[1] = Class'Engine.BTCustomDrawHK'.static.MakeTextColor(8, 1, "-", plus_c, Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 100));
    textAmmosize[2] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 1, "-");
    textAmmosize[3] = Class'Engine.BTCustomDrawHK'.static.MakeTextColor(8, 1, "-", plus_c, Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 100));
    textSkill.Length = 2;
    textSkill[0] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 1, "-");
    textSkill[1] = Class'Engine.BTCustomDrawHK'.static.MakeTextColor(8, 1, "-", minus_c, Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 100));
    X[0] = 0;
    X[1] = 41;
    X[2] = 187;
    X[3] = 242;
    //return;    
}

function SetDamage(int Value, optional int Add)
{
    WeaponState[0].SetData(Value, Add);
    //return;    
}

function SetSpread(int Value, optional int Add)
{
    WeaponState[1].SetData(Value, Add);
    //return;    
}

function SetViewKick(int Value, optional int Add)
{
    WeaponState[2].SetData(Value, Add);
    //return;    
}

function SetRateofFire(int Value, optional int Add)
{
    WeaponState[3].SetData(Value, Add);
    //return;    
}

function SetMove(int Value, optional int Add)
{
    WeaponState[4].SetData(Value, Add);
    //return;    
}

function SetRange(int Value, optional int Add)
{
    WeaponState[5].SetData(Value, Add);
    //return;    
}

function SetAmmoSize(int clipsize, int MaxAmmo, optional int addopt1, optional int addopt2)
{
    // End:0x1D
    if(addopt1 == 0)
    {
        textAmmosize[1].Text = "";        
    }
    else
    {
        // End:0x5C
        if(addopt1 > 0)
        {
            textAmmosize[1].Text = ("(+" $ string(addopt1)) $ ")";
            textAmmosize[1].DrawColor = plus_c;            
        }
        else
        {
            textAmmosize[1].Text = ("(" $ string(addopt1)) $ ")";
            textAmmosize[1].DrawColor = minus_c;
        }
    }
    // End:0xAA
    if(addopt2 == 0)
    {
        textAmmosize[3].Text = "";        
    }
    else
    {
        // End:0xEB
        if(addopt2 > 0)
        {
            textAmmosize[3].Text = ("(+" $ string(addopt2)) $ ")";
            textAmmosize[3].DrawColor = plus_c;            
        }
        else
        {
            textAmmosize[3].Text = ("(" $ string(addopt2)) $ ")";
            textAmmosize[3].DrawColor = minus_c;
        }
    }
    textAmmosize[0].Text = string(clipsize + addopt1);
    textAmmosize[2].Text = "/" $ string(MaxAmmo + addopt2);
    //return;    
}

function SetSkill(string Skill, optional string mskill)
{
    textSkill[0].Text = Skill;
    // End:0x50
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

function SetTextDrawType(BTCustomDrawHK.DrawType dt)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x37 [Loop If]
    if(i < 6)
    {
        WeaponState[i].DrawType = dt;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function SetTextWidthNSpace(int Width, int Space)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x51 [Loop If]
    if(i < 6)
    {
        WeaponState[i].AllTextWidth = Width;
        WeaponState[i].BnTSpace = Space;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    local int i, Y;

    // End:0x0E
    if(bVisible == false)
    {
        return false;
    }
    C.Style = 5;
    i = 0;
    textForm.Text = strDamage;
    Class'Engine.BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), (AWinPos.Y1 + float(i)) + float(14));
    i += 14;
    textForm.Text = strSpread;
    Class'Engine.BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), (AWinPos.Y1 + float(i)) + float(14));
    i += 14;
    textForm.Text = strViewKick;
    Class'Engine.BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), (AWinPos.Y1 + float(i)) + float(14));
    i += 14;
    textForm.Text = strRateofFire;
    Class'Engine.BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), (AWinPos.Y1 + float(i)) + float(14));
    i += 14;
    textForm.Text = strMove;
    Class'Engine.BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), (AWinPos.Y1 + float(i)) + float(14));
    i += 14;
    textForm.Text = strRange;
    Class'Engine.BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), (AWinPos.Y1 + float(i)) + float(14));
    i += 14;
    textForm.Text = strAmmoSize;
    Class'Engine.BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), (AWinPos.Y1 + float(i)) + float(14));
    Class'Engine.BTCustomDrawHK'.static.DrawTextArray(C, textAmmosize, 1, 0, AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[2]), (AWinPos.Y1 + float(i)) + float(14));
    i += 14;
    textForm.Text = strSkill;
    Class'Engine.BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), (AWinPos.Y1 + float(i)) + float(14));
    Class'Engine.BTCustomDrawHK'.static.DrawTextArray(C, textSkill, 4, 2, AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[2]), (AWinPos.Y1 + float(i)) + float(14));
    Y = 5;
    i = 0;
    J0x554:

    // End:0x611 [Loop If]
    if(i < 6)
    {
        WeaponState[i].AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(Y), AWinPos.X1 + float(X[3]), (AWinPos.Y1 + float(Y)) + float(8));
        Y += 8;
        Y += 6;
        WeaponState[i].Render(C);
        i++;
        // [Loop Continue]
        goto J0x554;
    }
    return true;
    //return;    
}

defaultproperties
{
    strDamage="Power"
    strSpread="Accu."
    strViewKick="Recoil"
    strRateofFire="???????"
    strMove="Move"
    strRange="Range"
    strAmmoSize="Ammo"
    strSkill="Skill"
}