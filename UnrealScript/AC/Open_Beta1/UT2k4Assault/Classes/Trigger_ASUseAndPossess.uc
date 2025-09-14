class Trigger_ASUseAndPossess extends SVehicleTrigger;

enum AT_AssaultTeam
{
    AT_All,                         // 0
    AT_Attackers,                   // 1
    AT_Defenders                    // 2
};

var() Trigger_ASUseAndPossess.AT_AssaultTeam AssaultTeam;
var() name PawnTag;
var() name EventFull;
var() name EventNonFull;
var bool bFullCapacity;
var array<ASVehicleFactory> FactoryList;

event PostBeginPlay()
{
    local ASVehicleFactory ASVF;

    // End:0x3B
    foreach DynamicActors(Class'UT2k4Assault_Decompressed.ASVehicleFactory', ASVF)
    {
        // End:0x3A
        if(ASVF.VehicleTag == PawnTag)
        {
            FactoryList[FactoryList.Length] = ASVF;
        }        
    }    
    super.PostBeginPlay();
    // End:0x54
    if(!bEnabled)
    {
        NotifyAvailability(false);
    }
    //return;    
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    bEnabled = !bEnabled;
    // End:0x33
    if(bEnabled)
    {
        UpdateCapacity();
        // End:0x30
        if(!bFullCapacity)
        {
            NotifyAvailability(true);
        }        
    }
    else
    {
        SetCollision(false);
        // End:0x49
        if(!bFullCapacity)
        {
            NotifyAvailability(false);
        }
    }
    //return;    
}

event VehicleSpawned()
{
    // End:0x1A
    if(bEnabled && bFullCapacity)
    {
        UpdateCapacity();
    }
    //return;    
}

event VehicleDestroyed()
{
    // End:0x1C
    if(bEnabled && !bFullCapacity)
    {
        UpdateCapacity();
    }
    //return;    
}

event VehicleUnPossessed()
{
    // End:0x1A
    if(bEnabled && bFullCapacity)
    {
        UpdateCapacity();
    }
    //return;    
}

event VehiclePossessed()
{
    // End:0x1C
    if(bEnabled && !bFullCapacity)
    {
        UpdateCapacity();
    }
    //return;    
}

function bool ApprovePlayerTeam(byte Team)
{
    // End:0x12
    if(int(AssaultTeam) == int(0))
    {
        return true;
    }
    // End:0x96
    if(Level.Game.IsA('ASGameInfo'))
    {
        // End:0x6B
        if(int(AssaultTeam) == int(1))
        {
            // End:0x68
            if(ASGameInfo(Level.Game).IsAttackingTeam(int(Team)))
            {
                return true;
            }            
        }
        else
        {
            // End:0x96
            if(!ASGameInfo(Level.Game).IsAttackingTeam(int(Team)))
            {
                return true;
            }
        }
    }
    return false;
    //return;    
}

