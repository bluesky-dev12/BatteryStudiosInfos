/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wItemResourceParam.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:25
 *
 *******************************************************************************/
class wItemResourceParam extends Object
    native;

var int iItemResourceID;
var string strResName;
var string strRes_1st;
var string strRes_3rd;
var string strRes_Icon;
var string strHaveDotName;
var string strRes_3rd_AF_Backpack;
var string strRes_3rd_AF_Gore;
var string strRes_3rd_AF_Gore_Static;
var string strRes_1st_RSA;
var string strRes_3rd_RSA;
var string strRes_3rd_RSA_Backpack;
var string strRes_3rd_RSA_Gore;
var string strRes_3rd_RSA_Gore_Static;
var Mesh mesh_Base_1st;
var Mesh mesh_Base_3rd;
var Mesh mesh_Base_1st_RSA;
var Mesh mesh_Base_3rd_RSA;
var Mesh mesh_AF_Backpack;
var Mesh mesh_RSA_Backpack;
var StaticMesh stmesh_Base_1st;
var StaticMesh stmesh_Base_3rd;
var StaticMesh stmesh_Base_1st_RSA;
var StaticMesh stmesh_Base_3rd_RSA;
var string Resource_UI_Weapon_Ani;

defaultproperties
{
    iItemResourceID=-1
    strResName="-"
    strRes_1st="-"
    strRes_3rd="-"
    strRes_Icon="-"
    strHaveDotName="-"
    strRes_3rd_AF_Backpack="-"
    strRes_3rd_AF_Gore="-"
    strRes_1st_RSA="-"
    strRes_3rd_RSA="-"
    strRes_3rd_RSA_Backpack="-"
    strRes_3rd_RSA_Gore="-"
}