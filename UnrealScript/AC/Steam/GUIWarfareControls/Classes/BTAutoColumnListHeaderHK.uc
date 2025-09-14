/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTAutoColumnListHeaderHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:11
 *	Functions:6
 *
 *******************************************************************************/
class BTAutoColumnListHeaderHK extends Object;

enum AutoColumnType
{
    E_ACT_STRING,
    E_ACT_INT,
    E_ACT_FLOAT,
    E_ACT_INT_TO_STRING,
    E_ACT_FLOAT_TO_STRING,
    E_ACT_INT_TO_IMAGE,
    E_ACT_FLOAT_TO_IMAGE,
    E_ACT_CUSTOM
};

var() /*0x00000000-0x80000000*/ databinding editinlinenotify int ColumnIndex;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify string ColumnName;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify float ColumnPerc;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify BTAutoColumnListHeaderHK.AutoColumnType ColumnType;
var array<Image> ColumnImageList;
var Image ColumnBackgroundImage;
var delegate<IntToImageIndex> __IntToImageIndex__Delegate;
var delegate<FloatToImageIndex> __FloatToImageIndex__Delegate;
var delegate<IntToString> __IntToString__Delegate;
var delegate<FloatToString> __FloatToString__Delegate;
var delegate<CustomDraw> __CustomDraw__Delegate;

static function BTAutoColumnListHeaderHK MakeHeader(string CName, float cPerc, BTAutoColumnListHeaderHK.AutoColumnType ct)
{
    local BTAutoColumnListHeaderHK temp;

    temp = new class'BTAutoColumnListHeaderHK';
    temp.ColumnName = CName;
    temp.ColumnPerc = cPerc;
    temp.ColumnType = ct;
    return temp;
}

delegate int IntToImageIndex(int Input)
{
    return Input;
}

delegate int FloatToImageIndex(float Input)
{
    return int(Input);
}

delegate string IntToString(int Input)
{
    return string(Input);
}

delegate string FloatToString(float Input)
{
    return string(Input);
}

delegate CustomDraw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row);

defaultproperties
{
    ColumnName="EmptyHK"
    ColumnPerc=1.0
}