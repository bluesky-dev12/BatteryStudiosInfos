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
    WAT_Barrel                      // 6
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
    // End:0x7B
    if((int(AcceType) != int(4)) && int(AcceType) != int(6))
    {
        // End:0x57
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
        // End:0xA2
        case 4:
        // End:0xB2
        case 6:
            bHidden = true;
            // End:0x128
            break;
        // End:0xBC
        case 0:
            Destroy();
            return false;
        // End:0xC1
        case 1:
        // End:0xDE
        case 3:
            Owner.AttachToBone(self, 'Sight');
            // End:0x128
            break;
        // End:0x103
        case 2:
            Owner.AttachToBone(self, 'Dot');
            bUnlit = true;
            // End:0x128
            break;
        // End:0x120
        case 5:
            Owner.AttachToBone(self, 'Silencer');
            // End:0x128
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
    // End:0x1DE
    if(Owner.IsA('wGun'))
    {
        switch(AcceType)
        {
            // End:0x1BB
            case 3:
                wGun(Owner).ScopeAttached(true);
                BaseStaticMesh = NewSMesh;
                Scope3DAimMesh = StaticMesh(DynamicLoadObject(szMesh $ "_Zoom", Class'Engine.StaticMesh'));
                // End:0x1DB
                break;
            // End:0x1D8
            case 5:
                wGun(Owner).SilencerAttached(true);
                // End:0x1DB
                break;
            // End:0xFFFF
            default:
                break;
        }        
    }
    else
    {
        // End:0x251
        if(Owner.IsA('wFPWeaponAttachment'))
        {
            switch(AcceType)
            {
                // End:0x230
                case 3:
                    BaseStaticMesh = NewSMesh;
                    Scope3DAimMesh = StaticMesh(DynamicLoadObject(szMesh $ "_Zoom", Class'Engine.StaticMesh'));
                    // End:0x251
                    break;
                // End:0x24E
                case 5:
                    wFPWeaponAttachment(Owner).bSilencer = true;
                    // End:0x251
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