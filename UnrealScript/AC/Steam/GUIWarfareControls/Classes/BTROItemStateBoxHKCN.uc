/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTROItemStateBoxHKCN.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:12
 *
 *******************************************************************************/
class BTROItemStateBoxHKCN extends BTROItemStateBoxHK
    dependson(BTROItemStateBoxHK)
    dependson(BTROWeaponStatusBarHK);

var float locYOffset;

function Init()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x47 [While If]
    if(i < 6)
    {
        WeaponState[i] = new class'BTROWeaponStatusBarHKCN';
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
    X[0] = -63;
    X[2] = 203;
    X[1] = 18;
    X[3] = 140;
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
    WeaponState[3].SetData(Value, Add);
}

function SetRateofFire(int Value, optional int Add)
{
    WeaponState[2].SetData(Value, Add);
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
    local array<string> arrStrSrc, arrStrDest, strSkills, strDelSkills;
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
    textSkill[0].Text = "";
    i = 0;
    J0xe5:
    // End:0x19b [While If]
    if(i < arrStrSrc.Length)
    {
        iCheck = 0;
        j = 0;
        J0x103:
        // End:0x13f [While If]
        if(j < strSkills.Length)
        {
            // End:0x135
            if(strSkills[j] == arrStrSrc[i])
            {
                iCheck = 1;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x103;
        }
        // End:0x191
        if(iCheck == 0)
        {
            strSkills[strSkills.Length] = arrStrSrc[i];
            textSkill[0].Text = textSkill[0].Text $ "" $ arrStrSrc[i] $ " ";
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xe5;
    }
    // End:0x229
    if(strDelSkills.Length > 0)
    {
        textSkill[1].Text = "(";
        i = 0;
        J0x1be:
        // End:0x208 [While If]
        if(i < strDelSkills.Length)
        {
            textSkill[1].Text = textSkill[1].Text $ "-" $ strDelSkills[i] $ " ";
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1be;
        }
        textSkill[1].Text = textSkill[1].Text $ ")";
    }
    // End:0x238
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
    local int i, Y, j;

    // End:0x0e
    if(bVisible == false)
    {
        return false;
    }
    C.Style = 5;
    C.DrawColor = class'Canvas'.static.MakeColor(204, 204, 204, byte(255));
    i = 0;
    textForm.Text = strDamage;
    class'BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i) + float(14));
    i += int(locYOffset);
    textForm.Text = strSpread;
    class'BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i) + float(14));
    i += int(locYOffset);
    textForm.Text = strRateofFire;
    class'BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i) + float(14));
    i += int(locYOffset);
    textForm.Text = strViewKick;
    class'BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i) + float(14));
    i += int(locYOffset);
    textForm.Text = strMove;
    class'BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i) + float(14));
    i += int(locYOffset);
    textForm.Text = strAmmoSize;
    class'BTCustomDrawHK'.static.DrawText(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i) + float(14));
    class'BTCustomDrawHK'.static.DrawTextArray(C, textAmmosize, 3, 0, AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[2]), AWinPos.Y1 + float(i) + float(14));
    Y = 3;
    i = 0;
    J0x411:
    // End:0x4d8 [While If]
    if(i < 5)
    {
        j = int(float(i) * locYOffset);
        WeaponState[i].AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(Y) + float(j), AWinPos.X2, AWinPos.Y1 + float(Y) + float(7) + float(j));
        WeaponState[i].Render(C);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x411;
    }
    return true;
}

defaultproperties
{
    locYOffset=20.0
}