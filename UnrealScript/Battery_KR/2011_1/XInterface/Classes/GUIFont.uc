class GUIFont extends GUI
    abstract
    native
    editinlinenew
    instanced;

var(Menu) string KeyName;
var(Menu) bool bFixedSize;
var(Menu) bool bScaled;
var(Menu) int NormalXRes;
var(Menu) int FallBackRes;
var(Menu) array<string> FontArrayNames;
var(Menu) array<Font> FontArrayFonts;

// Export UGUIFont::execGetFont(FFrame&, void* const)
native event Font GetFont(int XRes)
{
    //native.XRes;        
}

static function Font LoadFontStatic(int i)
{
    return none;
    // End:0xA4
    if((i >= default.FontArrayFonts.Length) || default.FontArrayFonts[i] == none)
    {
        default.FontArrayFonts[i] = Font(DynamicLoadObject(default.FontArrayNames[i], Class'Engine.Font'));
        // End:0xA4
        if(default.FontArrayFonts[i] == none)
        {
            Log((("Warning: " $ string(default.Class)) $ " Couldn't dynamically load font ") $ default.FontArrayNames[i]);
        }
    }
    return default.FontArrayFonts[i];
    //return;    
}

function Font LoadFont(int i)
{
    return none;
    // End:0xA0
    if((i >= FontArrayFonts.Length) || FontArrayFonts[i] == none)
    {
        FontArrayFonts[i] = Font(DynamicLoadObject(FontArrayNames[i], Class'Engine.Font'));
        // End:0xA0
        if(FontArrayFonts[i] == none)
        {
            Log((("Warning: " $ string(self)) $ " Couldn't dynamically load font ") $ FontArrayNames[i]);
        }
    }
    return FontArrayFonts[i];
    //return;    
}
