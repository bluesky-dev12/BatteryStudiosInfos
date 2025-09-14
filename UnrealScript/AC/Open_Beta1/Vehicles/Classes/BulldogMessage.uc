class BulldogMessage extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string GetInMessage;
var localized string GetOutMessage;
var localized string TooManyCarsMessage;
var localized string FlipCarMessage;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x14
        case 0:
            return default.GetInMessage;
            // End:0x40
            break;
        // End:0x21
        case 1:
            return default.GetOutMessage;
            // End:0x40
            break;
        // End:0x2F
        case 2:
            return default.TooManyCarsMessage;
            // End:0x40
            break;
        // End:0x3D
        case 3:
            return default.FlipCarMessage;
            // End:0x40
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

defaultproperties
{
    GetInMessage="??? ?? [??]? ????."
    GetOutMessage="??? ?? [??]? ????."
    TooManyCarsMessage="??? ?? ????!"
    FlipCarMessage="??? ??? ???? ?????? [??]? ????."
    bIsUnique=true
    bFadeMessage=true
    bBeep=true
    Lifetime=6
    DrawColor=(R=128,G=128,B=255,A=255)
    StackMode=2
    PosY=0.1000000
}