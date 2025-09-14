class AdminPanelRules extends AdminPanelBase
    editinlinenew
    instanced;

var() automated RemotePlayInfoPanel p_Main;

defaultproperties
{
    // Reference: RemotePlayInfoPanel'GUI2K4_Decompressed.AdminPanelRules.PlayInfoPanel'
    begin object name="PlayInfoPanel" class=GUI2K4_Decompressed.RemotePlayInfoPanel
        OnActivate=PlayInfoPanel.InternalOnActivate
    end object
    p_Main=PlayInfoPanel
}