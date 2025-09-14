/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XAdmin\Classes\xAdminCommandlet.uc
 * Package Imports:
 *	XAdmin
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class xAdminCommandlet extends Commandlet
    transient;

var AccessControlIni M;

event int Main(string Parms)
{
    M = new (none) class'AccessControlIni';
    return 0;
}
