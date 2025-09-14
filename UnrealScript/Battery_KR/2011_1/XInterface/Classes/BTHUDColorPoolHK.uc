class BTHUDColorPoolHK extends Object;

static function Color DefaultWhite()
{
    return Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
    //return;    
}

static function Color DefaultShadow()
{
    return Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 200);
    //return;    
}
