class BTTPItemUIStatusHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var BTROItemUIStatusHK ro;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    ro = new Class'GUIWarfareControls_Decompressed.BTROItemUIStatusHK';
    ro.Init();
    ro.bNeedUpdate = true;
    //return;    
}

function SetData(wItemBoxHK ib, wItemBoxInstanceHK ibi, optional wItemBoxHK cib, optional wItemBoxInstanceHK cibi)
{
    local int i;

    // End:0x123
    if(cib == none)
    {
        ro.SetDamage(ib.ui_damage);
        ro.SetSpread(ib.ui_spread);
        ro.SetViewKick(ib.ui_view_kick);
        ro.SetRateofFire(ib.ui_rate_of_fire);
        ro.SetMove(ib.ui_move);
        ro.SetRange(ib.ui_range);
        ro.SetAmmoSize(ib.clip_size, ib.start_ammo - ib.clip_size);
        ro.SetSkill(ib.GetPartSkillName(ibi.PartID));        
    }
    else
    {
        ro.SetDamage(cib.ui_damage, ib.ui_damage - cib.ui_damage);
        ro.SetSpread(cib.ui_spread, ib.ui_spread - cib.ui_spread);
        ro.SetViewKick(cib.ui_view_kick, ib.ui_view_kick - cib.ui_view_kick);
        ro.SetRateofFire(cib.ui_rate_of_fire, ib.ui_rate_of_fire - cib.ui_rate_of_fire);
        ro.SetMove(cib.ui_move, ib.ui_move - cib.ui_move);
        ro.SetRange(cib.ui_range, ib.ui_range - cib.ui_range);
        ro.SetAmmoSize(cib.clip_size, cib.start_ammo - cib.clip_size, ib.clip_size - cib.clip_size, (ib.start_ammo - ib.clip_size) - (cib.start_ammo - cib.clip_size));
        ro.SetSkill(ib.GetPartSkillName(ibi.PartID), cib.GetPartSkillName(cibi.PartID));
    }
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local float OldValueX, OldValueY;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = byte(CanvasStyle);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1_half_alpha, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    ro.bVisible = self.bVisible;
    ro.AWinPos = self.AWinPos;
    ro.Render(C, 0.0000000);
    //return;    
}
