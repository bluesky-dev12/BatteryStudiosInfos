class SPECIES_Merc extends SPECIES_Human
    abstract;

static function string GetRagSkelName(string MeshName)
{
    // End:0x1A
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
    //return;    
}

defaultproperties
{
    MaleSoundGroup="WGame.wMercMaleSoundGroup"
    FemaleSoundGroup="WGame.wMercFemaleSoundGroup"
    SpeciesName="??"
    RaceNum=4
}