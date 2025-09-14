/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\SoundGroup.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *
 *******************************************************************************/
class SoundGroup extends Sound
    hidecategories(Object,Object)
    native
    noexport;

var deprecated string Package;
var(Sound) native array<Sound> Sounds;
var native const transient float TotalLikelihood;
var const transient Sound RenderedSound;
