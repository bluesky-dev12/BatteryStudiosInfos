class AnimNotify_Nemesis_BeamPrepare extends AnimNotify_Scripted
    editinlinenew
    collapsecategories
    hidecategories(Object);

simulated event Notify(Actor Owner)
{
    local wDefenceBoss aNemesis;

    aNemesis = wDefenceBoss(Owner);
    aNemesis.SpawnPrepareBeamEffect();
    //return;    
}
