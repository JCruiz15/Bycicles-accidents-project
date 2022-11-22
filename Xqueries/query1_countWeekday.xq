xquery version "3.1";

let $days := distinct-values(
    for $x in doc("xml_bycicle_accidents.xml")/accidents/Accident
    return data($x/Week_day)
    )

for $day in $days
return <results>
        <day>{$day}</day>
        <n_accidents>{
            count(
                for $x in doc("xml_bycicle_accidents.xml")/accidents/Accident/Week_day
                where $x = $day
                return $x
            )
        }</n_accidents>
    </results>
