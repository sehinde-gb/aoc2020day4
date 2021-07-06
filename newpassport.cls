Class New.Passport Extends %Persistent
{

/// Description
Property WholeLine As %String;

Property ObjectFound As %Integer;

ClassMethod Import(dir As %String = "/usr/local/day4.txt")
{
   

    // Open my text file and check it exists
    IF ##class(%File).Exists(dir) '=1 {
    write !, "Unable to Open: "_dir
    QUIT}
    ELSE { write "File: "_dir_" is open"
    }

    // instantiate a new class called file
    set file = ##class(%Stream.FileCharacter).%New()
    // create a new variable called sc
    set sc = file.LinkToFile(dir)
    write sc ,!
    
    
    WHILE ('file.AtEnd) {
        set obj = ##class(New.Passport).%New()
        set line = file.ReadLine()
        set lline = $LENGTH(line)
        //write !, "nline loop started"
        //write line ,!
        set extracted = $EXTRACT(line,1,lline)
        //write extracted ,! 
        set obj.WholeLine = extracted
        write obj.WholeLine
        set status = obj.extracted.%Save 
        //Write !, "Import Complete" 
        
    }
        
        
        //set status = obj.%Save()
        //write obj.WholeLine ,!
        //do file.Close()
}

Storage Default
{
<Data name="PassportDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>WholeLine</Value>
</Value>
<Value name="3">
<Value>FirstLine</Value>
</Value>
<Value name="4">
<Value>SecondLine</Value>
</Value>
<Value name="5">
<Value>ThirdLine</Value>
</Value>
<Value name="6">
<Value>FourthLine</Value>
</Value>
<Value name="7">
<Value>FifthLine</Value>
</Value>
<Value name="8">
<Value>SixthLine</Value>
</Value>
<Value name="9">
<Value>SeventhLine</Value>
</Value>
<Value name="10">
<Value>EighthLine</Value>
</Value>
<Value name="11">
<Value>NinethLine</Value>
</Value>
<Value name="12">
<Value>TenthLine</Value>
</Value>
<Value name="13">
<Value>ObjectFound</Value>
</Value>
</Data>
<DataLocation>^New.PassportD</DataLocation>
<DefaultData>PassportDefaultData</DefaultData>
<IdLocation>^New.PassportD</IdLocation>
<IndexLocation>^New.PassportI</IndexLocation>
<StreamLocation>^New.PassportS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
