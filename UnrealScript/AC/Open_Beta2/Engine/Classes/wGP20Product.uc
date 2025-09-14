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
