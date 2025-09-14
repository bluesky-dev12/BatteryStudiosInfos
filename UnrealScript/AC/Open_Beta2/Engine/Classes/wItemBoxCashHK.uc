class wItemBoxCashHK extends Object;

const CASH_PRICE_COUNT = 8;
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
var int WZPackageSeq;
var int WZCategorySeq;
var int WZPeriod[8];
var int WZCashPrice[8];
var int WZPriceSeq[8];
var int WZStoreSeq;
var int WZStoreItemSeq;
var int WZStoreItemType;
var int ProductCount;
var bool EnablePCoin;
var bool EnableCCoin;
var BtrDouble SaleEndTime;

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

static function bool IsCanBuy(BtrDouble clientTime, wGP20Product gp20Product)
{
    local bool canBuy, saleEnd;
    local int i;

    saleEnd = CheckSaleEndTime(clientTime, gp20Product.SaleEndTime);
    canBuy = false;
    // End:0xA5
    if(!saleEnd)
    {
        i = 0;
        J0x3A:

        // End:0xA5 [Loop If]
        if(i < gp20Product.SaleStatus.Length)
        {
            canBuy = (gp20Product.SaleStatus[i] == 10) || gp20Product.SaleStatus[i] == 11;
            // End:0x9B
            if(canBuy)
            {
                // [Explicit Break]
                goto J0xA5;
            }
            i++;
            // [Loop Continue]
            goto J0x3A;
        }
    }
    J0xA5:

    return canBuy;
    //return;    
}

static function bool IsShowStore(BtrDouble clientTime, wGP20Product gp20Product)
{
    local Object tempObj;
    local bool bShowStore, saleEnd;
    local int i;
    local BtrTime productTime;

    tempObj = new Class'Core.Object';
    tempObj.BtrDoubleToBtrTime(gp20Product.SaleEndTime, productTime);
    Log((((((((((("ProductCode :" @ string(gp20Product.ProductNo[0])) @ "Product Time : ") @ string(productTime.Year)) $ "/") $ string(productTime.Month)) $ "/") $ string(productTime.Day)) $ "/") $ string(productTime.Hour)) $ "/") $ string(productTime.Minute));
    saleEnd = CheckSaleEndTime(clientTime, gp20Product.SaleEndTime);
    bShowStore = false;
    // End:0x14B
    if(!saleEnd)
    {
        i = 0;
        J0xFD:

        // End:0x14B [Loop If]
        if(i < gp20Product.SaleStatus.Length)
        {
            bShowStore = gp20Product.SaleStatus[i] == 10;
            // End:0x141
            if(bShowStore)
            {
                // [Explicit Break]
                goto J0x14B;
            }
            i++;
            // [Loop Continue]
            goto J0xFD;
        }
    }
    J0x14B:

    return bShowStore;
    //return;    
}

static function bool CheckSaleEndTime(BtrDouble clientTime, BtrDouble saleTime)
{
    local bool saleEnd;
    local Object tempObj;

    tempObj = new Class'Core.Object';
    saleEnd = false;
    // End:0x5D
    if((saleTime.dummy_1_DO_NOT_USE != 0) || saleTime.dummy_2_DO_NOT_USE != 0)
    {
        // End:0x5D
        if(tempObj.BtrDoubleLessEqual(saleTime, clientTime))
        {
            saleEnd = true;
        }
    }
    return saleEnd;
    //return;    
}

function bool CheckSaleEnd(BtrDouble clientTime)
{
    local bool saleEnd;

    // End:0x23
    if(UseGP20())
    {
        saleEnd = CheckSaleEndTime(clientTime, SaleEndTime);        
    }
    else
    {
        saleEnd = false;
    }
    return saleEnd;
    //return;    
}

function SetCashItemInfoGP20(wItemBoxHK ItemInfo, wGP20Product gp20Product, int checkCoinType)
{
    local int j, k, costIndex, useCost;
    local bool haveCost, canBuy;

    costIndex = 0;
    WZItemName = gp20Product.ProductName;
    WZPurchaseType = 1;
    bWZPackage = false;
    bWZCanBuy = false;
    bWZCanGift = false;
    WZPackageSeq = 0;
    j = 0;
    J0x48:

    // End:0x85 [Loop If]
    if(j < 8)
    {
        WZCashPrice[j] = 0;
        WZPriceSeq[j] = 0;
        WZPeriod[j] = 0;
        j++;
        // [Loop Continue]
        goto J0x48;
    }
    j = 0;
    J0x8C:

    // End:0x2F6 [Loop If]
    if(j < gp20Product.ProductCost.Length)
    {
        canBuy = (gp20Product.SaleStatus[j] == 10) || gp20Product.SaleStatus[j] == 11;
        // End:0xEF
        if(!canBuy)
        {
            // [Explicit Continue]
            goto J0x2EC;
        }
        // End:0x11F
        if((checkCoinType != 0) && checkCoinType != int(gp20Product.SaleType[j]))
        {
            // [Explicit Continue]
            goto J0x2EC;
        }
        // End:0x156
        if(gp20Product.ProductDiscountCost[j] == 0)
        {
            useCost = gp20Product.ProductCost[j];            
        }
        else
        {
            useCost = gp20Product.ProductDiscountCost[j];
        }
        haveCost = false;
        k = 0;
        J0x17F:

        // End:0x1B5 [Loop If]
        if(k < 8)
        {
            // End:0x1AB
            if(WZCashPrice[k] == useCost)
            {
                haveCost = true;
                // [Explicit Break]
                goto J0x1B5;
            }
            k++;
            // [Loop Continue]
            goto J0x17F;
        }
        J0x1B5:

        // End:0x26D
        if(!haveCost)
        {
            WZCashPrice[costIndex] = useCost;
            WZPriceSeq[costIndex] = gp20Product.ProductNo[j];
            // End:0x246
            if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
            {
                WZPeriod[costIndex] = gp20Product.ProductHour[j] * 3600;                
            }
            else
            {
                WZPeriod[costIndex] = gp20Product.ProductQuantity[j];
            }
            ++costIndex;
        }
        // End:0x295
        if(int(gp20Product.SaleType[j]) == 2)
        {
            EnablePCoin = true;            
        }
        else
        {
            // End:0x2B9
            if(int(gp20Product.SaleType[j]) == 1)
            {
                EnableCCoin = true;
            }
        }
        // End:0x2CA
        if(canBuy)
        {
            bWZCanBuy = true;
        }
        // End:0x2EC
        if(gp20Product.IsGift[j] == 1)
        {
            bWZCanGift = true;
        }
        J0x2EC:

        j++;
        // [Loop Continue]
        goto J0x8C;
    }
    SaleEndTime = gp20Product.SaleEndTime;
    //return;    
}

