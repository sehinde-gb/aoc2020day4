Class New.Passport Extends (%Persistent, %JSON.Adaptor)
{

/// Description
Property WholeLine As %String;

/// initialise byr
Property byr As %String(%JSONFIELDNAME = "byr");

/// initialise iyr
Property iyr As %String(%JSONFIELDNAME = "iyr");

/// initialise eyr
Property eyr As %String(%JSONFIELDNAME = "eyr");

/// initialise hgt
Property hgt As %String(%JSONFIELDNAME = "hgt");

/// initialise hcl
Property hcl As %String(%JSONFIELDNAME = "hcl");

/// initialise ecl
Property ecl As %String(%JSONFIELDNAME = "ecl");

/// initialise pid
Property pid As %String(%JSONFIELDNAME = "pid");

/// initialise cid
Property cid As %String(%JSONFIELDNAME = "cid");

ClassMethod Import(dir As %String = "/usr/local/day4.txt")
{
    // Open my text file and check it exists
    IF ##class(%File).Exists(dir) '=1 {
    write !, "Unable to Open: "_dir
    QUIT}
    ELSE { write "File: "_dir_" is open"}

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
        IF (nline >= 1) & (line '= "") {
                
            //read line of text from file
           
            set row = ##class(New.Passport).%New()
            
            // get length of line
            set lline = $LENGTH(line)
            write *12
            write lline ,!

            //For i=1:42:lline {
                    
              //      write $extract(line,i,i+41),!
              //      set row.WholeLine = line
                    //set readvalue = $EXTRACT(lline,i,i+3)
                    //write !, "Current readvale is: "_readvalue_" i is currently: "_i
                    
                //}
            

            
            //if (nline = 4) {
                
              //  write *12
               // write !, lline
               // write !, line
            //} elseif (nline = 7) {
            //    WRITE *12
            //    write !, lline
            //    write !, line    
            //} elseif (nline = 12) {
            //    WRITE *12
            //    write !, lline
            //    write !, line  
            //} else {
                //write !, lline
              //  write !, line
                
                //write nline ,!
                 
                
                //write row.WholeLine ,!
               
                //set status = row.%Save()
                //write status ,!
                //write !, nline
                //write !, "post Extraction"
                //set $EXTRACT(line,1,7)=""
                //write !, line
            //}
            



           
        
        }

            
    //Write !, "Import Complete"
}
            //write lline ,!
            //write row.WholeLine ,!
            set test = $extract(line,1,8)
            write !, "test"
            write test ,!
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
<Value>byr</Value>
</Value>
<Value name="4">
<Value>iyr</Value>
</Value>
<Value name="5">
<Value>eyr</Value>
</Value>
<Value name="6">
<Value>hgt</Value>
</Value>
<Value name="7">
<Value>hcl</Value>
</Value>
<Value name="8">
<Value>ecl</Value>
</Value>
<Value name="9">
<Value>pid</Value>
</Value>
<Value name="10">
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
