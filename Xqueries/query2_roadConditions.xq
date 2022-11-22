
xquery version "3.1";
distinct-values(
for $cond in doc('/db/apps/doc/xml_bycicle_accidents.xml')/accidents/Accident/Conditions/Road_conditions
return data($cond)
)