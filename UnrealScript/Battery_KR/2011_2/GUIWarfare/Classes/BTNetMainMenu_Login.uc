class BTNetMainMenu_Login extends BTNetGUIPage
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    page_Main.TcpChannel.InitNetwork();
    page_Main.rMM.bServerConnected = page_Main.TcpChannel.Connect(page_Main.szLoginServerIP, 50000);
    //return;    
}

function InternalOnOpen()
{
    local export editinline GUIEditBox edtLoginBox;

    // End:0x45
    if(page_Main.szAccountName != "")
    {
        edtLoginBox = GUIEditBox(Controls[2]);
        edtLoginBox.TextStr = page_Main.szAccountName;
    }
    Controls[1].SetFocus(none);
    Log(string(self) $ "InternalOnOpen, SetFocus");
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    OnClose(bCanceled);
    //return;    
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    //return;    
}

function bool MyKeyEvent(out byte key, out byte Action, float Delta)
{
    local Interactions.EInputKey iKey;
    local Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    // End:0x42
    if((int(iKey) == int(13)) && int(iAction) == int(1))
    {
        return SendLogin();        
    }
    else
    {
        // End:0xA3
        if((int(iKey) == int(27)) && int(iAction) == int(1))
        {
            Controller.CloseAll(false);
            Console(Controller.Master.Console).ConsoleCommand("exit");            
        }
        else
        {
            // End:0xDC
            if((int(iKey) == int(71)) && Controller.CtrlPressed)
            {
                page_Main.SetPage(14, true);                
            }
            else
            {
                // End:0x115
                if((int(iKey) == int(72)) && Controller.CtrlPressed)
                {
                    page_Main.SetPage(15, true);                    
                }
                else
                {
                    // End:0x14E
                    if((int(iKey) == int(74)) && Controller.CtrlPressed)
                    {
                        page_Main.SetPage(16, true);                        
                    }
                    else
                    {
                        // End:0x187
                        if((int(iKey) == int(86)) && Controller.CtrlPressed)
                        {
                            page_Main.SetPage(17, true);                            
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function bool LoadMap(GUIComponent Sender)
{
    Controller.CloseAll(false);
    return true;
    //return;    
}

function bool SendLogin()
{
    local string loginid;
    local export editinline GUIEditBox loginbox;

    loginbox = GUIEditBox(Controls[2]);
    loginid = loginbox.GetText();
    // End:0x8F
    if(loginid != "")
    {
        page_Main.szAccountName = loginid;
        page_Main.rMM.My_szName = page_Main.szAccountName;
        return page_Main.TcpChannel.sfReqLogin(loginid);        
    }
    else
    {
        return false;
    }
    //return;    
}

function bool btnHelloWorld(GUIComponent Sender)
{
    return SendLogin();
    //return;    
}

function bool GoToChannelList()
{
    page_Main.SetPage(6, true);
    return true;
    //return;    
}

function bool rfAckLogin(int Result, string ErrMsg)
{
    Log("[BTNetMainMenu] result=" $ string(Result));
    // End:0x38
    if(Result == 0)
    {
        GoToChannelList();        
    }
    return true;
    //return;    
}

defaultproperties
{
    bPersistent=true
    bAllowedAsLast=true
    OnOpen=BTNetMainMenu_Login.InternalOnOpen
    OnClose=BTNetMainMenu_Login.InternalOnClose
    // Reference: BackgroundImage'GUIWarfare_Decompressed.BTNetMainMenu_Login.backg'
    begin object name="backg" class=XInterface.BackgroundImage
        Image=Texture'Warfare_UI.ID_Textures.ID_back2'
        ImageStyle=6
    end object
    Controls[0]=backg
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMainMenu_Login.HelloButton'
    begin object name="HelloButton" class=XInterface.GUIButton
        Caption="Connect"
        StyleName="WarfareConnectButton"
        WinTop=0.4361979
        WinLeft=0.6572266
        WinWidth=0.0693359
        WinHeight=0.0507812
        OnClick=BTNetMainMenu_Login.btnHelloWorld
        OnKeyEvent=HelloButton.InternalOnKeyEvent
    end object
    Controls[1]=HelloButton
    // Reference: GUIEditBox'GUIWarfare_Decompressed.BTNetMainMenu_Login.edtLoginName'
    begin object name="edtLoginName" class=XInterface.GUIEditBox
        MaxWidth=80
        StyleName="WarfareIDEditBox"
        WinTop=0.4440104
        WinLeft=0.4931641
        WinWidth=0.1386719
        WinHeight=0.0351562
        bBoundToParent=true
        bScaleToParent=true
        OnActivate=edtLoginName.InternalActivate
        OnDeActivate=edtLoginName.InternalDeactivate
        OnKeyType=edtLoginName.InternalOnKeyType
        OnKeyEvent=edtLoginName.InternalOnKeyEvent
    end object
    Controls[2]=edtLoginName
    OnKeyEvent=BTNetMainMenu_Login.MyKeyEvent
}