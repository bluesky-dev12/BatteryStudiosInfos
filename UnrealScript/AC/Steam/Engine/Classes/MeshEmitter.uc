/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\MeshEmitter.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *
 *******************************************************************************/
class MeshEmitter extends ParticleEmitter
    native
    editinlinenew;

var(Mesh) StaticMesh StaticMesh;
var(Mesh) bool UseMeshBlendMode;
var(Mesh) bool RenderTwoSided;
var(Mesh) bool UseParticleColor;
var transient Vector MeshExtent;

defaultproperties
{
    UseMeshBlendMode=true
    StartSizeRange=(X=(Min=1.0,Max=1.0),Y=(Min=1.0,Max=1.0),Z=(Min=1.0,Max=1.0))
}