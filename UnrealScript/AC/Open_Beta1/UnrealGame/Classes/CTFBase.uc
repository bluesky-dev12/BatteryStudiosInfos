class CTFBase extends GameObjective
    abstract
    hidecategories(Lighting,LightColor,Karma,Force);

var() Sound TakenSound;
var CTFFlag myFlag;
var Class<CTFFlag> FlagType;

function BeginPlay()
{
    super(Actor).BeginPlay();
    bHidden = false;
    myFlag = Spawn(FlagType, self);
    // End:0x70
    if(myFlag == none)
    {
        Warn((((string(self) $ " could not spawn flag of type '") $ string(FlagType)) $ "' at ") $ string(Location));
        return;        
    }
    else
    {
        myFlag.HomeBase = self;
        myFlag.TeamNum = DefenderTeamIndex;
    }
    //return;    
}

function PostBeginPlay()
{
    local UnrealScriptedSequence W;

    super.PostBeginPlay();
    SetBaseDistance(int(DefenderTeamIndex));
    SetBaseVisibility(int(DefenderTeamIndex));
    W = DefenseScripts;
    J0x2B:

    // End:0x80 [Loop If]
    if(W != none)
    {
        // End:0x69
        if(W.myMarker != none)
        {
            W.myMarker.SetBaseVisibility(int(DefenderTeamIndex));
        }
        W = W.NextScript;
        // [Loop Continue]
        goto J0x2B;
    }
    //return;    
}

function PlayAlarm()
{
    SetTimer(5.0000000, false);
    AmbientSound = TakenSound;
    //return;    
}

function Timer()
{
    AmbientSound = none;
    //return;    
}

defaultproperties
{
    DrawType=2
    bStatic=false
    bAlwaysRelevant=true
    NetUpdateFrequency=8.0000000
    DrawScale=1.3000000
    SoundRadius=255.0000000
    CollisionRadius=60.0000000
    CollisionHeight=60.0000000
    bCollideActors=true
}