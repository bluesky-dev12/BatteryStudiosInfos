/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTROModelHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Functions:13
 *
 *******************************************************************************/
class BTROModelHK extends RenderObject;

function Init();
function LoadSetModelData();
function SaveModelData();
function BeginModel();
function ChangeTeam(int TeamIndex);
function ChangeEquipItem(wMyPlayerStatus MyStatus);
function ChangeEquipItemByID(int iBodyID, int iFaceID, int iHelmetID, int iAccessoryID);
function ChangeWeapon(int weaponID, optional int AddPartID);
function EndModel();
function SetScaleModel(Vector scaleVector);
function bool Render(Canvas C, optional float Delta)
{
    return false;
}

function SetRotationLeft();
function SetRotationRight();
