/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wWeaponAcce.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:8
 *	Functions:3
 *
 *******************************************************************************/
class wWeaponAcce extends Actor
    dependson(wFPWeaponAttachment)
    notplaceable;

enum EAcceType
{
    WAT_None,
    WAT_Sight,
    WAT_Dot,
    WAT_Scope,
    WAT_ButtStock,
    WAT_Silencer
};

var string szName;
var wWeaponAcce.EAcceType AcceType;
var Vector vAimDiff;
var int PartsItemID;
var int PartsGroupID;
var StaticMesh BaseStaticMesh;
var StaticMesh Scope3DAimMesh;
var bool bIsAiming;

simulated function bool Set(wWeaponAcce.EAcceType Type, string szMesh, Vector AimDiff, int iPartsItemID, int iPartsGroupID, optional bool bUseMeshString)
{
    local StaticMesh NewSMesh;

    AcceType = Type;
    // End:0x35
    if(bUseMeshString == true)
    {
        NewSMesh = StaticMesh(DynamicLoadObject(szMesh, class'StaticMesh'));
    }
    // End:0x59
    else
    {
        NewSMesh = Level.GameMgr.GetItemResourceStaticMesh(iPartsItemID, false);
    }
    SetDrawType(8);
    SetStaticMesh(NewSMesh);
    SetBase(Owner);
    switch(AcceType)
    {
        // End:0x85
        case 0:
            Destroy();
            return false;
        // End:0x8a
        case 1:
        // End:0xa7
        case 3:
            Owner.AttachToBone(self, 'Sight');
            // End:0xf1
            break;
        // End:0xcc
        case 2:
            Owner.AttachToBone(self, 'Dot');
            bUnlit = true;
            // End:0xf1
            break;
        // End:0xe9
        case 5:
            Owner.AttachToBone(self, 'Silencer');
            // End:0xf1
            break;
        // End:0xffff
        default:
            Destroy();
            return false;
    }
    szName = szMesh;
    vAimDiff = AimDiff;
    PartsItemID = iPartsItemID;
    PartsGroupID = iPartsGroupID;
    // End:0x1a7
    if(Owner.IsA('wGun'))
    {
        switch(AcceType)
        {
            // End:0x184
            case 3:
                wGun(Owner).ScopeAttached(true);
                BaseStaticMesh = NewSMesh;
                Scope3DAimMesh = StaticMesh(DynamicLoadObject(szMesh $ "_Zoom", class'StaticMesh'));
                // End:0x1a4
                break;
            // End:0x1a1
            case 5:
                wGun(Owner).SilencerAttached(true);
                // End:0x1a4
                break;
            // End:0xffff
            default:
                // End:0x21a Break;
                break;
            }
    }
    // End:0x21a
    if(Owner.IsA('wFPWeaponAttachment'))
    {
        switch(AcceType)
        {
            // End:0x1f9
            case 3:
                BaseStaticMesh = NewSMesh;
                Scope3DAimMesh = StaticMesh(DynamicLoadObject(szMesh $ "_Zoom", class'StaticMesh'));
                // End:0x21a
                break;
            // End:0x217
            case 5:
                wFPWeaponAttachment(Owner).bSilencer = true;
                // End:0x21a
                break;
            // End:0xffff
            default:
            }
            return true;
}

simulated function Switch3DScope(bool bAiming)
{
    // End:0x1a
    if(bAiming == false)
    {
        SetStaticMesh(BaseStaticMesh);
    }
    // End:0x25
    else
    {
        SetStaticMesh(Scope3DAimMesh);
    }
    bIsAiming = bAiming;
}

simulated function bool IsAiming()
{
    return bIsAiming;
}

defaultproperties
{
    PartsItemID=-1
    PartsGroupID=-1
    RemoteRole=0
}