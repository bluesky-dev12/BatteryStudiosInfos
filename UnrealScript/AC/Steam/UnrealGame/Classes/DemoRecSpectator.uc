/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\DemoRecSpectator.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:5
 *	States:1
 *
 *******************************************************************************/
class DemoRecSpectator extends UnrealPlayer
    config(User);

var bool bTempBehindView;
var bool bFoundPlayer;
var string RemoteViewTarget;

event PostBeginPlay()
{
    local class<HUD> HudClass;
    local class<ScoreBoard> ScoreboardClass;

    // End:0x116
    if(Role == 4 && Level.Game != none)
    {
        HudClass = class<HUD>(DynamicLoadObject(Level.Game.HUDType, class'Class'));
        // End:0x95
        if(HudClass == none)
        {
            Log("Can't find HUD class " $ Level.Game.HUDType, 'Error');
        }
        ScoreboardClass = class<ScoreBoard>(DynamicLoadObject(Level.Game.ScoreBoardType, class'Class'));
        // End:0x104
        if(ScoreboardClass == none)
        {
            Log("Can't find HUD class " $ Level.Game.ScoreBoardType, 'Error');
        }
        ClientSetHUD(HudClass, ScoreboardClass, none, none);
    }
    super.PostBeginPlay();
    // End:0x138
    if(PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.bOutOfLives = true;
    }
}

function InitPlayerReplicationInfo()
{
    super(Controller).InitPlayerReplicationInfo();
    PlayerReplicationInfo.PlayerName = "DemoRecSpectator";
    PlayerReplicationInfo.bIsSpectator = true;
    PlayerReplicationInfo.bOnlySpectator = true;
    PlayerReplicationInfo.bOutOfLives = true;
    PlayerReplicationInfo.bWaitingPlayer = false;
}

exec function ViewClass(class<Actor> aClass, optional bool bQuiet, optional bool bCheat)
{
    local Actor Other, first;
    local bool bFound;

    first = none;
    // End:0x5c
    foreach AllActors(aClass, Other)
    {
        // End:0x44
        if(bFound || first == none)
        {
            first = Other;
            // End:0x44
            if(bFound)
            {
            }
            // End:0x5c
            else
            {
            }
            // End:0x5b
            if(Other == ViewTarget)
            {
                bFound = true;
            }
            continue;
        }        
    }
    // End:0x9d
    if(first != none)
    {
        SetViewTarget(first);
        bBehindView = ViewTarget != self;
        // End:0x9a
        if(bBehindView)
        {
            ViewTarget.BecomeViewTarget();
        }
    }
    // End:0xa4
    else
    {
        SetViewTarget(self);
    }
}

exec function DemoViewNextPlayer()
{
    local Controller C, pick;
    local bool bFound;

    // End:0x25
    if(PlayerController(RealViewTarget) != none)
    {
        PlayerController(RealViewTarget).DemoViewer = none;
    }
    // End:0xf8
    foreach DynamicActors(class'Controller', C)
    {
        // End:0xf7
        if(C == self || PlayerController(C) == none || !PlayerController(C).IsSpectating())
        {
            // End:0xa3
            if(GameReplicationInfo == none && PlayerController(C) != none)
            {
                GameReplicationInfo = PlayerController(C).GameReplicationInfo;
            }
            // End:0xb9
            if(pick == none)
            {
                pick = C;
            }
            // End:0xd3
            if(bFound)
            {
                pick = C;
                // This is an implied JumpToken;
                goto J0xf8;
            }
            // End:0xf7
            else
            {
                bFound = RealViewTarget == C || ViewTarget == C;
            }
        }        
        J0xf8:        
    }
    SetViewTarget(pick);
    // End:0x129
    if(PlayerController(RealViewTarget) != none)
    {
        PlayerController(RealViewTarget).DemoViewer = self;
    }
}

event PlayerCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    local Rotator R;

    // End:0x1f
    if(RealViewTarget != none)
    {
        R = RealViewTarget.Rotation;
    }
    super(PlayerController).PlayerCalcView(ViewActor, CameraLocation, CameraRotation);
    // End:0x95
    if(RealViewTarget != none)
    {
        // End:0x84
        if(!bBehindView)
        {
            CameraRotation = R;
            // End:0x84
            if(Pawn(ViewTarget) != none)
            {
                CameraLocation.Z += Pawn(ViewTarget).BaseEyeHeight;
            }
        }
        RealViewTarget.SetRotation(R);
    }
}

auto state Spectating
{
    exec function Fire(optional float f)
    {
        bBehindView = false;
        DemoViewNextPlayer();
    }

    exec function AltFire(optional float f)
    {
        bBehindView = !bBehindView;
    }

    event PlayerTick(float DeltaTime)
    {
        super(PlayerController).PlayerTick(DeltaTime);
        // End:0x68
        if(Role == 3 && RealViewTarget == none || RealViewTarget == self && !bFoundPlayer)
        {
            DemoViewNextPlayer();
            // End:0x68
            if(RealViewTarget != none && RealViewTarget != self)
            {
                bFoundPlayer = true;
            }
        }
        // End:0xb2
        if(RealViewTarget != none && RealViewTarget.Pawn == none)
        {
            // End:0xaf
            if(!bBehindView)
            {
                // End:0xaf
                if(!bTempBehindView)
                {
                    bTempBehindView = true;
                    bBehindView = true;
                }
            }
        }
        // End:0xcb
        else
        {
            // End:0xcb
            if(bTempBehindView)
            {
                bBehindView = false;
                bTempBehindView = false;
            }
        }
    }

}

defaultproperties
{
    RemoteRole=3
    bDemoOwner=true
}