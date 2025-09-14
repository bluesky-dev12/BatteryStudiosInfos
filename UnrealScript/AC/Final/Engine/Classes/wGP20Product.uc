class wGP20Product extends Object;

const kIISF_Disabled = -1;
const kIISF_Enabled = 0x00;
const kIISF_New = 0x01;
const kIISF_Event = 0x02;
const kIISF_Limited = 0x04;
const kIISF_Hot = 0x08;
const kIISF_Best = 0x10;
const kIISF_Reserved = 0x20;
const kIISF_Sales = 0x40;
const kIISF_All = 0x7F;

var array<int> ProductNo;
var array<int> ProductCost;
var array<int> ProductDiscountCost;
var array<int> ProductHour;
var array<int> ProductQuantity;
var array<byte> SaleType;
var array<int> SaleStatus;
var array<int> IsGift;
var string ProductName;
var int ProductCode;
var int SaleMasterFlag;
var BtrDouble SaleEndTime;
var wGP20Package PackageInfo;

function bool IsDiscount(int costNum)
{
    return ProductDiscountCost[costNum] != 0;
    //return;    
}

function int GetPrice(int costNum)
{
    // End:0x1A
    if(IsDiscount(costNum))
    {
        return ProductDiscountCost[costNum];
    }
    return ProductCost[costNum];
    //return;    
}

function bool HasPCoin()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x46 [Loop If]
    if(i < SaleType.Length)
    {
        // End:0x3C
        if(int(SaleType[i]) == int(Class'Engine_Decompressed.wItemBoxCashHK'.static.PCoinType()))
        {
            return true;
        }
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}
