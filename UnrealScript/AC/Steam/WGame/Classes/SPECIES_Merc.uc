/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\SPECIES_Merc.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class SPECIES_Merc extends SPECIES_Human
    abstract;

static function string GetRagSkelName(string MeshName)
{
    // End:0x1a
    if(InStr(MeshName, "Gitty") >= 0)
    {
        return default.FemaleRagSkelName;
    }
    // End:0x36
    if(InStr(MeshName, "Ophelia") >= 0)
    {
        return default.FemaleRagSkelName;
    }
    return super(SpeciesType).GetRagSkelName(MeshName);
}

defaultproperties
{
    MaleSoundGroup="WGame.wMercMaleSoundGroup"
    FemaleSoundGroup="WGame.wMercFemaleSoundGroup"
    SpeciesName="??"
    RaceNum=4
}