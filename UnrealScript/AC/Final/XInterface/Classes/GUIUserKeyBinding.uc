class GUIUserKeyBinding extends GUI
    abstract
    editinlinenew
    instanced;

struct KeyInfo
{
    var string Alias;
    var string KeyLabel;
    var bool bIsSection;
};

var array<KeyInfo> KeyData;
