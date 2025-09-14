class BTPageCredit extends BTNetGUIPageHK
    editinlinenew
    instanced;

var() automated FloatBox fbLabelCredit;
var export editinline BTLabelCreditAnimationHK LabelCredit;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    TPTopMenu.SetVisibility(false);
    LabelTopLine.SetVisibility(false);
    LabelBottomLine.SetVisibility(false);
    LabelRoomName.SetVisibility(false);
    LabelLeftTopRoll.SetVisibility(false);
    LabelCredit = BTLabelCreditAnimationHK(NewComponent(new Class'GUIWarfareControls.BTLabelCreditAnimationHK', fbLabelCredit, 0.9900000));
    LabelCredit.__OnEndCredit__Delegate = LabelCredit_OnEndCredit;
    //return;    
}

function LabelCredit_OnEndCredit()
{
    PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
    page_Main.SetPage(1, true);
    //return;    
}

function bool Internal_KeyEvent(out byte key, out byte Action, float Delta)
{
    local Interactions.EInputKey iKey;
    local Interactions.EInputAction iAction;

    Log("[BTPageCredit::Internal_KeyEvent]");
    iKey = key;
    iAction = Action;
    // End:0x105
    if(int(iAction) == int(1))
    {
        // End:0x7F
        if((int(iKey) == int(1)) || int(iKey) == int(237))
        {
            LabelCredit.DecreaseDelta();            
        }
        else
        {
            // End:0xB3
            if((int(iKey) == int(2)) || int(iKey) == int(236))
            {
                LabelCredit.IncreaseDelta();                
            }
            else
            {
                // End:0xC6
                if(int(iKey) == int(4))
                {                    
                }
                else
                {
                    PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
                    page_Main.SetPage(1, true);
                }
            }
        }
    }
    return true;
    //return;    
}

function InternalOnOpen()
{
    __NFUN_270__("BTPageCredit::InternalOnOpen()");
    Log("[BTPageCredit::InternalOnOpen] Start");
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    Log("[BTPageCredit::InternalOnOpen] End");
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageCredit::InternalOnClose()");
    Log("[BTPageCredit::InternalOnClose]");
    OnClose(bCanceled);
    //return;    
}

defaultproperties
{
    fbLabelCredit=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=768.0000000)
    currentBGM="bgm_maintheme_part1"
    bPersistent=false
    OnOpen=BTPageCredit.InternalOnOpen
    OnClose=BTPageCredit.InternalOnClose
    OnKeyEvent=BTPageCredit.Internal_KeyEvent
}