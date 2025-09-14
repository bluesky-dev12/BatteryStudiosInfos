/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\STY_ListSelection.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class STY_ListSelection extends GUIStyles
    instanced;

event Initialize()
{
    local int i;

    super.Initialize();
    i = 0;
    J0x0d:
    // End:0x3f [While If]
    if(i < 5)
    {
        Images[i] = Controller.DefaultPens[0];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

defaultproperties
{
    KeyName="ListSelection"
    FontNames[10]="UT2HeaderFont"
    FontNames[11]="UT2HeaderFont"
    FontNames[12]="UT2HeaderFont"
    FontNames[13]="UT2HeaderFont"
    FontNames[14]="UT2HeaderFont"
    FontColors[0]=(R=64,G=64,B=128,A=255)
    FontColors[1]=(R=64,G=64,B=128,A=255)
    FontColors[2]=(R=64,G=64,B=128,A=255)
    FontColors[3]=(R=64,G=64,B=128,A=255)
    FontColors[4]=(R=64,G=64,B=128,A=255)
}