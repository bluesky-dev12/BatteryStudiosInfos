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
    tT = new Class'GUIWarfareControls_Decompressed.BTTTRoomInfoHK';
    tT.Init();
    tT.BackgroundImage.Image = none;
    //return;    
}

function SetMapName(string MN)
{
    local array<wMapInfo> Maps;
    local wMapInfo mInfo;
    local int i, j;

    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild());
    i = 0;
    J0x60:

    // End:0x1B9 [Loop If]
    if(i < Maps.Length)
    {
        // End:0x1AF
        if((Maps[i].File == MN) || Maps[i].FriendlyName == MN)
        {
            MapImg = Material(DynamicLoadObject(Maps[i].ResourceMapImage, Class'Engine.Material'));
            MapName = Maps[i].FriendlyName;
            mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(Maps[i].File);
            j = 0;
            J0x13C:

            // End:0x1AD [Loop If]
            if(j < 3)
            {
                // End:0x173
                if(mInfo.ResourceSupplyImages[j] == "")
                {
                    supplyImg[j] = none;
                    // [Explicit Continue]
                    goto J0x1A3;
                }
                supplyImg[j] = Material(DynamicLoadObject(mInfo.ResourceSupplyImages[j], Class'Engine.Material'));
                J0x1A3:

                j++;
                // [Loop Continue]
                goto J0x13C;
            }
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x60;
    }
    //return;    
}

function SetRoomInfo(string RoomName, int GameState, string roommaster, string GameMode, string Weapon, string HardCore, string gamerunning)
{
    tT.SetData(RoomName, GameState, MapName, MapImg, supplyImg, roommaster, GameMode, Weapon, HardCore, gamerunning);
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    tT.AWinPos.X1 = RWinPos.X1 - float(30);
    tT.AWinPos.Y1 = RWinPos.Y1 - float(45);
    tT.AWinPos.X2 = (RWinPos.X1 + float(535)) - float(30);
    tT.AWinPos.Y2 = (RWinPos.Y1 + float(255)) - float(45);
    tT.Render(C);
    //return;    
}

defaultproperties
{
    OnRendered=BTLabelRoomInfoHK.Internal_OnRendered
}