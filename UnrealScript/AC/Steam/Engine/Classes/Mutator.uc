/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Mutator.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:30
 *
 *******************************************************************************/
class Mutator extends Info
    dependson(Info)
    dependson(InventorySpot)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    notplaceable;

var Mutator NextMutator;
var class<wWeapon> DefaultWeapon;
var string DefaultWeaponName;
var bool bUserAdded;
var bool bAddToServerPackages;
var() noimport string IconMaterialName;
var() noimport string ConfigMenuClassName;
var() noimport string GroupName;
var() noimport localized string FriendlyName;
var() noimport localized string Description;

event PreBeginPlay()
{
    // End:0x11
    if(!MutatorIsAllowed())
    {
        Destroy();
    }
    // End:0x20
    else
    {
        // End:0x20
        if(bAddToServerPackages)
        {
            AddToPackageMap();
        }
    }
}

function bool MutatorIsAllowed()
{
    return !Level.IsDemoBuild() || Class == class'Mutator';
}

function Destroyed()
{
    local Mutator M;

    // End:0x3d
    if(Level.Game.BaseMutator == self)
    {
        Level.Game.BaseMutator = NextMutator;
    }
    // End:0xa7
    else
    {
        M = Level.Game.BaseMutator;
        J0x5a:
        // End:0xa7 [While If]
        if(M != none)
        {
            // End:0x90
            if(M.NextMutator == self)
            {
                M.NextMutator = NextMutator;
            }
            // End:0xa7
            else
            {
                M = M.NextMutator;
                // This is an implied JumpToken; Continue!
                goto J0x5a;
            }
        }
    }
    super(Actor).Destroyed();
}

function Mutate(string MutateString, PlayerController Sender)
{
    // End:0x24
    if(NextMutator != none)
    {
        NextMutator.Mutate(MutateString, Sender);
    }
}

function ModifyLogin(out string Portal, out string Options)
{
    // End:0x24
    if(NextMutator != none)
    {
        NextMutator.ModifyLogin(Portal, Options);
    }
}

function NotifyLogout(Controller Exiting)
{
    // End:0x1f
    if(NextMutator != none)
    {
        NextMutator.NotifyLogout(Exiting);
    }
}

function ModifyPlayer(Pawn Other)
{
    // End:0x1f
    if(NextMutator != none)
    {
        NextMutator.ModifyPlayer(Other);
    }
}

function class<wWeapon> GetDefaultWeapon()
{
    local class<wWeapon> W;

    // End:0x3a
    if(NextMutator != none)
    {
        W = NextMutator.GetDefaultWeapon();
        // End:0x37
        if(W == none)
        {
            W = MyDefaultWeapon();
        }
    }
    // End:0x46
    else
    {
        W = MyDefaultWeapon();
    }
    return W;
}

function class<Inventory> GetInventoryClass(string InventoryClassName)
{
    InventoryClassName = GetInventoryClassOverride(InventoryClassName);
    return class<Inventory>(DynamicLoadObject(InventoryClassName, class'Class'));
}

function string GetInventoryClassOverride(string InventoryClassName)
{
    // End:0x20
    if(NextMutator != none)
    {
        return NextMutator.GetInventoryClassOverride(InventoryClassName);
    }
    return InventoryClassName;
}

function class<wWeapon> MyDefaultWeapon()
{
    // End:0x34
    if(DefaultWeapon == none && DefaultWeaponName != "")
    {
        DefaultWeapon = class<wWeapon>(DynamicLoadObject(DefaultWeaponName, class'Class'));
    }
    return DefaultWeapon;
}

function AddMutator(Mutator M)
{
    // End:0x19
    if(NextMutator == none)
    {
        NextMutator = M;
    }
    // End:0x2d
    else
    {
        NextMutator.AddMutator(M);
    }
}

function string RecommendCombo(string ComboName)
{
    return ComboName;
}

function string NewRecommendCombo(string ComboName, AIController C)
{
    local string NewComboName;

    NewComboName = RecommendCombo(ComboName);
    // End:0x26
    if(NewComboName != ComboName)
    {
        return NewComboName;
    }
    // End:0x4b
    if(NextMutator != none)
    {
        return NextMutator.NewRecommendCombo(ComboName, C);
    }
    return ComboName;
}

