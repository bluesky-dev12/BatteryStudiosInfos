class utvMutator extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var string origcontroller;
var Class<PlayerController> origcclass;
var array<int> utvId;

function CreateInitialUtvReplication(Controller C)
{
    local utvReplicationInfo URI;
    local Controller P;

    // End:0x47
    foreach DynamicActors(Class'Engine.Controller', P)
    {
        // End:0x46
        if(P != C)
        {
            URI = Spawn(Class'UTV2004s_Decompressed.utvReplicationInfo', C);
            URI.OwnerCtrl = P;
        }        
    }    
    //return;    
}

function CreateUtvReplication(Controller C)
{
    local utvReplicationInfo URI;
    local PlayerController PC;
    local bool Found;

    // End:0xBB
    foreach DynamicActors(Class'Engine.PlayerController', PC)
    {
        // End:0x28
        if(!PC.bAllActorsRelevant)
        {
            continue;            
        }
        Found = false;
        // End:0x87
        foreach DynamicActors(Class'UTV2004s_Decompressed.utvReplicationInfo', URI)
        {
            // End:0x86
            if((URI.OwnerPlayer == C.PlayerReplicationInfo) && URI.Owner == PC)
            {
                Found = true;
                // End:0x87
                break;
            }            
        }        
        // End:0xBA
        if(!Found)
        {
            URI = Spawn(Class'UTV2004s_Decompressed.utvReplicationInfo', PC);
            URI.OwnerCtrl = C;
        }        
    }    
    //return;    
}

function Tick(float DeltaTime)
{
    local PlayerController PC;
    local int i;

    super(Actor).Tick(DeltaTime);
    // End:0xCB
    if(utvId.Length > 0)
    {
        // End:0xCA
        foreach DynamicActors(Class'Engine.PlayerController', PC)
        {
            i = 0;
            J0x2E:

            // End:0xC9 [Loop If]
            if(i < utvId.Length)
            {
                // End:0xBF
                if(PC.PlayerReplicationInfo.PlayerID == utvId[i])
                {
                    CreateInitialUtvReplication(PC);
                    Log((FriendlyName $ ": Found new UTV player: ") $ PC.PlayerReplicationInfo.PlayerName);
                    utvId.Remove(i, 1);
                    i--;
                }
                ++i;
                // [Loop Continue]
                goto J0x2E;
            }            
        }        
    }
    //return;    
}

function string GetNewController()
{
    local string cur, NewC;

    cur = Level.Game.PlayerControllerClassName;
    // End:0x7F
    if(InStr(cur, "BS_") > 0)
    {
        NewC = Repl(cur, "BS_", "UTV_BS_", false);
        Log((FriendlyName $ ": UTComp detected, using class ") $ NewC);        
    }
    else
    {
        // End:0x10A
        if(InStr(cur, "TTM_PlayerController") > 0)
        {
            NewC = Repl(cur, "TTM_PlayerController", "TTM_UTV_Spectator", false);
            Log((FriendlyName $ ": TTM detected, using class ") $ NewC);            
        }
        else
        {
            NewC = FriendlyName $ ".utvSpectator";
            Log((FriendlyName $ ": Using class ") $ NewC);
        }
    }
    return NewC;
    //return;    
}

function ModifyLogin(out string Portal, out string Options)
{
    local bool bSeeAll, bSpectator;

    super.ModifyLogin(Portal, Options);
    // End:0x46
    if(Level.Game == none)
    {
        Log(FriendlyName $ ": Level.game is none?");
        return;
    }
    // End:0x94
    if(origcontroller != "")
    {
        Level.Game.PlayerControllerClassName = origcontroller;
        Level.Game.PlayerControllerClass = origcclass;
        origcontroller = "";
    }
    bSpectator = Level.Game.ParseOption(Options, "SpectatorOnly") ~= "1";
    bSeeAll = Level.Game.ParseOption(Options, "UTVSeeAll") ~= "1";
    // End:0x1F9
    if(bSeeAll && bSpectator)
    {
        Log(((FriendlyName $ ": Player with id ") $ string(Level.Game.CurrentID)) $ " is requesting SeeAll");
        utvId[utvId.Length] = Level.Game.CurrentID;
        origcontroller = Level.Game.PlayerControllerClassName;
        origcclass = Level.Game.PlayerControllerClass;
        Level.Game.PlayerControllerClassName = GetNewController();
        Level.Game.PlayerControllerClass = none;
    }
    //return;    
}

function ModifyPlayer(Pawn Other)
{
    super.ModifyPlayer(Other);
    CreateUtvReplication(Other.Controller);
    //return;    
}

function NotifyLogout(Controller Exiting)
{
    local utvReplicationInfo URI;
    local PlayerController PC;

    super.NotifyLogout(Exiting);
    PC = PlayerController(Exiting);
    // End:0xA4
    if((PC != none) && PC.bAllActorsRelevant)
    {
        Log(((((FriendlyName $ ": SeeAll enabled player ") $ Exiting.PlayerReplicationInfo.PlayerName) $ " (") $ string(Exiting.PlayerReplicationInfo.PlayerID)) $ ") leaving");
    }
    // End:0xF3
    foreach DynamicActors(Class'UTV2004s_Decompressed.utvReplicationInfo', URI)
    {
        // End:0xF2
        if((URI.OwnerCtrl == Exiting) || URI.Owner == Exiting)
        {
            URI.Destroy();
        }        
    }    
    //return;    
}

defaultproperties
{
    bAddToServerPackages=true
    FriendlyName="UTV2004S"
    Description="모두보기 모드에서의 UTV2004를 지원하기 위해 필요합니다"
    bAlwaysTick=true
}