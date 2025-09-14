/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\Trigger_ASUseAndPossess.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:6
 *	Functions:14
 *
 *******************************************************************************/
class Trigger_ASUseAndPossess extends SVehicleTrigger;

enum AT_AssaultTeam
{
    AT_All,
    AT_Attackers,
    AT_Defenders
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

    // End:0x3b
    foreach DynamicActors(class'ASVehicleFactory', ASVF)
    {
        // End:0x3a
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
    // End:0x49
    else
    {
        SetCollision(false);
        // End:0x49
        if(!bFullCapacity)
        {
            NotifyAvailability(false);
        }
    }
}

event VehicleSpawned()
{
    // End:0x1a
    if(bEnabled && bFullCapacity)
    {
        UpdateCapacity();
    }
}

event VehicleDestroyed()
{
    // End:0x1c
    if(bEnabled && !bFullCapacity)
    {
        UpdateCapacity();
    }
}

event VehicleUnPossessed()
{
    // End:0x1a
    if(bEnabled && bFullCapacity)
    {
        UpdateCapacity();
    }
}

event VehiclePossessed()
{
    // End:0x1c
    if(bEnabled && !bFullCapacity)
    {
        UpdateCapacity();
    }
}

function bool ApprovePlayerTeam(byte Team)
{
    // End:0x12
    if(AssaultTeam == 0)
    {
        return true;
    }
    // End:0x96
    if(Level.Game.IsA('ASGameInfo'))
    {
        // End:0x6b
        if(AssaultTeam == 1)
        {
            // End:0x68
            if(ASGameInfo(Level.Game).IsAttackingTeam(Team))
            {
                return true;
            }
        }
        // End:0x96
        else
        {
            // End:0x96
            if(!ASGameInfo(Level.Game).IsAttackingTeam(Team))
            {
                return true;
            }
        }
    }
    return false;
}

function Touch(Actor Other)
{
    local wPawn User;
    local Controller C;

    User = wPawn(Other);
    // End:0x4b
    if(!bEnabled || bFullCapacity || User == none || User.Controller == none)
    {
        return;
    }
    C = User.Controller;
    // End:0x13c
    if(AIController(C) != none && C.RouteGoal == self || C.MoveTarget == self || C.RouteGoal == myMarker || C.MoveTarget == myMarker)
    {
        // End:0x13a
        if(C.PlayerReplicationInfo != none && !C.PlayerReplicationInfo.bOnlySpectator && ApprovePlayerTeam(byte(C.PlayerReplicationInfo.Team.TeamIndex)))
        {
            UsedBy(User);
        }
        return;
    }
    User.ReceiveLocalizedMessage(class'BulldogMessage', 0);
}

function UsedBy(Pawn User)
{
    local Vehicle V;
    local int i;

    // End:0x59
    if(!bEnabled || bFullCapacity || User == none || User.Controller == none || !ApprovePlayerTeam(byte(User.GetTeamNum())))
    {
        return;
    }
    i = 0;
    J0x60:
    // End:0x117 [While If]
    if(i < FactoryList.Length)
    {
        V = FactoryList[i].Child;
        // End:0x10d
        if(V != none && V.Health > 0 && !V.bDeleteMe)
        {
            // End:0x10d
            if(V.Controller == none || !V.Controller.IsA('PlayerController'))
            {
                V.TryToDrive(User);
            }
            // End:0x117
            else
            {
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x60;
        }
    }
    UpdateCapacity();
}

function UpdateCapacity()
{
    local Vehicle V;
    local bool bOldCapacity;
    local int i;

    bOldCapacity = bFullCapacity;
    bFullCapacity = true;
    i = 0;
    J0x1c:
    // End:0xc4 [While If]
    if(i < FactoryList.Length)
    {
        V = FactoryList[i].Child;
        // End:0xba
        if(V != none && V.Health > 0 && !V.bDeleteMe)
        {
            // End:0xba
            if(V.Controller == none || !V.Controller.IsA('PlayerController'))
            {
                bFullCapacity = false;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1c;
    }
    // End:0xec
    if(bEnabled && bOldCapacity && !bFullCapacity)
    {
        NotifyAvailability(true);
    }
    // End:0x114
    if(bEnabled && !bOldCapacity && bFullCapacity)
    {
        NotifyAvailability(false);
    }
}

function Reset()
{
    local bool bOldEnabled;

    bOldEnabled = bEnabled;
    super.Reset();
    // End:0x46
    if(bOldEnabled != bEnabled || bEnabled && bFullCapacity)
    {
        NotifyAvailability(bEnabled);
    }
    bFullCapacity = false;
}

event NotifyAvailability(bool bAvailableSpace)
{
    SetCollision(bAvailableSpace);
    // End:0x22
    if(bAvailableSpace)
    {
        TriggerEvent(EventNonFull, self, none);
    }
    // End:0x2f
    else
    {
        TriggerEvent(EventFull, self, none);
    }
}

event PrevVehicle(ASVehicleFactory ASVF, Vehicle V)
{
    local int i, CurrentIndex;
    local ASVehicleFactory newASVF;
    local PlayerController PC;
    local Vector ExitPos;

    PC = PlayerController(V.Controller);
    // End:0x4b
    if(!bEnabled || bFullCapacity || V == none || PC == none)
    {
        return;
    }
    i = 0;
    J0x52:
    // End:0x8f [While If]
    if(i < FactoryList.Length)
    {
        // End:0x85
        if(FactoryList[i] == ASVF)
        {
            CurrentIndex = i;
        }
        // End:0x8f
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x52;
        }
    }
    i = CurrentIndex - 1;
    J0x9d:
    // End:0x135 [While If]
    if(i >= 0)
    {
        // End:0x12b
        if(FactoryList[i].Child != none && FactoryList[i].Child.Controller == none || !FactoryList[i].Child.Controller.IsA('PlayerController'))
        {
            newASVF = FactoryList[i];
        }
        // End:0x135
        else
        {
            -- i;
            // This is an implied JumpToken; Continue!
            goto J0x9d;
        }
    }
    // End:0x1eb
    if(newASVF == none)
    {
        i = FactoryList.Length - 1;
        J0x14f:
        // End:0x1eb [While If]
        if(i > CurrentIndex)
        {
            // End:0x1e1
            if(FactoryList[i].Child != none && FactoryList[i].Child.Controller == none || !FactoryList[i].Child.Controller.IsA('PlayerController'))
            {
                newASVF = FactoryList[i];
            }
            // End:0x1eb
            else
            {
                -- i;
                // This is an implied JumpToken; Continue!
                goto J0x14f;
            }
        }
    }
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
}

event NextVehicle(ASVehicleFactory ASVF, Vehicle V)
{
    local int i, CurrentIndex;
    local ASVehicleFactory newASVF;
    local PlayerController PC;
    local Vector ExitPos;

    PC = PlayerController(V.Controller);
    // End:0x4b
    if(!bEnabled || bFullCapacity || V == none || PC == none)
    {
        return;
    }
    i = 0;
    J0x52:
    // End:0x8f [While If]
    if(i < FactoryList.Length)
    {
        // End:0x85
        if(FactoryList[i] == ASVF)
        {
            CurrentIndex = i;
        }
        // End:0x8f
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x52;
        }
    }
    i = CurrentIndex + 1;
    J0x9d:
    // End:0x13a [While If]
    if(i < FactoryList.Length)
    {
        // End:0x130
        if(FactoryList[i].Child != none && FactoryList[i].Child.Controller == none || !FactoryList[i].Child.Controller.IsA('PlayerController'))
        {
            newASVF = FactoryList[i];
        }
        // End:0x13a
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x9d;
        }
    }
    // End:0x1e8
    if(newASVF == none)
    {
        i = 0;
        J0x14c:
        // End:0x1e8 [While If]
        if(i < CurrentIndex)
        {
            // End:0x1de
            if(FactoryList[i].Child != none && FactoryList[i].Child.Controller == none || !FactoryList[i].Child.Controller.IsA('PlayerController'))
            {
                newASVF = FactoryList[i];
            }
            // End:0x1e8
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x14c;
            }
        }
    }
    // End:0x28f
    if(newASVF != none)
    {
        // End:0x21d
        if(!V.bRelativeExitPos)
        {
            ExitPos = V.ExitPositions[0];
        }
        V.KDriverLeave(true);
        newASVF.Child.TryToDrive(PC.Pawn);
        // End:0x28f
        if(!newASVF.Child.bRelativeExitPos)
        {
            newASVF.Child.ExitPositions[0] = ExitPos;
        }
    }
}

defaultproperties
{
    bMarkWithPath=true
    bNoDelete=true
    bHardAttach=true
    bCollideActors=true
}