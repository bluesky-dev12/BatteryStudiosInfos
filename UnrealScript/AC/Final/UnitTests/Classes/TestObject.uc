class TestObject extends UnitTest;

function string RunUnitTest(int SW)
{
    switch(SW)
    {
        // End:0x12
        case 0:
            return StrStartsWith_ShorterPrimaryStr_ReturnFalse();
        // End:0x1D
        case 1:
            return StrStartsWith_IndeedStartsWith_ReturnsTrue();
        // End:0x29
        case 2:
            return StrStartsWith_NotStartsWith_ReturnsFalse();
        // End:0xFFFF
        default:
            return "";
            break;
    }
    //return;    
}

function string StrStartsWith_ShorterPrimaryStr_ReturnFalse()
{
    return Check(!StrStartsWith("ab", "abc"), "StrStartsWith_ShorterPrimaryStr_ReturnFalse");
    //return;    
}

function string StrStartsWith_IndeedStartsWith_ReturnsTrue()
{
    return Check(StrStartsWith("qwer", "qw"), "StrStartsWith_IndeedStartsWith_ReturnsTrue");
    //return;    
}

function string StrStartsWith_NotStartsWith_ReturnsFalse()
{
    return Check(!StrStartsWith("qwer", "qa"), "StrStartsWith_NotStartsWith_ReturnsFalse");
    //return;    
}
