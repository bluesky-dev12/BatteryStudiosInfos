class wWeaponAcce extends Actor
    notplaceable;

enum EAcceType
{
    WAT_None,                       // 0
    WAT_Sight,                      // 1
    WAT_Dot,                        // 2
    WAT_Scope,                      // 3
    WAT_ButtStock,                  // 4
    WAT_Silencer                    // 5
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
        NewSMesh = StaticMesh(DynamicLoadObject(szMesh, Class'Engine.StaticMesh'));        
    }
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
        // End:0x8A
        case 1:
        // End:0xA7
        case 3:
            Owner.AttachToBone(self, 'Sight');
            // End:0xF1
            break;
        // End:0xCC
        case 2:
            Owner.AttachToBone(self, 'Dot');
            bUnlit = true;
            // End:0xF1
            break;
        // End:0xE9
        case 5:
            Owner.AttachToBone(self, 'Silencer');
            // End:0xF1
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
    // End:0x1A7
    if(Owner.IsA('wGun'))
    {
        switch(AcceType)
        {
            // End:0x184
            case 3:
                wGun(Owner).ScopeAttached(true);
                BaseStaticMesh = NewSMesh;
                Scope3DAimMesh = StaticMesh(DynamicLoadObject(szMesh $ "_Zoom", Class'Engine.StaticMesh'));
                // End:0x1A4
                break;
            // End:0x1A1
            case 5:
                wGun(Owner).SilencerAttached(true);
                // End:0x1A4
                break;
            // End:0xFFFF
            default:
                break;
        }        
    }
    else
    {
        // End:0x21A
        if(Owner.IsA('wFPWeaponAttachment'))
        {
            switch(AcceType)
            {
                // End:0x1F9
                case 3:
                    BaseStaticMesh = NewSMesh;
                    Scope3DAimMesh = StaticMesh(DynamicLoadObject(szMesh $ "_Zoom", Class'Engine.StaticMesh'));
                    // End:0x21A
                    break;
                // End:0x217
                case 5:
                    wFPWeaponAttachment(Owner).bSilencer = true;
                    // End:0x21A
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