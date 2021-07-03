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
            //write !, "nline loop started"
            //read line of text from file
           
            set row = ##class(New.Passport).%New()
             if (nline=2) {
                SET formfeed=$CHAR(10)
            } 
            // get length of line
            set lline = $LENGTH(line)
            write !, line
           
        //set status = row.%Save()
        }

    
    //Write !, "Import Complete"
}
    write row ,!
}

Storage Default
{
<Data name="PassportDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>byr</Value>
</Value>
<Value name="3">
<Value>iyr</Value>
</Value>
<Value name="4">
<Value>eyr</Value>
</Value>
<Value name="5">
<Value>hgt</Value>
</Value>
<Value name="6">
<Value>hcl</Value>
</Value>
<Value name="7">
<Value>ecl</Value>
</Value>
<Value name="8">
<Value>pid</Value>
</Value>
<Value name="9">
<Value>cid</Value>
</Value>
<Value name="10">
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
