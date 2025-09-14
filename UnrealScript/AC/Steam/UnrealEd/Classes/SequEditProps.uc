/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealEd\Classes\SequEditProps.uc
 * Package Imports:
 *	UnrealEd
 *	Core
 *
 * Stats:
 *	Properties:7
 *
 *******************************************************************************/
class SequEditProps extends Object
    hidecategories(Object)
    native;

var const transient pointer WBrowserAnimationPtr;
var(Adjust) Vector Translation;
var(Adjust) Rotator Rotation;
var(SequenceProperties) float Rate;
var(SequenceProperties) float Compression;
var(SequenceProperties) name SequenceName;
var(Groups) array<name> Groups;
