class wItemBoxCashHK extends Object;

const kST_None = 0x00;
const kST_CCoin = 0x01;
const kST_PCoin = 0x02;
const kST_ComplexCoin = 0x03;
const kST_FlatRate = 0x04;
const kST_ETC = 0x05;
const kST_CCoinFlatRate = 0x06;
const kST_ComplexCoinFlatRate = 0x07;

var string WZItemName;
var int WZPurchaseType;
var string WZItemDescription;
var int WZLeftCount;
var string WZEndDate;
var bool bWZPackage;
var bool bWZCanBuy;
var bool bWZCanGift;
var bool bWZCapsuleItem;
var int WZPackageType;
var array<int> WZPackageSeq;
var int WZCategorySeq;
var int WZPeriod[5];
var int WZCashPrice[5];
var int WZPriceSeq[5];
var int WZStoreSeq;
var int WZStoreItemSeq;
var int WZStoreItemType;
var int ProductType;
var int ProductCount;
var bool EnablePCoin;
var bool EnableCCoin;

static function byte PCoinType()
{
    return 2;
    //return;    
}

static function byte CCoinType()
{
    return 1;
    //return;    
}

static function bool IsShowStore(GP20Product GP20Product)
{
    local bool bShowStore;
    local int i;

    bShowStore = false;
    i = 0;
    J0x0F:

    // End:0x55 [Loop If]
    if(i < GP20Product.SaleStatus.Length)
    {
        bShowStore = GP20Product.SaleStatus[i] == 10;
        // End:0x4B
        if(bShowStore)
        {
            // [Explicit Break]
            goto J0x55;
        }
        i++;
        // [Loop Continue]
        goto J0x0F;
    }
    J0x55:

    return bShowStore;
    //return;    
}

function SetProductType(string proType)
{
    switch(proType)
    {
        // End:0x1C
        case "ITT001":
            ProductType = 1;
            // End:0x6B
            break;
        // End:0x32
        case "ITT002":
            ProductType = 2;
            // End:0x6B
            break;
        // End:0x48
        case "ITT003":
            ProductType = 3;
            // End:0x6B
            break;
        // End:0x5E
        case "ITT004":
            ProductType = 4;
            // End:0x6B
            break;
        // End:0xFFFF
        default:
            ProductType = 0;
            // End:0x6B
            break;
            break;
    }
    //return;    
}

function SetCashItemInfo(wItemBoxHK ItemInfo, GP20Product GP20Product, string strEndDate)
{
    local int j, k, costIndex;
    local bool haveCost, canBuy;

    costIndex = 0;
    WZItemName = GP20Product.ProductName;
    WZPurchaseType = 1;
    SetProductType(GP20Product.ProductType);
    WZItemDescription = GP20Product.Description;
    bWZPackage = false;
    bWZCanBuy = false;
    bWZCanGift = false;
    j = 0;
    J0x5D:

    // End:0x254 [Loop If]
    if(j < GP20Product.ProductCost.Length)
    {
        canBuy = (GP20Product.SaleStatus[j] == 10) || GP20Product.SaleStatus[j] == 11;
        // End:0xB4
        if(!canBuy)
        {
            // [Explicit Continue]
            goto J0x24A;
        }
        WZPackageSeq[j] = GP20Product.ProductNo[j];
        haveCost = false;
        k = 0;
        J0xDF:

        // End:0x120 [Loop If]
        if(k < 5)
        {
            // End:0x116
            if(WZCashPrice[k] == GP20Product.ProductCost[j])
            {
                haveCost = true;
                // [Explicit Break]
                goto J0x120;
            }
            k++;
            // [Loop Continue]
            goto J0xDF;
        }
        J0x120:

        // End:0x1D7
        if(!haveCost)
        {
            WZCashPrice[costIndex] = GP20Product.ProductCost[j];
            WZPriceSeq[costIndex] = GP20Product.ProductCost[j];
            // End:0x1B4
            if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
            {
                WZPeriod[costIndex] = GP20Product.ProductHour[j] * 3600;                
            }
            else
            {
                WZPeriod[costIndex] = GP20Product.ProductQuantity[j];
            }
            ++costIndex;
        }
        // End:0x1FB
        if(int(GP20Product.SaleType[j]) == 2)
        {
            EnablePCoin = true;            
        }
        else
        {
            // End:0x21B
            if(int(GP20Product.SaleType[j]) == 1)
            {
                EnableCCoin = true;
            }
        }
        // End:0x22C
        if(canBuy)
        {
            bWZCanBuy = true;
        }
        // End:0x24A
        if(GP20Product.IsGift[j] == 1)
        {
            bWZCanGift = true;
        }
        J0x24A:

        j++;
        // [Loop Continue]
        goto J0x5D;
    }
    WZLeftCount = GP20Product.PurchaseAvailableQuantity;
    //return;    
}
