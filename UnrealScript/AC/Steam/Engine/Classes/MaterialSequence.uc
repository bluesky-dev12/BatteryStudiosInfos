/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\MaterialSequence.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:2
 *	Structs:1
 *	Properties:7
 *	Functions:2
 *
 *******************************************************************************/
class MaterialSequence extends Modifier
    hidecategories(Object,Modifier)
    native
    editinlinenew
    collapsecategories;

enum EMaterialSequenceAction
{
    MSA_ShowMaterial,
    MSA_FadeToMaterial
};

enum EMaterialSequenceTriggerActon
{
    MSTA_Ignore,
    MSTA_Reset,
    MSTA_Pause,
    MSTA_Stop
};

struct native MaterialSequenceItem
{
    var() editinlineuse Material Material;
    var() float Time;
    var() MaterialSequence.EMaterialSequenceAction Action;
};

var() array<MaterialSequenceItem> SequenceItems;
var() MaterialSequence.EMaterialSequenceTriggerActon TriggerAction;
var() bool Loop;
var() bool Paused;
var transient float CurrentTime;
var transient float LastTime;
var float TotalTime;

function Reset()
{
    CurrentTime = 0.0;
    LastTime = 0.0;
    Paused = default.Paused;
}

function Trigger(Actor Other, Actor EventInstigator)
{
    switch(TriggerAction)
    {
        // End:0x25
        case 1:
            CurrentTime = 0.0;
            LastTime = 0.0;
            // End:0x4f
            break;
        // End:0x3c
        case 2:
            Paused = !Paused;
            // End:0x4f
            break;
        // End:0x4c
        case 3:
            Paused = true;
            // End:0x4f
            break;
        // End:0xffff
        default:
}

defaultproperties
{
    Loop=true
}