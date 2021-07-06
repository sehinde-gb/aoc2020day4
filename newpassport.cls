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
        
        set objectfound=0
        set validlist=0

        set line = file.ReadLine()
        write !, "nline loop started"
        set row = ##class(New.Passport).%New() 
        set lline = $LENGTH(line)
        set row.WholeLine = line
        set readvalue = $EXTRACT(line,1,lline)
        write readvalue ,!
        set status = row.%Save()
        write !, "status is:"
        write status ,!
        write !, "row saved"
        
        set obj =..%New()
        set sts=obj.FirstLine
        /// save the object
            if sts {
                set sts = obj.%Save()
                write sts
                set objectfound = $INCREMENT(objectfound)
            }
    }
}

}
