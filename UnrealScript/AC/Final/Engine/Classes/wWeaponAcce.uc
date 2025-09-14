class wWeaponAcce extends Actor
    notplaceable;

enum EAcceType
{
    WAT_None,                       // 0
    WAT_Sight,                      // 1
    WAT_Dot,                        // 2
    WAT_Scope,                      // 3
    WAT_GunStock,                   // 4
    WAT_Silencer,                   // 5
    WAT_Barrel,                     // 6
    WAT_Muzzle                      // 7
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
    // End:0x8D
    if(((int(AcceType) != int(4)) && int(AcceType) != int(6)) && int(AcceType) != int(7))
    {
        // End:0x69
        if(bUseMeshString == true)
        {
            NewSMesh = StaticMesh(DynamicLoadObject(szMesh, Class'Engine.StaticMesh'));            
        }
        else
        {
            NewSMesh = Level.GameMgr.GetItemResourceStaticMesh(iPartsItemID, false);
        }
    }
    SetDrawType(8);
    SetStaticMesh(NewSMesh);
    SetBase(Owner);
    switch(AcceType)
    {
        // End:0xB4
        case 4:
        // End:0xB9
        case 6:
        // End:0xC9
        case 7:
            bHidden = true;
            // End:0x13F
            break;
        // End:0xD3
        case 0:
            Destroy();
            return false;
        // End:0xD8
        case 1:
        // End:0xF5
        case 3:
            Owner.AttachToBone(self, 'Sight');
            // End:0x13F
            break;
        // End:0x11A
        case 2:
            Owner.AttachToBone(self, 'Dot');
            bUnlit = true;
            // End:0x13F
            break;
        // End:0x137
        case 5:
            Owner.AttachToBone(self, 'Silencer');
            // End:0x13F
            break;
        // End:0xFFFF
        default:
            Destroy();
            return false;
            break;
    }
    szName = szMesh;
    vAimDiff = AimDiff;
    PartsItemID = iPartsItemID;
    PartsGroupID = iPartsGroupID;
    // End:0x217
    if(Owner.IsA('wGun'))
    {
        switch(AcceType)
        {
            // End:0x1D2
            case 3:
                wGun(Owner).ScopeAttached(true);
                BaseStaticMesh = NewSMesh;
                Scope3DAimMesh = StaticMesh(DynamicLoadObject(szMesh $ "_Zoom", Class'Engine.StaticMesh'));
                // End:0x214
                break;
            // End:0x1EF
            case 5:
                wGun(Owner).SilencerAttached(true);
                // End:0x214
                break;
            // End:0x211
            case 7:
                wGun(Owner).MuzzleFlashModified(true, szMesh);
                // End:0x214
                break;
            // End:0xFFFF
            default:
                break;
        }        
    }
    else
    {
        // End:0x2C1
        if(Owner.IsA('wFPWeaponAttachment'))
        {
            switch(AcceType)
            {
                // End:0x269
                case 3:
                    BaseStaticMesh = NewSMesh;
                    Scope3DAimMesh = StaticMesh(DynamicLoadObject(szMesh $ "_Zoom", Class'Engine.StaticMesh'));
                    // End:0x2C1
                    break;
                // End:0x287
                case 5:
                    wFPWeaponAttachment(Owner).bSilencer = true;
                    // End:0x2C1
                    break;
                // End:0x2BE
                case 7:
                    wFPWeaponAttachment(Owner).bModMuzFlash = true;
                    wFPWeaponAttachment(Owner).strSuffixMuzFlashClass = szMesh;
                    // End:0x2C1
                    break;
                // End:0xFFFF
                default:
                    break;
            }
        }
        else
        {
        }
        return true;
        //return;        
    }
}

simulated function Switch3DScope(bool bAiming)
{
    // End:0x1A
    if(bAiming == false)
    {
        SetStaticMesh(BaseStaticMesh);        
    }
    else
    {
        SetStaticMesh(Scope3DAimMesh);
    }
    bIsAiming = bAiming;
    //return;    
}

simulated function bool IsAiming()
{
    return bIsAiming;
    //return;    
}

defaultproperties
{
    PartsItemID=-1
    PartsGroupID=-1
    RemoteRole=0
}