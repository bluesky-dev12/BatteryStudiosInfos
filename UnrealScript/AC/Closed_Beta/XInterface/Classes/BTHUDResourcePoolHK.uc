class BTHUDResourcePoolHK extends Object;

var Image keyb_Z;
var Image keyb_1;
var Image keyb_2;
var Image keyb_3;
var Image keyb_4;
var Image keyb_5;
var Image keyb_T;
var Image keyb_E;
var Image keyb_B;
var Image keyb_Q;
var Image img_login_test;
var Image hud_back_1;
var Image hud_back_2;
var Image hud_back_3;
var Image hud_back_4;
var Image hud_back_4_1;
var Image hud_back_5;
var Image hud_chat_but;
var Image img_HUD_back_1;
var Image img_HUD_back_2;
var Image InGameChatCursor;
var Image Key_Bg;
var Image butt_n;
var Image butt_quick3;
var Image butt_On1;
var Image butt_On2;
var Image butt_Keyboard;
var Image img_TextSelect;
var Image img_TextBack;
var Image newButt_n;
var Image Weapon_Type_n;
var Image Weapon_Sel_Line;
var Image Slot_Bg;
var Image MainWeapon_Bg;
var Image SubWeapon_Bg;
var Image MeleeWeapon_Bg;
var Image SpWeapon_Bg;
var Image ActiveSkill_Bg;
var Image PassiveSkill_Bg;

defaultproperties
{
    img_login_test=(X=0.0000000,Y=0.0000000,Width=1024.0000000,Height=768.0000000,Image=Texture'Warfare_Login.Common.img_login_test',DrawType=28,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    hud_back_1=(X=0.0000000,Y=0.0000000,Width=16.0000000,Height=16.0000000,Image=Texture'Warfare_GP_UI_UI.Common.img_back_quick_1',DrawType=15,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    hud_back_2=(X=0.0000000,Y=0.0000000,Width=16.0000000,Height=16.0000000,Image=Texture'Warfare_GP_UI_UI.Common.img_back_quick_2',DrawType=15,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    hud_back_3=(X=0.0000000,Y=0.0000000,Width=16.0000000,Height=16.0000000,Image=Texture'Warfare_GP_UI_UI.Common.img_back_quick_3',DrawType=15,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    hud_back_4=(X=0.0000000,Y=0.0000000,Width=1024.0000000,Height=16.0000000,Image=Texture'Warfare_GP_UI_HUD.Common.hud_back_4',DrawType=15,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    hud_back_4_1=(X=0.0000000,Y=0.0000000,Width=16.0000000,Height=16.0000000,Image=Texture'Warfare_GP_UI_UI.Common.img_back_quick_4',DrawType=15,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    hud_back_5=(X=0.0000000,Y=0.0000000,Width=16.0000000,Height=16.0000000,Image=Texture'Warfare_GP_UI_UI.Common.img_back_quick_5',DrawType=15,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    hud_chat_but=(X=0.0000000,Y=0.0000000,Width=67.0000000,Height=31.0000000,Image=Texture'Warfare_GP_UI_HUD.Common.hud_chat_but',DrawType=15,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    img_HUD_back_1=(X=0.0000000,Y=0.0000000,Width=1024.0000000,Height=2.0000000,Image=Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_1',DrawType=15,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    img_HUD_back_2=(X=0.0000000,Y=0.0000000,Width=512.0000000,Height=8.0000000,Image=Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_2',DrawType=15,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    InGameChatCursor=(X=0.0000000,Y=0.0000000,Width=0.0000000,Height=0.0000000,Image=FadeColor'Warfare_UI.HUD.InGameChatCursor',DrawType=15,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    Key_Bg=(X=0.0000000,Y=0.0000000,Width=32.0000000,Height=32.0000000,Image=Texture'Warfare_GP_UI_UI.Common.img_keyback',DrawType=28,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    butt_n=(X=0.0000000,Y=0.0000000,Width=336.0000000,Height=41.0000000,Image=Texture'Warfare_GP_UI_UI.Common.butt_HUD_all',DrawType=28,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    butt_quick3=(X=0.0000000,Y=0.0000000,Width=16.0000000,Height=16.0000000,Image=Texture'Warfare_GP_UI_UI.Common.img_back_quick_3',DrawType=15,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    butt_Keyboard=(X=0.0000000,Y=0.0000000,Width=26.0000000,Height=26.0000000,Image=Texture'Warfare_GP_UI_HUD.Common.img_keyboard_2',DrawType=28,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    img_TextSelect=(X=0.0000000,Y=0.0000000,Width=8.0000000,Height=8.0000000,Image=Texture'Engine.MenuWhite',DrawType=15,DrawColor=(R=229,G=229,B=229,A=128),DrawShadowColor=(R=255,G=255,B=255,A=255))
    img_TextBack=(X=0.0000000,Y=0.0000000,Width=16.0000000,Height=16.0000000,Image=Texture'Warfare_GP_UI_UI.Common.panel_1_1',DrawType=15,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=0,G=0,B=0,A=255))
    newButt_n=(X=0.0000000,Y=0.0000000,Width=339.0000000,Height=49.0000000,Image=Texture'Warfare_GP_UI_UI.HUD_ETC.butt_hud_quickslot_openslot',DrawType=28,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    Weapon_Type_n=(X=0.0000000,Y=0.0000000,Width=214.0000000,Height=49.0000000,Image=Texture'Warfare_GP_UI_UI.HUD_ETC.butt_hud_quickslot_slottype',DrawType=28,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    Weapon_Sel_Line=(X=0.0000000,Y=0.0000000,Width=64.0000000,Height=64.0000000,Image=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_quickslot_slotselectedline',DrawType=15,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    Slot_Bg=(X=0.0000000,Y=0.0000000,Width=64.0000000,Height=64.0000000,Image=Texture'Warfare_GP_UI_UI.HUD_ETC.img_scoreboard_blackstroke_back',DrawType=15,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    MainWeapon_Bg=(X=0.0000000,Y=0.0000000,Width=210.0000000,Height=42.0000000,Image=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_quickslot_weaponslot',DrawType=28,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    SubWeapon_Bg=(X=0.0000000,Y=42.0000000,Width=210.0000000,Height=84.0000000,Image=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_quickslot_weaponslot',DrawType=28,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    MeleeWeapon_Bg=(X=84.0000000,Y=0.0000000,Width=210.0000000,Height=126.0000000,Image=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_quickslot_weaponslot',DrawType=28,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    SpWeapon_Bg=(X=0.0000000,Y=126.0000000,Width=210.0000000,Height=168.0000000,Image=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_quickslot_weaponslot',DrawType=28,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    ActiveSkill_Bg=(X=168.0000000,Y=0.0000000,Width=210.0000000,Height=210.0000000,Image=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_quickslot_weaponslot',DrawType=28,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
    PassiveSkill_Bg=(X=210.0000000,Y=0.0000000,Width=210.0000000,Height=252.0000000,Image=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_quickslot_weaponslot',DrawType=28,DrawColor=(R=255,G=255,B=255,A=255),DrawShadowColor=(R=255,G=255,B=255,A=255))
}