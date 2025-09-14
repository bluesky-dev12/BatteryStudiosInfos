class AnimNotify_Nemesis_BeamFire extends AnimNotify_Scripted
    editinlinenew
    collapsecategories
    hidecategories(Object);

simulated event Notify(Actor Owner)
{
    local wDefenceBoss aNemesis;

    aNemesis = wDefenceBoss(Owner);
    aNemesis.FireBeam();
    //return;    
}
