/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTROItemStateBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Properties:15
 *	Functions:12
 *
 *******************************************************************************/
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
    // End:0x47 [While If]
    if(i < 6)
    {
        WeaponState[i] = new class'BTROWeaponStatusBarHK';
        WeaponState[i].Init();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    plus_c = class'BTUIColorPoolHK'.static.ItemUIStatus_Plus();
    minus_c = class'BTUIColorPoolHK'.static.ItemUIStatus_Minus();
    textForm = class'BTCustomDrawHK'.static.MakeText(9, 0, "");
    textAmmosize.Length = 4;
    textAmmosize[0] = class'BTCustomDrawHK'.static.MakeText(9, 1, "-");
    textAmmosize[1] = class'BTCustomDrawHK'.static.MakeTextColor(8, 1, "-", plus_c, class'Canvas'.static.MakeColor(0, 0, 0, 100));
    textAmmosize[2] = class'BTCustomDrawHK'.static.MakeText(9, 1, "-");
    textAmmosize[3] = class'BTCustomDrawHK'.static.MakeTextColor(8, 1, "-", plus_c, class'Canvas'.static.MakeColor(0, 0, 0, 100));
    textSkill.Length = 2;
    textSkill[0] = class'BTCustomDrawHK'.static.MakeText(9, 1, "-");
    textSkill[1] = class'BTCustomDrawHK'.static.MakeTextColor(8, 1, "-", minus_c, class'Canvas'.static.MakeColor(0, 0, 0, 100));
    X[0] = 0;
    X[1] = 41;
    X[2] = 187;
    X[3] = 242;
}

function SetDamage(int Value, optional int Add)
{
    WeaponState[0].SetData(Value, Add);
}

function SetSpread(int Value, optional int Add)
{
    WeaponState[1].SetData(Value, Add);
}

function SetViewKick(int Value, optional int Add)
{
    WeaponState[2].SetData(Value, Add);
}

function SetRateofFire(int Value, optional int Add)
{
    WeaponState[3].SetData(Value, Add);
}

function SetMove(int Value, optional int Add)
{
    WeaponState[4].SetData(Value, Add);
}

function SetRange(int Value, optional int Add)
{
    WeaponState[5].SetData(Value, Add);
}

function SetAmmoSize(int clipsize, int MaxAmmo, optional int addopt1, optional int addopt2)
{
    // End:0x1d
    if(addopt1 == 0)
    {
        textAmmosize[1].Text = "";
    }
    // End:0x8c
    else
    {
        // End:0x5c
        if(addopt1 > 0)
        {
            textAmmosize[1].Text = "(+" $ string(addopt1) $ ")";
            textAmmosize[1].DrawColor = plus_c;
        }
        // End:0x8c
        else
        {
            textAmmosize[1].Text = "(" $ string(addopt1) $ ")";
            textAmmosize[1].DrawColor = minus_c;
        }
    }
    // End:0xaa
    if(addopt2 == 0)
    {
        textAmmosize[3].Text = "";
    }
    // End:0x11d
    else
    {
        // End:0xeb
        if(addopt2 > 0)
        {
            textAmmosize[3].Text = "(+" $ string(addopt2) $ ")";
            textAmmosize[3].DrawColor = plus_c;
        }
        // End:0x11d
        else
        {
            textAmmosize[3].Text = "(" $ string(addopt2) $ ")";
            textAmmosize[3].DrawColor = minus_c;
        }
    }
    textAmmosize[0].Text = string(clipsize + addopt1);
    textAmmosize[2].Text = "/" $ string(MaxAmmo + addopt2);
}

function SetSkill(string Skill, optional string mskill)
{
    local array<string> arrStrSrc, arrStrDest, strDelSkills;
    local int i, j, iCheck;

    Split(Skill, ", ", arrStrSrc);
    // End:0x2c
    if(mskill != "")
    {
        Split(mskill, ", ", arrStrDest);
    }
    j = 0;
    J0x33:
    // End:0xcf [While If]
    if(j < arrStrDest.Length)
    {
        // End:0x58
        if(arrStrDest[j] == "")
        {
        }
        // End:0xc5
        else
        {
            iCheck = 0;
            i = 0;
            J0x66:
            // End:0xa2 [While If]
            if(i < arrStrSrc.Length)
            {
                // End:0x98
                if(arrStrSrc[i] == arrStrDest[j])
                {
                    iCheck = 1;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x66;
            }
            // End:0xc5
            if(iCheck == 0)
            {
                strDelSkills[strDelSkills.Length] = arrStrDest[j];
            }
        }
        ++ j;
        // This is an implied JumpToken; Continue!
        goto J0x33;
    }
    // End:0x15e
    if(strDelSkills.Length > 0)
    {
        textSkill[1].Text = " (";
        i = 0;
        J0xf3:
        // End:0x13d [While If]
        if(i < strDelSkills.Length)
        {
            textSkill[1].Text = textSkill[1].Text $ "-" $ strDelSkills[i] $ " ";
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xf3;
        }
        textSkill[1].Text = textSkill[1].Text $ ")";
    }
    // End:0x16d
    else
    {
        textSkill[1].Text = "";
    }
}

function SetTextDrawType(Engine.BTCustomDrawHK.DrawType dt)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x37 [While If]
    if(i < 6)
    {
        WeaponState[i].DrawType = dt;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SetTextWidthNSpace(int width, int Space)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x51 [While If]
    if(i < 6)
    {
        WeaponState[i].AllTextWidth = width;
        WeaponState[i].BnTSpace = Space;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function bool Render(Canvas C, optional float Delta)
{
    local int i, Y, offset;

    // End:0x0e
    if(bVisible == false)
    {
        return false;
    }
    C.Style = 5;
    offset = 14;
    i = 0;
    textForm.Text = strDamage;
    class'BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i) + float(14));
    i += offset;
    textForm.Text = strSpread;
    class'BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i) + float(14));
    i += offset;
    textForm.Text = strViewKick;
    class'BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i) + float(14));
    i += offset;
    textForm.Text = strRateofFire;
    class'BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i) + float(14));
    i += offset;
    textForm.Text = strMove;
    class'BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i) + float(14));
    i += offset;
    textForm.Text = strRange;
    class'BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i) + float(14));
    i += offset;
    textForm.Text = strAmmoSize;
    class'BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i) + float(14));
    class'BTCustomDrawHK'.static.DrawTextArray(C, textAmmosize, 1, 0, AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[2]), AWinPos.Y1 + float(i) + float(14));
    i += offset;
    textForm.Text = strSkill;
    class'BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i) + float(14));
    class'BTCustomDrawHK'.static.DrawTextArray(C, textSkill, 4, 2, AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[2]), AWinPos.Y1 + float(i) + float(14));
    Y = 5;
    return true;
}

defaultproperties
{
    strDamage="Damage"
    strSpread="Precision"
    strViewKick="Stability"
    strRateofFire="F. Rate"
    strMove="Mobility"
    strRange="Range"
    strAmmoSize="Rounds"
    strSkill="Skill"
}