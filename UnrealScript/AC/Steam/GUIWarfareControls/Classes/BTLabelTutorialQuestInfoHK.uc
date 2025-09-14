/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTLabelTutorialQuestInfoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:4
 *
 *******************************************************************************/
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
    ACLQuest = new class'BTACLQuestHK';
    ACLQuest.InitComponent(MyController, myOwner);
    ACLQuest.SetVisibility(false);
    txtQuestDesc = class'BTCustomDrawHK'.static.MakeText(11, 1, "");
    txtQuestExtDesc = class'BTCustomDrawHK'.static.MakeText(9, 1, "");
    txtReward = class'BTCustomDrawHK'.static.MakeText(11, 1, "");
    txtReward.DrawColor = class'BTUIColorPoolHK'.static.QuestReward();
    txtLastReward = class'BTCustomDrawHK'.static.MakeText(11, 1, "");
    txtLastReward.DrawColor = class'BTUIColorPoolHK'.static.QuestReward();
    BackgroundImage.DrawColor.R = 100;
    BackgroundImage.DrawColor.G = 100;
    BackgroundImage.DrawColor.B = 100;
    BackgroundImage = class'BTUIResourcePoolHK'.default.panel_4;
    HelpResource = class'BTCustomDrawHK'.static.MakeImage(512, 139, 26, none);
    HelpResource.Image = class'BTUIResourcePoolHK'.default.img_exclamation.Image;
    SetVisibility(false);
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
    // End:0x11f [While If]
    if(i < MM.QuestList.Length)
    {
        q = Controller.ViewportOwner.Actor.Level.GameMgr.GetQuestInfo(MM.QuestList[i].QuestID);
        // End:0x115
        if(q.QuestType == 0)
        {
            ACLQuest.AddQuestInfo(MM.QuestList[i].QuestID, MM.QuestList[i].CurrentProgress);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
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
            HelpResource = class'BTUIResourcePoolHK'.default.img_help_all0;
            // End:0x31c
            break;
        // End:0x21d
        case 1:
            HelpResource = class'BTUIResourcePoolHK'.default.img_help_all1;
            // End:0x31c
            break;
        // End:0x239
        case 2:
            HelpResource = class'BTUIResourcePoolHK'.default.img_help_all2;
            // End:0x31c
            break;
        // End:0x255
        case 3:
            HelpResource = class'BTUIResourcePoolHK'.default.img_help_all3;
            // End:0x31c
            break;
        // End:0x271
        case 4:
            HelpResource = class'BTUIResourcePoolHK'.default.img_help_all4;
            // End:0x31c
            break;
        // End:0x28d
        case 5:
            HelpResource = class'BTUIResourcePoolHK'.default.img_help_all5;
            // End:0x31c
            break;
        // End:0x2a9
        case 6:
            HelpResource = class'BTUIResourcePoolHK'.default.img_help_all6;
            // End:0x31c
            break;
        // End:0x2c5
        case 7:
            HelpResource = class'BTUIResourcePoolHK'.default.img_help_all7;
            // End:0x31c
            break;
        // End:0x2e1
        case 8:
            HelpResource = class'BTUIResourcePoolHK'.default.img_help_all8;
            // End:0x31c
            break;
        // End:0x2fd
        case 9:
            HelpResource = class'BTUIResourcePoolHK'.default.img_help_all9;
            // End:0x31c
            break;
        // End:0x319
        case 10:
            HelpResource = class'BTUIResourcePoolHK'.default.img_help_all10;
            // End:0x31c
            break;
        // End:0xffff
        default:
            SetVisibility(true);
            Alpha = 0.0;
            Phase = 2;
            StayTime = 10.0;
            PlayerOwner().PlaySound(sound'ui_result_bonus_point', 0, 1.0);
}

function bool Internal_OnClick(GUIComponent Sender)
{
    Phase = 3;
    return true;
}

function Internal_OnRendered(Canvas C)
{
    local int L, t, Alpha255;
    local Plane AlphaColor;

    // End:0x0e
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
    // End:0xf8
    else
    {
        // End:0x6c
        if(Phase == 1)
        {
            StayTime -= Controller.RenderDelta;
            // End:0x69
            if(StayTime < float(0))
            {
                Phase = 3;
            }
        }
        // End:0xf8
        else
        {
            // End:0xaf
            if(Phase == 2)
            {
                Alpha += Controller.RenderDelta;
                // End:0xac
                if(Alpha > float(1))
                {
                    Alpha = 1.0;
                    Phase = 1;
                }
            }
            // End:0xf8
            else
            {
                // End:0xf8
                if(Phase == 3)
                {
                    Alpha -= Controller.RenderDelta;
                    // End:0xf8
                    if(Alpha < float(0))
                    {
                        Alpha = 0.0;
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
    AlphaColor.X = 1.0;
    AlphaColor.Y = 1.0;
    AlphaColor.Z = 1.0;
    AlphaColor.W = Alpha;
    class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, AWinPos.X1, AWinPos.Y1 - float(1), AWinPos.X2, AWinPos.Y2 - float(1));
    t = int(AWinPos.Y1);
    t += 7;
    L = int(float(int(float(int(AWinPos.X2 - AWinPos.X1)) - HelpResource.width) / 2) + AWinPos.X1);
    class'BTCustomDrawHK'.static.DrawText_UseModulateColor(C, txtQuestDesc, AWinPos.X1, float(t), AWinPos.X2, AWinPos.Y2, 0, false, true, AlphaColor);
    t += 20;
    class'BTCustomDrawHK'.static.DrawText_UseModulateColor(C, txtQuestExtDesc, AWinPos.X1, float(t), AWinPos.X2, AWinPos.Y2, 0, false, true, AlphaColor);
    t += 19;
    class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, HelpResource, AWinPos.X1 + AWinPos.X2 / float(2) - float(200), float(t + 5), AWinPos.X1 + AWinPos.X2 / float(2) + float(200), float(t + 5 + 137), HelpResource.X, HelpResource.Y, HelpResource.X + HelpResource.width, HelpResource.Y + HelpResource.Height);
    t += 146;
    class'BTCustomDrawHK'.static.DrawText_UseModulateColor(C, txtReward, AWinPos.X1, float(t), AWinPos.X2, AWinPos.Y2, 0, false, true, AlphaColor);
    t += 17;
    class'BTCustomDrawHK'.static.DrawText_UseModulateColor(C, txtLastReward, AWinPos.X1, float(t), AWinPos.X2, AWinPos.Y2, 0, false, true, AlphaColor);
}

defaultproperties
{
    OnRendered=Internal_OnRendered
    OnClick=Internal_OnClick
}