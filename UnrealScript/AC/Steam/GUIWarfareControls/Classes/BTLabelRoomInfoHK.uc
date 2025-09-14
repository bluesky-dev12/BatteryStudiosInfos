/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTLabelRoomInfoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:4
 *
 *******************************************************************************/
class BTLabelRoomInfoHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var BTTTRoomInfoHK tT;
var string MapName;
var Material MapImg;
var array<Material> supplyImg;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    supplyImg.Length = 3;
    tT = new class'BTTTRoomInfoHK';
    tT.Init();
    tT.BackgroundImage.Image = none;
}

function SetMapName(string MN)
{
    local array<wMapInfo> Maps;
    local wMapInfo mInfo;
    local int i, j;

    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild());
    i = 0;
    J0x60:
    // End:0x1b9 [While If]
    if(i < Maps.Length)
    {
        // End:0x1af
        if(Maps[i].File == MN || Maps[i].FriendlyName == MN)
        {
            MapImg = Material(DynamicLoadObject(Maps[i].ResourceMapImage, class'Material'));
            MapName = Maps[i].FriendlyName;
            mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(Maps[i].File);
            j = 0;
            J0x13c:
            // End:0x1ad [While If]
            if(j < 3)
            {
                // End:0x173
                if(mInfo.ResourceSupplyImages[j] == "")
                {
                    supplyImg[j] = none;
                }
                // End:0x1a3
                else
                {
                    supplyImg[j] = Material(DynamicLoadObject(mInfo.ResourceSupplyImages[j], class'Material'));
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x13c;
            }
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x60;
    }
}

function SetRoomInfo(string RoomName, int GameState, string roommaster, string GameMode, string Weapon, string HardCore, string gamerunning)
{
    tT.SetData(RoomName, GameState, MapName, MapImg, supplyImg, roommaster, GameMode, Weapon, HardCore, gamerunning);
}

function Internal_OnRendered(Canvas C)
{
    tT.AWinPos.X1 = RWinPos.X1 - float(30);
    tT.AWinPos.Y1 = RWinPos.Y1 - float(45);
    tT.AWinPos.X2 = RWinPos.X1 + float(535) - float(30);
    tT.AWinPos.Y2 = RWinPos.Y1 + float(255) - float(45);
    tT.Render(C);
}

defaultproperties
{
    OnRendered=Internal_OnRendered
}