function bool ReplaceWith(Actor Other, string aClassName)
{
    local Actor A;
    local class<Actor> aClass;

    // End:0x0e
    if(aClassName == "")
    {
        return true;
    }
    aClass = class<Actor>(DynamicLoadObject(aClassName, class'Class'));
    // End:0x7a
    if(aClass != none)
    {
        A = Spawn(aClass, Other.Owner, Other.Tag, Other.Location, Other.Rotation);
    }
    // End:0x193
    if(Other.IsA('Pickup'))
    {
        // End:0x166
        if(Pickup(Other).myMarker != none)
        {
            Pickup(Other).myMarker.markedItem = Pickup(A);
            // End:0x14e
            if(Pickup(A) != none)
            {
                Pickup(A).myMarker = Pickup(Other).myMarker;
                A.SetLocation(A.Location + A.CollisionHeight - Other.CollisionHeight * vect(0.0, 0.0, 1.0));
            }
            Pickup(Other).myMarker = none;
        }
        // End:0x193
        else
        {
            // End:0x193
            if(A.IsA('Pickup'))
            {
                Pickup(A).RespawnTime = 0.0;
            }
        }
    }
    // End:0x1da
    if(A != none)
    {
        A.Event = Other.Event;
        A.Tag = Other.Tag;
        return true;
    }
    return false;
}

function bool AlwaysKeep(Actor Other)
{
    // End:0x20
    if(NextMutator != none)
    {
        return NextMutator.AlwaysKeep(Other);
    }
    return false;
}

function bool IsRelevant(Actor Other, out byte bSuperRelevant)
{
    local bool bResult;

    bResult = CheckReplacement(Other, bSuperRelevant);
    // End:0x4d
    if(bResult && NextMutator != none)
    {
        bResult = NextMutator.IsRelevant(Other, bSuperRelevant);
    }
    return bResult;
}

function bool CheckRelevance(Actor Other)
{
    local bool bResult;
    local byte bSuperRelevant;

    // End:0x10
    if(AlwaysKeep(Other))
    {
        return true;
    }
    bResult = IsRelevant(Other, bSuperRelevant);
    return bResult;
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
    return true;
}

function PlayerChangedClass(Controller aPlayer)
{
    // End:0x1f
    if(NextMutator != none)
    {
        NextMutator.PlayerChangedClass(aPlayer);
    }
}

function GetServerDetails(out ServerResponseLine ServerState)
{
    local int i;

    i = ServerState.ServerInfo.Length;
    ServerState.ServerInfo.Length = i + 1;
    ServerState.ServerInfo[i].key = "Mutator";
    ServerState.ServerInfo[i].Value = GetHumanReadableName();
}

function GetServerPlayers(out ServerResponseLine ServerState);
function string ParseChatPercVar(Controller Who, string Cmd)
{
    // End:0x2a
    if(NextMutator != none)
    {
        Cmd = NextMutator.ParseChatPercVar(Who, Cmd);
    }
    return Cmd;
}

function MutatorFillPlayInfo(PlayInfo PlayInfo)
{
    FillPlayInfo(PlayInfo);
    // End:0x2a
    if(NextMutator != none)
    {
        NextMutator.MutatorFillPlayInfo(PlayInfo);
    }
}

event bool OverrideDownload(string PlayerIP, string PlayerID, string PlayerURL, out string RedirectURL)
{
    // End:0x2f
    if(NextMutator != none)
    {
        return NextMutator.OverrideDownload(PlayerIP, PlayerID, PlayerURL, RedirectURL);
    }
    return true;
}

function ServerTraveling(string URL, bool bItems)
{
    // End:0x25
    if(NextMutator != none)
    {
        NextMutator.ServerTraveling(URL, bItems);
    }
}

function bool CanEnterVehicle(Vehicle V, Pawn P)
{
    // End:0x25
    if(NextMutator != none)
    {
        return NextMutator.CanEnterVehicle(V, P);
    }
    return true;
}

function DriverEnteredVehicle(Vehicle V, Pawn P)
{
    // End:0x24
    if(NextMutator != none)
    {
        NextMutator.DriverEnteredVehicle(V, P);
    }
}

function bool CanLeaveVehicle(Vehicle V, Pawn P)
{
    // End:0x25
    if(NextMutator != none)
    {
        return NextMutator.CanLeaveVehicle(V, P);
    }
    return true;
}

function DriverLeftVehicle(Vehicle V, Pawn P)
{
    // End:0x24
    if(NextMutator != none)
    {
        NextMutator.DriverLeftVehicle(V, P);
    }
}
