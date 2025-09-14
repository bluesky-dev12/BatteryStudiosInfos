class BTItemStateBoxButtonHK extends GUIButton
    editinlinenew
    instanced;

var BTROItemStateBoxHKCN StateBox;
var int BGOffsetX;
var Image GaugeBGImage;
var bool VisibleGaugeBG;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    StateBox = new Class'GUIWarfareControls_Decompressed.BTROItemStateBoxHKCN';
    StateBox.Init();
    //return;    
}

function SetData(wItemBoxHK ib, wItemBoxInstanceHK ibi, optional wItemBoxHK cib, optional wItemBoxInstanceHK cibi)
{
    local int ib_ui_damage, ib_ui_spread, ib_ui_view_kick, ib_ui_rate_of_fire, ib_ui_move, ib_ui_range,
	    cib_ui_damage, cib_ui_spread, cib_ui_view_kick, cib_ui_rate_of_fire, cib_ui_move,
	    cib_ui_range;

    // End:0xE0
    if(ibi != none)
    {
        ib_ui_damage = ib.GetUIDamage(ibi.PartID);
        ib_ui_spread = ib.GetUISpread(ibi.PartID);
        ib_ui_view_kick = ib.GetUIViewKick(ibi.PartID);
        ib_ui_rate_of_fire = ib.GetUIRateOfFire(ibi.PartID);
        ib_ui_move = ib.GetUIMove(ibi.PartID);
        ib_ui_range = ib.GetUIRange(ibi.PartID);        
    }
    else
    {
        ib_ui_damage = ib.GetUIDamage(0);
        ib_ui_spread = ib.GetUISpread(0);
        ib_ui_view_kick = ib.GetUIViewKick(0);
        ib_ui_rate_of_fire = ib.GetUIRateOfFire(0);
        ib_ui_move = ib.GetUIMove(0);
        ib_ui_range = ib.GetUIRange(0);
    }
    // End:0x241
    if(cib != none)
    {
        cib_ui_damage = cib.GetUIDamage(cibi.PartID);
        cib_ui_spread = cib.GetUISpread(cibi.PartID);
        cib_ui_view_kick = cib.GetUIViewKick(cibi.PartID);
        cib_ui_rate_of_fire = cib.GetUIRateOfFire(cibi.PartID);
        cib_ui_move = cib.GetUIMove(cibi.PartID);
        cib_ui_range = cib.GetUIRange(cibi.PartID);
    }
    // End:0x2EE
    if(cib == none)
    {
        StateBox.SetDamage(ib_ui_damage);
        StateBox.SetSpread(ib_ui_spread);
        StateBox.SetViewKick(ib_ui_view_kick);
        StateBox.SetRateofFire(ib_ui_rate_of_fire);
        StateBox.SetMove(ib_ui_move);
        StateBox.SetAmmoSize(ib.clip_size, ib.start_ammo - ib.clip_size);        
    }
    else
    {
        StateBox.SetDamage(cib_ui_damage, ib_ui_damage - cib_ui_damage);
        StateBox.SetSpread(cib_ui_spread, ib_ui_spread - cib_ui_spread);
        StateBox.SetViewKick(cib_ui_view_kick, ib_ui_view_kick - cib_ui_view_kick);
        StateBox.SetRateofFire(cib_ui_rate_of_fire, ib_ui_rate_of_fire - cib_ui_rate_of_fire);
        StateBox.SetMove(cib_ui_move, ib_ui_move - cib_ui_move);
        StateBox.SetAmmoSize(cib.clip_size, cib.start_ammo - cib.clip_size, ib.clip_size - cib.clip_size, (ib.start_ammo - ib.clip_size) - (cib.start_ammo - cib.clip_size));
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
    // End:0x10D
    if(VisibleGaugeBG && GaugeBGImage.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, GaugeBGImage, StateBox.AWinPos.X1 + float(BGOffsetX), StateBox.AWinPos.Y1, StateBox.AWinPos.X2 + float(BGOffsetX), StateBox.AWinPos.Y2);
    }
    StateBox.Render(C);
    return true;
    //return;    
}

defaultproperties
{
    VisibleGaugeBG=true
    OnDraw=BTItemStateBoxButtonHK.OnDraw
}