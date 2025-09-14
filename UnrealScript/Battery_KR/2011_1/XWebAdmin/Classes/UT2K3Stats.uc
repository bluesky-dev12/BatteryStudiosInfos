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
    //return;    
}

function string HandleWebInclude(WebResponse Response, string Page)
{
    // End:0x1B
    if(!bMutQuery && !bRuleQuery)
    {
        return "";
    }
    // End:0x99
    if((((Left(Page, 5) != "cell_") && Page != "current_mutators_group") && Page != "current_mutators_group_row") && Page != "defaults_row")
    {
        return "";
    }
    // End:0x17B
    if(((Page == "current_mutators_group") || Page == "current_mutators_group_row") || Page == "defaults_row")
    {
        // End:0x136
        if(bFull)
        {
            bAltLine = false;
            bRegLine = false;
            Response.Subst("CellClass", "n");            
        }
        else
        {
            bAltLine = true;
            bRegLine = true;
            Response.Subst("CellClass", "nabg");
        }
        bFull = !bFull;
        return "";        
    }
    else
    {
        // End:0x1C0
        if(bRegLine)
        {
            Response.Subst("CellClass", "n");
            // End:0x1B5
            if(bAltLine)
            {
                bAltLine = false;                
            }
            else
            {
                bRegLine = false;
            }            
        }
        else
        {
            Response.Subst("CellClass", "nabg");
            // End:0x1F4
            if(bAltLine)
            {
                bRegLine = true;                
            }
            else
            {
                bAltLine = true;
            }
        }
    }
    return "";
    //return;    
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
    else
    {
        // End:0x57
        if(Page ~= "defaults_row")
        {
            bRuleQuery = false;
        }
    }
    return false;
    //return;    
}

defaultproperties
{
    SubPath="UT2K3Stats"
    DisplayName="UT2K3 Stats"
    SkinCSS="ut2003stats.css"
    SpecialQuery[0]="current_mutators"
    SpecialQuery[1]="defaults_rules"
}