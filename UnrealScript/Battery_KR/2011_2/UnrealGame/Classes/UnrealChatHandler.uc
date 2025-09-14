class UnrealChatHandler extends BroadcastHandler
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var bool bDebug;

function ToggleChatDebug()
{
    bDebug = !bDebug;
    //return;    
}

function DoChatDebug()
{
    local array<PlayerController> Arr;
    local int i;

    // End:0x11
    if(!bDebug)
    {
        ToggleChatDebug();
    }
    Level.Game.GetPlayerControllerList(Arr);
    Log("Controller list length:" $ string(Arr.Length), 'ChatManager');
    i = 0;
    J0x5F:

    // End:0x196 [Loop If]
    if(i < Arr.Length)
    {
        // End:0xF9
        if(Arr[i].ChatManager == none)
        {
            Log(((((string(Arr[i].Name) @ "PC[") $ string(i)) $ "].ChatManager None (") $ Arr[i].PlayerReplicationInfo.PlayerName) $ ")", 'ChatManager');
            Log("");
            // [Explicit Continue]
            goto J0x18C;
        }
        Log(((((string(Arr[i].Name) @ "PC[") $ string(i)) $ "] (") $ Arr[i].PlayerReplicationInfo.PlayerName) $ ") Chat Handler Information", 'ChatManager');
        Arr[i].ChatManager.ChatDebug();
        Log("");
        J0x18C:

        i++;
        // [Loop Continue]
        goto J0x5F;
    }
    //return;    
}

function bool AcceptBroadcastText(PlayerController Receiver, PlayerReplicationInfo SenderPRI, out string Msg, optional name Type)
{
    local bool Result;

    // End:0x104
    if((Receiver != none) && Receiver.ChatManager != none)
    {
        Result = Receiver.ChatManager.AcceptText(SenderPRI, Msg, Type);
        // End:0xD3
        if(bDebug)
        {
            Log((((("AcceptBroadcastText() Receiver:" $ string(Receiver.Name)) @ "Sender:") $ SenderPRI.PlayerName) @ "Allowed:") $ string(Result), 'ChatManager');
            // End:0xD0
            if(!Result)
            {
                return false;
            }            
        }
        else
        {
            // End:0x101
            if(!Receiver.ChatManager.AcceptText(SenderPRI, Msg, Type))
            {
                return false;
            }
        }        
    }
    else
    {
        // End:0x172
        if(bDebug)
        {
            Log((("AcceptBroadcastText() Receiver:" $ string(Receiver.Name)) @ "Receiver.ChatManager:") $ string(Receiver.ChatManager), 'ChatManager');
        }
    }
    return super.AcceptBroadcastText(Receiver, SenderPRI, Msg, Type);
    //return;    
}

function bool AcceptBroadcastLocalized(PlayerController Receiver, Actor Sender, Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object obj)
{
    // End:0x5E
    if((Receiver != none) && Receiver.ChatManager != none)
    {
        // End:0x5E
        if(!Receiver.ChatManager.AcceptLocalized(Sender, Message, Switch, RelatedPRI_1, RelatedPRI_2, obj))
        {
            return false;
        }
    }
    return super.AcceptBroadcastLocalized(Receiver, Sender, Message, Switch, RelatedPRI_1, RelatedPRI_2, obj);
    //return;    
}

function bool AcceptBroadcastSpeech(PlayerController Receiver, PlayerReplicationInfo SenderPRI)
{
    local bool bResult;

    // End:0xF2
    if((Receiver != none) && Receiver.ChatManager != none)
    {
        bResult = Receiver.ChatManager.AcceptSpeech(SenderPRI);
        // End:0xCB
        if(bDebug)
        {
            Log((((("AcceptBroadcastSpeech() Receiver:" $ string(Receiver.Name)) @ "Sender:") $ SenderPRI.PlayerName) @ "Allowed:") $ string(bResult), 'ChatManager');
            // End:0xC8
            if(!bResult)
            {
                return false;
            }            
        }
        else
        {
            // End:0xEF
            if(!Receiver.ChatManager.AcceptSpeech(SenderPRI))
            {
                return false;
            }
        }        
    }
    else
    {
        // End:0x162
        if(bDebug)
        {
            Log((("AcceptBroadcastSpeech() Receiver:" $ string(Receiver.Name)) @ "Receiver.ChatManager:") $ string(Receiver.ChatManager), 'ChatManager');
        }
    }
    return super.AcceptBroadcastSpeech(Receiver, SenderPRI);
    //return;    
}

function bool AcceptBroadcastVoice(PlayerController Receiver, PlayerReplicationInfo Sender)
{
    // End:0x45
    if((Receiver != none) && Receiver.ChatManager != none)
    {
        // End:0x45
        if(!Receiver.ChatManager.AcceptVoice(Sender))
        {
            return false;
        }
    }
    return super.AcceptBroadcastVoice(Receiver, Sender);
    //return;    
}
