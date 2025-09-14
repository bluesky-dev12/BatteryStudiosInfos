class BTTPMyInfoStatHK extends BTTPOptionBaseHK
    editinlinenew
    instanced;

var localized string strLabel[30];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    ACLList.SetItemCountPerPage(17, 1);
    Label.Length = 30;
    Content.Length = 30;
    InternalPadding.Length = 30;
    i = 0;
    J0x44:

    // End:0x8A [Loop If]
    if(i < InternalPadding.Length)
    {
        InternalPadding[i].Y1 = 3.0000000;
        InternalPadding[i].Y2 = 4.0000000;
        i++;
        // [Loop Continue]
        goto J0x44;
    }
    InitializeLabel();
    InitializeContent();
    ACLList_PositionChanged(0);
    //return;    
}

function InitializeLabel()
{
    local int i;
    local RenderObject ro;

    i = 0;
    J0x07:

    // End:0xCE [Loop If]
    if(i < Label.Length)
    {
        ro = new Class'GUIWarfareControls_Decompressed.RenderObject';
        ro.Init();
        ACLList.AddRenderObject(ro);
        Label[i] = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].SetDefaultFontColor();
        Label[i].CaptionDrawType = 3;
        Label[i].Caption = strLabel[i];
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function InitializeContent()
{
    local int i;
    local float RenderWeight;

    RenderWeight = 0.7800000;
    i = 0;
    J0x12:

    // End:0x67 [Loop If]
    if(i < Content.Length)
    {
        Content[i] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawTextArrayHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7800000);
        RenderWeight -= 0.0100000;
        ++i;
        // [Loop Continue]
        goto J0x12;
    }
    //return;    
}

function SetData(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb)
{
    BTOwnerDrawTextArrayHK(Content[0]).SetData(string(MaxSerial));
    BTOwnerDrawTextArrayHK(Content[1]).SetData(string(MaxScore));
    BTOwnerDrawTextArrayHK(Content[2]).SetData(string(MaxKill));
    BTOwnerDrawTextArrayHK(Content[3]).SetData(string(MaxAssist));
    BTOwnerDrawTextArrayHK(Content[4]).SetData(string(Serial3));
    BTOwnerDrawTextArrayHK(Content[5]).SetData(string(Serial5));
    BTOwnerDrawTextArrayHK(Content[6]).SetData(string(Serial7));
    BTOwnerDrawTextArrayHK(Content[7]).SetData(string(Serial10));
    BTOwnerDrawTextArrayHK(Content[8]).SetData(string(Serial15));
    BTOwnerDrawTextArrayHK(Content[9]).SetData(string(AR));
    BTOwnerDrawTextArrayHK(Content[10]).SetData(string(SMG));
    BTOwnerDrawTextArrayHK(Content[11]).SetData(string(SR));
    BTOwnerDrawTextArrayHK(Content[12]).SetData(string(SW));
    BTOwnerDrawTextArrayHK(Content[13]).SetData(string(Melee));
    BTOwnerDrawTextArrayHK(Content[14]).SetData(string(Grenade));
    BTOwnerDrawTextArrayHK(Content[15]).SetData(string(FlashBang));
    BTOwnerDrawTextArrayHK(Content[16]).SetData(string(Foot));
    BTOwnerDrawTextArrayHK(Content[17]).SetData(string(AT4));
    BTOwnerDrawTextArrayHK(Content[18]).SetData(string(MG));
    BTOwnerDrawTextArrayHK(Content[19]).SetData(string(Fire));
    BTOwnerDrawTextArrayHK(Content[20]).SetData(string(RPG7));
    BTOwnerDrawTextArrayHK(Content[21]).SetData(string(TimeBomb));
    BTOwnerDrawTextArrayHK(Content[22]).SetData(string(IcendiaryBomb));
    BTOwnerDrawTextArrayHK(Content[23]).SetData(string(ClusterBomb));
    BTOwnerDrawTextArrayHK(Content[24]).SetData(string(ByChopper));
    BTOwnerDrawTextArrayHK(Content[25]).SetData(string(Artillery));
    BTOwnerDrawTextArrayHK(Content[26]).SetData(string(KillChopper));
    BTOwnerDrawTextArrayHK(Content[27]).SetData(string(Dominate));
    BTOwnerDrawTextArrayHK(Content[28]).SetData(string(InstallBomb));
    BTOwnerDrawTextArrayHK(Content[29]).SetData(string(DefuseBomb));
    //return;    
}

defaultproperties
{
    strLabel[0]="?? ???"
    strLabel[1]="?? ??"
    strLabel[2]="?? ?"
    strLabel[3]="?? ????"
    strLabel[4]="3???"
    strLabel[5]="5???"
    strLabel[6]="7???"
    strLabel[7]="10???"
    strLabel[8]="15???"
    strLabel[9]="????(AR) ?"
    strLabel[10]="????(SMG) ?"
    strLabel[11]="???(SR) ?"
    strLabel[12]="???? ?"
    strLabel[13]="???? ?"
    strLabel[14]="??? ?"
    strLabel[15]="??? ?"
    strLabel[16]="?? ?"
    strLabel[17]="AT-4 ?"
    strLabel[18]="??? ?"
    strLabel[19]="????? ?"
    strLabel[20]="RPG-7 ?"
    strLabel[21]="???? ?"
    strLabel[22]="??? ?"
    strLabel[23]="??? ?"
    strLabel[24]="?? ?"
    strLabel[25]="?? ?"
    strLabel[26]="?? ??"
    strLabel[27]="??"
    strLabel[28]="?? ??"
    strLabel[29]="?? ??"
    ItemWidth=468
    LabelWidth=114
    fbACLList=(X1=523.0000000,Y1=126.0000000,X2=1004.0000000,Y2=736.0000000)
}