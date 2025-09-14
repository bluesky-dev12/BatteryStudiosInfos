/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UWeb\Classes\ImageServer.uc
 * Package Imports:
 *	UWeb
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class ImageServer extends WebApplication;

event Query(WebRequest Request, WebResponse Response)
{
    local string Image;

    Image = Request.URI;
    // End:0x62
    if(Right(Caps(Image), 4) == ".JPG" || Right(Caps(Image), 5) == ".JPEG")
    {
        Response.SendStandardHeaders("image/jpeg", true);
    }
    // End:0xe0
    else
    {
        // End:0x96
        if(Right(Caps(Image), 4) == ".GIF")
        {
            Response.SendStandardHeaders("image/gif", true);
        }
        // End:0xe0
        else
        {
            // End:0xca
            if(Right(Caps(Image), 4) == ".BMP")
            {
                Response.SendStandardHeaders("image/bmp", true);
            }
            // End:0xe0
            else
            {
                Response.HTTPError(404);
                return;
            }
        }
    }
    Response.IncludeBinaryFile(Path $ Image);
}
