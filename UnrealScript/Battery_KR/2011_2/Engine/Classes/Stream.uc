class Stream extends StreamBase
    native;

var() protected editconst int Handle;
var() private const editconst string DefaultExtension;
var() protected const editconst editinline StreamTag IDTag;
var() private const editconst editinline FilePath PathName;
var() private const editconst StreamBase.EFileType Type;
var() const editconst bool bReadOnly;

// Export UStream::execSaveID3Tag(FFrame&, void* const)
native final function bool SaveID3Tag();

// Export UStream::execLoadID3Tag(FFrame&, void* const)
native final function bool LoadID3Tag();

function bool IsReadOnly()
{
    return bReadOnly;
    //return;    
}

function int GetHandle()
{
    return Handle;
    //return;    
}

function StreamTag GetTag()
{
    return IDTag;
    //return;    
}

function StreamBase.EFileType GetType()
{
    return Type;
    //return;    
}

function string GetDirectory()
{
    return PathName.Directory;
    //return;    
}

function string GetFileName()
{
    return PathName.fileName;
    //return;    
}

function string GetExtension()
{
    return PathName.Extension;
    //return;    
}

function string GetPath()
{
    return PathName.FullPath;
    //return;    
}

function string GetFullName()
{
    return ((GetFileName()) $ ".") $ (GetExtension());
    //return;    
}

function string GetSongTitle()
{
    // End:0x2E
    if((IDTag == none) || IDTag.Title.FieldValue == "")
    {
        return GetFileName();
    }
    return IDTag.Title.FieldValue;
    //return;    
}

event bool SetHandle(int NewHandle)
{
    Handle = NewHandle;
    return true;
    //return;    
}

function DumpScriptTag()
{
    IDTag.DumpScriptTag();
    //return;    
}

function DumpTags()
{
    IDTag.DumpTag();
    //return;    
}

defaultproperties
{
    Handle=-1
    DefaultExtension="mp3"
}