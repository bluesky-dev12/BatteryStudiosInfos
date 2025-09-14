class wItemBaseParam extends Object
    native;

var wGameManager.EItemType eType;
var wGameManager.EItemGrade eGrade;
var string strGradeDisplay;
var int iItemID;
var string strDisplayName;
var int iResourceID;
var int iShopDisplayOrder;
var int iInvenDisplayOrder;
var int iEquipLevel;
var int iEquipTeam;
var wGameManager.EEquipSlot EEquipSlot;
var bool bOverlap;
var string strAddPartGroupID;
var string strPaintingGroupID;
var string strAddOption[2];
var string strOptionValue[2];
var wGameManager.ECastType ECastType;
var int iRepairCost;
var byte byDurabilityWeight;
var int iAdType;
var bool bSell;
var int iSellingPrice;
var int iPeriodNum[5];
var int iCashPrice[5];
var int iPointPrice[5];
var int iDBRemainTime;
var int iDBAddPartID;
var int iDBDurability;
var int iDBImpair;
var int iDBEquipUpgrade;
var bool bAuction;
var int iAuctionMaxPrice;
var int iAuctionMinPrice;
var string strDescription;
var int start_ammo;
var int clip_size;
var byte ui_damage;
var byte ui_spread;
var byte ui_view_kick;
var byte ui_rate_of_fire;
var byte ui_move;
var byte ui_range;
var int iResourceArrayIndex;

defaultproperties
{
    eType=20
    eGrade=16
    iItemID=-1
    iResourceID=-1
    iEquipLevel=99999
    EEquipSlot=10
    strAddPartGroupID="NULL DATA"
    strAddOption[0]="NULL DATA"
    strAddOption[1]="NULL DATA"
    strOptionValue[0]="NULL DATA"
    strOptionValue[1]="NULL DATA"
    ECastType=4
    iRepairCost=99999
    iPeriodNum[0]=99999
    iPeriodNum[1]=99999
    iPeriodNum[2]=99999
    iPeriodNum[3]=99999
    iPeriodNum[4]=99999
    iCashPrice[0]=99999
    iCashPrice[1]=99999
    iCashPrice[2]=99999
    iCashPrice[3]=99999
    iCashPrice[4]=99999
    iPointPrice[0]=99999
    iPointPrice[1]=99999
    iPointPrice[2]=99999
    iPointPrice[3]=99999
    iPointPrice[4]=99999
    iDBAddPartID=99999
    iDBEquipUpgrade=99999
}