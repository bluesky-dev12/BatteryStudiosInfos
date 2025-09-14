class Spline extends Object
    native;

const mMaxTimes = 5;

var Vector SplineA;
var Vector SplineB;
var Vector SplineC;
var Vector SplineD;
var Rotator SplineE;
var Rotator SplineF;
var Rotator SplineG;
var Rotator SplineH;
var float mStartT;
var float mEndT;
var bool mbInit;
var float mTime;
var float maDeltaTimes[5];
var int mIndex;
var float mTotalTime;
var bool mbRotatorSpline;
var int mCnt;

// Export USpline::execInitSplinePath(FFrame&, void* const)
native final simulated function bool InitSplinePath(float t0, Vector d0, Vector v0, float t1, Vector d1, Vector v1)
{
    //native.t0;
    //native.d0;
    //native.v0;
    //native.t1;
    //native.d1;
    //native.v1;        
}

// Export USpline::execInitSplineRot(FFrame&, void* const)
native final simulated function bool InitSplineRot(float t0, Rotator d0, Rotator v0, float t1, Rotator d1, Rotator v1)
{
    //native.t0;
    //native.d0;
    //native.v0;
    //native.t1;
    //native.d1;
    //native.v1;        
}

// Export USpline::execNextSplinePos(FFrame&, void* const)
native final simulated function bool NextSplinePos(float dt, out Vector D, out Vector V, out Vector A, out float outdt, optional bool bSmoothDt, optional bool bAccumDeltas)
{
    //native.dt;
    //native.D;
    //native.V;
    //native.A;
    //native.outdt;
    //native.bSmoothDt;
    //native.bAccumDeltas;        
}

// Export USpline::execNextSplineRot(FFrame&, void* const)
native final simulated function bool NextSplineRot(float dt, out Rotator D, out Rotator V, out Rotator A, out float outdt, optional bool bSmoothDt, optional bool bAccumDeltas)
{
    //native.dt;
    //native.D;
    //native.V;
    //native.A;
    //native.outdt;
    //native.bSmoothDt;
    //native.bAccumDeltas;        
}
