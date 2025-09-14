/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\LogEntry.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:3
 *
 *******************************************************************************/
class LogEntry extends Object
    native
    config();

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
    // End:0x63
    else
    {
        cur = Next;
        J0x24:
        // End:0x4f [While If]
        if(cur.Next != none)
        {
            cur = cur.Next;
            // This is an implied JumpToken; Continue!
            goto J0x24;
        }
        cur.Next = newLE;
    }
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
    // End:0x80
    else
    {
        Prev = self;
        cur = Next;
        J0x32:
        // End:0x63 [While If]
        if(cur != delLE)
        {
            Prev = cur;
            cur = cur.Next;
            // This is an implied JumpToken; Continue!
            goto J0x32;
        }
        Prev.Next = cur.Next;
    }
    return head;
}

simulated function int Count()
{
    local int Num;
    local LogEntry le;

    le = self;
    Num = 0;
    J0x0e:
    // End:0x37 [While If]
    if(le != none)
    {
        ++ Num;
        le = le.Next;
        // This is an implied JumpToken; Continue!
        goto J0x0e;
    }
    return Num;
}

defaultproperties
{
    DateTime="No Date/Time specified."
    Entry="No Data."
}