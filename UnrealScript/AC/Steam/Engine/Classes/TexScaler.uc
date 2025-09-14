/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\TexScaler.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *
 *******************************************************************************/
class TexScaler extends TexModifier
    hidecategories(Object,Material)
    native
    editinlinenew
    collapsecategories;

var Matrix M;
var() float UScale;
var() float VScale;
var() float UOffset;
var() float VOffset;

defaultproperties
{
    UScale=1.0
    VScale=1.0
}