class ObjectiveProgressDisplay extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var HUD_Assault ASHUD;
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

simulated function ShowStatus(bool bShow)
{
    //return;    
}

simulated function UpdateSlideScale(float DeltaTime)
{
    //return;    
}

simulated function Initialize(HUD_Assault H)
{
    ASHUD = H;
    //return;    
}

simulated function PostRender(Canvas C, float DeltaTime, bool bDefender)
{
    //return;    
}

simulated function Vector DrawObjectives(Canvas C, Vector BoxPivot, bool bDefender, bool bGetBoxSize)
{
    return vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

simulated function string CheckEntry(Canvas C, string Entry)
{
    local float XL, YL;
    local string Left, Right, newentry, previousentry;

    C.TextSize(Entry, XL, YL);
    // End:0x40
    if(XL < (C.ClipX * 0.3300000))
    {
        return Entry;
    }
    J0x40:

    previousentry = newentry;
    // End:0x69
    if(!Divide(Entry, SpaceSeparator, Left, Right))
    {        
    }
    else
    {
        // End:0x91
        if(newentry != "")
        {
            newentry = (newentry $ SpaceSeparator) $ Left;            
        }
        else
        {
            newentry = newentry $ Left;
        }
        Entry = Right;
        C.TextSize(newentry $ TextCutSuffix, XL, YL);
        // End:0x40
        if(!(XL > (C.ClipX * 0.3300000)))
            goto J0x40;
    }
    return previousentry $ TextCutSuffix;
    //return;    
}

simulated function DrawBigCurrentObjective(Canvas C, bool bDefender, bool bCheckOverlap)
{
    local float XL, YL, XL2, YL2, XO, YO;

    local string CurrentObjectiveString;
    local Vector ScreenPos;
    local byte bProgressPulsing;
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
    else
    {
        CurrentObjectiveString = ASHUD.CurrentObjective.Objective_Info_Attacker;
    }
    // End:0x567
    if(CurrentObjectiveString != "")
    {
        PrimaryObjectiveCount = GetPrimaryObjectiveCount();
        // End:0xCF
        if(PrimaryObjectiveCount > 1)
        {
            CurrentObjectiveString = (CurrentObjectiveString @ ObjTimesString) $ string(PrimaryObjectiveCount);
        }
        C.StrLen(CurrentObjectiveString, XL, YL);
        // End:0x240
        if(XL > ((C.ClipX * 0.3300000) * ASHUD.HudScale))
        {
            C.Font = ASHUD.GetFontSizeIndex(C, -1);
            C.StrLen(CurrentObjectiveString, XL, YL);
            // End:0x240
            if(XL > ((C.ClipX * 0.3300000) * ASHUD.HudScale))
            {
                C.Font = ASHUD.GetFontSizeIndex(C, -2);
                C.StrLen(CurrentObjectiveString, XL, YL);
                // End:0x240
                if(XL > ((C.ClipX * 0.3300000) * ASHUD.HudScale))
                {
                    C.Font = ASHUD.GetFontSizeIndex(C, -3);
                    C.StrLen(CurrentObjectiveString, XL, YL);
                }
            }
        }
        XL2 = XL + (float(64) * ASHUD.ResScaleX);
        YL2 = YL + (float(8) * ASHUD.ResScaleY);
        XO = C.ClipX * 0.5000000;
        YO = (YL * 0.5000000) + (float(10) * ASHUD.ResScaleY);
        C.DrawColor = ASHUD.GetObjectiveColor(ASHUD.CurrentObjective);
        // End:0x35A
        if(bCheckOverlap && (XO + (XL * 0.5000000)) > BoxPivot.X)
        {
            XO -= ((XO + (XL * 0.5000000)) - BoxPivot.X);
            C.DrawColor.A = 128;
        }
        C.SetPos(XO - (XL * 0.5000000), YO - (YL * 0.5000000));
        C.DrawText(CurrentObjectiveString, false);
        // End:0x4CF
        if(ASHUD.CurrentObjective.ObjectiveTypeIcon != none)
        {
            C.DrawColor = ASHUD.GetObjectiveColor(ASHUD.CurrentObjective);
            XL2 = ((32.0000000 * ASHUD.ResScaleX) * ASHUD.HudScale) * 0.4000000;
            YL2 = ((32.0000000 * ASHUD.ResScaleY) * ASHUD.HudScale) * 0.4000000;
            C.SetPos(ScreenPos.X - XL2, ScreenPos.Y - YL2);
            C.DrawTile(ASHUD.CurrentObjective.ObjectiveTypeIcon, XL2 * float(2), YL2 * float(2), 0.0000000, 0.0000000, 64.0000000, 64.0000000);
        }
        ASHUD.DrawObjectiveStatusOverlay(C, GetGlobalObjectiveProgress(), AnyPrimaryObjectivesCritical(), ScreenPos, 1.0000000);
        ASHUD.DrawObjectiveStatusOverlay(C, GetGlobalObjectiveProgress(), AnyPrimaryObjectivesCritical(), ScreenPos, 1.1000000);
        // End:0x567
        if(AnyPrimaryObjectivesCritical())
        {
            C.DrawColor = ASHUD.WhiteColor;
            ASHUD.DrawCriticalObjectiveOverlay(C, ScreenPos, 1.0000000);
        }
    }
    //return;    
}

simulated function int GetPrimaryObjectiveCount()
{
    local int i, Count;

    i = 0;
    J0x07:

    // End:0xB0 [Loop If]
    if(i < ASHUD.obj.Length)
    {
        // End:0x9F
        if(((int(ASHUD.obj[i].ObjectivePriority) != int(ASHUD.ObjectiveProgress)) || !ASHUD.obj[i].IsActive()) || ASHUD.obj[i].bOptionalObjective)
        {
            // [Explicit Continue]
            goto J0xA6;
        }
        Count++;
        J0xA6:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return Count;
    //return;    
}

simulated function float GetGlobalObjectiveProgress()
{
    local int i, Count;
    local float GlobalProgress;

    i = 0;
    J0x07:

    // End:0xB0 [Loop If]
    if(i < ASHUD.obj.Length)
    {
        // End:0x7A
        if((int(ASHUD.obj[i].ObjectivePriority) != int(ASHUD.ObjectiveProgress)) || ASHUD.obj[i].bOptionalObjective)
        {
            // [Explicit Continue]
            goto J0xA6;
        }
        GlobalProgress += ASHUD.obj[i].GetObjectiveProgress();
        Count++;
        J0xA6:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return GlobalProgress / float(Count);
    //return;    
}

simulated function bool AnyPrimaryObjectivesCritical()
{
    local int i;

    // End:0x1D
    if(ASHUD.CurrentObjective.IsCritical())
    {
        return true;
    }
    i = 0;
    J0x24:

    // End:0xC4 [Loop If]
    if(i < ASHUD.obj.Length)
    {
        // End:0x97
        if((int(ASHUD.obj[i].ObjectivePriority) != int(ASHUD.ObjectiveProgress)) || ASHUD.obj[i].bOptionalObjective)
        {
            // [Explicit Continue]
            goto J0xBA;
        }
        // End:0xBA
        if(ASHUD.obj[i].IsCritical())
        {
            return true;
        }
        J0xBA:

        i++;
        // [Loop Continue]
        goto J0x24;
    }
    return false;
    //return;    
}

simulated function bool AnyOptionalObjectiveCritical()
{
    local int i;

    i = 0;
    J0x07:

    // End:0xA9 [Loop If]
    if(i < ASHUD.obj.Length)
    {
        // End:0x7C
        if((int(ASHUD.obj[i].ObjectivePriority) != int(ASHUD.ObjectiveProgress)) || !ASHUD.obj[i].bOptionalObjective)
        {
            // [Explicit Continue]
            goto J0x9F;
        }
        // End:0x9F
        if(ASHUD.obj[i].IsCritical())
        {
            return true;
        }
        J0x9F:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

simulated function SetObjectiveColor(Canvas C, GameObjective Go)
{
    local Color ObjColor;

    // End:0x3E
    if(Go == ASHUD.CurrentObjective)
    {
        ObjColor = C.MakeColor(byte(255), byte(255), 127, byte(255));        
    }
    else
    {
        // End:0x72
        if(Go.bDisabled)
        {
            ObjColor = C.MakeColor(127, 127, 127, byte(255));            
        }
        else
        {
            // End:0xA4
            if(Go.bOptionalObjective)
            {
                ObjColor = C.MakeColor(192, 192, 192, 192);                
            }
            else
            {
                ObjColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
            }
        }
    }
    // End:0x12B
    if(Go.IsCritical())
    {
        ObjColor = (ObjColor * (float(1) - ASHUD.fPulse)) + (C.MakeColor(byte(255), 127, 64, byte(255)) * ASHUD.fPulse);
    }
    C.DrawColor = ObjColor;
    //return;    
}

simulated function string GetObjectiveDescription(GameObjective Go, bool bDefender)
{
    // End:0x18
    if(bDefender)
    {
        return Go.Objective_Info_Defender;
    }
    return Go.Objective_Info_Attacker;
    //return;    
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
        //return;        
    }

    simulated function PostRender(Canvas C, float DeltaTime, bool bDefender)
    {
        DrawBigCurrentObjective(C, bDefender, false);
        //return;        
    }
    stop;    
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
        //return;        
    }
    stop;    
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
        //return;        
    }

    simulated function UpdateSlideScale(float DeltaTime)
    {
        SlideScale += (DeltaTime * SlideSpeed);
        // End:0x34
        if(SlideScale > 1.0000000)
        {
            SlideScale = 1.0000000;
            GotoState('Visible');
        }
        //return;        
    }

    simulated function Vector DrawObjectives(Canvas C, Vector BoxPivot, bool bDefender, bool bGetBoxSize)
    {
        // End:0x26
        if(bGetBoxSize)
        {
            return global.DrawObjectives(C, BoxPivot, bDefender, bGetBoxSize);
        }
        return vect(0.0000000, 0.0000000, 0.0000000);
        //return;        
    }
    stop;    
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
        //return;        
    }

    simulated function UpdateSlideScale(float DeltaTime)
    {
        SlideScale -= (DeltaTime * SlideSpeed);
        // End:0x34
        if(SlideScale < 0.0000000)
        {
            SlideScale = 0.0000000;
            GotoState('Hidden');
        }
        //return;        
    }

    simulated function Vector DrawObjectives(Canvas C, Vector BoxPivot, bool bDefender, bool bGetBoxSize)
    {
        // End:0x26
        if(bGetBoxSize)
        {
            return global.DrawObjectives(C, BoxPivot, bDefender, bGetBoxSize);
        }
        return vect(0.0000000, 0.0000000, 0.0000000);
        //return;        
    }
    stop;    
}

defaultproperties
{
    HeaderText="??"
    OptionalObjectivePrefix="*"
    ObjTimesString="x"
    TextCutSuffix="..."
    SpaceSeparator=" "
    PrimaryObjectivePrefix="-"
    SlideSpeed=4.0000000
}