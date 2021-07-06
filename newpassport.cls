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

    WHILE ('file.AtEnd) & ('file ="") {
        set line = file.ReadLine()
        write !, "nline loop started"
        //write line ,!
        set obj = ##class(New.Passport).%New()
        
        set lline = $LENGTH(line)
        set extracted = $EXTRACT(line,1,lline)
        write extracted ,!
        //set readvalue = $LISTFROMSTRING(line)
        //WRITE !,"1st element: ",$LIST(readvalue,1)
        
        
    }
        
        //set obj.WholeLine = readvalue
        //set status = obj.%Save()
        //write obj.WholeLine ,!
        //do file.Close()
}

}
