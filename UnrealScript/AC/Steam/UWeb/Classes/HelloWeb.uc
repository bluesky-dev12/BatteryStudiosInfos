/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UWeb\Classes\HelloWeb.uc
 * Package Imports:
 *	UWeb
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class HelloWeb extends WebApplication;

event Query(WebRequest Request, WebResponse Response)
{
    local int i;

    // End:0x4f
    if(Request.UserName != "test" || Request.Password != "test")
    {
        Response.FailAuthentication("HelloWeb");
        return;
    }
    switch(Request.URI)
    {
        // End:0x23e
        case "/form.html":
            Response.SendText("<form method=post action=submit.html>");
            Response.SendText("<input type=edit name=TestEdit>");
            Response.SendText("<p><select multiple name=selecter>");
            Response.SendText("<option value=\\"one\\">Number One");
            Response.SendText("<option value=\\"two\\">Number Two");
            Response.SendText("<option value=\\"three\\">Number Three");
            Response.SendText("<option value=\\"four\\">Number Four");
            Response.SendText("</select><p>");
            Response.SendText("<input type=submit name=Submit value=Submit>");
            Response.SendText("</form>");
            // End:0x4c1
            break;
        // End:0x368
        case "/submit.html":
            Response.SendText("Thanks for submitting the form.<br>");
            Response.SendText("TestEdit was \\"" $ Request.GetVariable("TestEdit") $ "\\"<p>");
            Response.SendText("You selected these items:<br>");
            i = Request.GetVariableCount("selecter") - 1;
            J0x315:
            // End:0x365 [While If]
            if(i >= 0)
            {
                Response.SendText("\\"" $ Request.GetVariableNumber("selecter", i) $ "\\"<br>");
                -- i;
                // This is an implied JumpToken; Continue!
                goto J0x315;
            }
            // End:0x4c1
            break;
        // End:0x428
        case "/include.html":
            Response.Subst("variable1", "This is variable 1");
            Response.Subst("variable2", "This is variable 2");
            Response.Subst("variable3", "This is variable 3");
            Response.IncludeUHTM("testinclude.html");
            // End:0x4c1
            break;
        // End:0xffff
        default:
            Response.SendText("Hello web!  The current level is " $ Level.Title);
            Response.SendText("<br>Click <a href=\\"form.html\\">this link</a> to go to a test form");
            // End:0x4c1 Break;
            break;
    }
}
