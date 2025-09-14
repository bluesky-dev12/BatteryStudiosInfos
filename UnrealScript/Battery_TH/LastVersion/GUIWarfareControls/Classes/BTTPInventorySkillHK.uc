class BTTPInventorySkillHK extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline BTModelHK UIModel;
var BTROModelNew CharacterModel;
var() automated ButtonGroups InvenGroup;
var() automated BTStretchedImageHK BackgroundImage;
var localized string strButtonSkill[4];
var export editinline BTItemBoxButtonHK ButtonSkill[4];
var export editinline BTOwnerDrawCaptionButtonHK ButtonAF;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRSA;
var bool bLRMousePressed;
var export editinline BTOwnerDrawCaptionButtonHK ButtonLR;
var bool bRRMousePressed;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRR;
var export editinline BTOwnerDrawImageHK EdgeLine;
var export editinline BTOwnerDrawImageHK AFTeamBG;
var export editinline BTOwnerDrawImageHK RSATeamBG;
var localized string strAF;
var localized string strRSA;
var bool bVisibleAFModel;
var export editinline BTAutoScrollListHK ChatBox;

function ButtonLR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bLRMousePressed = true;
    //return;    
}

function ButtonLR_OnRelease(GUIComponent Sender)
{
    bLRMousePressed = false;
    //return;    
}

function ButtonRR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bRRMousePressed = true;
    //return;    
}

function ButtonRR_OnRelease(GUIComponent Sender)
{
    bRRMousePressed = false;
    //return;    
}

function bool ButtonAF_OnClick(GUIComponent Sender)
{
    ChangeVisibleModel(true);
    CharacterModel.ChangeTeam(0);
    return true;
    //return;    
}

function bool ButtonRSA_OnClick(GUIComponent Sender)
{
    ChangeVisibleModel(false);
    CharacterModel.ChangeTeam(1);
    return true;
    //return;    
}

function ChangeVisibleModel(bool bAF)
{
    bVisibleAFModel = bAF;
    // End:0x3B
    if(bVisibleAFModel)
    {
        AFTeamBG.bVisible = true;
        RSATeamBG.bVisible = false;        
    }
    else
    {
        AFTeamBG.bVisible = false;
        RSATeamBG.bVisible = true;
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x150 [Loop If]
    if(i < 4)
    {
        ButtonSkill[i] = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
        ButtonSkill[i].bUseAWinPos = true;
        ButtonSkill[i].AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(337.0000000, (380.0000000 + float(i * 85)) + float(i * 2), 493.0000000, (380.0000000 + float((i + 1) * 85)) + float(i * 2));
        ButtonSkill[i].DefaultSlotName[0] = strButtonSkill[i];
        ButtonSkill[i].InitComponent(MyController, self);
        AppendComponent(ButtonSkill[i]);
        ButtonSkill[i].itemBox.ChangeState(0);
        InvenGroup.AddButton(ButtonSkill[i]);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function bool OnPreDraw(Canvas C)
{
    ChangeVisibleModel(bVisibleAFModel);
    UIModel.cModel = CharacterModel;
    // End:0x3B
    if(bLRMousePressed)
    {
        CharacterModel.SetRotationLeft();        
    }
    else
    {
        // End:0x53
        if(bRRMousePressed)
        {
            CharacterModel.SetRotationRight();
        }
    }
    return false;
    //return;    
}

function bool FindAndRemoveItem(int ItemID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x8B [Loop If]
    if(i < 4)
    {
        // End:0x81
        if((ButtonSkill[i].itemBox.ItemInfo != none) && ButtonSkill[i].itemBox.ItemInfo.ItemID == ItemID)
        {
            ButtonSkill[i].SetData(none, none);
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

defaultproperties
{
    // Reference: ButtonGroups'GUIWarfareControls_Decompressed.BTTPInventorySkillHK.mgroups'
    begin object name="mgroups" class=GUIWarfareControls_Decompressed.ButtonGroups
    end object
    InvenGroup=mgroups
    // Reference: BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPInventorySkillHK.mBackgroundImage'
    begin object name="mBackgroundImage" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
        WinTop=0.0000000
        WinLeft=0.0000000
        WinWidth=1.0000000
        WinHeight=1.0000000
    end object
    BackgroundImage=mBackgroundImage
    strButtonSkill[0]="?????????"
    strButtonSkill[1]="?????????????"
    strAF="AF"
    strRSA="RSA"
    OnPreDraw=BTTPInventorySkillHK.OnPreDraw
}