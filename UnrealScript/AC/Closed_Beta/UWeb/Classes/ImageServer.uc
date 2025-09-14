class ImageServer extends WebApplication;

event Query(WebRequest Request, WebResponse Response)
{
    local string Image;

    Image = Request.URI;
    // End:0x62
    if((Right(Caps(Image), 4) == ".JPG") || Right(Caps(Image), 5) == ".JPEG")
    {
        Response.SendStandardHeaders("image/jpeg", true);        
    }
    else
    {
        // End:0x96
        if(Right(Caps(Image), 4) == ".GIF")
        {
            Response.SendStandardHeaders("image/gif", true);            
        }
        else
        {
            // End:0xCA
            if(Right(Caps(Image), 4) == ".BMP")
            {
                Response.SendStandardHeaders("image/bmp", true);                
            }
            else
            {
                Response.HTTPError(404);
                return;
            }
        }
    }
    Response.IncludeBinaryFile(Path $ Image);
    //return;    
}
