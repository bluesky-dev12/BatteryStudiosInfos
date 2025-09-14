class BGMTable extends Object;

var array<string> Files;
var array<int> Durations;

static function int GetDuration(string File)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x42 [Loop If]
    if(lp1 < default.Files.Length)
    {
        // End:0x38
        if(default.Files[lp1] == File)
        {
            return default.Durations[lp1];
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return 0;
    //return;    
}

defaultproperties
{
    Files[0]="bgm_af_lose"
    Files[1]="bgm_af_start"
    Files[2]="bgm_af_theme"
    Files[3]="bgm_af_win"
    Files[4]="bgm_c1_general_1"
    Files[5]="bgm_c2_general_1"
    Files[6]="bgm_c3_general_1"
    Files[7]="bgm_c4_jungle_1"
    Files[8]="bgm_c5_city_1"
    Files[9]="bgm_c6_village_1"
    Files[10]="bgm_c7_plain_1"
    Files[11]="bgm_c8_snowfield_1"
    Files[12]="bgm_c9_desert_1"
    Files[13]="bgm_last_losing"
    Files[14]="bgm_last_winning"
    Files[15]="bgm_lobby_part1"
    Files[16]="bgm_lobby_part2"
    Files[17]="bgm_maintheme_part1"
    Files[18]="bgm_rsa_lose"
    Files[19]="bgm_rsa_start"
    Files[20]="bgm_rsa_theme"
    Files[21]="bgm_rsa_win"
    Files[22]="bgm_shop"
    Durations[0]=21
    Durations[1]=15
    Durations[2]=131
    Durations[3]=18
    Durations[4]=69
    Durations[5]=69
    Durations[6]=67
    Durations[7]=78
    Durations[8]=71
    Durations[9]=72
    Durations[10]=66
    Durations[11]=73
    Durations[12]=65
    Durations[13]=20
    Durations[14]=20
    Durations[15]=98
    Durations[16]=101
    Durations[17]=209
    Durations[18]=21
    Durations[19]=13
    Durations[20]=112
    Durations[21]=19
    Durations[22]=81
}