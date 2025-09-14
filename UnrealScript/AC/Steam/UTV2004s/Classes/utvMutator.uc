/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UTV2004s\Classes\utvMutator.uc
 * Package Imports:
 *	UTV2004s
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:7
 *
 *******************************************************************************/
class utvMutator extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var string origcontroller;
var class<PlayerController> origcclass;
var array<int> utvId;

function CreateInitialUtvReplication(Controller C)
{
    local utvReplicationInfo URI;
    local Controller P;

    // End:0x47
    foreach DynamicActors(class'Controller', P)
    {
        // End:0x46
        if(P != C)
        {
            URI = Spawn(class'utvReplicationInfo', C);
            URI.OwnerCtrl = P;
        }                
    }
}

function CreateUtvReplication(Controller C)
{
    local utvReplicationInfo URI;
    local PlayerController PC;
    local bool Found;

    // End:0xbb
    foreach DynamicActors(class'PlayerController', PC)
    {
        // End:0x28
        if(!PC.bAllActorsRelevant)
        {
            continue;
        }
        // End:0xbb
        else
        {
            Found = false;
            // End:0x87
            foreach DynamicActors(class'utvReplicationInfo', URI)
            {
                // End:0x86
                if(URI.OwnerPlayer == C.PlayerReplicationInfo && URI.Owner == PC)
                {
                    Found = true;
                }
                // End:0x87
                else
                {
                    continue;
                }                
            }
            // End:0xba
            if(!Found)
            {
                URI = Spawn(class'utvReplicationInfo', PC);
                URI.OwnerCtrl = C;
            }
            continue;
        }        
    }
}

function Tick(float DeltaTime)
{
    local PlayerController PC;
    local int i;

    super(Actor).Tick(DeltaTime);
    // End:0xcb
    if(utvId.Length > 0)
    {
        // End:0xca
        foreach DynamicActors(class'PlayerController', PC)
        {
            i = 0;
            J0x2e:
            // End:0xc9 [While If]
            if(i < utvId.Length)
            {
                // End:0xbf
                if(PC.PlayerReplicationInfo.PlayerID == utvId[i])
                {
                    CreateInitialUtvReplication(PC);
                    Log(FriendlyName $ ": Found new UTV player: " $ PC.PlayerReplicationInfo.PlayerName);
                    utvId.Remove(i, 1);
                    -- i;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x2e;
            }                        
        }
    }
}

function string GetNewController()
{
    local string cur, NewC;

    cur = Level.Game.PlayerControllerClassName;
    // End:0x7f
    if(InStr(cur, "BS_") > 0)
    {
        NewC = Repl(cur, "BS_", "UTV_BS_", false);
        Log(FriendlyName $ ": UTComp detected, using class " $ NewC);
    }
    // End:0x146
    else
    {
        // End:0x10a
        if(InStr(cur, "TTM_PlayerController") > 0)
        {
            NewC = Repl(cur, "TTM_PlayerController", "TTM_UTV_Spectator", false);
            Log(FriendlyName $ ": TTM detected, using class " $ NewC);
        }
        // End:0x146
        else
        {
            NewC = FriendlyName $ ".utvSpectator";
            Log(FriendlyName $ ": Using class " $ NewC);
        }
    }
    return NewC;
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
    // End:0x1f9
    if(bSeeAll && bSpectator)
    {
        Log(FriendlyName $ ": Player with id " $ string(Level.Game.CurrentID) $ " is requesting SeeAll");
        utvId[utvId.Length] = Level.Game.CurrentID;
        origcontroller = Level.Game.PlayerControllerClassName;
        origcclass = Level.Game.PlayerControllerClass;
        Level.Game.PlayerControllerClassName = GetNewController();
        Level.Game.PlayerControllerClass = none;
    }
}

function ModifyPlayer(Pawn Other)
{
    super.ModifyPlayer(Other);
    CreateUtvReplication(Other.Controller);
}

function NotifyLogout(Controller Exiting)
{
    local utvReplicationInfo URI;
    local PlayerController PC;

    super.NotifyLogout(Exiting);
    PC = PlayerController(Exiting);
    // End:0xa4
    if(PC != none && PC.bAllActorsRelevant)
    {
        Log(FriendlyName $ ": SeeAll enabled player " $ Exiting.PlayerReplicationInfo.PlayerName $ " (" $ string(Exiting.PlayerReplicationInfo.PlayerID) $ ") leaving");
    }
    // End:0xf3
    foreach DynamicActors(class'utvReplicationInfo', URI)
    {
        // End:0xf2
        if(URI.OwnerCtrl == Exiting || URI.Owner == Exiting)
        {
            URI.Destroy();
        }                
    }
}

defaultproperties
{
    bAddToServerPackages=true
    FriendlyName="UTV2004S"
    Description="???????? ?????????? UTV2004?? ???????? ???? ??????????"
    bAlwaysTick=true
}