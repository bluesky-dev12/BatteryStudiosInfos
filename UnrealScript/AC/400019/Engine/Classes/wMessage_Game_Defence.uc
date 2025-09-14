class wMessage_Game_Defence extends wMessage_Game
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string lsItemBuyOK;
var localized string lsItemBuyFaild;
var localized string lsItemNotBuy;
var localized string lsUsingCashItem;
var localized string lsCantCashItem;
var localized string lsRepairNuclear;
var int Code_ItemBuyOK;
var int Code_ItemBuyFaild;
var int Code_ItemNotBuy;
var int Code_ItemChangeWeapon1;
var int Code_ItemChangeWeapon2;
var int Code_ItemChangeWeapon3;
var int Code_ItemChangeWeapon4;
var int Code_ItemChangeWeapon5;
var int Code_ItemChangeWeapon6;
var int Code_DestroyNuclear;
var int Code_WaringNuclear;
var int Code_DestroyBarricade;
var int Code_AmmoCharger;
var int Code_UsingCashItemSlot1;
var int Code_UsingCashItemSlot2;
var int Code_CantUsing;
var int Code_RepairNuclear;
var string SoundBuyOK;
var string SoundNotBuy;
var string SoundDestroyNuclear;
var string SoundWarningNuclear;
var string SoundDestroyBarricade;
var string SoundAmmoCharger;
var string SoundCashItemSlot1;
var string SoundCashItemSlot2;
var string SoundCantCashItem;
var string SoundRepairNuclear;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo sRelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x15
        case default.Code_ItemBuyOK:
            return default.lsItemBuyOK;
        // End:0x23
        case default.Code_ItemBuyFaild:
            return default.lsItemBuyFaild;
        // End:0x31
        case default.Code_ItemNotBuy:
            return default.lsItemNotBuy;
        // End:0x39
        case default.Code_UsingCashItemSlot1:
        // End:0x47
        case default.Code_UsingCashItemSlot2:
            return default.lsUsingCashItem;
        // End:0x55
        case default.Code_CantUsing:
            return default.lsCantCashItem;
        // End:0x73
        case default.Code_RepairNuclear:
            return RelatedPRI_1.PlayerName $ default.lsRepairNuclear;
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    switch(Switch)
    {
        // End:0x2E
        case default.Code_ItemChangeWeapon1:
        // End:0x36
        case default.Code_ItemChangeWeapon2:
        // End:0x3E
        case default.Code_ItemChangeWeapon3:
        // End:0x46
        case default.Code_ItemChangeWeapon4:
        // End:0x4E
        case default.Code_ItemChangeWeapon5:
        // End:0x6D
        case default.Code_ItemChangeWeapon6:
            P.FmodClientPlaySound(default.SoundBuyOK);
            // End:0x18A
            break;
        // End:0x8C
        case default.Code_ItemNotBuy:
            P.FmodClientPlaySound(default.SoundNotBuy);
            // End:0x18A
            break;
        // End:0xAB
        case default.Code_DestroyNuclear:
            P.FmodClientPlaySound(default.SoundDestroyNuclear);
            // End:0x18A
            break;
        // End:0xCA
        case default.Code_WaringNuclear:
            P.FmodClientPlaySound(default.SoundWarningNuclear);
            // End:0x18A
            break;
        // End:0xE9
        case default.Code_DestroyBarricade:
            P.FmodClientPlaySound(default.SoundDestroyBarricade);
            // End:0x18A
            break;
        // End:0x108
        case default.Code_AmmoCharger:
            P.FmodClientPlaySound(default.SoundAmmoCharger);
            // End:0x18A
            break;
        // End:0x127
        case default.Code_UsingCashItemSlot1:
            P.FmodClientPlaySound(default.SoundCashItemSlot1);
            // End:0x18A
            break;
        // End:0x146
        case default.Code_UsingCashItemSlot2:
            P.FmodClientPlaySound(default.SoundCashItemSlot2);
            // End:0x18A
            break;
        // End:0x165
        case default.Code_CantUsing:
            P.FmodClientPlaySound(default.SoundCantCashItem);
            // End:0x18A
            break;
        // End:0x184
        case default.Code_RepairNuclear:
            P.FmodClientPlaySound(default.SoundRepairNuclear);
            // End:0x18A
            break;
        // End:0xFFFF
        default:
            // End:0x18A
            break;
            break;
    }
    //return;    
}

static function float GetLifeTime(int Switch)
{
    return super(LocalMessage).GetLifeTime(Switch);
    //return;    
}

static function bool GotoHud(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x0F
        case default.Code_DestroyNuclear:
        // End:0x17
        case default.Code_WaringNuclear:
        // End:0x1F
        case default.Code_DestroyBarricade:
        // End:0x29
        case default.Code_AmmoCharger:
            return false;
        // End:0xFFFF
        default:
            return true;
            break;
    }
    //return;    
}

static function bool GotoBTConsole(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x0F
        case default.Code_DestroyNuclear:
        // End:0x17
        case default.Code_WaringNuclear:
        // End:0x1F
        case default.Code_DestroyBarricade:
        // End:0x29
        case default.Code_AmmoCharger:
            return false;
        // End:0xFFFF
        default:
            return true;
            break;
    }
    //return;    
}

defaultproperties
{
    lsItemBuyOK="has been purchased."
    lsItemBuyFaild="Purchase was not complete."
    lsItemNotBuy="More points required to purchase."
    lsUsingCashItem="has been used."
    lsCantCashItem="cannot be used."
    lsRepairNuclear="has used Repair Nuclear Reactor."
    Code_ItemBuyOK=40001
    Code_ItemBuyFaild=40002
    Code_ItemNotBuy=40003
    Code_ItemChangeWeapon1=40004
    Code_ItemChangeWeapon2=40005
    Code_ItemChangeWeapon3=40006
    Code_ItemChangeWeapon4=40007
    Code_ItemChangeWeapon5=40008
    Code_ItemChangeWeapon6=40009
    Code_DestroyNuclear=40010
    Code_WaringNuclear=40011
    Code_DestroyBarricade=40012
    Code_AmmoCharger=40013
    Code_UsingCashItemSlot1=40014
    Code_UsingCashItemSlot2=40015
    Code_CantUsing=40101
    Code_RepairNuclear=40102
    SoundBuyOK="Warfare_Sound_Defense_Mode/UI/buyitem"
    SoundNotBuy="Warfare_Sound_Defense_Mode/UI/buyfail"
    SoundDestroyNuclear="Warfare_Sound_Defense_Mode/Object/bombing"
    SoundWarningNuclear="Warfare_Sound_Defense_Mode/UI/warning"
    SoundDestroyBarricade="Warfare_Sound_Defense_Mode/Object/bombing"
    SoundAmmoCharger="Warfare_Sound_Defense_Mode/object/ammocharger"
    SoundCashItemSlot1="Warfare_Sound_Defense_Mode/UI/buyitem"
    SoundCashItemSlot2="Warfare_Sound_Defense_Mode/UI/buyitem"
    SoundCantCashItem="Warfare_Sound_Defense_Mode/UI/buyfail"
    SoundRepairNuclear="Warfare_Sound_Defense_Mode/object/ammocharger"
    bIsPartiallyUnique=true
    Lifetime=3
    DrawColor=(R=255,G=255,B=255,A=255)
    StackMode=0
    FontSize=22
}