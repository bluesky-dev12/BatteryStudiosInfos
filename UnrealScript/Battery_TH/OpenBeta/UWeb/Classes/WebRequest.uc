class WebRequest extends Object
    native
    noexport;

enum ERequestType
{
    Request_GET,                    // 0
    Request_POST                    // 1
};

var string URI;
var string UserName;
var string Password;
var int ContentLength;
var string ContentType;
var WebRequest.ERequestType RequestType;
var private native const TMultiMap VariableMap;

// Export UWebRequest::execDecodeBase64(FFrame&, void* const)
native final function string DecodeBase64(string Encoded)
{
    //native.Encoded;        
}

// Export UWebRequest::execAddVariable(FFrame&, void* const)
native final function AddVariable(string VariableName, coerce string Value)
{
    //native.VariableName;
    //native.Value;        
}

// Export UWebRequest::execGetVariable(FFrame&, void* const)
native final function string GetVariable(string VariableName, optional string DefaultValue)
{
    //native.VariableName;
    //native.DefaultValue;        
}

// Export UWebRequest::execGetVariableCount(FFrame&, void* const)
native final function int GetVariableCount(string VariableName)
{
    //native.VariableName;        
}

// Export UWebRequest::execGetVariableNumber(FFrame&, void* const)
native final function string GetVariableNumber(string VariableName, int Number, optional string DefaultValue)
{
    //native.VariableName;
    //native.Number;
    //native.DefaultValue;        
}

// Export UWebRequest::execDump(FFrame&, void* const)
native final function Dump();

function ProcessHeaderString(string S)
{
    local int i;

    // End:0x88
    if(Left(S, 21) ~= "Authorization: Basic ")
    {
        S = DecodeBase64(Mid(S, 21, 256));
        i = InStr(S, ":");
        // End:0x85
        if(i != -1)
        {
            UserName = Left(S, i);
            Password = Mid(S, i + 1);
        }        
    }
    else
    {
        // End:0xBE
        if(Left(S, 16) ~= "Content-Length: ")
        {
            ContentLength = int(Mid(S, 16, 64));            
        }
        else
        {
            // End:0xF0
            if(Left(S, 14) ~= "Content-Type: ")
            {
                ContentType = Mid(S, 14, 512);
            }
        }
    }
    //return;    
}

function DecodeFormData(string Data)
{
    local string Token[2], ch;
    local int i, H1, H2, limit, t;

    t = 0;
    i = 0;
    J0x0E:

    // End:0x1D8 [Loop If]
    if(i < Len(Data))
    {
        // End:0x54
        if((limit > Class'UWeb_Decompressed.WebConnection'.default.MaxValueLength) || i > Class'UWeb_Decompressed.WebConnection'.default.MaxLineLength)
        {
            // [Explicit Break]
            goto J0x1D8;
        }
        ch = Mid(Data, i, 1);
        switch(ch)
        {
            // End:0x90
            case "+":
                Token[t] $= " ";
                limit++;
                // End:0x1CE
                break;
            // End:0x96
            case "&":
            // End:0xE3
            case "?":
                // End:0xBE
                if(Token[0] != "")
                {
                    AddVariable(Token[0], Token[1]);
                }
                Token[0] = "";
                Token[1] = "";
                t = 0;
                limit = 0;
                // End:0x1CE
                break;
            // End:0x11D
            case "=":
                // End:0x105
                if(t == 0)
                {
                    limit = 0;
                    t = 1;                    
                }
                else
                {
                    Token[1] $= "=";
                    limit++;
                }
                // End:0x1CE
                break;
            // End:0x1B0
            case "%":
                H1 = GetHexDigit(Mid(Data, ++i, 1));
                // End:0x1A6
                if(H1 != -1)
                {
                    limit++;
                    H1 *= float(16);
                    H2 = GetHexDigit(Mid(Data, ++i, 1));
                    // End:0x1A6
                    if(H2 != -1)
                    {
                        Token[t] $= Chr(H1 + H2);
                    }
                }
                limit++;
                // End:0x1CE
                break;
            // End:0xFFFF
            default:
                Token[t] $= ch;
                limit++;
                break;
        }
        i++;
        // [Loop Continue]
        goto J0x0E;
    }
    J0x1D8:

    // End:0x1FA
    if(Token[0] != "")
    {
        AddVariable(Token[0], Token[1]);
    }
    //return;    
}

function int GetHexDigit(string D)
{
    switch(Caps(D))
    {
        // End:0x11
        case "0":
            return 0;
        // End:0x19
        case "1":
            return 1;
        // End:0x22
        case "2":
            return 2;
        // End:0x2B
        case "3":
            return 3;
        // End:0x34
        case "4":
            return 4;
        // End:0x3D
        case "5":
            return 5;
        // End:0x46
        case "6":
            return 6;
        // End:0x4F
        case "7":
            return 7;
        // End:0x58
        case "8":
            return 8;
        // End:0x61
        case "9":
            return 9;
        // End:0x6A
        case "A":
            return 10;
        // End:0x73
        case "B":
            return 11;
        // End:0x7C
        case "C":
            return 12;
        // End:0x85
        case "D":
            return 13;
        // End:0x8E
        case "E":
            return 14;
        // End:0x97
        case "F":
            return 15;
        // End:0xFFFF
        default:
            return -1;
            break;
    }
    //return;    
}
