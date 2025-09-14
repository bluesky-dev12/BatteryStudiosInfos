/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\PageOnWindowManager.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:13
 *
 *******************************************************************************/
class PageOnWindowManager extends Object;

var bool bProcess;
var GUIController Controller;
var PageOnWindow Pow[30];

function bool IsAvailable()
{
    return bProcess;
}

function StartProcess()
{
    bProcess = true;
}

function StopProcess()
{
    bProcess = false;
}

function Init(GUIController C)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x32 [While If]
    if(i < 30)
    {
        Pow[i] = new class'PageOnWindow';
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    Controller = C;
    StartProcess();
}

function CloseAndClear()
{
    local int i, j;

    i = 0;
    J0x07:
    // End:0x8d [While If]
    if(i < 30)
    {
        j = 0;
        J0x1a:
        // End:0x6c [While If]
        if(j < Pow[i].WindowList.Length)
        {
            Controller.CloseMenuPage(Pow[i].WindowList[j]);
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x1a;
        }
        Pow[i].WindowList.Length = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function BTWindowHK CreateAndPush(Core.Object.EPage destpage, string WindowName, optional bool bUseInsert, optional int insertPos, optional bool bUseInsertAtName, optional name nobject)
{
    local export editinline GUIPage GP;
    local class<GUIPage> NewMenuClass;

    NewMenuClass = class<GUIPage>(Controller.AddComponentClass(WindowName));
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
}

function Push(Core.Object.EPage destpage, BTWindowHK N, optional bool bUseInsert, optional int insertPos, optional bool bUseInsertAtName, optional name nobject)
{
    local int i;

    // End:0xc7
    if(bUseInsertAtName)
    {
        i = 0;
        J0x10:
        // End:0xc7 [While If]
        if(i < Pow[destpage].WindowList.Length)
        {
            // End:0xbd
            if(Pow[destpage].WindowList[i].Name == nobject)
            {
                Pow[destpage].WindowList.Insert(i, 1);
                Pow[destpage].WindowList[insertPos] = N;
                Pow[destpage].Last = N;
                return;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x10;
        }
    }
    // End:0x12d
    if(bUseInsert)
    {
        Pow[destpage].WindowList.Insert(insertPos, 1);
        Pow[destpage].WindowList[insertPos] = N;
        Pow[destpage].Last = N;
        return;
    }
    Pow[destpage].WindowList.Length = Pow[destpage].WindowList.Length + 1;
    Pow[destpage].WindowList[Pow[destpage].WindowList.Length - 1] = N;
    Pow[destpage].Last = N;
}

function int ListLen(Core.Object.EPage destpage)
{
    return Pow[destpage].WindowList.Length;
}

function BTWindowHK FindWindowOnStack(Core.Object.EPage destpage, name WindowName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x7e [While If]
    if(i < Pow[destpage].WindowList.Length)
    {
        // End:0x74
        if(Pow[destpage].WindowList[i].Name == WindowName)
        {
            return Pow[destpage].WindowList[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

function bool RemoveWindowOnStack(Core.Object.EPage destpage, name WindowName, optional bool bAll)
{
    local int i;
    local bool bFindAndRemove;

    i = 0;
    J0x07:
    // End:0x9b [While If]
    if(i < Pow[destpage].WindowList.Length)
    {
        // End:0x91
        if(Pow[destpage].WindowList[i].Name == WindowName)
        {
            Pow[destpage].WindowList.Remove(i, 1);
            -- i;
            bFindAndRemove = true;
            // End:0x91
            if(bAll == false)
            {
                return true;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return bFindAndRemove;
}

function BTWindowHK Last(Core.Object.EPage destpage)
{
    return Pow[destpage].Last;
}

function BTWindowHK back(Core.Object.EPage destpage)
{
    // End:0x36
    if(Pow[destpage].WindowList.Length > 0)
    {
        return Pow[destpage].WindowList[0];
    }
    return none;
}

function BTWindowHK Pop(Core.Object.EPage destpage)
{
    local export editinline BTWindowHK BTWindow;

    BTWindow = none;
    // End:0x5b
    if(Pow[destpage].WindowList.Length > 0)
    {
        BTWindow = Pow[destpage].WindowList[0];
        Pow[destpage].WindowList.Remove(0, 1);
    }
    return BTWindow;
}
