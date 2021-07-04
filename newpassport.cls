Class New.Passport Extends (%Persistent, %JSON.Adaptor)
{

/// Description
Property WholeLine As %String;

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
        //read line of text from file
        set line = file.ReadLine()
        // create nline and go through each line of text from file whilst incrementing the counter
        set nline = $INCREMENT(nline)
        //if line exists loop through each line until no more lines
        //write !, line 
        set row = ##class(New.Passport).%New() 
        set row.WholeLine = line
        set readvalue = $EXTRACT(line,1,42)
        set $extract(readvalue, 4, 5) = "12345"

        write !, readvalue
        #; IF (nline >= 1) & (nline=3) & (line '= ""){
        #;      write !, line
        #; } elseif (nline=4) & (nline=7) & (nline=12) & (line '= "") {
        #;     write *12
        #;     write !, line
        #; } else {
        #;     Write !, "Wrong"
        #; }

        
        #; IF (nline >= 1) & (line '= "") {
                

        #;     //read line of text from file
           
        #;     set row = ##class(New.Passport).%New()
            
        #;     // get length of line
        #;     set lline = $LENGTH(line)

        #;     set row.WholeLine = line
        #;     set readvalue = $EXTRACT(line,1,42)
        #;     write readvalue ,!
            
        #;     if (nline = 4) {
        #;         write *12
        #;         write !, line
        #;     } elseif (nline = 7) {
        #;         WRITE *12
        #;         write !, line    
        #;     } elseif (nline = 12) {
        #;         WRITE *12
        #;         write !, line  
        #;     } else {
                
        #;        //set row.WholeLine = line
        #;        //set readvalue = $EXTRACT(line,1,42)
        #;        //write readvalue ,!
        #;        //write !, "Current readvalue is: "_readvalue_" i is currently: "_i
        #;     }
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
<Value name="3">
<Value>cid</Value>
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
