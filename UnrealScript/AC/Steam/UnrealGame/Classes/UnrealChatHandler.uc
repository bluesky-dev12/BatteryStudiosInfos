/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\UnrealChatHandler.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:6
 *
 *******************************************************************************/
class UnrealChatHandler extends BroadcastHandler
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var bool bDebug;

function ToggleChatDebug()
{
    bDebug = !bDebug;
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
    J0x5f:
    // End:0x196 [While If]
    if(i < Arr.Length)
    {
        // End:0xf9
        if(Arr[i].ChatManager == none)
        {
            Log(string(Arr[i].Name) @ "PC[" $ string(i) $ "].ChatManager None (" $ Arr[i].PlayerReplicationInfo.PlayerName $ ")", 'ChatManager');
            Log("");
        }
        // End:0x18c
        else
        {
            Log(string(Arr[i].Name) @ "PC[" $ string(i) $ "] (" $ Arr[i].PlayerReplicationInfo.PlayerName $ ") Chat Handler Information", 'ChatManager');
            Arr[i].ChatManager.ChatDebug();
            Log("");
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5f;
    }
}

function bool AcceptBroadcastText(PlayerController Receiver, PlayerReplicationInfo SenderPRI, out string Msg, optional name Type)
{
    local bool Result;

    // End:0x104
    if(Receiver != none && Receiver.ChatManager != none)
    {
        Result = Receiver.ChatManager.AcceptText(SenderPRI, Msg, Type);
        // End:0xd3
        if(bDebug)
        {
            Log("AcceptBroadcastText() Receiver:" $ string(Receiver.Name) @ "Sender:" $ SenderPRI.PlayerName @ "Allowed:" $ string(Result), 'ChatManager');
            // End:0xd0
            if(!Result)
            {
                return false;
            }
        }
        // End:0x101
        else
        {
            // End:0x101
            if(!Receiver.ChatManager.AcceptText(SenderPRI, Msg, Type))
            {
                return false;
            }
        }
    }
    // End:0x172
    else
    {
        // End:0x172
        if(bDebug)
        {
            Log("AcceptBroadcastText() Receiver:" $ string(Receiver.Name) @ "Receiver.ChatManager:" $ string(Receiver.ChatManager), 'ChatManager');
        }
    }
    return super.AcceptBroadcastText(Receiver, SenderPRI, Msg, Type);
}

function bool AcceptBroadcastLocalized(PlayerController Receiver, Actor Sender, class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object obj)
{
    // End:0x5e
    if(Receiver != none && Receiver.ChatManager != none)
    {
        // End:0x5e
        if(!Receiver.ChatManager.AcceptLocalized(Sender, Message, Switch, RelatedPRI_1, RelatedPRI_2, obj))
        {
            return false;
        }
    }
    return super.AcceptBroadcastLocalized(Receiver, Sender, Message, Switch, RelatedPRI_1, RelatedPRI_2, obj);
}

function bool AcceptBroadcastSpeech(PlayerController Receiver, PlayerReplicationInfo SenderPRI)
{
    local bool bResult;

    // End:0xf2
    if(Receiver != none && Receiver.ChatManager != none)
    {
        bResult = Receiver.ChatManager.AcceptSpeech(SenderPRI);
        // End:0xcb
        if(bDebug)
        {
            Log("AcceptBroadcastSpeech() Receiver:" $ string(Receiver.Name) @ "Sender:" $ SenderPRI.PlayerName @ "Allowed:" $ string(bResult), 'ChatManager');
            // End:0xc8
            if(!bResult)
            {
                return false;
            }
        }
        // End:0xef
        else
        {
            // End:0xef
            if(!Receiver.ChatManager.AcceptSpeech(SenderPRI))
            {
                return false;
            }
        }
    }
    // End:0x162
    else
    {
        // End:0x162
        if(bDebug)
        {
            Log("AcceptBroadcastSpeech() Receiver:" $ string(Receiver.Name) @ "Receiver.ChatManager:" $ string(Receiver.ChatManager), 'ChatManager');
        }
    }
    return super.AcceptBroadcastSpeech(Receiver, SenderPRI);
}

function bool AcceptBroadcastVoice(PlayerController Receiver, PlayerReplicationInfo Sender)
{
    // End:0x45
    if(Receiver != none && Receiver.ChatManager != none)
    {
        // End:0x45
        if(!Receiver.ChatManager.AcceptVoice(Sender))
        {
            return false;
        }
    }
    return super.AcceptBroadcastVoice(Receiver, Sender);
}
