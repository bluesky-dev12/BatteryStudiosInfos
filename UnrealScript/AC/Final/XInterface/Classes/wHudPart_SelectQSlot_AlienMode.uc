class wHudPart_SelectQSlot_AlienMode extends wHudPart_SelectQSlotCN
    transient;

function CalcQuickSlotTimer(out int respawnLeftTime, out int startupLeftTime)
{
    local GameReplicationInfo GRI;

    GRI = HudOwner.PlayerOwner.GameReplicationInfo;
    respawnLeftTime = GRI.GetCurAlienModeWaitingTimeCount();
    startupLeftTime = GRI.GetCurAlienModeWaitingTimeCount();
    //return;    
}
