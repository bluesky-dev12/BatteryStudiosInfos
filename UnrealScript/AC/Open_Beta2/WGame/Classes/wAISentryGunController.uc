class wAISentryGunController extends wAIBot;

const SENTRYGUN_VIEW_ANGLE = 45.0;
const SENTRYGUN_ROTATION_STEP = 10000;
const RUU = 65535;

var bool m_bAimingTarget;

function ExecuteWhatToDoNext()
{
    //return;    
}

function bool IsFinishSpecificBoneRotate()
{
    return m_bAimingTarget;
    //return;    
}

simulated function Rotator GetViewRotation()
{
    local int i;
    local Rotator resultViewRotatio;

    i = 0;
    J0x07:

    // End:0x4B [Loop If]
    if(i < Pawn.m_aSpecificBoneRotateInfo.Length)
    {
        resultViewRotatio += Pawn.m_aSpecificBoneRotateInfo[i].boneRotator;
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    return resultViewRotatio;
    //return;    
}

state InstallState
{
    function BeginState()
    {
        Pawn.AddSpecificBoneRotator('Bone_weapon');
        //return;        
    }

    function Tick(float dt)
    {
        // End:0x1B
        if(none != Pawn.Weapon)
        {
            GotoState('AttackModeState');
        }
        //return;        
    }
    stop;    
}

state AttackModeState
{
    function BeginState()
    {
        // End:0x43
        if(none == Goal)
        {
            Goal = Goal_PlanAndExec(AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_PlanAndExec')).Init(self, Planner);
        }
        Memory.SetOffsetStandHeight(100.0000000);
        Memory.SetOffsetCrouchHeight(80.0000000);
        //return;        
    }

    function Tick(float dt)
    {
        Memory.Update(dt);
        UpdateSpecificBoneRotation(dt);
        // End:0x2C
        if(none == Goal)
        {
            return;
        }
        UpdateElapsed += dt;
        // End:0x49
        if(UpdateElapsed <= UpdateInterval)
        {
            return;
        }
        Goal.SetFocus();
        switch(Goal.Process(UpdateElapsed))
        {
            // End:0x73
            case 3:
            // End:0x89
            case 2:
                Goal = none;
                GotoState('IdleState');
                // End:0x8C
                break;
            // End:0xFFFF
            default:
                break;
        }
        UpdateElapsed = 0.0000000;
        //return;        
    }

    protected function UpdateSpecificBoneRotation(float dt)
    {
        local int iTargetYaw, iWeaponYaw, iPawnYaw, iRUU, iPositiveRangeRUU, iNagativeRangeRUU,
	        iCircleUnitCount;

        local MemoryItem mi;
        local Rotator rotTarget;

        Planner.WorkingState.bAimingTarget = false;
        mi = TargetSystem.GetTarget();
        // End:0x3C
        if(none == mi)
        {
            return;
        }
        // End:0x52
        if(none == mi.Pawn)
        {
            return;
        }
        rotTarget = Rotator(mi.Pawn.Location - Pawn.Location);
        iTargetYaw = rotTarget.Yaw;
        iRUU = Degree2Unreal(45.0000000);
        iPawnYaw = Pawn.Rotation.Yaw;
        iPositiveRangeRUU = iPawnYaw + iRUU;
        iNagativeRangeRUU = iPawnYaw - iRUU;
        // End:0x139
        if(iNagativeRangeRUU > iTargetYaw)
        {
            // End:0x136
            if((iPositiveRangeRUU - iTargetYaw) > 65535)
            {
                iCircleUnitCount = (iPositiveRangeRUU - iTargetYaw) / 65535;
                iTargetYaw = iTargetYaw + (iCircleUnitCount * 65535);
            }            
        }
        else
        {
            // End:0x190
            if(iPositiveRangeRUU < iTargetYaw)
            {
                // End:0x190
                if((iTargetYaw - iNagativeRangeRUU) > 65535)
                {
                    iCircleUnitCount = (iTargetYaw - iNagativeRangeRUU) / 65535;
                    iTargetYaw = iTargetYaw - (iCircleUnitCount * 65535);
                }
            }
        }
        // End:0x1A1
        if(iPositiveRangeRUU < iTargetYaw)
        {
            return;
        }
        // End:0x1B2
        if(iNagativeRangeRUU > iTargetYaw)
        {
            return;
        }
        iWeaponYaw = iPawnYaw + Pawn.m_aSpecificBoneRotateInfo[0].boneRotator.Yaw;
        // End:0x236
        if(iTargetYaw > iWeaponYaw)
        {
            iWeaponYaw += int(dt * float(10000));
            // End:0x219
            if(iWeaponYaw > iTargetYaw)
            {
                iWeaponYaw = iTargetYaw;
            }
            // End:0x233
            if(iWeaponYaw > iPositiveRangeRUU)
            {
                iWeaponYaw = iPositiveRangeRUU;
            }            
        }
        else
        {
            // End:0x290
            if(iTargetYaw < iWeaponYaw)
            {
                iWeaponYaw -= int(dt * float(10000));
                // End:0x276
                if(iWeaponYaw < iTargetYaw)
                {
                    iWeaponYaw = iTargetYaw;
                }
                // End:0x290
                if(iWeaponYaw < iNagativeRangeRUU)
                {
                    iWeaponYaw = iNagativeRangeRUU;
                }
            }
        }
        // End:0x2BC
        if(iWeaponYaw == iTargetYaw)
        {
            Planner.WorkingState.bAimingTarget = true;            
        }
        else
        {
            // End:0x2E7
            if(iPawnYaw < iTargetYaw)
            {
                iWeaponYaw = iPawnYaw - (iTargetYaw - iPawnYaw);                
            }
            else
            {
                iWeaponYaw = iPawnYaw + (iPawnYaw - iTargetYaw);
            }
            Planner.WorkingState.bAimingTarget = true;
        }
        iWeaponYaw = iWeaponYaw - iPawnYaw;
        Pawn.m_aSpecificBoneRotateInfo[0].boneRotator.Yaw = iWeaponYaw;
        //return;        
    }

    protected function int Degree2Unreal(float Angle)
    {
        return int((Angle / 360.0000000) * float(65535));
        //return;        
    }

    protected function float Unreal2Degree(int iRUU)
    {
        return (float(iRUU) * 360.0000000) / float(65535);
        //return;        
    }
    stop;    
}

defaultproperties
{
    StateOnPossess="InstallState"
    PawnClass=Class'WGame_Decompressed.wSentryGunPawn'
}