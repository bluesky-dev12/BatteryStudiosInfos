/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wObjectiveProgressDisplay.uc
 * Package Imports:
 *	WMission
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:13
 *	States:4
 *
 *******************************************************************************/
class wObjectiveProgressDisplay extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var wHUD_Mission ASHUD;
var localized string HeaderText;
var localized string OptionalObjectivePrefix;
var localized string ObjTimesString;
var localized string TextCutSuffix;
var localized string SpaceSeparator;
var localized string PrimaryObjectivePrefix;
var float SlideScale;
var Vector BoxSize;
var Vector BoxPivot;
var() float SlideSpeed;

simulated function ShowStatus(bool bShow);
simulated function UpdateSlideScale(float DeltaTime);
simulated function Initialize(wHUD_Mission H)
{
    ASHUD = H;
}

simulated function PostRender(Canvas C, float DeltaTime, bool bDefender)
{
    local float HeaderHeight, XL, YL;

    C.Style = 5;
    C.Font = class'UT2MidGameFont'.static.GetMidGameFont(int(C.ClipX * 0.750 * ASHUD.HudScale));
    C.StrLen(HeaderText, XL, YL);
    HeaderHeight = YL * float(2);
    UpdateSlideScale(DeltaTime);
    BoxSize = DrawObjectives(C, vect(0.0, 0.0, 0.0), bDefender, true);
    BoxPivot.X = C.ClipX - BoxSize.X;
    BoxPivot.Y = BoxSize.Y + HeaderHeight * SlideScale - BoxSize.Y;
    DrawBigCurrentObjective(C, bDefender, true);
    // End:0x218
    if(SlideScale == 1.0)
    {
        C.Font = class'UT2MidGameFont'.static.GetMidGameFont(int(C.ClipX * 0.750 * ASHUD.HudScale));
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        C.StrLen(HeaderText, XL, YL);
        C.SetPos(BoxPivot.X + BoxSize.X - XL * 0.50, BoxPivot.Y - HeaderHeight + YL * 0.50);
        C.DrawText(HeaderText);
    }
    DrawObjectives(C, BoxPivot, bDefender, false);
}

