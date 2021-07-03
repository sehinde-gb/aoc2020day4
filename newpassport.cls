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

            
            if (nline = 4) {
                
                write *12
                write !, lline
                write !, line
                
                
            } elseif (nline = 7) {
                WRITE *12
                write !, lline
                write !, line
                
            } elseif (nline = 12) {
                WRITE *12
                write !, lline
                write !, line
                
            } else {
                //write !, lline
                write !, line
                
                //write nline ,!
                 For i=1:42:lline {
                    set row.WholeLine = line
                    set readvalue = $EXTRACT(line,i,i)
                    write !, "Current readvale is: "_readvalue_" i is currently: "_i
                    
                }
                
                //write row.WholeLine ,!
               
                //set status = row.%Save()
                //write status ,!
                //write !, nline
                //write !, "post Extraction"
                //set $EXTRACT(line,1,7)=""
                //write !, line
            }
            



           
        
        }

    
    //Write !, "Import Complete"

}
}

}
