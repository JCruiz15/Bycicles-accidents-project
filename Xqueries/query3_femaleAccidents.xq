
xquery version "3.1";
count(doc('/db/apps/doc/xml_bycicle_accidents.xml')/accidents/Accident/Biker[biker_gender="Female"])
