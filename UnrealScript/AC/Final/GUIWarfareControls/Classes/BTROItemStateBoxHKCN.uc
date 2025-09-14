class BTROItemStateBoxHKCN extends BTROItemStateBoxHK;

var float locYOffset;
var int gaugeStartYOffset;
var int gaugeYSize;

function Init()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x47 [Loop If]
    if(i < 6)
    {
        WeaponState[i] = new Class'GUIWarfareControls_Decompressed.BTROWeaponStatusBarHKCN';
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
    X[0] = -63;
    X[2] = 203;
    X[1] = 18;
    X[3] = 140;
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
    WeaponState[3].SetData(Value, Add);
    //return;    
}

function SetRateofFire(int Value, optional int Add)
{
    WeaponState[2].SetData(Value, Add);
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
    local array<string> arrStrSrc, arrStrDest, strSkills, strDelSkills;
    local int i, j, iCheck;

    Split(Skill, ", ", arrStrSrc);
    // End:0x2C
    if(mskill != "")
    {
        Split(mskill, ", ", arrStrDest);
    }
    j = 0;
    J0x33:

    // End:0xCF [Loop If]
    if(j < arrStrDest.Length)
    {
        // End:0x58
        if(arrStrDest[j] == "")
        {
            // [Explicit Continue]
            goto J0xC5;
        }
        iCheck = 0;
        i = 0;
        J0x66:

        // End:0xA2 [Loop If]
        if(i < arrStrSrc.Length)
        {
            // End:0x98
            if(arrStrSrc[i] == arrStrDest[j])
            {
                iCheck = 1;
            }
            i++;
            // [Loop Continue]
            goto J0x66;
        }
        // End:0xC5
        if(iCheck == 0)
        {
            strDelSkills[strDelSkills.Length] = arrStrDest[j];
        }
        J0xC5:

        j++;
        // [Loop Continue]
        goto J0x33;
    }
    textSkill[0].Text = "";
    i = 0;
    J0xE5:

    // End:0x19B [Loop If]
    if(i < arrStrSrc.Length)
    {
        iCheck = 0;
        j = 0;
        J0x103:

        // End:0x13F [Loop If]
        if(j < strSkills.Length)
        {
            // End:0x135
            if(strSkills[j] == arrStrSrc[i])
            {
                iCheck = 1;
            }
            j++;
            // [Loop Continue]
            goto J0x103;
        }
        // End:0x191
        if(iCheck == 0)
        {
            strSkills[strSkills.Length] = arrStrSrc[i];
            textSkill[0].Text = ((textSkill[0].Text $ "") $ arrStrSrc[i]) $ " ";
        }
        i++;
        // [Loop Continue]
        goto J0xE5;
    }
    // End:0x229
    if(strDelSkills.Length > 0)
    {
        textSkill[1].Text = "(";
        i = 0;
        J0x1BE:

        // End:0x208 [Loop If]
        if(i < strDelSkills.Length)
        {
            textSkill[1].Text = ((textSkill[1].Text $ "-") $ strDelSkills[i]) $ " ";
            i++;
            // [Loop Continue]
            goto J0x1BE;
        }
        textSkill[1].Text = textSkill[1].Text $ ")";        
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

function SetTextWidthNSpace(int width, int Space)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x51 [Loop If]
    if(i < 6)
    {
        WeaponState[i].AllTextWidth = width;
        WeaponState[i].BnTSpace = Space;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    local int i, j;

    // End:0x0E
    if(bVisible == false)
    {
        return false;
    }
    C.Style = 5;
    C.DrawColor = Class'Engine.Canvas'.static.MakeColor(204, 204, 204, byte(255));
    i = 0;
    textForm.Text = strDamage;
    Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), (AWinPos.Y1 + float(i)) + float(14));
    i += int(locYOffset);
    textForm.Text = strSpread;
    Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), (AWinPos.Y1 + float(i)) + float(14));
    i += int(locYOffset);
    textForm.Text = strRateofFire;
    Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), (AWinPos.Y1 + float(i)) + float(14));
    i += int(locYOffset);
    textForm.Text = strViewKick;
    Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), (AWinPos.Y1 + float(i)) + float(14));
    i += int(locYOffset);
    textForm.Text = strMove;
    Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), (AWinPos.Y1 + float(i)) + float(14));
    i += int(locYOffset);
    textForm.Text = strAmmoSize;
    Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, textForm, AWinPos.X1 + float(X[0]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[1]), (AWinPos.Y1 + float(i)) + float(14));
    Class'Engine.BTCustomDrawHK'.static.DrawTextArrayRatio(C, textAmmosize, 3, 0, AWinPos.X1 + float(X[1]), AWinPos.Y1 + float(i), AWinPos.X1 + float(X[2]), (AWinPos.Y1 + float(i)) + float(14));
    i = 0;
    J0x409:

    // End:0x4D3 [Loop If]
    if(i < 5)
    {
        j = int(float(i) * locYOffset);
        WeaponState[i].AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(X[1]), (AWinPos.Y1 + float(gaugeStartYOffset)) + float(j), AWinPos.X2, ((AWinPos.Y1 + float(gaugeStartYOffset)) + float(gaugeYSize)) + float(j));
        WeaponState[i].Render(C);
        i++;
        // [Loop Continue]
        goto J0x409;
    }
    return true;
    //return;    
}

defaultproperties
{
    locYOffset=20.0000000
    gaugeStartYOffset=3
    gaugeYSize=7
}