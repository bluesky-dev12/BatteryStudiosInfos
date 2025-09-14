/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIUserKeyBinding.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:1
 *
 *******************************************************************************/
class GUIUserKeyBinding extends GUI
    editinlinenew
    abstract
    instanced;

struct KeyInfo
{
    var string Alias;
    var string KeyLabel;
    var bool bIsSection;
};

var array<KeyInfo> KeyData;
