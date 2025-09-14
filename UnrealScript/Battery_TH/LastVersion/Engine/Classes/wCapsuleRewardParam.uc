class wCapsuleRewardParam extends Object
    native;

enum E_CAPSULE_REWARD_TYPE
{
    CRT_CAPSULE_BUY,                // 0
    CRT_COUPON,                     // 1
    CRT_NONE                        // 2
};

var int rewardType;
var int RewardUniqueIndex;
var int RewardNeedNum;
var int Reward_ID;

function SetRewardType(string _type)
{
    switch(_type)
    {
        // End:0x28
        case "Capsule_Buy_Num":
            rewardType = int(0);
            // End:0x54
            break;
        // End:0x44
        case "Coupon_Num":
            rewardType = int(1);
            // End:0x54
            break;
        // End:0xFFFF
        default:
            rewardType = int(2);
            // End:0x54
            break;
            break;
    }
    //return;    
}
