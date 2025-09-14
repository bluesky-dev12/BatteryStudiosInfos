/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\AimedAttachment.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *
 *******************************************************************************/
class AimedAttachment extends Actor
    native
    notplaceable;

var() Vector BaseOffset;
var() Vector AimedOffset;
var() float DownwardBias;
