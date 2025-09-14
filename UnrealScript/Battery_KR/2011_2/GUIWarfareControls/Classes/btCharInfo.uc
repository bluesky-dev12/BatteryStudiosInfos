class btCharInfo extends GUITabPanel
    editinlinenew
    instanced;

var() automated BTBoxImage BackgroundImg;
var() automated FloatingImage TitleMapInfo;
var() automated BTTailImage CommunityTail1;
var() automated GUILabel UserName;
var() automated GUILabel Clanname;
var() automated GUILabel LabelRanking;
var localized string LabelRankingCaption;
var() automated GUILabel Ranking;
var() automated GUILabel LabelExp;
var localized string LabelExpCaption;
var() automated GUILabel Experience;
var() automated GUILabel LabelPoint;
var localized string LabelPointCaption;
var() automated GUILabel Point;
var() automated GUILabel LabelWarPoint;
var() automated GUILabel WarPoint;
var() automated GUILabel LabelLicense;
var() automated GUILabel License;
var() automated GUILabel LabelRecords;
var localized string LabelRecordsCaption;
var() automated GUILabel Records;
var() automated FloatingImage ClanMark;
var() automated FloatingImage ClassMark;

function Set(string Name, string Clan, CharInfo Info)
{
    local FloatBox Coordi;

    Log(((("[BTCharInfo::Set]" $ " name=") $ Name) $ " clan=") $ Clan);
    UserName.Caption = Name;
    Ranking.Caption = "" $ string(Info.Ranking);
    Experience.Caption = "" $ string(Info.Exp);
    Point.Caption = "" $ string(Info.Point);
    Records.Caption = (("" $ string(Info.Kill)) $ " / ") $ string(Info.Death);
    ClassMark.Image = Material(PlayerOwner().Level.DynamicLoadObject(PlayerOwner().Level.GameMgr.GetLevelImageString(Info.Level), Class'Engine.Material'));
    Coordi = PlayerOwner().Level.GameMgr.GetLevelImageCoordi(Info.Level);
    ClassMark.X1 = int(Coordi.X1);
    ClassMark.Y1 = int(Coordi.Y1);
    ClassMark.X2 = int(Coordi.X2);
    ClassMark.Y2 = int(Coordi.Y2);
    //return;    
}

function ApplyLocalizedStrings()
{
    LabelRanking.Caption = LabelRankingCaption;
    LabelExp.Caption = LabelExpCaption;
    LabelPoint.Caption = LabelPointCaption;
    LabelRecords.Caption = LabelRecordsCaption;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    ApplyLocalizedStrings();
    //return;    
}

function bool InternalOnDraw(Canvas C)
{
    return false;
    //return;    
}

