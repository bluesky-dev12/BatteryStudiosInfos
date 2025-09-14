class PlayerRecordClass extends Object
    abstract;

var() Class<SpeciesType> Species;
var() string MeshName;
var() string BodySkinName;
var() string FaceSkinName;
var() Material Portrait;
var() string TextName;
var() string VoiceClassName;
var() string Sex;
var() string Menu;
var() string Skeleton;
var() string Ragdoll;
var() Class<wPlayerInfo> PlayerInfo;

static simulated function PlayerRecord FillPlayerRecord()
{
    local PlayerRecord PRE;

    PRE.Species = default.Species;
    PRE.MeshName = default.MeshName;
    PRE.BodySkinName = default.BodySkinName;
    PRE.FaceSkinName = default.FaceSkinName;
    PRE.Portrait = default.Portrait;
    PRE.TextName = default.TextName;
    PRE.VoiceClassName = default.VoiceClassName;
    PRE.Sex = default.Sex;
    PRE.Menu = default.Menu;
    PRE.Skeleton = default.Skeleton;
    PRE.Ragdoll = default.Ragdoll;
    PRE.PlayerInfo = default.PlayerInfo;
    return PRE;
    //return;    
}
