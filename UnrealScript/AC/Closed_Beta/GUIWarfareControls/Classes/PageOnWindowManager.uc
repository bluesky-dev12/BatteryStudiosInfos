class PageOnWindowManager extends Object;

var bool bProcess;
var GUIController Controller;
var PageOnWindow Pow[30];

function bool IsAvailable()
{
    return bProcess;
    //return;    
}

function StartProcess()
{
    bProcess = true;
    //return;    
}

function StopProcess()
{
    bProcess = false;
    //return;    
}

function Init(GUIController C)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x32 [Loop If]
    if(i < 30)
    {
        Pow[i] = new Class'GUIWarfareControls_Decompressed.PageOnWindow';
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    Controller = C;
    StartProcess();
    //return;    
}

function CloseAndClear()
{
    local int i, j;

    i = 0;
    J0x07:

    // End:0x8D [Loop If]
    if(i < 30)
    {
        j = 0;
        J0x1A:

        // End:0x6C [Loop If]
        if(j < Pow[i].WindowList.Length)
        {
            Controller.CloseMenuPage(Pow[i].WindowList[j]);
            j++;
            // [Loop Continue]
            goto J0x1A;
        }
        Pow[i].WindowList.Length = 0;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function BTWindowHK CreateAndPush(Object.EPage destpage, string WindowName, optional bool bUseInsert, optional int insertPos, optional bool bUseInsertAtName, optional name nobject)
{
    local export editinline GUIPage GP;
    local Class<GUIPage> NewMenuClass;

    NewMenuClass = Class<GUIPage>(Controller.AddComponentClass(WindowName));
    // End:0x55
    if(NewMenuClass == none)
    {
        Log("CreateAndPush    NewMenuClass == none");
        return none;
    }
    GP = new NewMenuClass;
    GP.InitComponent(Controller, none);
    Push(destpage, BTWindowHK(GP), bUseInsert, insertPos, bUseInsertAtName, nobject);
    return BTWindowHK(GP);
    //return;    
}

function Push(Object.EPage destpage, BTWindowHK N, optional bool bUseInsert, optional int insertPos, optional bool bUseInsertAtName, optional name nobject)
{
    local int i;

    // End:0xC7
    if(bUseInsertAtName)
    {
        i = 0;
        J0x10:

        // End:0xC7 [Loop If]
        if(i < Pow[int(destpage)].WindowList.Length)
        {
            // End:0xBD
            if(Pow[int(destpage)].WindowList[i].Name == nobject)
            {
                Pow[int(destpage)].WindowList.Insert(i, 1);
                Pow[int(destpage)].WindowList[insertPos] = N;
                Pow[int(destpage)].Last = N;
                return;
            }
            i++;
            // [Loop Continue]
            goto J0x10;
        }
    }
    // End:0x12D
    if(bUseInsert)
    {
        Pow[int(destpage)].WindowList.Insert(insertPos, 1);
        Pow[int(destpage)].WindowList[insertPos] = N;
        Pow[int(destpage)].Last = N;
        return;
    }
    Pow[int(destpage)].WindowList.Length = Pow[int(destpage)].WindowList.Length + 1;
    Pow[int(destpage)].WindowList[Pow[int(destpage)].WindowList.Length - 1] = N;
    Pow[int(destpage)].Last = N;
    //return;    
}

function int ListLen(Object.EPage destpage)
{
    return Pow[int(destpage)].WindowList.Length;
    //return;    
}

function BTWindowHK FindWindowOnStack(Object.EPage destpage, name WindowName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x7E [Loop If]
    if(i < Pow[int(destpage)].WindowList.Length)
    {
        // End:0x74
        if(Pow[int(destpage)].WindowList[i].Name == WindowName)
        {
            return Pow[int(destpage)].WindowList[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function bool RemoveWindowOnStack(Object.EPage destpage, name WindowName, optional bool bAll)
{
    local int i;
    local bool bFindAndRemove;

    i = 0;
    J0x07:

    // End:0x9B [Loop If]
    if(i < Pow[int(destpage)].WindowList.Length)
    {
        // End:0x91
        if(Pow[int(destpage)].WindowList[i].Name == WindowName)
        {
            Pow[int(destpage)].WindowList.Remove(i, 1);
            i--;
            bFindAndRemove = true;
            // End:0x91
            if(bAll == false)
            {
                return true;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return bFindAndRemove;
    //return;    
}

function BTWindowHK Last(Object.EPage destpage)
{
    return Pow[int(destpage)].Last;
    //return;    
}

function BTWindowHK back(Object.EPage destpage)
{
    // End:0x36
    if(Pow[int(destpage)].WindowList.Length > 0)
    {
        return Pow[int(destpage)].WindowList[0];
    }
    return none;
    //return;    
}

function BTWindowHK Pop(Object.EPage destpage)
{
    local export editinline BTWindowHK BTWindow;

    BTWindow = none;
    // End:0x5B
    if(Pow[int(destpage)].WindowList.Length > 0)
    {
        BTWindow = Pow[int(destpage)].WindowList[0];
        Pow[int(destpage)].WindowList.Remove(0, 1);
    }
    return BTWindow;
    //return;    
}
