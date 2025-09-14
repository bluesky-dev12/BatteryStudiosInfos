class DemoRecSpectator extends UnrealPlayer
    config(User);

var bool bTempBehindView;
var bool bFoundPlayer;
var string RemoteViewTarget;

event PostBeginPlay()
{
    local Class<HUD> HudClass;
    local Class<ScoreBoard> ScoreboardClass;

    // End:0x116
    if((int(Role) == int(ROLE_Authority)) && Level.Game != none)
    {
        HudClass = Class<HUD>(DynamicLoadObject(Level.Game.HUDType, Class'Core.Class'));
        // End:0x95
        if(HudClass == none)
        {
            Log("Can't find HUD class " $ Level.Game.HUDType, 'Error');
        }
        ScoreboardClass = Class<ScoreBoard>(DynamicLoadObject(Level.Game.ScoreBoardType, Class'Core.Class'));
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
    //return;    
}

function InitPlayerReplicationInfo()
{
    super(Controller).InitPlayerReplicationInfo();
    PlayerReplicationInfo.PlayerName = "DemoRecSpectator";
    PlayerReplicationInfo.bIsSpectator = true;
    PlayerReplicationInfo.bOnlySpectator = true;
    PlayerReplicationInfo.bOutOfLives = true;
    PlayerReplicationInfo.bWaitingPlayer = false;
    //return;    
}

exec function ViewClass(Class<Actor> aClass, optional bool bQuiet, optional bool bCheat)
{
    local Actor Other, first;
    local bool bFound;

    first = none;
    // End:0x5C
    foreach AllActors(aClass, Other)
    {
        // End:0x44
        if(bFound || first == none)
        {
            first = Other;
            // End:0x44
            if(bFound)
            {
                // End:0x5C
                break;
            }
        }
        // End:0x5B
        if(Other == ViewTarget)
        {
            bFound = true;
        }        
    }    
    // End:0x9D
    if(first != none)
    {
        SetViewTarget(first);
        bBehindView = ViewTarget != self;
        // End:0x9A
        if(bBehindView)
        {
            ViewTarget.BecomeViewTarget();
        }        
    }
    else
    {
        SetViewTarget(self);
    }
    //return;    
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
    // End:0xF8
    foreach DynamicActors(Class'Engine.Controller', C)
    {
        // End:0xF7
        if(((C == self) || PlayerController(C) == none) || !PlayerController(C).IsSpectating())
        {
            // End:0xA3
            if((GameReplicationInfo == none) && PlayerController(C) != none)
            {
                GameReplicationInfo = PlayerController(C).GameReplicationInfo;
            }
            // End:0xB9
            if(pick == none)
            {
                pick = C;
            }
            // End:0xD3
            if(bFound)
            {
                pick = C;
                // End:0xF8
                break;
                // End:0xF7
                continue;
            }
            bFound = (RealViewTarget == C) || ViewTarget == C;
        }        
    }    
    SetViewTarget(pick);
    // End:0x129
    if(PlayerController(RealViewTarget) != none)
    {
        PlayerController(RealViewTarget).DemoViewer = self;
    }
    //return;    
}

event PlayerCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    local Rotator R;

    // End:0x1F
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
    //return;    
}

auto state Spectating
{
    exec function Fire(optional float f)
    {
        bBehindView = false;
        DemoViewNextPlayer();
        //return;        
    }

    exec function AltFire(optional float f)
    {
        bBehindView = !bBehindView;
        //return;        
    }

    event PlayerTick(float DeltaTime)
    {
        super(PlayerController).PlayerTick(DeltaTime);
        // End:0x68
        if(((int(Role) == int(ROLE_AutonomousProxy)) && (RealViewTarget == none) || RealViewTarget == self) && !bFoundPlayer)
        {
            DemoViewNextPlayer();
            // End:0x68
            if((RealViewTarget != none) && RealViewTarget != self)
            {
                bFoundPlayer = true;
            }
        }
        // End:0xB2
        if((RealViewTarget != none) && RealViewTarget.Pawn == none)
        {
            // End:0xAF
            if(!bBehindView)
            {
                // End:0xAF
                if(!bTempBehindView)
                {
                    bTempBehindView = true;
                    bBehindView = true;
                }
            }            
        }
        else
        {
            // End:0xCB
            if(bTempBehindView)
            {
                bBehindView = false;
                bTempBehindView = false;
            }
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    RemoteRole=3
    bDemoOwner=true
}