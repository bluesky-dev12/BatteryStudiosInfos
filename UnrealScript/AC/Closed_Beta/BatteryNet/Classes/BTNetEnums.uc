class BTNetEnums extends Object;

enum SLOT_POS
{
    SLOT_POS_MAIN_WEAPON,           // 0
    SLOT_POS_SUB_WEAPON,            // 1
    SLOT_POS_THROW_WEAPON1,         // 2
    SLOT_POS_THROW_WEAPON2,         // 3
    SLOT_POS_QUICK_MAIN_WEAPON1,    // 4
    SLOT_POS_QUICK_MAIN_WEAPON2,    // 5
    SLOT_POS_QUICK_MAIN_WEAPON3,    // 6
    SLOT_POS_QUICK_SUB_WEAPON1,     // 7
    SLOT_POS_QUICK_SUB_WEAPON2,     // 8
    SLOT_POS_QUICK_SUB_WEAPON3,     // 9
    SLOT_POS_QUICK_THROW_WEAPON1,   // 10
    SLOT_POS_QUICK_THROW_WEAPON2,   // 11
    SLOT_POS_QUICK_THROW_WEAPON3,   // 12
    SLOT_POS_INVEN,                 // 13
    SLOT_POS_SKILL1,                // 14
    SLOT_POS_SKILL2,                // 15
    SLOT_POS_SKILL3,                // 16
    SLOT_POS_SKILL4,                // 17
    SLOT_HELMET,                    // 18
    SLOT_FACE,                      // 19
    SLOT_FACE_ACCESSORY,            // 20
    SLOT_SPECIAL_CHAR_AF,           // 21
    SLOT_SPECIAL_CHAR_RSA,          // 22
    SLOT_SPECIAL_LEVEL_MARK,        // 23
    SLOT_POS_END                    // 24
};

enum ITEM_TYPE
{
    ITEM_TYPE_HEAD,                 // 0
    ITEM_TYPE_FACE,                 // 1
    ITEM_TYPE_BODY,                 // 2
    ITEM_TYPE_UNIFORM,              // 3
    ITEM_TYPE_PISTOL,               // 4
    ITEM_TYPE_RIFLE,                // 5
    ITEM_TYPE_SMG,                  // 6
    ITEM_TYPE_SNIPER,               // 7
    ITEM_TYPE_HEAVY,                // 8
    ITEM_TYPE_BOMB,                 // 9
    ITEM_TYPE_DOTSIGHT,             // 10
    ITEM_TYPE_SCOPE,                // 11
    ITEM_TYPE_BARREL,               // 12
    ITEM_TYPE_SLIENCER,             // 13
    ITEM_TYPE_STOCK,                // 14
    ITEM_TYPE_HEALTH,               // 15
    ITEM_TYPE_ETC,                  // 16
    ITEM_TYPE_NULL                  // 17
};

enum EItemType
{
    ITYPE_Pistol,                   // 0
    ITYPE_AR,                       // 1
    ITYPE_SMG,                      // 2
    ITYPE_SR,                       // 3
    ITYPE_HW,                       // 4
    ITYPE_TW,                       // 5
    ITYPE_Bomb,                     // 6
    ITYPE_SPW,                      // 7
    ITYPE_Meele,                    // 8
    ITYPE_Body,                     // 9
    ITYPE_Head,                     // 10
    ITYPE_Face,                     // 11
    ITYPE_Accessory,                // 12
    ITYPE_Backpack,                 // 13
    ITYPE_SpChar,                   // 14
    ITYPE_Part_Sight,               // 15
    ITYPE_Part_Silencer,            // 16
    ITYPE_Part_Camo,                // 17
    ITYPE_Part_Paint,               // 18
    ITYPE_Cash,                     // 19
    ITYPE_ETC,                      // 20
    ITYPE_Supply,                   // 21
    ITYPE_Skill,                    // 22
    ITYPE_Part_Scope,               // 23
    ITYPE_Helmet,                   // 24
    ITYPE_Passive,                  // 25
    ITYPE_ItemBox,                  // 26
    ITYPE_None                      // 27
};

function bool IsWeapon(byte ItemType)
{
    // End:0x5D
    if(((((int(ItemType) == int(0)) || int(ItemType) == int(1)) || int(ItemType) == int(2)) || int(ItemType) == int(3)) || int(ItemType) == int(5))
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}
