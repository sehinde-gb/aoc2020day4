Class New.Passport Extends (%Persistent, %JSON.Adaptor)
{

/// initialise byr
Property byr As %String(%JSONFIELDNAME = "byr");

/// initialise iyr
Property iyr As %String(%JSONFIELDNAME = "iyr");

/// initialise eyr
Property eyr As %String(%JSONFIELDNAME = "eyr");

Property hgt As %String(%JSONFIELDNAME = "hgt");

Property hcl As %String(%JSONFIELDNAME = "hcl");

Property ecl As %String(%JSONFIELDNAME = "ecl");

Property pid As %String(%JSONFIELDNAME = "pid");

Property cid As %String(%JSONFIELDNAME = "cid");

ClassMethod Initialise()
{
    
    
    //set pass1 = {"byr":"1937", "iyr":"2017", "eyr":"2020", "hgt":"183cm", "hcl":"#FFFFFD","ecl":"grey", "pid":"028048884","cid":"147"}

    //set pass2={"iyr":"2013", "ecl":"amb", "cid":"350", "eyr":"2023", "pid":"028048884", "hcl":"#cfa07d", "byr":"1929"}

    //set pass3={"ecl":"grey","pid":"860033327", "eyr":"2020","hcl":"#FFFFFD","byr":"1937", "iyr":"2017", "cid":"147", "hgt":"183cm"}

    set pass4 = {"hcl":"#ae17e1", "iyr":"2013", "eyr":"2024", "ecl":"brn", "pid":"760753108","byr":"1931", "hgt":"179cm", "cid":"147"}

    /// Run the 4 passport process methods in sequence

    //do ..PassportProcess(pass1)
    //do ..PassportProcess(pass2)
    //do ..PassportProcess(pass3)
    do ..PassportProcess(pass4)
}

ClassMethod PassportProcess(pass4 As %DynamicAbstractObject)
{
    write "Passport calculation process has started:",!

    /// set the iterators and the mysize variable

    set iterator = pass4.%GetIterator()

    set mySize = pass4.%Size()
    
    write "Number of passport fields filled in: ",! 

    write mySize, !

    /// This method is used to determine if you have any missing fields and if you do have them a message appears
    /// on the screen stating that you have an incomplete passport submission and it tells you the
    /// number of fields that you need to fill in to process.
    if (mySize >=8) {
        while iterator.%GetNext(.key, .value) {
        
            write key_value, !     
        }
    }
        write !
        write "No of completed fields is:",! 
        write mySize, !
        write !
        //write "We are unable to process incomplete passport submissions!",!
        //set difference = 8 - mySize
        //write "You need to fill in",! write difference,"field/s",!

        do ..Import(pass4)
}

/// Set up import method to import the data and save it it an object
ClassMethod Import(pass4)
{
        set obj =..%New()
        set sts=obj.%JSONImport(pass4,"")

        if sts {
        set sts = obj.%Save()
        
        if sts {
            write "Saved, ID=",obj.%Id(),!
            quit 1
            
        } else {
            write "Not saved, Err=",$system.Status.GetOneErrorText(sts),!
            quit 0
        }
        
        } else {
            write "Can't import: ",$system.Status.GetOneErrorText(sts),!
            quit 0
        }
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
</Data>
<DataLocation>^New.PassportD</DataLocation>
<DefaultData>PassportDefaultData</DefaultData>
<IdLocation>^New.PassportD</IdLocation>
<IndexLocation>^New.PassportI</IndexLocation>
<StreamLocation>^New.PassportS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
