class BTLabelTutorialQuestInfoHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var float StayTime;
var int Phase;
var float Alpha;
var export editinline BTACLQuestHK ACLQuest;
var Text txtQuestDesc;
var Text txtQuestExtDesc;
var Text txtReward;
var Text txtLastReward;
var Image Exclamation;
var Image HelpResource;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    ACLQuest = new Class'GUIWarfareControls_Decompressed.BTACLQuestHK';
    ACLQuest.InitComponent(MyController, myOwner);
    ACLQuest.SetVisibility(false);
    txtQuestDesc = Class'Engine.BTCustomDrawHK'.static.MakeText(11, 1, "");
    txtQuestExtDesc = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 1, "");
    txtReward = Class'Engine.BTCustomDrawHK'.static.MakeText(11, 1, "");
    txtReward.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.QuestReward();
    txtLastReward = Class'Engine.BTCustomDrawHK'.static.MakeText(11, 1, "");
    txtLastReward.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.QuestReward();
    BackgroundImage.DrawColor.R = 100;
    BackgroundImage.DrawColor.G = 100;
    BackgroundImage.DrawColor.B = 100;
    BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4;
    HelpResource = Class'Engine.BTCustomDrawHK'.static.MakeImage(512, 139, 26, none);
    HelpResource.Image = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_exclamation.Image;
    SetVisibility(false);
    //return;    
}

function StartShow()
{
    local wMatchMaker MM;
    local wQuestParam q;
    local int S, i;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ACLQuest.RemovePool();
    ACLQuest.RemoveAll();
    i = 0;
    J0x55:

    // End:0x11F [Loop If]
    if(i < MM.QuestList.Length)
    {
        q = Controller.ViewportOwner.Actor.Level.GameMgr.GetQuestInfo(MM.QuestList[i].QuestID);
        // End:0x115
        if(q.QuestType == 0)
        {
            ACLQuest.AddQuestInfo(MM.QuestList[i].QuestID, MM.QuestList[i].CurrentProgress);
        }
        i++;
        // [Loop Continue]
        goto J0x55;
    }
    // End:0x136
    if(ACLQuest.ACLRowListPool.Length <= 0)
    {
        return;
    }
    S = Rand(ACLQuest.ACLRowListPool.Length);
    txtQuestDesc.Text = ACLQuest.GetQuestDesc(S);
    txtQuestExtDesc.Text = "-" $ ACLQuest.GetQuestExtDesc(S);
    txtReward.Text = ACLQuest.GetReward(S);
    txtLastReward.Text = ACLQuest.GetLastReward(S);
    switch(ACLQuest.GetHelpResourceIndex(S) - 1)
    {
        // End:0x202
        case 0:
            HelpResource = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_help_all0;
            // End:0x31C
            break;
        // End:0x21D
        case 1:
            HelpResource = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_help_all1;
            // End:0x31C
            break;
        // End:0x239
        case 2:
            HelpResource = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_help_all2;
            // End:0x31C
            break;
        // End:0x255
        case 3:
            HelpResource = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_help_all3;
            // End:0x31C
            break;
        // End:0x271
        case 4:
            HelpResource = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_help_all4;
            // End:0x31C
            break;
        // End:0x28D
        case 5:
            HelpResource = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_help_all5;
            // End:0x31C
            break;
        // End:0x2A9
        case 6:
            HelpResource = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_help_all6;
            // End:0x31C
            break;
        // End:0x2C5
        case 7:
            HelpResource = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_help_all7;
            // End:0x31C
            break;
        // End:0x2E1
        case 8:
            HelpResource = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_help_all8;
            // End:0x31C
            break;
        // End:0x2FD
        case 9:
            HelpResource = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_help_all9;
            // End:0x31C
            break;
        // End:0x319
        case 10:
            HelpResource = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_help_all10;
            // End:0x31C
            break;
        // End:0xFFFF
        default:
            break;
    }
    SetVisibility(true);
    Alpha = 0.0000000;
    Phase = 2;
    StayTime = 10.0000000;
    PlayerOwner().FmodClientPlaySound("Warfare_Sound_UI/Result/bonus_point");
    //return;    
}

function bool Internal_OnClick(GUIComponent Sender)
{
    Phase = 3;
    return true;
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local int L, t, Alpha255;
    local Plane AlphaColor;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = byte(CanvasStyle);
    // End:0x34
    if(Phase == 0)
    {
        return;        
    }
    else
    {
        // End:0x6C
        if(Phase == 1)
        {
            StayTime -= Controller.RenderDelta;
            // End:0x69
            if(StayTime < float(0))
            {
                Phase = 3;
            }            
        }
        else
        {
            // End:0xAF
            if(Phase == 2)
            {
                Alpha += Controller.RenderDelta;
                // End:0xAC
                if(Alpha > float(1))
                {
                    Alpha = 1.0000000;
                    Phase = 1;
                }                
            }
            else
            {
                // End:0xF8
                if(Phase == 3)
                {
                    Alpha -= Controller.RenderDelta;
                    // End:0xF8
                    if(Alpha < float(0))
                    {
                        Alpha = 0.0000000;
                        Phase = 0;
                        SetVisibility(false);
                        return;
                    }
                }
            }
        }
    }
    Alpha255 = int(Alpha * float(255));
    BackgroundImage.DrawColor.A = byte(Alpha255);
    HelpResource.DrawColor.A = byte(Alpha255);
    AlphaColor.X = 1.0000000;
    AlphaColor.Y = 1.0000000;
    AlphaColor.Z = 1.0000000;
    AlphaColor.W = Alpha;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, AWinPos.X1, AWinPos.Y1 - float(1), AWinPos.X2, AWinPos.Y2 - float(1));
    t = int(AWinPos.Y1);
    t += 7;
    L = int(float(int(float(int(AWinPos.X2 - AWinPos.X1)) - HelpResource.width) / 2) + AWinPos.X1);
    Class'Engine.BTCustomDrawHK'.static.DrawText_UseModulateColor(C, txtQuestDesc, AWinPos.X1, float(t), AWinPos.X2, AWinPos.Y2, 0, false, true, AlphaColor);
    t += 20;
    Class'Engine.BTCustomDrawHK'.static.DrawText_UseModulateColor(C, txtQuestExtDesc, AWinPos.X1, float(t), AWinPos.X2, AWinPos.Y2, 0, false, true, AlphaColor);
    t += 19;
    Class'Engine.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, HelpResource, ((AWinPos.X1 + AWinPos.X2) / float(2)) - float(200), float(t + 5), ((AWinPos.X1 + AWinPos.X2) / float(2)) + float(200), float((t + 5) + 137), HelpResource.X, HelpResource.Y, HelpResource.X + HelpResource.width, HelpResource.Y + HelpResource.Height);
    t += 146;
    Class'Engine.BTCustomDrawHK'.static.DrawText_UseModulateColor(C, txtReward, AWinPos.X1, float(t), AWinPos.X2, AWinPos.Y2, 0, false, true, AlphaColor);
    t += 17;
    Class'Engine.BTCustomDrawHK'.static.DrawText_UseModulateColor(C, txtLastReward, AWinPos.X1, float(t), AWinPos.X2, AWinPos.Y2, 0, false, true, AlphaColor);
    //return;    
}

defaultproperties
{
    OnRendered=BTLabelTutorialQuestInfoHK.Internal_OnRendered
    OnClick=BTLabelTutorialQuestInfoHK.Internal_OnClick
}