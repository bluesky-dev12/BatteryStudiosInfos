/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\SpriteEmitter.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:3
 *
 *******************************************************************************/
class SpriteEmitter extends ParticleEmitter
    native
    editinlinenew;

enum EParticleDirectionUsage
{
    PTDU_None,
    PTDU_Up,
    PTDU_Right,
    PTDU_Forward,
    PTDU_Normal,
    PTDU_UpAndNormal,
    PTDU_RightAndNormal,
    PTDU_Scale
};

var(Sprite) SpriteEmitter.EParticleDirectionUsage UseDirectionAs;
var(Sprite) Vector ProjectionNormal;
var transient Vector RealProjectionNormal;

defaultproperties
{
    ProjectionNormal=(X=0.0,Y=0.0,Z=1.0)
}