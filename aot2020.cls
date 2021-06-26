Class Aot2020.Passport Extends (%Persistent, %JSON.Adaptor)
{

/// initialise byr
Property byr As %String(%JSONFIELDNAME = "byr");

/// initialise iyr
Property iyr As %String(%JSONFIELDNAME = "iyr");

/// initialise eyr
Property eyr As %String(%JSONFIELDNAME = "eyr");

/// Set up import method to import the data and save it it an object
ClassMethod Import(data)
{
        set obj =..%New()
        set sts=obj.%JSONImport(data,"")

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

ClassMethod Test()
{
    
    
    set obj = {"byr:":"1937", "iyr:":"2017", "eyr:":"2020", "hgt:":"183cm", "hcl:":"#FFFFFD","ecl:":"grey", "pid:":"028048884"}
    set passport3 = {"hcl:":"#ae17e1", "iyr:":"2013", "eyr:":"2024", "ecl:":"brn", "pid:":"760753108","byr:":"1931", "hgt:":"179cm"}

    do ..PassportProcess(obj)
}

ClassMethod PassportProcess(obj As %DynamicAbstractObject, property = "")
{
    write "Passport calculation process has started:",!

    set iterator = obj.%GetIterator()

    set myVariable = obj.%Size()
    
    write "Number of passport fields filled in: ",! 

    write myVariable, !

    if (myVariable >=8) {
        while iterator.%GetNext(.key, .value) {
        
            write key_value, !     
        }
    }
        write !
        write "No of completed fields is:",! 
        write myVariable, !
        write !
        write "We are unable to process incomplete passport submissions!",!
        set difference = 8 - myVariable
        write "You need to fill in",! write difference,"field/s",!
}

Storage Default
{
<Data name="TestDefaultData">
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
</Data>
<DataLocation>^Passport.TestD</DataLocation>
<DefaultData>TestDefaultData</DefaultData>
<IdLocation>^Passport.TestD</IdLocation>
<IndexLocation>^Passport.TestI</IndexLocation>
<StreamLocation>^Passport.TestS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
