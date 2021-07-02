Class New.Passport Extends (%Persistent, %JSON.Adaptor)
{

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

ClassMethod Initialise()
{
    
    
    //set pass1 = {"byr":"1937", "iyr":"2017", "eyr":"2020", "hgt":"183cm", "hcl":"#FFFFFD","ecl":"grey", "pid":"028048884","cid":"147"}

    //set pass2={"iyr":"2013", "ecl":"amb", "cid":"350", "eyr":"2023", "pid":"028048884", "hcl":"#cfa07d", "byr":"1929"}

    set pass3={"ecl":"brn","pid":"760753108", "eyr":"2024","hcl":"#ae17e1","byr":"1931", "iyr":"2013","hgt":"179cm"}

    //set pass4 = {"hcl":"#cfa07d", "iyr":"2011", "eyr":"2025", "ecl":"brn", "pid":"166559648","byr":"1931", "hgt":"59in"}

    /// Run the 4 passport process methods in sequence

    do ..PassportProcess(pass3)
    //do ..PassportProcess(pass2)
    //do ..PassportProcess(pass3)
    //do ..PassportProcess(pass4)
}

ClassMethod PassportProcess(pass3 As %DynamicAbstractObject)
{
    write !
    write "Passport calculation process has started:",!

    /// set the iterators and the mysize variable

    set iterator = pass3.%GetIterator()

    set mySize = pass3.%Size()
    
    write "Number of passport fields filled in: ",! 

    write mySize, !

    /// This method is used to determine if you have any missing fields and if you do have them a message appears
    /// on the screen stating that you have an incomplete passport submission and it tells you the
    /// number of fields that you need to fill in to process.
    if (mySize=8) {
        while iterator.%GetNext(.key, .value) {
              
            write key_value, !
           if (key_value '= "hgt") {
                write "Your passport is valid and we are able to submit your passport",!
            }

            } 

          
        }
            write !
            write "No of completed fields is:",! 
            write mySize, !
            write !
            write "Your passport is valid and we have submitted your passport",!
            /// call the import method to save our newly constructed data.
            //do ..Import(pass1)
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