function Touch(Actor Other)
{
    local wPawn User;
    local Controller C;

    User = wPawn(Other);
    // End:0x4B
    if(((!bEnabled || bFullCapacity) || User == none) || User.Controller == none)
    {
        return;
    }
    C = User.Controller;
    // End:0x13C
    if((AIController(C) != none) && (((C.RouteGoal == self) || C.MoveTarget == self) || C.RouteGoal == myMarker) || C.MoveTarget == myMarker)
    {
        // End:0x13A
        if(((C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator) && ApprovePlayerTeam(byte(C.PlayerReplicationInfo.Team.TeamIndex)))
        {
            UsedBy(User);
        }
        return;
    }
    User.ReceiveLocalizedMessage(Class'Vehicles.BulldogMessage', 0);
    //return;    
}

function UsedBy(Pawn User)
{
    local Vehicle V;
    local int i;

    // End:0x59
    if((((!bEnabled || bFullCapacity) || User == none) || User.Controller == none) || !ApprovePlayerTeam(byte(User.GetTeamNum())))
    {
        return;
    }
    i = 0;
    J0x60:

    // End:0x117 [Loop If]
    if(i < FactoryList.Length)
    {
        V = FactoryList[i].Child;
        // End:0x10D
        if(((V != none) && V.Health > 0) && !V.bDeleteMe)
        {
            // End:0x10D
            if((V.Controller == none) || !V.Controller.IsA('PlayerController'))
            {
                V.TryToDrive(User);
                // [Explicit Break]
                goto J0x117;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x60;
    }
    J0x117:

    UpdateCapacity();
    //return;    
}

function UpdateCapacity()
{
    local Vehicle V;
    local bool bOldCapacity;
    local int i;

    bOldCapacity = bFullCapacity;
    bFullCapacity = true;
    i = 0;
    J0x1C:

    // End:0xC4 [Loop If]
    if(i < FactoryList.Length)
    {
        V = FactoryList[i].Child;
        // End:0xBA
        if(((V != none) && V.Health > 0) && !V.bDeleteMe)
        {
            // End:0xBA
            if((V.Controller == none) || !V.Controller.IsA('PlayerController'))
            {
                bFullCapacity = false;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x1C;
    }
    // End:0xEC
    if((bEnabled && bOldCapacity) && !bFullCapacity)
    {
        NotifyAvailability(true);
    }
    // End:0x114
    if((bEnabled && !bOldCapacity) && bFullCapacity)
    {
        NotifyAvailability(false);
    }
    //return;    
}

function Reset()
{
    local bool bOldEnabled;

    bOldEnabled = bEnabled;
    super.Reset();
    // End:0x46
    if((bOldEnabled != bEnabled) || bEnabled && bFullCapacity)
    {
        NotifyAvailability(bEnabled);
    }
    bFullCapacity = false;
    //return;    
}

event NotifyAvailability(bool bAvailableSpace)
{
    SetCollision(bAvailableSpace);
    // End:0x22
    if(bAvailableSpace)
    {
        TriggerEvent(EventNonFull, self, none);        
    }
    else
    {
        TriggerEvent(EventFull, self, none);
    }
    //return;    
}

event PrevVehicle(ASVehicleFactory ASVF, Vehicle V)
{
    local int i, CurrentIndex;
    local ASVehicleFactory newASVF;
    local PlayerController PC;
    local Vector ExitPos;

    PC = PlayerController(V.Controller);
    // End:0x4B
    if(((!bEnabled || bFullCapacity) || V == none) || PC == none)
    {
        return;
    }
    i = 0;
    J0x52:

    // End:0x8F [Loop If]
    if(i < FactoryList.Length)
    {
        // End:0x85
        if(FactoryList[i] == ASVF)
        {
            CurrentIndex = i;
            // [Explicit Break]
            goto J0x8F;
        }
        i++;
        // [Loop Continue]
        goto J0x52;
    }
    J0x8F:

    i = CurrentIndex - 1;
    J0x9D:

    // End:0x135 [Loop If]
    if(i >= 0)
    {
        // End:0x12B
        if((FactoryList[i].Child != none) && (FactoryList[i].Child.Controller == none) || !FactoryList[i].Child.Controller.IsA('PlayerController'))
        {
            newASVF = FactoryList[i];
            // [Explicit Break]
            goto J0x135;
        }
        i--;
        // [Loop Continue]
        goto J0x9D;
    }
    J0x135:

    // End:0x1EB
    if(newASVF == none)
    {
        i = FactoryList.Length - 1;
        J0x14F:

        // End:0x1EB [Loop If]
        if(i > CurrentIndex)
        {
            // End:0x1E1
            if((FactoryList[i].Child != none) && (FactoryList[i].Child.Controller == none) || !FactoryList[i].Child.Controller.IsA('PlayerController'))
            {
                newASVF = FactoryList[i];
                // [Explicit Break]
                goto J0x1EB;
            }
            i--;
            // [Loop Continue]
            goto J0x14F;
        }
    }
    J0x1EB:

    // End:0x292
    if(newASVF != none)
    {
        // End:0x220
        if(!V.bRelativeExitPos)
        {
            ExitPos = V.ExitPositions[0];
        }
        V.KDriverLeave(true);
        newASVF.Child.TryToDrive(PC.Pawn);
        // End:0x292
        if(!newASVF.Child.bRelativeExitPos)
        {
            newASVF.Child.ExitPositions[0] = ExitPos;
        }
    }
    //return;    
}

event NextVehicle(ASVehicleFactory ASVF, Vehicle V)
{
    local int i, CurrentIndex;
    local ASVehicleFactory newASVF;
    local PlayerController PC;
    local Vector ExitPos;

    PC = PlayerController(V.Controller);
    // End:0x4B
    if(((!bEnabled || bFullCapacity) || V == none) || PC == none)
    {
        return;
    }
    i = 0;
    J0x52:

    // End:0x8F [Loop If]
    if(i < FactoryList.Length)
    {
        // End:0x85
        if(FactoryList[i] == ASVF)
        {
            CurrentIndex = i;
            // [Explicit Break]
            goto J0x8F;
        }
        i++;
        // [Loop Continue]
        goto J0x52;
    }
    J0x8F:

    i = CurrentIndex + 1;
    J0x9D:

    // End:0x13A [Loop If]
    if(i < FactoryList.Length)
    {
        // End:0x130
        if((FactoryList[i].Child != none) && (FactoryList[i].Child.Controller == none) || !FactoryList[i].Child.Controller.IsA('PlayerController'))
        {
            newASVF = FactoryList[i];
            // [Explicit Break]
            goto J0x13A;
        }
        i++;
        // [Loop Continue]
        goto J0x9D;
    }
    J0x13A:

    // End:0x1E8
    if(newASVF == none)
    {
        i = 0;
        J0x14C:

        // End:0x1E8 [Loop If]
        if(i < CurrentIndex)
        {
            // End:0x1DE
            if((FactoryList[i].Child != none) && (FactoryList[i].Child.Controller == none) || !FactoryList[i].Child.Controller.IsA('PlayerController'))
            {
                newASVF = FactoryList[i];
                // [Explicit Break]
                goto J0x1E8;
            }
            i++;
            // [Loop Continue]
            goto J0x14C;
        }
    }
    J0x1E8:

    // End:0x28F
    if(newASVF != none)
    {
        // End:0x21D
        if(!V.bRelativeExitPos)
        {
            ExitPos = V.ExitPositions[0];
        }
        V.KDriverLeave(true);
        newASVF.Child.TryToDrive(PC.Pawn);
        // End:0x28F
        if(!newASVF.Child.bRelativeExitPos)
        {
            newASVF.Child.ExitPositions[0] = ExitPos;
        }
    }
    //return;    
}

defaultproperties
{
    bMarkWithPath=true
    bNoDelete=true
    bHardAttach=false
    bCollideActors=true
}