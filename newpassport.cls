Class New.Passport Extends %Persistent
{

/// Description
Property WholeLine As %String;

// do the same for all other fields

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
    //write sc ,!
    WRITE !,*32
    WRITE !,$X
    

    WHILE ('file.AtEnd) {
        set obj = ##class(%Library.ListOfDataTypes).%New()
        set line = file.ReadLine()
        set lline = $LENGTH(line)
        
        //write line ,!

        set delim=" "
        set countdown=$LENGTH(line,delim)
        
        set countup=1
        for reps=countdown:-1:1 {
            //write line ,!
            
            SET extract=$PIECE(line,delim,countup)
        
            //do obj.Insert($PIECE(line,delim,countup))
            WRITE !,countup," ",extract
            
            
            SET countup=countup+1
            //write !,countup, " ", extract
 

            set status = obj.%Save()
            write status
            //write obj.WholeLine ,!
        }

        
        
        //write "Object Saved under ID: ",obj.%Id(),!

        //Write !, "Import Complete" 
        //Write "Number of items in this list: ", Count(extract, "ecl:gry")
        //Write !, "Second item in the list: ", extract.GetAt(2)
        
        //Write "Number of items in this list: ", obj.Count()
        //Write !, "Second item in the list: ", obj.GetAt(2)
        
        
        //write obj.WholeLine ,!
        //do file.Close()
    }
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
</Data>
<DataLocation>^New.PassportD</DataLocation>
<DefaultData>PassportDefaultData</DefaultData>
<IdLocation>^New.PassportD</IdLocation>
<IndexLocation>^New.PassportI</IndexLocation>
<StreamLocation>^New.PassportS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
