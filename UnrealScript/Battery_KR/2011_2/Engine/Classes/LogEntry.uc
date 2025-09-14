class LogEntry extends Object
    native
    config;

var() config string DateTime;
var() config string Entry;
var() LogEntry Next;

simulated function Insert(LogEntry newLE)
{
    local LogEntry cur;

    // End:0x19
    if(Next == none)
    {
        Next = newLE;        
    }
    else
    {
        cur = Next;
        J0x24:

        // End:0x4F [Loop If]
        if(cur.Next != none)
        {
            cur = cur.Next;
            // [Loop Continue]
            goto J0x24;
        }
        cur.Next = newLE;
    }
    //return;    
}

simulated function LogEntry Delete(LogEntry delLE)
{
    local LogEntry head, Prev, cur;

    head = self;
    // End:0x20
    if(self == delLE)
    {
        head = Next;        
    }
    else
    {
        Prev = self;
        cur = Next;
        J0x32:

        // End:0x63 [Loop If]
        if(cur != delLE)
        {
            Prev = cur;
            cur = cur.Next;
            // [Loop Continue]
            goto J0x32;
        }
        Prev.Next = cur.Next;
    }
    return head;
    //return;    
}

simulated function int Count()
{
    local int Num;
    local LogEntry le;

    le = self;
    Num = 0;
    J0x0E:

    // End:0x37 [Loop If]
    if(le != none)
    {
        Num++;
        le = le.Next;
        // [Loop Continue]
        goto J0x0E;
    }
    return Num;
    //return;    
}

defaultproperties
{
    DateTime="No Date/Time specified."
    Entry="No Data."
}