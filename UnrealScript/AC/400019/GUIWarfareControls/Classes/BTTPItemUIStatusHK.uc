class BTTPItemUIStatusHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var BTROItemUIStatusHK Ro;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    Ro = new Class'GUIWarfareControls_Decompressed.BTROItemUIStatusHK';
    Ro.Init();
    Ro.bNeedUpdate = true;
    //return;    
}

function SetData(wItemBoxHK ib, wItemBoxInstanceHK ibi, optional wItemBoxHK cib, optional wItemBoxInstanceHK cibi)
{
    // End:0x123
    if(cib == none)
    {
        Ro.SetDamage(ib.ui_damage);
        Ro.SetSpread(ib.ui_spread);
        Ro.SetViewKick(ib.ui_view_kick);
        Ro.SetRateofFire(ib.ui_rate_of_fire);
        Ro.SetMove(ib.ui_move);
        Ro.SetRange(ib.ui_range);
        Ro.SetAmmoSize(ib.clip_size, ib.start_ammo - ib.clip_size);
        Ro.SetSkill(ib.GetPartSkillName(ibi.PartID));        
    }
    else
    {
        Ro.SetDamage(cib.ui_damage, ib.ui_damage - cib.ui_damage);
        Ro.SetSpread(cib.ui_spread, ib.ui_spread - cib.ui_spread);
        Ro.SetViewKick(cib.ui_view_kick, ib.ui_view_kick - cib.ui_view_kick);
        Ro.SetRateofFire(cib.ui_rate_of_fire, ib.ui_rate_of_fire - cib.ui_rate_of_fire);
        Ro.SetMove(cib.ui_move, ib.ui_move - cib.ui_move);
        Ro.SetRange(cib.ui_range, ib.ui_range - cib.ui_range);
        Ro.SetAmmoSize(cib.clip_size, cib.start_ammo - cib.clip_size, ib.clip_size - cib.clip_size, (ib.start_ammo - ib.clip_size) - (cib.start_ammo - cib.clip_size));
        Ro.SetSkill(ib.GetPartSkillName(ibi.PartID), cib.GetPartSkillName(cibi.PartID));
    }
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = byte(CanvasStyle);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1_half_alpha, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    Ro.bVisible = self.bVisible;
    Ro.AWinPos = self.AWinPos;
    Ro.Render(C, 0.0000000);
    //return;    
}