function SetCashItemInfoWZ(out wItemBoxHK ItemInfo, WebzenShopPackage WZShopPackage)
{
    local int j;

    WZItemName = WZShopPackage.PackageName;
    WZPurchaseType = 1;
    WZItemDescription = WZShopPackage.ItemDesc;
    bWZPackage = false;
    Log("WZItemName=" $ WZItemName);
    // End:0x26B
    if(WZShopPackage.PriceList.Length > 0)
    {
        Log("WZShopPackage.PriceList[0].PropertySeq=" $ string(WZShopPackage.PriceList[0].PropertySeq));
        // End:0x17F
        if(WZShopPackage.PriceList[0].PropertySeq == 7)
        {
            j = 0;
            J0xB5:

            // End:0x137 [Loop If]
            if(j < WZShopPackage.PriceList.Length)
            {
                WZPeriod[j] = WZShopPackage.PriceList[j].Value;
                WZCashPrice[j] = WZShopPackage.PriceList[j].Price;
                WZPriceSeq[j] = WZShopPackage.PriceList[j].PriceSeq;
                j++;
                // [Loop Continue]
                goto J0xB5;
            }
            j = j;
            J0x142:

            // End:0x17F [Loop If]
            if(j < 8)
            {
                WZPeriod[j] = 0;
                WZCashPrice[j] = 0;
                WZPriceSeq[j] = 0;
                j++;
                // [Loop Continue]
                goto J0x142;
            }
        }
        // End:0x268
        if(WZShopPackage.PriceList[0].PropertySeq == 10)
        {
            j = 0;
            J0x19E:

            // End:0x220 [Loop If]
            if(j < WZShopPackage.PriceList.Length)
            {
                WZPeriod[j] = WZShopPackage.PriceList[j].Value;
                WZCashPrice[j] = WZShopPackage.PriceList[j].Price;
                WZPriceSeq[j] = WZShopPackage.PriceList[j].PriceSeq;
                j++;
                // [Loop Continue]
                goto J0x19E;
            }
            j = j;
            J0x22B:

            // End:0x268 [Loop If]
            if(j < 8)
            {
                WZPeriod[j] = 0;
                WZCashPrice[j] = 0;
                WZPriceSeq[j] = 0;
                j++;
                // [Loop Continue]
                goto J0x22B;
            }
        }        
    }
    else
    {
        // End:0x284
        if(WZShopPackage.ProductList.Length >= 1)
        {
            bWZPackage = true;
        }
        j = 0;
        J0x28B:

        // End:0x2BB [Loop If]
        if(j < 8)
        {
            WZPeriod[j] = 0;
            WZCashPrice[j] = 0;
            j++;
            // [Loop Continue]
            goto J0x28B;
        }
        WZPeriod[0] = 1;
        WZCashPrice[0] = WZShopPackage.CashPrice;
        WZPriceSeq[0] = 0;
    }
    WZLeftCount = WZShopPackage.LeftCount;
    // End:0x30B
    if(WZShopPackage.SalesFlag == 182)
    {
        bWZCanBuy = true;        
    }
    else
    {
        bWZCanBuy = false;
    }
    // End:0x32F
    if(WZShopPackage.GiftFlag == 184)
    {
        bWZCanGift = true;        
    }
    else
    {
        bWZCanGift = false;
    }
    // End:0x353
    if(WZShopPackage.CapsuleFlag == 176)
    {
        bWZCapsuleItem = true;        
    }
    else
    {
        bWZCapsuleItem = false;
    }
    // End:0x383
    if(WZShopPackage.ImageTagType == 680)
    {
        ItemInfo.AdType = 3;        
    }
    else
    {
        // End:0x3A8
        if(WZShopPackage.ImageTagType == 681)
        {
            ItemInfo.AdType = 4;
        }
    }
    WZPackageType = WZShopPackage.PackageType;
    WZPackageSeq = WZShopPackage.PackageSeq;
    WZCategorySeq = WZShopPackage.CategorySeq;
    //return;    
}
