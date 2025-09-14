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

    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos();
    i = 0;
    J0x36:

    // End:0x18F [Loop If]
    if(i < Maps.Length)
    {
        // End:0x185
        if((Maps[i].File == MN) || Maps[i].FriendlyName == MN)
        {
            MapImg = Material(DynamicLoadObject(Maps[i].ResourceMapImage, Class'Engine.Material'));
            MapName = Maps[i].FriendlyName;
            mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(Maps[i].File);
            j = 0;
            J0x112:

            // End:0x183 [Loop If]
            if(j < 3)
            {
                // End:0x149
                if(mInfo.ResourceSupplyImages[j] == "")
                {
                    supplyImg[j] = none;
                    // [Explicit Continue]
                    goto J0x179;
                }
                supplyImg[j] = Material(DynamicLoadObject(mInfo.ResourceSupplyImages[j], Class'Engine.Material'));
                J0x179:

                j++;
                // [Loop Continue]
                goto J0x112;
            }
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x36;
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