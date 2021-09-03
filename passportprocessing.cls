Class Passport.Processing Extends %Persistent
{

/// Description
Property Length As %Integer;

/// Description
Property Concatenated As %String;

Property ListA As %String;

/// Description
Property ListB As %String;

/// Description
Property ListC As %String;

ClassMethod Import(dir As %String = "/usr/local/day4.txt") As %Status
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
    set count=1
    /// loop to go through each line and save it to a global that increments
    
    WHILE ('file.AtEnd) 
    {
        set delim=" "
        set line = file.ReadLine()
        write !, "Loop started"
        write *32
        write line,!
        set ^namelist(count)=$LISTFROMSTRING(line, delim)
        set countdown=$LENGTH(line,delim)
        set count=$INCREMENT(count)        
    }
        write !,*32
        write !, "Double checking to see if the fields are set"
        write !,*32
        write !, "1st element of 2nd global", $LIST(^namelist(2),1)
        write !, "Import process complete"
        write *32
        //do ..FirstPassportString()
        do ..FirstPassportObject()
}

/// Compare listx with concatenated and if the lists are identical output a message
ClassMethod FirstPassportString() As %Status
{
    write "First Passport as a String",!
    write !,*32
    /// Save the combined string to a new variable called passport1
    set concatenated=^namelist(1)_^namelist(2)
             
    /// Build the list
    set lista=$LISTBUILD("ecl:gry", "pid:860033327", "eyr:2020", "hcl:#fffffd","byr:1937", "iyr:2017", "cid:147", "hgt:183cm")
    
    /// Comparison to check to see if the lists are the same
    if concatenated=lista{write "The list's are identical",!
    }ELSE{
        write "The list's are not identical",!
    }
    
    write !,*32
    /// Explain why the lists are not the same
    
    write "List Length: ",$LISTLENGTH(concatenated)
    // Save the length to the passport length property
              
    write !,*32
    write !,"Your passport is valid" 
    write !,*32

    do ..SecondPassportString()
}

/// set up a passport object and then compare the object properties with the concatenated list
ClassMethod FirstPassportObject() As %Status
{

    set passport = ##class(Passport.Processing).%New()
    write "First Passport as an Object",!
    write !,*32
    
    // Save the combined string to concatenated property
    set passport.Concatenated = ^namelist(1)_^namelist(2)
                
    /// Build the list
    set passport.ListA = $LISTBUILD("ecl:gry", "pid:860033327", "eyr:2020", "hcl:#fffffd","byr:1937", "iyr:2017", "cid:147", "hgt:183cm")
    /// Comparison to check to see if the lists are the same
    
    if passport.Concatenated=passport.ListA
    {
        write "The list's are identical",!
    } ELSE {
        write "The list's are not identical",!
    }
        write !,*32
              
    // Save the length to the passport length property
    set passport.Length = $LISTLENGTH(passport.Concatenated) 
    write !,"Your passport is valid" 
    write !,*32

    do ..SecondPassportObject()
}

/// Compare listx with concatenated and if the lists are identical output a message
ClassMethod SecondPassportString() As %Status
{
    write !,*32
    write "Second Passport as a String",!
    write !,*32
    set concatenated=^namelist(4)_^namelist(5)
    
    set listb=$LISTBUILD("iyr:2013", "ecl:amb", "cid:350", "eyr:2023", "pid:028048884","hcl:#cfa07d", "byr:1929")
    if concatenated=listb 
    {
    write "The list's are identical",!
    }ELSE{
    write "The list's are not identical",!
    }
    write !,*32
    write "List Length: ",$LISTLENGTH(concatenated)
    if $LISTFIND(listb,"hgt: ")=0
    { 
    write !,*32 
    write "Your passport is missing a hgt field and this means we won't be processing your passport this time" 
    }
    write !,*32

    do ..ThirdPassportString()
}

/// set up a passport object and then compare the object properties with the concatenated list
ClassMethod SecondPassportObject() As %Status
{
   write !,*32
    write "Second Passport as an Object",!
    write !,*32
    set passport = ##class(Passport.Processing).%New()
    set passport.Concatenated=^namelist(4)_^namelist(5)
    
    set listb=$LISTBUILD("iyr:2013", "ecl:amb", "cid:350", "eyr:2023", "pid:028048884","hcl:#cfa07d", "byr:1929")
    if passport.Concatenated=passport.ListB 
    {
    write "The list's are identical",!
    }ELSE{
    write "The list's are not identical",!
    }
    write !,*32
    write "List Length: ",$LISTLENGTH(passport.Concatenated)
    if $LISTFIND(passport.ListB,"hgt: ")=0
    { 
    write !,*32 
    write "Your passport is missing a hgt field and this means we won't be processing your passport this time" 
    }
    write !,*32

    do ..ThirdPassportObject()
}

/// Compare listx with concatenated and if the lists are identical output a message
ClassMethod ThirdPassportString() As %Status
{
    write !,*32
    write "Passport as a String",!
    write !,*32
    set concatenated=^namelist(7)_^namelist(8)_^namelist(9)_^namelist(10)
    set listb=$LISTBUILD("hcl:#ae17e1","iyr:2013","eyr:2024","ecl:brn","pid:760753108","byr:1931","hgt:179cm")
    
    if concatenated=listb {write "The list's are identical",!
    } ELSE {
        write "The list's are not identical",!
    }
    write "List Length: ",$LISTLENGTH(concatenated)
    
    if $LISTFIND(listb,"cid:")=0{ write !,*32 write "No cid in this case we will make an exception and we will validate your passport"}
    write !,*32

    do ..FourthPassportString()
}

/// set up a passport object and then compare the object properties with the concatenated list
ClassMethod ThirdPassportObject() As %Status
{
    write !,*32
    write "Passport as an Object",!
    write !,*32
    set passport = ##class(Passport.Processing).%New()
    set passport.Concatenated=^namelist(7)_^namelist(8)_^namelist(9)_^namelist(10)
    set passport.ListB=$LISTBUILD("hcl:#ae17e1","iyr:2013","eyr:2024","ecl:brn","pid:760753108","byr:1931","hgt:179cm")
    
    if passport.Concatenated=passport.ListB {write "The list's are identical",!
    } ELSE {
        write "The list's are not identical",!
    }
    write "List Length: ",$LISTLENGTH(passport.Concatenated)
    
    if $LISTFIND(passport.ListB,"cid:")=0{ write !,*32 write "No cid in this case we will make an exception and we will validate your passport"}
    write !,*32

    do ..FourthPassportObject()
}

/// Compare listx with concatenated and if the lists are identical output a message
ClassMethod FourthPassportString() As %Status
{
   write !,*32
   write "Fourth Passport as a String",!
   write !,*32
                
   set concatenated=^namelist(12)_^namelist(13)
   set listc=$LISTBUILD("hcl:#cfa07d", "eyr:2025", "pid:166559648", "iyr:2011", "ecl:brn", "hgt:59in")
                
   if concatenated=listc 
   {
    write "The list's are identical",!
   }ELSE {
   write "The list's are not identical",!
   }
    
   write "List Length: ",$LISTLENGTH(concatenated)
    
   if $LISTFIND(listc,"cid:")=0 && $LISTFIND(listc,"byr")=0
    { 
        write !,*32 write "Your passport is missing the cid & byr so your passport is invalid" 
    }
}

/// set up a passport object and then compare the object properties with the concatenated list
ClassMethod FourthPassportObject() As %Status
{
   write !,*32
   write "Fourth Passport as a String",!
   write !,*32
   
   set passport = ##class(Passport.Processing).%New()             
   set passport.Concatenated=^namelist(12)_^namelist(13)
   set passport.ListC=$LISTBUILD("hcl:#cfa07d", "eyr:2025", "pid:166559648", "iyr:2011", "ecl:brn", "hgt:59in")
                
   if passport.Concatenated=passport.ListC 
   {
    write "The list's are identical",!
   }ELSE {
   write "The list's are not identical",!
   }
    
   write "List Length: ",$LISTLENGTH(passport.Concatenated)
    
   if $LISTFIND(passport.ListC,"cid:")=0 && $LISTFIND(passport.ListC,"byr")=0
    { 
        write !,*32 write "Your passport is missing the cid & byr so your passport is invalid" 
    }

    set sc = passport.%Save()
}

Storage Default
{
<Data name="ProcessingDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Length</Value>
</Value>
<Value name="3">
<Value>Concatenated</Value>
</Value>
<Value name="4">
<Value>ListA</Value>
</Value>
<Value name="5">
<Value>ListB</Value>
</Value>
<Value name="6">
<Value>ListC</Value>
</Value>
</Data>
<DataLocation>^Passport.ProcessingD</DataLocation>
<DefaultData>ProcessingDefaultData</DefaultData>
<IdLocation>^Passport.ProcessingD</IdLocation>
<IndexLocation>^Passport.ProcessingI</IndexLocation>
<StreamLocation>^Passport.ProcessingS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
