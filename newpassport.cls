Class New.Passport Extends %Persistent
{

/// Description
Property WholeLine As %String;

Property FirstLine As %String;

Property SecondLine As %String;

Property ThirdLine As %String;

Property FourthLine As %String;

Property FifthLine As %String;

Property SixthLine As %String;

Property SeventhLine As %String;

Property EighthLine As %String;

Property NinethLine As %String;

Property TenthLine As %String;

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

    WHILE ('file.AtEnd) {
        set line = file.ReadLine()
        //write !, "nline loop started"
        write line ,!
        set obj = ##class(New.Passport).%New()
        
        set lline = $LENGTH(line)
        set readvalue = $EXTRACT(line,1,lline)
        //set test = $LISTFROMSTRING(line)
        
        write readvalue ,!
        
    }
        
        set status = obj.readvalue
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
