/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wAdminConfigBase.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class wAdminConfigBase extends wAdminBase;

static function bool Load(wAdminUserList Users, wAdminGroupList Groups, bool bDontAddDefaultAdmin);
static function bool Save(wAdminUserList Users, wAdminGroupList Groups);
