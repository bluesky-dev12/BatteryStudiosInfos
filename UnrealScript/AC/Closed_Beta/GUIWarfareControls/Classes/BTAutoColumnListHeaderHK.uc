class BTAutoColumnListHeaderHK extends Object;

enum AutoColumnType
{
    E_ACT_STRING,                   // 0
    E_ACT_INT,                      // 1
    E_ACT_FLOAT,                    // 2
    E_ACT_INT_TO_STRING,            // 3
    E_ACT_FLOAT_TO_STRING,          // 4
    E_ACT_INT_TO_IMAGE,             // 5
    E_ACT_FLOAT_TO_IMAGE,           // 6
    E_ACT_CUSTOM                    // 7
};

var() automated int ColumnIndex;
var() automated string ColumnName;
var() automated float ColumnPerc;
var() automated BTAutoColumnListHeaderHK.AutoColumnType ColumnType;
var array<Image> ColumnImageList;
var Image ColumnBackgroundImage;
//var delegate<IntToImageIndex> __IntToImageIndex__Delegate;
//var delegate<FloatToImageIndex> __FloatToImageIndex__Delegate;
//var delegate<IntToString> __IntToString__Delegate;
//var delegate<FloatToString> __FloatToString__Delegate;
//var delegate<CustomDraw> __CustomDraw__Delegate;

static function BTAutoColumnListHeaderHK MakeHeader(string CName, float cPerc, BTAutoColumnListHeaderHK.AutoColumnType ct)
{
    local BTAutoColumnListHeaderHK temp;

    temp = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK';
    temp.ColumnName = CName;
    temp.ColumnPerc = cPerc;
    temp.ColumnType = ct;
    return temp;
    //return;    
}

delegate int IntToImageIndex(int Input)
{
    return Input;
    //return;    
}

delegate int FloatToImageIndex(float Input)
{
    return int(Input);
    //return;    
}

delegate string IntToString(int Input)
{
    return string(Input);
    //return;    
}

delegate string FloatToString(float Input)
{
    return string(Input);
    //return;    
}

delegate CustomDraw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    //return;    
}

defaultproperties
{
    ColumnName="EmptyHK"
    ColumnPerc=1.0000000
}