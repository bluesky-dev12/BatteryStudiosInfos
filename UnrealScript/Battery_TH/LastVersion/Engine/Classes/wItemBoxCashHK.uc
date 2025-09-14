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
var bool UseDescription;
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
var int WZOriginalCashPrice[8];
var int WZStoreSeq;
var int WZStoreItemSeq;
var int WZStoreItemType;
var int ProductCount;
var bool EnablePCoin;
var bool EnableCCoin;
var BtrDouble SaleEndTime;
var bool IsDiscount;

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

    saleEnd = CheckSaleEndTime(clientTime, gp20Product.SaleEndTime, gp20Product);
    canBuy = false;
    // End:0xAA
    if(!saleEnd)
    {
        i = 0;
        J0x3F:

        // End:0xAA [Loop If]
        if(i < gp20Product.SaleStatus.Length)
        {
            canBuy = (gp20Product.SaleStatus[i] == 10) || gp20Product.SaleStatus[i] == 11;
            // End:0xA0
            if(canBuy)
            {
                // [Explicit Break]
                goto J0xAA;
            }
            i++;
            // [Loop Continue]
            goto J0x3F;
        }
    }
    J0xAA:

    return canBuy;
    //return;    
}

static function bool IsShowStore(BtrDouble clientTime, wGP20Product gp20Product)
{
    local bool bShowStore, saleEnd;
    local int i;
    local BtrTime productTime;

    gp20Product.BtrDoubleToBtrTime(gp20Product.SaleEndTime, productTime);
    Log((((((((((("ProductCode :" @ string(gp20Product.ProductNo[0])) @ "Product Time : ") @ string(productTime.Year)) $ "/") $ string(productTime.Month)) $ "/") $ string(productTime.Day)) $ "/") $ string(productTime.Hour)) $ "/") $ string(productTime.Minute));
    saleEnd = CheckSaleEndTime(clientTime, gp20Product.SaleEndTime, gp20Product);
    bShowStore = false;
    // End:0x141
    if(!saleEnd)
    {
        i = 0;
        J0xF3:

        // End:0x141 [Loop If]
        if(i < gp20Product.SaleStatus.Length)
        {
            bShowStore = gp20Product.SaleStatus[i] == 10;
            // End:0x137
            if(bShowStore)
            {
                // [Explicit Break]
                goto J0x141;
            }
            i++;
            // [Loop Continue]
            goto J0xF3;
        }
    }
    J0x141:

    return bShowStore;
    //return;    
}

static function bool CheckSaleEndTime(BtrDouble clientTime, BtrDouble saleTime, Object tempObj)
{
    local bool saleEnd;

    saleEnd = false;
    // End:0x4E
    if((saleTime.dummy_1_DO_NOT_USE != 0) || saleTime.dummy_2_DO_NOT_USE != 0)
    {
        // End:0x4E
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

    // End:0x24
    if(UseGP20())
    {
        saleEnd = CheckSaleEndTime(clientTime, SaleEndTime, self);        
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
    local bool haveCost, canBuy, disCountPrice;

    costIndex = 0;
    WZItemName = gp20Product.ProductName;
    WZPurchaseType = 1;
    bWZPackage = false;
    bWZCanBuy = false;
    bWZCanGift = false;
    EnablePCoin = false;
    EnableCCoin = false;
    UseDescription = false;
    WZPackageSeq = 0;
    // End:0x9A
    if(gp20Product.PackageInfo != none)
    {
        UseDescription = true;
        bWZPackage = true;
        WZItemDescription = gp20Product.PackageInfo.PackageDescription;
    }
    j = 0;
    J0xA1:

    // End:0xEB [Loop If]
    if(j < 8)
    {
        WZCashPrice[j] = 0;
        WZPriceSeq[j] = 0;
        WZPeriod[j] = 0;
        WZOriginalCashPrice[j] = 0;
        j++;
        // [Loop Continue]
        goto J0xA1;
    }
    j = 0;
    J0xF2:

    // End:0x36C [Loop If]
    if(j < gp20Product.ProductCost.Length)
    {
        canBuy = (gp20Product.SaleStatus[j] == 10) || gp20Product.SaleStatus[j] == 11;
        // End:0x155
        if(!canBuy)
        {
            // [Explicit Continue]
            goto J0x362;
        }
        // End:0x185
        if((checkCoinType != 0) && checkCoinType != int(gp20Product.SaleType[j]))
        {
            // [Explicit Continue]
            goto J0x362;
        }
        // End:0x1AC
        if(gp20Product.IsDiscount(j))
        {
            IsDiscount = true;
            disCountPrice = true;
        }
        useCost = gp20Product.GetPrice(j);
        haveCost = false;
        k = 0;
        J0x1D5:

        // End:0x20B [Loop If]
        if(k < 8)
        {
            // End:0x201
            if(WZCashPrice[k] == useCost)
            {
                haveCost = true;
                // [Explicit Break]
                goto J0x20B;
            }
            k++;
            // [Loop Continue]
            goto J0x1D5;
        }
        J0x20B:

        // End:0x2E3
        if(!haveCost)
        {
            WZOriginalCashPrice[costIndex] = gp20Product.ProductCost[j];
            WZCashPrice[costIndex] = useCost;
            WZPriceSeq[costIndex] = gp20Product.ProductNo[j];
            // End:0x2BC
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
        // End:0x30B
        if(int(gp20Product.SaleType[j]) == 2)
        {
            EnablePCoin = true;            
        }
        else
        {
            // End:0x32F
            if(int(gp20Product.SaleType[j]) == 1)
            {
                EnableCCoin = true;
            }
        }
        // End:0x340
        if(canBuy)
        {
            bWZCanBuy = true;
        }
        // End:0x362
        if(gp20Product.IsGift[j] == 1)
        {
            bWZCanGift = true;
        }
        J0x362:

        j++;
        // [Loop Continue]
        goto J0xF2;
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

function bool CanGift()
{
    return false;
    return bWZCanGift;
    //return;    
}
