class xAdminCommandlet extends Commandlet
    transient;

var AccessControlIni M;

event int Main(string Parms)
{
    M = new (none) Class'XAdmin_Decompressed.AccessControlIni';
    return 0;
    //return;    
}
