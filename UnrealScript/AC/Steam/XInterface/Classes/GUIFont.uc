/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIFont.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:3
 *
 *******************************************************************************/
class GUIFont extends GUI
    dependson(GUI)
    native
    editinlinenew
    abstract
    instanced;

var(Menu) string KeyName;
var(Menu) bool bFixedSize;
var(Menu) bool bScaled;
var(Menu) int NormalXRes;
var(Menu) int FallBackRes;
var(Menu) array<string> FontArrayNames;
var(Menu) array<Font> FontArrayFonts;

// Export UGUIFont::execGetFont(FFrame&, void* const)
native event Font GetFont(int XRes);
static function Font LoadFontStatic(int i)
{
    return none;
    // End:0xa4
    if(i >= default.FontArrayFonts.Length || default.FontArrayFonts[i] == none)
    {
        default.FontArrayFonts[i] = Font(DynamicLoadObject(default.FontArrayNames[i], class'Font'));
        // End:0xa4
        if(default.FontArrayFonts[i] == none)
        {
            Log("Warning: " $ string(default.Class) $ " Couldn't dynamically load font " $ default.FontArrayNames[i]);
        }
    }
    return default.FontArrayFonts[i];
}

function Font LoadFont(int i)
{
    return none;
    // End:0xa0
    if(i >= FontArrayFonts.Length || FontArrayFonts[i] == none)
    {
        FontArrayFonts[i] = Font(DynamicLoadObject(FontArrayNames[i], class'Font'));
        // End:0xa0
        if(FontArrayFonts[i] == none)
        {
            Log("Warning: " $ string(self) $ " Couldn't dynamically load font " $ FontArrayNames[i]);
        }
    }
    return FontArrayFonts[i];
}
