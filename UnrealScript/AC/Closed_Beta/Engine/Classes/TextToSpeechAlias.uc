class TextToSpeechAlias extends Object
    abstract
    native;

struct native SpeechReplacement
{
    var array<string> MatchWords;
    var string ReplaceWord;
};

var array<SpeechReplacement> Aliases;
var string RemoveCharacters;

defaultproperties
{
    Aliases[0]=(MatchWords=MatchWords[0]="gg",ReplaceWord="good game")
    Aliases[1]=(MatchWords=MatchWords[0]="rofl"
    MatchWords[1]="rotfl"
    MatchWords[2]="rotflmao",ReplaceWord="rolls on floor laughing!")
    Aliases[2]=(MatchWords=MatchWords[0]="lol",ReplaceWord="laughing out loud!")
    Aliases[3]=(MatchWords=MatchWords[0]=":)"
    MatchWords[1]=":-)"
    MatchWords[2]=":P",ReplaceWord="smile")
    Aliases[4]=(MatchWords=MatchWords[0]=";)"
    MatchWords[1]=";-)"
    MatchWords[2]=";P",ReplaceWord="wink")
    Aliases[5]=(MatchWords=MatchWords[0]="omg"
    MatchWords[1]="omfg"
    MatchWords[2]="omg!"
    MatchWords[3]="omfg!",ReplaceWord="oh my god!")
    Aliases[6]=(MatchWords=MatchWords[0]="ns",ReplaceWord="nice shot")
    Aliases[7]=(MatchWords=MatchWords[0]="hf",ReplaceWord="have fun")
    Aliases[8]=(MatchWords=MatchWords[0]="fc",ReplaceWord="flag carrier")
    Aliases[9]=(MatchWords=MatchWords[0]="ih",ReplaceWord="incoming high")
    Aliases[10]=(MatchWords=MatchWords[0]="iw",ReplaceWord="incoming low")
    Aliases[11]=(MatchWords=MatchWords[0]="ir",ReplaceWord="incoming right")
    Aliases[12]=(MatchWords=MatchWords[0]="il",ReplaceWord="incoming left")
    Aliases[13]=(MatchWords=MatchWords[0]="bbl",ReplaceWord="be back later")
    Aliases[14]=(MatchWords=MatchWords[0]="brb",ReplaceWord="be right back")
    Aliases[15]=(MatchWords=MatchWords[0]="bbiab",ReplaceWord="be back in a bit")
    Aliases[16]=(MatchWords=MatchWords[0]="gg",ReplaceWord="good game")
    Aliases[17]=(MatchWords=MatchWords[0]="rofl"
    MatchWords[1]="rotfl"
    MatchWords[2]="rotflmao",ReplaceWord="rolls on floor laughing!")
    Aliases[18]=(MatchWords=MatchWords[0]="lol",ReplaceWord="laughing out loud!")
    Aliases[19]=(MatchWords=MatchWords[0]="thx",ReplaceWord="thanks")
    Aliases[20]=(MatchWords=MatchWords[0]="np",ReplaceWord="no problem")
    Aliases[21]=(MatchWords=MatchWords[0]=":)"
    MatchWords[1]=":-)"
    MatchWords[2]=":P",ReplaceWord="smile")
    Aliases[22]=(MatchWords=MatchWords[0]=";)"
    MatchWords[1]=";-)"
    MatchWords[2]=";P",ReplaceWord="wink")
    Aliases[23]=(MatchWords=MatchWords[0]="omg"
    MatchWords[1]="omfg",ReplaceWord="oh my god!")
    Aliases[24]=(MatchWords=MatchWords[0]="ns",ReplaceWord="nice shot")
    Aliases[25]=(MatchWords=MatchWords[0]="hf",ReplaceWord="have fun")
    Aliases[26]=(MatchWords=MatchWords[0]="fc",ReplaceWord="flag carrier")
    Aliases[27]=(MatchWords=MatchWords[0]="ih",ReplaceWord="incoming high")
    Aliases[28]=(MatchWords=MatchWords[0]="iw",ReplaceWord="incoming low")
    Aliases[29]=(MatchWords=MatchWords[0]="ir",ReplaceWord="incoming right")
    Aliases[30]=(MatchWords=MatchWords[0]="il",ReplaceWord="incoming left")
    Aliases[31]=(MatchWords=MatchWords[0]="thx",ReplaceWord="thanks")
    Aliases[32]=(MatchWords=MatchWords[0]="gl",ReplaceWord="good luck")
    Aliases[33]=(MatchWords=MatchWords[0]="cya",ReplaceWord="seeya")
    Aliases[34]=(MatchWords=MatchWords[0]="gj",ReplaceWord="good job")
    Aliases[35]=(MatchWords=MatchWords[0]="ty",ReplaceWord="thank you")
    Aliases[36]=(MatchWords=MatchWords[0]="bbl",ReplaceWord="be back later")
    Aliases[37]=(MatchWords=MatchWords[0]="brb",ReplaceWord="be right back")
    Aliases[38]=(MatchWords=MatchWords[0]="bbiab",ReplaceWord="be back in a bit")
    Aliases[39]=(MatchWords=MatchWords[0]="woot"
    MatchWords[1]="w00t",ReplaceWord="woute")
    Aliases[40]=(MatchWords=MatchWords[0]="woot!"
    MatchWords[1]="w00t!",ReplaceWord="woute!")
    Aliases[41]=(MatchWords=MatchWords[0]="woohoo",ReplaceWord="woo who")
    RemoveCharacters="|:][}{^/~()*"
}