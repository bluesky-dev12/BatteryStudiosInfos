/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWebAdmin\Classes\UT2K3Stats.uc
 * Package Imports:
 *	XWebAdmin
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:3
 *
 *******************************************************************************/
class UT2K3Stats extends WebSkin;

var int i;
var bool bMutQuery;
var bool bRuleQuery;
var bool bFull;
var bool bRegLine;
var bool bAltLine;

function bool HandleSpecialQuery(WebRequest Request, WebResponse Response)
{
    bMutQuery = Mid(Request.URI, 1) == "current_mutators";
    bRuleQuery = Mid(Request.URI, 1) == "defaults_rules";
    return false;
}

function string HandleWebInclude(WebResponse Response, string Page)
{
    // End:0x1b
    if(!bMutQuery && !bRuleQuery)
    {
        return "";
    }
    // End:0x99
    if(Left(Page, 5) != "cell_" && Page != "current_mutators_group" && Page != "current_mutators_group_row" && Page != "defaults_row")
    {
        return "";
    }
    // End:0x17b
    if(Page == "current_mutators_group" || Page == "current_mutators_group_row" || Page == "defaults_row")
    {
        // End:0x136
        if(bFull)
        {
            bAltLine = false;
            bRegLine = false;
            Response.Subst("CellClass", "n");
        }
        // End:0x166
        else
        {
            bAltLine = true;
            bRegLine = true;
            Response.Subst("CellClass", "nabg");
        }
        bFull = !bFull;
        return "";
    }
    // End:0x1fc
    else
    {
        // End:0x1c0
        if(bRegLine)
        {
            Response.Subst("CellClass", "n");
            // End:0x1b5
            if(bAltLine)
            {
                bAltLine = false;
            }
            // End:0x1bd
            else
            {
                bRegLine = false;
            }
        }
        // End:0x1fc
        else
        {
            Response.Subst("CellClass", "nabg");
            // End:0x1f4
            if(bAltLine)
            {
                bRegLine = true;
            }
            // End:0x1fc
            else
            {
                bAltLine = true;
            }
        }
    }
    return "";
}

function bool HandleHTM(WebResponse Response, string Page)
{
    // End:0x37
    if(Page ~= "current_mutators")
    {
        bMutQuery = false;
        bRegLine = false;
        bAltLine = false;
    }
    // End:0x57
    else
    {
        // End:0x57
        if(Page ~= "defaults_row")
        {
            bRuleQuery = false;
        }
    }
    return false;
}

defaultproperties
{
    SubPath="UT2K3Stats"
    DisplayName="UT2K3 Stats"
    SkinCSS="ut2003stats.css"
    SpecialQuery=// Object reference not set to an instance of an object.
    
}