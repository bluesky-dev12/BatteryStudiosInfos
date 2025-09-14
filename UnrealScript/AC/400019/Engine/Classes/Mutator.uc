class Mutator extends Info
    native
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Mutator NextMutator;
var Class<wWeapon> DefaultWeapon;
var string DefaultWeaponName;
var bool bUserAdded;
var bool bAddToServerPackages;
var() cache string IconMaterialName;
var() cache string ConfigMenuClassName;
var() cache string GroupName;
var() localized cache string FriendlyName;
var() localized cache string Description;

event PreBeginPlay()
{
    // End:0x11
    if(!MutatorIsAllowed())
    {
        Destroy();        
    }
    else
    {
        // End:0x20
        if(bAddToServerPackages)
        {
            AddToPackageMap();
        }
    }
    //return;    
}

function bool MutatorIsAllowed()
{
    return !Level.IsDemoBuild() || Class == Class'Engine.Mutator';
    //return;    
}

function Destroyed()
{
    local Mutator M;

    // End:0x3D
    if(Level.Game.BaseMutator == self)
    {
        Level.Game.BaseMutator = NextMutator;        
    }
    else
    {
        M = Level.Game.BaseMutator;
        J0x5A:

        // End:0xA7 [Loop If]
        if(M != none)
        {
            // End:0x90
            if(M.NextMutator == self)
            {
                M.NextMutator = NextMutator;
                // [Explicit Break]
                goto J0xA7;
            }
            M = M.NextMutator;
            // [Loop Continue]
            goto J0x5A;
        }
    }
    J0xA7:

    super(Actor).Destroyed();
    //return;    
}

function Mutate(string MutateString, PlayerController Sender)
{
    // End:0x24
    if(NextMutator != none)
    {
        NextMutator.Mutate(MutateString, Sender);
    }
    //return;    
}

function ModifyLogin(out string Portal, out string Options)
{
    // End:0x24
    if(NextMutator != none)
    {
        NextMutator.ModifyLogin(Portal, Options);
    }
    //return;    
}

function NotifyLogout(Controller Exiting)
{
    // End:0x1F
    if(NextMutator != none)
    {
        NextMutator.NotifyLogout(Exiting);
    }
    //return;    
}

function ModifyPlayer(Pawn Other)
{
    // End:0x1F
    if(NextMutator != none)
    {
        NextMutator.ModifyPlayer(Other);
    }
    //return;    
}

function Class<wWeapon> GetDefaultWeapon()
{
    local Class<wWeapon> W;

    // End:0x3A
    if(NextMutator != none)
    {
        W = NextMutator.GetDefaultWeapon();
        // End:0x37
        if(W == none)
        {
            W = MyDefaultWeapon();
        }        
    }
    else
    {
        W = MyDefaultWeapon();
    }
    return W;
    //return;    
}

function Class<Inventory> GetInventoryClass(string InventoryClassName)
{
    InventoryClassName = GetInventoryClassOverride(InventoryClassName);
    return Class<Inventory>(DynamicLoadObject(InventoryClassName, Class'Core.Class'));
    //return;    
}

function string GetInventoryClassOverride(string InventoryClassName)
{
    // End:0x20
    if(NextMutator != none)
    {
        return NextMutator.GetInventoryClassOverride(InventoryClassName);
    }
    return InventoryClassName;
    //return;    
}

function Class<wWeapon> MyDefaultWeapon()
{
    // End:0x34
    if((DefaultWeapon == none) && DefaultWeaponName != "")
    {
        DefaultWeapon = Class<wWeapon>(DynamicLoadObject(DefaultWeaponName, Class'Core.Class'));
    }
    return DefaultWeapon;
    //return;    
}

function AddMutator(Mutator M)
{
    // End:0x19
    if(NextMutator == none)
    {
        NextMutator = M;        
    }
    else
    {
        NextMutator.AddMutator(M);
    }
    //return;    
}

function string RecommendCombo(string ComboName)
{
    return ComboName;
    //return;    
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
    // End:0x4B
    if(NextMutator != none)
    {
        return NextMutator.NewRecommendCombo(ComboName, C);
    }
    return ComboName;
    //return;    
}