simulated function Vector DrawObjectives(Canvas C, Vector BoxPivot, bool bDefender, bool bGetBoxSize)
{
    local int i, Priority, startpriority, endpriority;
    local bool bDrawObjectiveNumber;
    local float XL, YL, XUnit, YOffset;
    local Vector ScreenPos, newBoxSize;
    local string Entry;

    startpriority = 0;
    endpriority = ASHUD.MSGRI.MaxObjectivePriority;
    // End:0xb8
    if(!bGetBoxSize)
    {
        C.Font = class'UT2MidGameFont'.static.GetMidGameFont(int(C.ClipX * 0.750 * ASHUD.HudScale));
        C.StrLen("0", XL, YL);
        XUnit = XL;
        YOffset = BoxPivot.Y + YL * 0.50;
    }
    Priority = startpriority;
    J0xc3:
    // End:0x78a [While If]
    if(Priority <= endpriority)
    {
        bDrawObjectiveNumber = true;
        i = 0;
        J0xe1:
        // End:0x467 [While If]
        if(i < ASHUD.obj.Length)
        {
            // End:0x149
            if(ASHUD.obj[i].ObjectivePriority != Priority || ASHUD.obj[i].bOptionalObjective)
            {
            }
            // End:0x45d
            else
            {
                // End:0x1ab
                if(ASHUD.ObjectiveProgress == Priority)
                {
                    C.Font = class'UT2MidGameFont'.static.GetMidGameFont(int(C.ClipX * 0.750 * ASHUD.HudScale));
                }
                // End:0x1f0
                else
                {
                    C.Font = class'UT2MidGameFont'.static.GetMidGameFont(int(C.ClipX * 0.670 * ASHUD.HudScale));
                }
                Entry = CheckEntry(C, GetObjectiveDescription(ASHUD.obj[i], bDefender));
                // End:0x275
                if(bGetBoxSize)
                {
                    C.StrLen(Entry, XL, YL);
                    newBoxSize.X = FMax(newBoxSize.X, XL);
                    newBoxSize.Y += YL;
                }
                // End:0x440
                else
                {
                    C.StrLen("0", XL, YL);
                    SetObjectiveColor(C, ASHUD.obj[i]);
                    C.SetPos(BoxPivot.X + XUnit * float(4), YOffset);
                    C.DrawText(Entry);
                    // End:0x3ac
                    if(ASHUD.obj[i].IsCritical() && ASHUD.ObjectiveProgress == Priority)
                    {
                        C.DrawColor = ASHUD.WhiteColor;
                        ScreenPos.X = BoxPivot.X + XUnit + XL * 0.50;
                        ScreenPos.Y = YOffset + YL * 0.330;
                        ASHUD.DrawCriticalObjectiveOverlay(C, ScreenPos, 0.450);
                    }
                    // End:0x42c
                    else
                    {
                        // End:0x42c
                        if(bDrawObjectiveNumber)
                        {
                            C.SetPos(BoxPivot.X + XUnit, YOffset);
                            C.DrawText(string(Priority + 1));
                            C.SetPos(BoxPivot.X + XUnit * float(3), YOffset);
                            C.DrawText(PrimaryObjectivePrefix);
                        }
                    }
                    YOffset += YL;
                    bDrawObjectiveNumber = false;
                }
                // End:0x45d
                if(ASHUD.ObjectiveProgress != Priority)
                {
                }
                // End:0x467
                else
                {
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xe1;
            }
        }
        // End:0x780
        if(ASHUD.ObjectiveProgress == Priority)
        {
            C.Font = class'UT2MidGameFont'.static.GetMidGameFont(int(C.ClipX * 0.670 * ASHUD.HudScale));
            i = 0;
            J0x4cd:
            // End:0x780 [While If]
            if(i < ASHUD.obj.Length)
            {
                // End:0x537
                if(ASHUD.obj[i].ObjectivePriority > Priority || !ASHUD.obj[i].bOptionalObjective)
                {
                }
                // End:0x776
                else
                {
                    // End:0x588
                    if(!ASHUD.obj[i].IsActive() && ASHUD.obj[i].ObjectivePriority != Priority)
                    {
                    }
                    // End:0x776
                    else
                    {
                        Entry = CheckEntry(C, GetObjectiveDescription(ASHUD.obj[i], bDefender));
                        // End:0x60d
                        if(bGetBoxSize)
                        {
                            C.StrLen(Entry, XL, YL);
                            newBoxSize.X = FMax(newBoxSize.X, XL);
                            newBoxSize.Y += YL;
                        }
                        // End:0x776
                        else
                        {
                            SetObjectiveColor(C, ASHUD.obj[i]);
                            C.StrLen("0", XL, YL);
                            C.SetPos(BoxPivot.X + XUnit * float(5), YOffset);
                            C.DrawText(Entry);
                            // End:0x72e
                            if(ASHUD.obj[i].IsCritical())
                            {
                                C.DrawColor = ASHUD.WhiteColor;
                                ScreenPos.X = BoxPivot.X + XUnit * float(3) + XL * 0.50;
                                ScreenPos.Y = YOffset + YL * 0.330;
                                ASHUD.DrawCriticalObjectiveOverlay(C, ScreenPos, 0.30);
                            }
                            // End:0x76a
                            else
                            {
                                C.SetPos(BoxPivot.X + XUnit * float(4), YOffset);
                                C.DrawText(OptionalObjectivePrefix);
                            }
                            YOffset += YL;
                        }
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x4cd;
            }
        }
        ++ Priority;
        // This is an implied JumpToken; Continue!
        goto J0xc3;
    }
    // End:0x861
    if(bGetBoxSize)
    {
        C.Font = class'UT2MidGameFont'.static.GetMidGameFont(int(C.ClipX * 0.750 * ASHUD.HudScale));
        C.StrLen(HeaderText, XL, YL);
        newBoxSize.X = FMax(newBoxSize.X, XL);
        C.StrLen("0", XL, YL);
        XUnit = XL;
        newBoxSize.X += XUnit * float(5);
        newBoxSize.Y += YL;
        return newBoxSize;
    }
    return vect(0.0, 0.0, 0.0);
}

simulated function string CheckEntry(Canvas C, string Entry)
{
    local float XL, YL;
    local string Left, Right, newentry, previousentry;

    C.TextSize(Entry, XL, YL);
    // End:0x40
    if(XL < C.ClipX * 0.330)
    {
        return Entry;
    }
    previousentry = newentry;
    // End:0x69
    if(!Divide(Entry, SpaceSeparator, Left, Right))
    {
    }
    // End:0xef
    else
    {
        // End:0x91
        if(newentry != "")
        {
            newentry = newentry $ SpaceSeparator $ Left;
        }
        // End:0xa3
        else
        {
            newentry = newentry $ Left;
        }
        Entry = Right;
        C.TextSize(newentry $ TextCutSuffix, XL, YL);
        // End:0x40
        if(XL > C.ClipX * 0.330)
        	goto J0x40;
    }
    return previousentry $ TextCutSuffix;
}

simulated function DrawBigCurrentObjective(Canvas C, bool bDefender, bool bCheckOverlap)
{
    local float XL, YL, XL2, YL2, XO, YO;

    local string CurrentObjectiveString;
    local Vector ScreenPos;
    local int PrimaryObjectiveCount;

    // End:0x16
    if(ASHUD.CurrentObjective == none)
    {
        return;
    }
    C.Font = ASHUD.GetFontSizeIndex(C, 0);
    C.Style = 5;
    // End:0x74
    if(bDefender)
    {
        CurrentObjectiveString = ASHUD.CurrentObjective.Objective_Info_Defender;
    }
    // End:0x91
    else
    {
        CurrentObjectiveString = ASHUD.CurrentObjective.Objective_Info_Attacker;
    }
    // End:0x437
    if(CurrentObjectiveString != "")
    {
        PrimaryObjectiveCount = GetPrimaryObjectiveCount();
        // End:0xcf
        if(PrimaryObjectiveCount > 1)
        {
            CurrentObjectiveString = CurrentObjectiveString @ ObjTimesString $ string(PrimaryObjectiveCount);
        }
        C.StrLen(CurrentObjectiveString, XL, YL);
        // End:0x240
        if(XL > C.ClipX * 0.330 * ASHUD.HudScale)
        {
            C.Font = ASHUD.GetFontSizeIndex(C, -1);
            C.StrLen(CurrentObjectiveString, XL, YL);
            // End:0x240
            if(XL > C.ClipX * 0.330 * ASHUD.HudScale)
            {
                C.Font = ASHUD.GetFontSizeIndex(C, -2);
                C.StrLen(CurrentObjectiveString, XL, YL);
                // End:0x240
                if(XL > C.ClipX * 0.330 * ASHUD.HudScale)
                {
                    C.Font = ASHUD.GetFontSizeIndex(C, -3);
                    C.StrLen(CurrentObjectiveString, XL, YL);
                }
            }
        }
        XL2 = XL + float(64) * ASHUD.ResScaleX;
        YL2 = YL + float(8) * ASHUD.ResScaleY;
        XO = C.ClipX * 0.50;
        YO = YL * 0.50 + float(10) * ASHUD.ResScaleY;
        // End:0x3f3
        if(ASHUD.CurrentObjective.ObjectiveTypeIcon != none)
        {
            C.DrawColor = ASHUD.GetObjectiveColor(ASHUD.CurrentObjective);
            XL2 = 32.0 * ASHUD.ResScaleX * ASHUD.HudScale * 0.40;
            YL2 = 32.0 * ASHUD.ResScaleY * ASHUD.HudScale * 0.40;
            C.SetPos(ScreenPos.X - XL2, ScreenPos.Y - YL2);
            C.DrawTile(ASHUD.CurrentObjective.ObjectiveTypeIcon, XL2 * float(2), YL2 * float(2), 0.0, 0.0, 64.0, 64.0);
        }
        // End:0x437
        if(AnyPrimaryObjectivesCritical())
        {
            C.DrawColor = ASHUD.WhiteColor;
            ASHUD.DrawCriticalObjectiveOverlay(C, ScreenPos, 1.0);
        }
    }
}

simulated function int GetPrimaryObjectiveCount()
{
    local int i, Count;

    i = 0;
    J0x07:
    // End:0xb0 [While If]
    if(i < ASHUD.obj.Length)
    {
        // End:0x9f
        if(ASHUD.obj[i].ObjectivePriority != ASHUD.ObjectiveProgress || !ASHUD.obj[i].IsActive() || ASHUD.obj[i].bOptionalObjective)
        {
        }
        // End:0xa6
        else
        {
            ++ Count;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return Count;
}

simulated function float GetGlobalObjectiveProgress()
{
    local int i, Count;
    local float GlobalProgress;

    i = 0;
    J0x07:
    // End:0xb0 [While If]
    if(i < ASHUD.obj.Length)
    {
        // End:0x7a
        if(ASHUD.obj[i].ObjectivePriority != ASHUD.ObjectiveProgress || ASHUD.obj[i].bOptionalObjective)
        {
        }
        // End:0xa6
        else
        {
            GlobalProgress += ASHUD.obj[i].GetObjectiveProgress();
            ++ Count;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return GlobalProgress / float(Count);
}

simulated function bool AnyPrimaryObjectivesCritical()
{
    local int i;

    // End:0x1d
    if(ASHUD.CurrentObjective.IsCritical())
    {
        return true;
    }
    i = 0;
    J0x24:
    // End:0xc4 [While If]
    if(i < ASHUD.obj.Length)
    {
        // End:0x97
        if(ASHUD.obj[i].ObjectivePriority != ASHUD.ObjectiveProgress || ASHUD.obj[i].bOptionalObjective)
        {
        }
        // End:0xba
        else
        {
            // End:0xba
            if(ASHUD.obj[i].IsCritical())
            {
                return true;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x24;
    }
    return false;
}

simulated function bool AnyOptionalObjectiveCritical()
{
    local int i;

    i = 0;
    J0x07:
    // End:0xa9 [While If]
    if(i < ASHUD.obj.Length)
    {
        // End:0x7c
        if(ASHUD.obj[i].ObjectivePriority != ASHUD.ObjectiveProgress || !ASHUD.obj[i].bOptionalObjective)
        {
        }
        // End:0x9f
        else
        {
            // End:0x9f
            if(ASHUD.obj[i].IsCritical())
            {
                return true;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

simulated function SetObjectiveColor(Canvas C, GameObjective Go)
{
    local Color ObjColor;

    // End:0x3e
    if(Go == ASHUD.CurrentObjective)
    {
        ObjColor = C.MakeColor(byte(255), byte(255), 127, byte(255));
    }
    // End:0xc9
    else
    {
        // End:0x72
        if(Go.bDisabled)
        {
            ObjColor = C.MakeColor(127, 127, 127, byte(255));
        }
        // End:0xc9
        else
        {
            // End:0xa4
            if(Go.bOptionalObjective)
            {
                ObjColor = C.MakeColor(192, 192, 192, 192);
            }
            // End:0xc9
            else
            {
                ObjColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
            }
        }
    }
    // End:0x12b
    if(Go.IsCritical())
    {
        ObjColor = ObjColor * float(1) - ASHUD.fPulse + C.MakeColor(byte(255), 127, 64, byte(255)) * ASHUD.fPulse;
    }
    C.DrawColor = ObjColor;
}

simulated function string GetObjectiveDescription(GameObjective Go, bool bDefender)
{
    // End:0x18
    if(bDefender)
    {
        return Go.Objective_Info_Defender;
    }
    return Go.Objective_Info_Attacker;
}

auto state Hidden
{
    simulated function ShowStatus(bool bShow)
    {
        // End:0x10
        if(bShow)
        {
            GotoState('SlideIn');
        }
    }

    simulated function PostRender(Canvas C, float DeltaTime, bool bDefender)
    {
        DrawBigCurrentObjective(C, bDefender, false);
    }

}

state Visible
{
    simulated function ShowStatus(bool bShow)
    {
        // End:0x12
        if(!bShow)
        {
            GotoState('SlideOut');
        }
    }

}

state SlideIn
{
    simulated function ShowStatus(bool bShow)
    {
        // End:0x12
        if(!bShow)
        {
            GotoState('SlideOut');
        }
    }

    simulated function UpdateSlideScale(float DeltaTime)
    {
        SlideScale += DeltaTime * SlideSpeed;
        // End:0x34
        if(SlideScale > 1.0)
        {
            SlideScale = 1.0;
            GotoState('Visible');
        }
    }

    simulated function Vector DrawObjectives(Canvas C, Vector BoxPivot, bool bDefender, bool bGetBoxSize)
    {
        // End:0x26
        if(bGetBoxSize)
        {
            return global.DrawObjectives(C, BoxPivot, bDefender, bGetBoxSize);
        }
        return vect(0.0, 0.0, 0.0);
    }

}

state SlideOut
{
    simulated function ShowStatus(bool bShow)
    {
        // End:0x10
        if(bShow)
        {
            GotoState('SlideIn');
        }
    }

    simulated function UpdateSlideScale(float DeltaTime)
    {
        SlideScale -= DeltaTime * SlideSpeed;
        // End:0x34
        if(SlideScale < 0.0)
        {
            SlideScale = 0.0;
            GotoState('Hidden');
        }
    }

    simulated function Vector DrawObjectives(Canvas C, Vector BoxPivot, bool bDefender, bool bGetBoxSize)
    {
        // End:0x26
        if(bGetBoxSize)
        {
            return global.DrawObjectives(C, BoxPivot, bDefender, bGetBoxSize);
        }
        return vect(0.0, 0.0, 0.0);
    }

}

defaultproperties
{
    HeaderText="Objectives"
    OptionalObjectivePrefix="*"
    ObjTimesString="x"
    TextCutSuffix="..."
    SpaceSeparator=" "
    PrimaryObjectivePrefix="-"
    SlideSpeed=4.0
}