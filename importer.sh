#!/bin/bash
cd /tmp/
unzip /tmp/prism-$(date +%Y%m%d).zip
cp /webroot/rsm.karit.geek.nz/sqlite/full/prism.sqlite.gz .
gunzip prism.sqlite.gz
cp /webroot/rsm.karit.geek.nz/sqlite/singles/prism-single.sqlite.gz .
gunzip prism-single.sqlite.gz
mv prism-single.sqlite prism-single-$(date +%Y%m%d).sqlite
cp /home/rsm/rsm/setDates.sql .

echo BEGIN\; > associatedlicences.sql
mdb-export -I mysql prism.mdb associatedlicences >> associatedlicences.sql
echo COMMIT\; >> associatedlicences.sql
sqlite3 -init associatedlicences.sql prism.sqlite .exit
sqlite3 -init associatedlicences.sql prism-single-$(date +%Y%m%d).sqlite .exit

echo BEGIN\; >clientname.sql
mdb-export -I mysql prism.mdb clientname >> clientname.sql
echo COMMIT\; >> clientname.sql
sqlite3 -init clientname.sql prism.sqlite .exit
sqlite3 -init clientname.sql prism-single-$(date +%Y%m%d).sqlite .exit

echo BEGIN\; >emission.sql
mdb-export -I mysql prism.mdb emission >> emission.sql
echo COMMIT\; >> emission.sql
sqlite3 -init emission.sql prism.sqlite .exit
sqlite3 -init emission.sql prism-single-$(date +%Y%m%d).sqlite .exit

echo BEGIN\; >emissionlimit.sql
mdb-export -I mysql prism.mdb emissionlimit >> emissionlimit.sql
echo COMMIT\; >> emissionlimit.sql
sqlite3 -init emissionlimit.sql prism.sqlite .exit
sqlite3 -init emissionlimit.sql prism-single-$(date +%Y%m%d).sqlite .exit

echo BEGIN\; >geographicreference.sql
mdb-export -I mysql prism.mdb geographicreference >> geographicreference.sql
echo COMMIT\; >> geographicreference.sql
sqlite3 -init geographicreference.sql prism.sqlite .exit
sqlite3 -init geographicreference.sql prism-single-$(date +%Y%m%d).sqlite .exit

echo BEGIN\; >issuingoffice.sql
mdb-export -I mysql prism.mdb issuingoffice >> issuingoffice.sql
echo COMMIT\; >> issuingoffice.sql
sqlite3 -init issuingoffice.sql prism.sqlite .exit
sqlite3 -init issuingoffice.sql prism-single-$(date +%Y%m%d).sqlite .exit

echo BEGIN\; >licence.sql
mdb-export -I mysql prism.mdb licence >> licence.sql
echo COMMIT\; >> licence.sql
sqlite3 -init licence.sql prism.sqlite .exit
sqlite3 -init licence.sql prism-single-$(date +%Y%m%d).sqlite .exit

echo BEGIN\; >licenceconditions.sql
mdb-export -I mysql prism.mdb licenceconditions >> licenceconditions.sql
echo COMMIT\; >> licenceconditions.sql
sqlite3 -init licenceconditions.sql prism.sqlite .exit
sqlite3 -init licenceconditions.sql prism-single-$(date +%Y%m%d).sqlite .exit

echo BEGIN\; > licencetype.sql
mdb-export -I mysql prism.mdb licencetype >> licencetype.sql
echo COMMIT\; >>  licencetype.sql
sqlite3 -init licencetype.sql prism.sqlite .exit
sqlite3 -init licencetype.sql prism-single-$(date +%Y%m%d).sqlite .exit

echo BEGIN\; >location.sql
mdb-export -I mysql prism.mdb location >> location.sql
echo COMMIT\; >> location.sql
sqlite3 -init location.sql prism.sqlite .exit
sqlite3 -init location.sql prism-single-$(date +%Y%m%d).sqlite .exit

echo BEGIN\; >managementright.sql
mdb-export -I mysql prism.mdb managementright >> managementright.sql
echo COMMIT\; >> managementright.sql
sqlite3 -init managementright.sql prism.sqlite .exit
sqlite3 -init managementright.sql prism-single-$(date +%Y%m%d).sqlite .exit

echo BEGIN\; >mapdistrict.sql
mdb-export -I mysql prism.mdb mapdistrict >> mapdistrict.sql
echo COMMIT\; >> mapdistrict.sql
sqlite3 -init mapdistrict.sql prism.sqlite .exit
sqlite3 -init mapdistrict.sql prism-single-$(date +%Y%m%d).sqlite .exit

echo BEGIN\; >radiationpattern.sql
mdb-export -I mysql prism.mdb radiationpattern >> radiationpattern.sql
echo COMMIT\; >> radiationpattern.sql
sqlite3 -init radiationpattern.sql prism.sqlite .exit
sqlite3 -init radiationpattern.sql prism-single-$(date +%Y%m%d).sqlite .exit

echo BEGIN\; >receiveconfiguration.sql
mdb-export -I mysql prism.mdb receiveconfiguration >> receiveconfiguration.sql
echo COMMIT\; >> receiveconfiguration.sql
sqlite3 -init receiveconfiguration.sql prism.sqlite .exit
sqlite3 -init receiveconfiguration.sql prism-single-$(date +%Y%m%d).sqlite .exit

echo BEGIN\; >spectrum.sql
mdb-export -I mysql prism.mdb spectrum >> spectrum.sql
echo COMMIT\; >> spectrum.sql
sqlite3 -init spectrum.sql prism.sqlite .exit
sqlite3 -init spectrum.sql prism-single-$(date +%Y%m%d).sqlite .exit

echo BEGIN\; >transmitconfiguration.sql
mdb-export -I mysql prism.mdb transmitconfiguration >> transmitconfiguration.sql
echo COMMIT\; >> transmitconfiguration.sql
sqlite3 -init transmitconfiguration.sql prism.sqlite .exit
sqlite3 -init transmitconfiguration.sql prism-single-$(date +%Y%m%d).sqlite .exit

sqlite3 -init setDates.sql prism.sqlite .exit

gzip prism.sqlite
mv prism.sqlite.gz /webroot/rsm.karit.geek.nz/sqlite/full/
gzip prism-single-$(date +%Y%m%d).sqlite
mv prism-single-$(date +%Y%m%d).sqlite.gz /webroot/rsm.karit.geek.nz/sqlite/singles/

rm associatedlicences.sql
rm clientname.sql
rm emission.sql
rm emissionlimit.sql
rm geographicreference.sql
rm issuingoffice.sql
rm licence.sql
rm licenceconditions.sql
rm licencetype.sql
rm location.sql
rm managementright.sql
rm mapdistrict.sql
rm radiationpattern.sql
rm receiveconfiguration.sql
rm spectrum.sql
rm transmitconfiguration.sql 
rm prism.mdb
rm setDates.sql