function bool ReplaceWith(Actor Other, string aClassName)
{
    local Actor A;
    local Class<Actor> aClass;

    // End:0x0E
    if(aClassName == "")
    {
        return true;
    }
    aClass = Class<Actor>(DynamicLoadObject(aClassName, Class'Core.Class'));
    // End:0x7A
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
            // End:0x14E
            if(Pickup(A) != none)
            {
                Pickup(A).myMarker = Pickup(Other).myMarker;
                A.SetLocation(A.Location + ((A.CollisionHeight - Other.CollisionHeight) * vect(0.0000000, 0.0000000, 1.0000000)));
            }
            Pickup(Other).myMarker = none;            
        }
        else
        {
            // End:0x193
            if(A.IsA('Pickup'))
            {
                Pickup(A).RespawnTime = 0.0000000;
            }
        }
    }
    // End:0x1DA
    if(A != none)
    {
        A.Event = Other.Event;
        A.Tag = Other.Tag;
        return true;
    }
    return false;
    //return;    
}

function bool AlwaysKeep(Actor Other)
{
    // End:0x20
    if(NextMutator != none)
    {
        return NextMutator.AlwaysKeep(Other);
    }
    return false;
    //return;    
}

function bool IsRelevant(Actor Other, out byte bSuperRelevant)
{
    local bool bResult;

    bResult = CheckReplacement(Other, bSuperRelevant);
    // End:0x4D
    if(bResult && NextMutator != none)
    {
        bResult = NextMutator.IsRelevant(Other, bSuperRelevant);
    }
    return bResult;
    //return;    
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
    //return;    
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
    return true;
    //return;    
}

function PlayerChangedClass(Controller aPlayer)
{
    // End:0x1F
    if(NextMutator != none)
    {
        NextMutator.PlayerChangedClass(aPlayer);
    }
    //return;    
}

function GetServerDetails(out ServerResponseLine ServerState)
{
    local int i;

    i = ServerState.ServerInfo.Length;
    ServerState.ServerInfo.Length = i + 1;
    ServerState.ServerInfo[i].key = "Mutator";
    ServerState.ServerInfo[i].Value = GetHumanReadableName();
    //return;    
}

function GetServerPlayers(out ServerResponseLine ServerState)
{
    //return;    
}

function string ParseChatPercVar(Controller Who, string Cmd)
{
    // End:0x2A
    if(NextMutator != none)
    {
        Cmd = NextMutator.ParseChatPercVar(Who, Cmd);
    }
    return Cmd;
    //return;    
}

function MutatorFillPlayInfo(PlayInfo PlayInfo)
{
    FillPlayInfo(PlayInfo);
    // End:0x2A
    if(NextMutator != none)
    {
        NextMutator.MutatorFillPlayInfo(PlayInfo);
    }
    //return;    
}

event bool OverrideDownload(string PlayerIP, string PlayerID, string PlayerURL, out string RedirectURL)
{
    // End:0x2F
    if(NextMutator != none)
    {
        return NextMutator.OverrideDownload(PlayerIP, PlayerID, PlayerURL, RedirectURL);
    }
    return true;
    //return;    
}

function ServerTraveling(string URL, bool bItems)
{
    // End:0x25
    if(NextMutator != none)
    {
        NextMutator.ServerTraveling(URL, bItems);
    }
    //return;    
}

function bool CanEnterVehicle(Vehicle V, Pawn P)
{
    // End:0x25
    if(NextMutator != none)
    {
        return NextMutator.CanEnterVehicle(V, P);
    }
    return true;
    //return;    
}

function DriverEnteredVehicle(Vehicle V, Pawn P)
{
    // End:0x24
    if(NextMutator != none)
    {
        NextMutator.DriverEnteredVehicle(V, P);
    }
    //return;    
}

function bool CanLeaveVehicle(Vehicle V, Pawn P)
{
    // End:0x25
    if(NextMutator != none)
    {
        return NextMutator.CanLeaveVehicle(V, P);
    }
    return true;
    //return;    
}

function DriverLeftVehicle(Vehicle V, Pawn P)
{
    // End:0x24
    if(NextMutator != none)
    {
        NextMutator.DriverLeftVehicle(V, P);
    }
    //return;    
}