defaultproperties
{
    // Reference: BTBoxImage'GUIWarfareControls_Decompressed.btCharInfo.mBackground'
    begin object name="mBackground" class=GUIWarfareControls_Decompressed.BTBoxImage
        WinTop=0.7135417
        WinLeft=0.7529297
        WinWidth=0.2363281
        WinHeight=0.2408854
    end object
    BackgroundImg=mBackground
    // Reference: FloatingImage'GUIWarfareControls_Decompressed.btCharInfo.mTitleMapInfo'
    begin object name="mTitleMapInfo" class=XInterface.FloatingImage
        X1=0
        Y1=0
        X2=62
        Y2=14
        DropShadowX=0
        DropShadowY=0
        WinTop=0.6875000
        WinLeft=0.7529297
        WinWidth=0.0683594
        WinHeight=0.0182292
        RenderWeight=0.2100000
    end object
    TitleMapInfo=mTitleMapInfo
    // Reference: BTTailImage'GUIWarfareControls_Decompressed.btCharInfo.mCommunityTail1'
    begin object name="mCommunityTail1" class=GUIWarfareControls_Decompressed.BTTailImage
        WinTop=0.6875000
        WinLeft=0.8144531
        WinWidth=0.1748047
    end object
    CommunityTail1=mCommunityTail1
    // Reference: GUILabel'GUIWarfareControls_Decompressed.btCharInfo.mUserName'
    begin object name="mUserName" class=XInterface.GUILabel
        Caption="Babababa"
        TextColor=(R=255,G=153,B=0,A=255)
        FontSize=9
        WinTop=0.7174479
        WinLeft=0.8330078
        WinWidth=0.1445312
        WinHeight=0.0377604
    end object
    UserName=mUserName
    // Reference: GUILabel'GUIWarfareControls_Decompressed.btCharInfo.mClanName'
    begin object name="mClanName" class=XInterface.GUILabel
        Caption="Battery TF"
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.7565104
        WinLeft=0.8330078
        WinWidth=0.1445312
        WinHeight=0.0377604
    end object
    Clanname=mClanName
    // Reference: GUILabel'GUIWarfareControls_Decompressed.btCharInfo.mLabelRanking'
    begin object name="mLabelRanking" class=XInterface.GUILabel
        Caption="RANK"
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.7955729
        WinLeft=0.7597656
        WinWidth=0.0673828
        WinHeight=0.0377604
    end object
    LabelRanking=mLabelRanking
    LabelRankingCaption="??"
    // Reference: GUILabel'GUIWarfareControls_Decompressed.btCharInfo.mRanking'
    begin object name="mRanking" class=XInterface.GUILabel
        Caption="1"
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.7955729
        WinLeft=0.8330078
        WinWidth=0.1445312
        WinHeight=0.0377604
    end object
    Ranking=mRanking
    // Reference: GUILabel'GUIWarfareControls_Decompressed.btCharInfo.mLabelExp'
    begin object name="mLabelExp" class=XInterface.GUILabel
        Caption="Experience"
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.8346354
        WinLeft=0.7597656
        WinWidth=0.0673828
        WinHeight=0.0377604
    end object
    LabelExp=mLabelExp
    LabelExpCaption="EXP"
    // Reference: GUILabel'GUIWarfareControls_Decompressed.btCharInfo.mExp'
    begin object name="mExp" class=XInterface.GUILabel
        Caption="999"
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.8346354
        WinLeft=0.8330078
        WinWidth=0.1445312
        WinHeight=0.0377604
    end object
    Experience=mExp
    // Reference: GUILabel'GUIWarfareControls_Decompressed.btCharInfo.mLabelPoint'
    begin object name="mLabelPoint" class=XInterface.GUILabel
        Caption="POINT"
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.8736979
        WinLeft=0.7597656
        WinWidth=0.0673828
        WinHeight=0.0377604
    end object
    LabelPoint=mLabelPoint
    LabelPointCaption="POINT"
    // Reference: GUILabel'GUIWarfareControls_Decompressed.btCharInfo.mPoint'
    begin object name="mPoint" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.8736979
        WinLeft=0.8330078
        WinWidth=0.1445312
        WinHeight=0.0377604
    end object
    Point=mPoint
    // Reference: GUILabel'GUIWarfareControls_Decompressed.btCharInfo.mLabelRecords'
    begin object name="mLabelRecords" class=XInterface.GUILabel
        Caption="K/D"
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.9127604
        WinLeft=0.7597656
        WinWidth=0.0673828
        WinHeight=0.0377604
    end object
    LabelRecords=mLabelRecords
    LabelRecordsCaption="??"
    // Reference: GUILabel'GUIWarfareControls_Decompressed.btCharInfo.mRecords'
    begin object name="mRecords" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.9127604
        WinLeft=0.8330078
        WinWidth=0.1445312
        WinHeight=0.0377604
    end object
    Records=mRecords
    // Reference: FloatingImage'GUIWarfareControls_Decompressed.btCharInfo.mClanMark'
    begin object name="mClanMark" class=XInterface.FloatingImage
        ImageStyle=2
        X1=0
        Y1=0
        X2=32
        Y2=32
        WinTop=0.7369792
        WinLeft=0.7597656
        WinWidth=0.0312500
        WinHeight=0.0416667
        RenderWeight=0.3000000
    end object
    ClanMark=mClanMark
    // Reference: FloatingImage'GUIWarfareControls_Decompressed.btCharInfo.mClassMark'
    begin object name="mClassMark" class=XInterface.FloatingImage
        ImageStyle=2
        X1=0
        Y1=0
        X2=32
        Y2=32
        WinTop=0.7369792
        WinLeft=0.7978516
        WinWidth=0.0312500
        WinHeight=0.0416667
        RenderWeight=0.3000000
    end object
    ClassMark=mClassMark
    SetControlsBoundToParent=false
    SetControlsScaleToParent=false
    OnDraw=btCharInfo.InternalOnDraw
}