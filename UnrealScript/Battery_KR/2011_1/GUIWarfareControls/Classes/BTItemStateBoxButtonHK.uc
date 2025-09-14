class BTItemStateBoxButtonHK extends GUIButton
    editinlinenew
    instanced;

var BTROItemStateBoxHK StateBox;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    StateBox = new Class'GUIWarfareControls_Decompressed.BTROItemStateBoxHK';
    StateBox.Init();
    //return;    
}

function SetData(wItemBoxHK ib, wItemBoxInstanceHK ibi, optional wItemBoxHK cib, optional wItemBoxInstanceHK cibi)
{
    // End:0x123
    if(cib == none)
    {
        StateBox.SetDamage(ib.ui_damage);
        StateBox.SetSpread(ib.ui_spread);
        StateBox.SetViewKick(ib.ui_view_kick);
        StateBox.SetRateofFire(ib.ui_rate_of_fire);
        StateBox.SetMove(ib.ui_move);
        StateBox.SetRange(ib.ui_range);
        StateBox.SetAmmoSize(ib.clip_size, ib.start_ammo - ib.clip_size);
        StateBox.SetSkill(ib.GetPartSkillName(ibi.PartID));        
    }
    else
    {
        StateBox.SetDamage(cib.ui_damage, ib.ui_damage - cib.ui_damage);
        StateBox.SetSpread(cib.ui_spread, ib.ui_spread - cib.ui_spread);
        StateBox.SetViewKick(cib.ui_view_kick, ib.ui_view_kick - cib.ui_view_kick);
        StateBox.SetRateofFire(cib.ui_rate_of_fire, ib.ui_rate_of_fire - cib.ui_rate_of_fire);
        StateBox.SetMove(cib.ui_move, ib.ui_move - cib.ui_move);
        StateBox.SetRange(cib.ui_range, ib.ui_range - cib.ui_range);
        StateBox.SetAmmoSize(cib.clip_size, cib.start_ammo - cib.clip_size, ib.clip_size - cib.clip_size, (ib.start_ammo - ib.clip_size) - (cib.start_ammo - cib.clip_size));
        StateBox.SetSkill(ib.GetPartSkillName(ibi.PartID), cib.GetPartSkillName(cibi.PartID));
    }
    //return;    
}

function bool OnDraw(Canvas C)
{
    StateBox.bVisible = self.bVisible;
    StateBox.AWinPos = self.RWinPos;
    // End:0x6A
    if((int(MenuState) == int(1)) || int(MenuState) == int(3))
    {
        StateBox.bMouseOn = true;        
    }
    else
    {
        StateBox.bMouseOn = false;
    }
    StateBox.Render(C);
    return true;
    //return;    
}

defaultproperties
{
    OnDraw=BTItemStateBoxButtonHK.OnDraw
}