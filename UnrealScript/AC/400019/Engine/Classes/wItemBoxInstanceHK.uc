class wItemBoxInstanceHK extends Object;

var wItemBoxCashHK cashItemInfo;
var int ItemID;
var BtrDouble UniqueID;
var int UniqueSkillID;
var BtrDouble UntilTime;
var BtrTime LeftTime;
var int Durability;
var int DamageDegree;
var int SlotPosition;
var int PartID;
var int ItemState;
var int OverlapCount;
var int PaintID;
var int TradeCount;
var int Extra;

function SetExtraValue(wItemBoxHK ItemInfo, int Value)
{
    // End:0x5C
    if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
    {
        LeftTime.Day = Value / 24;
        LeftTime.Hour = int(float(Value) % float(24));        
    }
    else
    {
        // End:0xA0
        if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
        {
            PartID = Value;
            Durability = 100000;            
        }
        else
        {
            // End:0xC0
            if(ItemInfo.CostType == 3)
            {
                OverlapCount = Value;
            }
        }
    }
    //return;    
}
