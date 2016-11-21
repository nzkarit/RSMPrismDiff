#!/bin/bash
cd /tmp
mkdir rsm-diff
cd rsm-diff
cp /webroot/rsm.karit.geek.nz/sqlite/full/prism.sqlite.gz .
cp /home/rsm/rsm/getNewDates.sql .
gunzip prism.sqlite.gz
Output=`sqlite3 -init getNewDates.sql prism.sqlite .exit`
newDate=`echo $Output | awk '{print $1}'`
oldDate=`echo $Output | awk '{print $2}'`


#SELECT primarylicence, associatedlicence FROM associatedlicences
echo SELECT primarylicence, associatedlicence FROM associatedlicences WHERE import_date = \'$newDate\' > associatedlicences-new.sql
echo EXCEPT >> associatedlicences-new.sql
echo SELECT primarylicence, associatedlicence FROM associatedlicences WHERE import_date = \'$oldDate\'\; >> associatedlicences-new.sql
sqlite3 -init associatedlicences-new.sql prism.sqlite .exit > associatedlicences-new-$newDate-$oldDate.txt
rm associatedlicences-new.sql
echo SELECT primarylicence, associatedlicence FROM associatedlicences WHERE import_date = \'$oldDate\' > associatedlicences-deleted.sql
echo EXCEPT >> associatedlicences-deleted.sql
echo SELECT primarylicence, associatedlicence FROM associatedlicences WHERE import_date = \'$newDate\'\; >> associatedlicences-deleted.sql
sqlite3 -init associatedlicences-deleted.sql prism.sqlite .exit > associatedlicences-deleted-$newDate-$oldDate.txt
rm associatedlicences-deleted.sql

#SELECT clientid, name, legal_order, address1, address2, address3 FROM clientname
echo SELECT clientid, name, legal_order, address1, address2, address3 FROM clientname WHERE import_date = \'$newDate\' > clientname-new.sql
echo EXCEPT >> clientname-new.sql
echo SELECT clientid, name, legal_order, address1, address2, address3 FROM clientname WHERE import_date = \'$oldDate\'\; >> clientname-new.sql
sqlite3 -init clientname-new.sql prism.sqlite .exit > clientname-new-$newDate-$oldDate.txt
rm clientname-new.sql
echo SELECT clientid, name, legal_order, address1, address2, address3 FROM clientname WHERE import_date = \'$oldDate\' > clientname-deleted.sql
echo EXCEPT >> clientname-deleted.sql
echo SELECT clientid, name, legal_order, address1, address2, address3 FROM clientname WHERE import_date = \'$newDate\'\; >> clientname-deleted.sql
sqlite3 -init clientname-deleted.sql prism.sqlite .exit > clientname-deleted-$newDate-$oldDate.txt
rm clientname-deleted.sql

#SELECT emissionid, emission FROM emission
echo SELECT emissionid, emission FROM emission WHERE import_date = \'$newDate\' > emission-new.sql
echo EXCEPT >> emission-new.sql
echo SELECT emissionid, emission FROM emission WHERE import_date = \'$oldDate\'\; >> emission-new.sql
sqlite3 -init emission-new.sql prism.sqlite .exit > emission-new-$newDate-$oldDate.txt
rm emission-new.sql
echo SELECT emissionid, emission FROM emission WHERE import_date = \'$oldDate\' > emission-deleted.sql
echo EXCEPT >> emission-deleted.sql
echo SELECT emissionid, emission FROM emission WHERE import_date = \'$newDate\'\; >> emission-deleted.sql
sqlite3 -init emission-deleted.sql prism.sqlite .exit > emission-deleted-$newDate-$oldDate.txt
rm emission-deleted.sql

#SELECT emissionlimitid, spectrumid, emissionlimittypeid, limitfrequency, limitvalue, limitgraphpoint FROM emissionlimit
echo SELECT emissionlimitid, spectrumid, emissionlimittypeid, limitfrequency, limitvalue, limitgraphpoint FROM emissionlimit WHERE import_date = \'$newDate\' > emissionlimit-new.sql
echo EXCEPT >> emissionlimit-new.sql
echo SELECT emissionlimitid, spectrumid, emissionlimittypeid, limitfrequency, limitvalue, limitgraphpoint FROM emissionlimit WHERE import_date = \'$oldDate\'\; >> emissionlimit-new.sql
sqlite3 -init emissionlimit-new.sql prism.sqlite .exit > emissionlimit-new-$newDate-$oldDate.txt
rm emissionlimit-new.sql
echo SELECT emissionlimitid, spectrumid, emissionlimittypeid, limitfrequency, limitvalue, limitgraphpoint FROM emissionlimit WHERE import_date = \'$oldDate\' > emissionlimit-deleted.sql
echo EXCEPT >> emissionlimit-deleted.sql
echo SELECT emissionlimitid, spectrumid, emissionlimittypeid, limitfrequency, limitvalue, limitgraphpoint FROM emissionlimit WHERE import_date = \'$newDate\'\; >> emissionlimit-deleted.sql
sqlite3 -init emissionlimit-deleted.sql prism.sqlite .exit > emissionlimit-deleted-$newDate-$oldDate.txt
rm emissionlimit-deleted.sql

#SELECT locationid, georeferencetypeid, georeferencetype, easting, northing, mapnumber, original, referenceorder FROM geographicreference
echo SELECT locationid, georeferencetypeid, georeferencetype, easting, northing, mapnumber, original, referenceorder FROM geographicreference WHERE import_date = \'$newDate\' > geographicreference-new.sql
echo EXCEPT >> geographicreference-new.sql
echo SELECT locationid, georeferencetypeid, georeferencetype, easting, northing, mapnumber, original, referenceorder FROM geographicreference WHERE import_date = \'$oldDate\'\; >> geographicreference-new.sql
sqlite3 -init geographicreference-new.sql prism.sqlite .exit > geographicreference-new-$newDate-$oldDate.txt
rm geographicreference-new.sql
echo SELECT locationid, georeferencetypeid, georeferencetype, easting, northing, mapnumber, original, referenceorder FROM geographicreference WHERE import_date = \'$oldDate\' > geographicreference-deleted.sql
echo EXCEPT >> geographicreference-deleted.sql
echo SELECT locationid, georeferencetypeid, georeferencetype, easting, northing, mapnumber, original, referenceorder FROM geographicreference WHERE import_date = \'$newDate\'\; >> geographicreference-deleted.sql
sqlite3 -init geographicreference-deleted.sql prism.sqlite .exit > geographicreference-deleted-$newDate-$oldDate.txt
rm geographicreference-deleted.sql

#SELECT officeid, officecode, officename FROM issuingoffice
echo SELECT officeid, officecode, officename FROM issuingoffice WHERE import_date = \'$newDate\' > issuingoffice-new.sql
echo EXCEPT >> issuingoffice-new.sql
echo SELECT officeid, officecode, officename FROM issuingoffice WHERE import_date = \'$oldDate\'\; >> issuingoffice-new.sql
sqlite3 -init issuingoffice-new.sql prism.sqlite .exit > issuingoffice-new-$newDate-$oldDate.txt
rm issuingoffice-new.sql
echo SELECT officeid, officecode, officename FROM issuingoffice WHERE import_date = \'$oldDate\' > issuingoffice-deleted.sql
echo EXCEPT >> issuingoffice-deleted.sql
echo SELECT officeid, officecode, officename FROM issuingoffice WHERE import_date = \'$newDate\'\; >> issuingoffice-deleted.sql
sqlite3 -init issuingoffice-deleted.sql prism.sqlite .exit > issuingoffice-deleted-$newDate-$oldDate.txt
rm issuingoffice-deleted.sql

#SELECT licenceid, managementrightid, clientid, licencetypeid, licencetype, licencecode, licencecategory, licencestatusid, officeid, licencenumber, commencementdate, registrationdate, expiry_date, sets, callsign, renewalfee, shipname FROM licence
echo SELECT licenceid, managementrightid, clientid, licencetypeid, licencetype, licencecode, licencecategory, licencestatusid, officeid, licencenumber, commencementdate, registrationdate, expiry_date, sets, callsign, renewalfee, shipname FROM licence WHERE import_date = \'$newDate\' > licence-new.sql
echo EXCEPT >> licence-new.sql
echo SELECT licenceid, managementrightid, clientid, licencetypeid, licencetype, licencecode, licencecategory, licencestatusid, officeid, licencenumber, commencementdate, registrationdate, expiry_date, sets, callsign, renewalfee, shipname FROM licence WHERE import_date = \'$oldDate\'\; >> licence-new.sql
sqlite3 -init licence-new.sql prism.sqlite .exit > licence-new-$newDate-$oldDate.txt
rm licence-new.sql
echo SELECT licenceid, managementrightid, clientid, licencetypeid, licencetype, licencecode, licencecategory, licencestatusid, officeid, licencenumber, commencementdate, registrationdate, expiry_date, sets, callsign, renewalfee, shipname FROM licence WHERE import_date = \'$oldDate\' > licence-deleted.sql
echo EXCEPT >> licence-deleted.sql
echo SELECT licenceid, managementrightid, clientid, licencetypeid, licencetype, licencecode, licencecategory, licencestatusid, officeid, licencenumber, commencementdate, registrationdate, expiry_date, sets, callsign, renewalfee, shipname FROM licence WHERE import_date = \'$newDate\'\; >> licence-deleted.sql
sqlite3 -init licence-deleted.sql prism.sqlite .exit > licence-deleted-$newDate-$oldDate.txt
rm licence-deleted.sql

#SELECT licenceid, licenceconditions FROM licenceconditions
echo SELECT licenceid, licenceconditions FROM licenceconditions WHERE import_date = \'$newDate\' > licenceconditions-new.sql
echo EXCEPT >> licenceconditions-new.sql
echo SELECT licenceid, licenceconditions FROM licenceconditions WHERE import_date = \'$oldDate\'\; >> licenceconditions-new.sql
sqlite3 -init licenceconditions-new.sql prism.sqlite .exit > licenceconditions-new-$newDate-$oldDate.txt
rm licenceconditions-new.sql
echo SELECT licenceid, licenceconditions FROM licenceconditions WHERE import_date = \'$oldDate\' > licenceconditions-deleted.sql
echo EXCEPT >> licenceconditions-deleted.sql
echo SELECT licenceid, licenceconditions FROM licenceconditions WHERE import_date = \'$newDate\'\; >> licenceconditions-deleted.sql
sqlite3 -init licenceconditions-deleted.sql prism.sqlite .exit > licenceconditions-deleted-$newDate-$oldDate.txt
rm licenceconditions-deleted.sql

#SELECT licencetypeid, licencetypeidentifier, workingdescription FROM licencetype
echo SELECT licencetypeid, licencetypeidentifier, workingdescription FROM licencetype WHERE import_date = \'$newDate\' > licencetype-new.sql
echo EXCEPT >> licencetype-new.sql
echo SELECT licencetypeid, licencetypeidentifier, workingdescription FROM licencetype WHERE import_date = \'$oldDate\'\; >> licencetype-new.sql
sqlite3 -init licencetype-new.sql prism.sqlite .exit > licencetype-new-$newDate-$oldDate.txt
rm licencetype-new.sql
echo SELECT licencetypeid, licencetypeidentifier, workingdescription FROM licencetype WHERE import_date = \'$oldDate\' > licencetype-deleted.sql
echo EXCEPT >> licencetype-deleted.sql
echo SELECT licencetypeid, licencetypeidentifier, workingdescription FROM licencetype WHERE import_date = \'$newDate\'\; >> licencetype-deleted.sql
sqlite3 -init licencetype-deleted.sql prism.sqlite .exit > licencetype-deleted-$newDate-$oldDate.txt
rm licencetype-deleted.sql

#SELECT locationid, locationtypeid, locationname, locationheight, nominalmap, nominalref, longeast, longnorth, districtid FROM location
echo SELECT locationid, locationtypeid, locationname, locationheight, nominalmap, nominalref, longeast, longnorth, districtid FROM location WHERE import_date = \'$newDate\' > location-new.sql
echo EXCEPT >> location-new.sql
echo SELECT locationid, locationtypeid, locationname, locationheight, nominalmap, nominalref, longeast, longnorth, districtid FROM location WHERE import_date = \'$oldDate\'\; >> location-new.sql
sqlite3 -init location-new.sql prism.sqlite .exit > location-new-$newDate-$oldDate.txt
rm location-new.sql
echo SELECT locationid, locationtypeid, locationname, locationheight, nominalmap, nominalref, longeast, longnorth, districtid FROM location WHERE import_date = \'$oldDate\' > location-deleted.sql
echo EXCEPT >> location-deleted.sql
echo SELECT locationid, locationtypeid, locationname, locationheight, nominalmap, nominalref, longeast, longnorth, districtid FROM location WHERE import_date = \'$newDate\'\; >> location-deleted.sql
sqlite3 -init location-deleted.sql prism.sqlite .exit > location-deleted-$newDate-$oldDate.txt
rm location-deleted.sql

#SELECT managementrightid, clientid, mrcommencementdate, mrregistrationdate, mrexpirydate, mrconditions FROM managementright
echo SELECT managementrightid, clientid, mrcommencementdate, mrregistrationdate, mrexpirydate, mrconditions FROM managementright WHERE import_date = \'$newDate\' > managementright-new.sql
echo EXCEPT >> managementright-new.sql
echo SELECT managementrightid, clientid, mrcommencementdate, mrregistrationdate, mrexpirydate, mrconditions FROM managementright WHERE import_date = \'$oldDate\'\; >> managementright-new.sql
sqlite3 -init managementright-new.sql prism.sqlite .exit > managementright-new-$newDate-$oldDate.txt
rm managementright-new.sql
echo SELECT managementrightid, clientid, mrcommencementdate, mrregistrationdate, mrexpirydate, mrconditions FROM managementright WHERE import_date = \'$oldDate\' > managementright-deleted.sql
echo EXCEPT >> managementright-deleted.sql
echo SELECT managementrightid, clientid, mrcommencementdate, mrregistrationdate, mrexpirydate, mrconditions FROM managementright WHERE import_date = \'$newDate\'\; >> managementright-deleted.sql
sqlite3 -init managementright-deleted.sql prism.sqlite .exit > managementright-deleted-$newDate-$oldDate.txt
rm managementright-deleted.sql

#SELECT mapdistrictid, map, district FROM mapdistrict
echo SELECT mapdistrictid, map, district FROM mapdistrict WHERE import_date = \'$newDate\' > mapdistrict-new.sql
echo EXCEPT >> mapdistrict-new.sql
echo SELECT mapdistrictid, map, district FROM mapdistrict WHERE import_date = \'$oldDate\'\; >> mapdistrict-new.sql
sqlite3 -init mapdistrict-new.sql prism.sqlite .exit > mapdistrict-new-$newDate-$oldDate.txt
rm mapdistrict-new.sql
echo SELECT mapdistrictid, map, district FROM mapdistrict WHERE import_date = \'$oldDate\' > mapdistrict-deleted.sql
echo EXCEPT >> mapdistrict-deleted.sql
echo SELECT mapdistrictid, map, district FROM mapdistrict WHERE import_date = \'$newDate\'\; >> mapdistrict-deleted.sql
sqlite3 -init mapdistrict-deleted.sql prism.sqlite .exit > mapdistrict-deleted-$newDate-$oldDate.txt
rm mapdistrict-deleted.sql

#SELECT licenceid, patterntypeid, bearingfrom, bearingto, bearingvalue FROM radiationpattern
echo SELECT licenceid, patterntypeid, bearingfrom, bearingto, bearingvalue FROM radiationpattern WHERE import_date = \'$newDate\' > radiationpattern-new.sql
echo EXCEPT >> radiationpattern-new.sql
echo SELECT licenceid, patterntypeid, bearingfrom, bearingto, bearingvalue FROM radiationpattern WHERE import_date = \'$oldDate\'\; >> radiationpattern-new.sql
sqlite3 -init radiationpattern-new.sql prism.sqlite .exit > radiationpattern-new-$newDate-$oldDate.txt
rm radiationpattern-new.sql
echo SELECT licenceid, patterntypeid, bearingfrom, bearingto, bearingvalue FROM radiationpattern WHERE import_date = \'$oldDate\' > radiationpattern-deleted.sql
echo EXCEPT >> radiationpattern-deleted.sql
echo SELECT licenceid, patterntypeid, bearingfrom, bearingto, bearingvalue FROM radiationpattern WHERE import_date = \'$newDate\'\; >> radiationpattern-deleted.sql
sqlite3 -init radiationpattern-deleted.sql prism.sqlite .exit > radiationpattern-deleted-$newDate-$oldDate.txt
rm radiationpattern-deleted.sql

#SELECT receiveconfigurationid, licenceid, locationid, rxantennamake, rxantennatype, rxantennaheight, rxazimuth, rxequipment, mpis, mpisunit, wantedsignal, wantedunit FROM receiveconfiguration
echo SELECT receiveconfigurationid, licenceid, locationid, rxantennamake, rxantennatype, rxantennaheight, rxazimuth, rxequipment, mpis, mpisunit, wantedsignal, wantedunit FROM receiveconfiguration WHERE import_date = \'$newDate\' > receiveconfiguration-new.sql
echo EXCEPT >> receiveconfiguration-new.sql
echo SELECT receiveconfigurationid, licenceid, locationid, rxantennamake, rxantennatype, rxantennaheight, rxazimuth, rxequipment, mpis, mpisunit, wantedsignal, wantedunit FROM receiveconfiguration WHERE import_date = \'$oldDate\'\; >> receiveconfiguration-new.sql
sqlite3 -init receiveconfiguration-new.sql prism.sqlite .exit > receiveconfiguration-new-$newDate-$oldDate.txt
rm receiveconfiguration-new.sql
echo SELECT receiveconfigurationid, licenceid, locationid, rxantennamake, rxantennatype, rxantennaheight, rxazimuth, rxequipment, mpis, mpisunit, wantedsignal, wantedunit FROM receiveconfiguration WHERE import_date = \'$oldDate\' > receiveconfiguration-deleted.sql
echo EXCEPT >> receiveconfiguration-deleted.sql
echo SELECT receiveconfigurationid, licenceid, locationid, rxantennamake, rxantennatype, rxantennaheight, rxazimuth, rxequipment, mpis, mpisunit, wantedsignal, wantedunit FROM receiveconfiguration WHERE import_date = \'$newDate\'\; >> receiveconfiguration-deleted.sql
sqlite3 -init receiveconfiguration-deleted.sql prism.sqlite .exit > receiveconfiguration-deleted-$newDate-$oldDate.txt
rm receiveconfiguration-deleted.sql

#SELECT spectrumid, spectrumstatusid, spectrumstatus, spectrumlabel, spectrumlow, spectrumhigh, licenceid, managementrightid, emissionid, frequency, power, polarisation, polarisationcode, serviceid, spectrumtypeid, spectrumtype, startdate, enddate, registereddate, spectrumremarks FROM spectrum 
echo SELECT spectrumid, spectrumstatusid, spectrumstatus, spectrumlabel, spectrumlow, spectrumhigh, licenceid, managementrightid, emissionid, frequency, power, polarisation, polarisationcode, serviceid, spectrumtypeid, spectrumtype, startdate, enddate, registereddate, spectrumremarks FROM spectrum WHERE import_date = \'$newDate\' > spectrum-new.sql
echo EXCEPT >> spectrum-new.sql
echo SELECT spectrumid, spectrumstatusid, spectrumstatus, spectrumlabel, spectrumlow, spectrumhigh, licenceid, managementrightid, emissionid, frequency, power, polarisation, polarisationcode, serviceid, spectrumtypeid, spectrumtype, startdate, enddate, registereddate, spectrumremarks FROM spectrum WHERE import_date = \'$oldDate\'\; >> spectrum-new.sql
sqlite3 -init spectrum-new.sql prism.sqlite .exit > spectrum-new-$newDate-$oldDate.txt
rm spectrum-new.sql
echo SELECT spectrumid, spectrumstatusid, spectrumstatus, spectrumlabel, spectrumlow, spectrumhigh, licenceid, managementrightid, emissionid, frequency, power, polarisation, polarisationcode, serviceid, spectrumtypeid, spectrumtype, startdate, enddate, registereddate, spectrumremarks FROM spectrum WHERE import_date = \'$oldDate\' > spectrum-deleted.sql
echo EXCEPT >> spectrum-deleted.sql
echo SELECT spectrumid, spectrumstatusid, spectrumstatus, spectrumlabel, spectrumlow, spectrumhigh, licenceid, managementrightid, emissionid, frequency, power, polarisation, polarisationcode, serviceid, spectrumtypeid, spectrumtype, startdate, enddate, registereddate, spectrumremarks FROM spectrum WHERE import_date = \'$newDate\'\; >> spectrum-deleted.sql
sqlite3 -init spectrum-deleted.sql prism.sqlite .exit > spectrum-deleted-$newDate-$oldDate.txt
rm spectrum-deleted.sql

#SELECT transmitconfigurationid, licenceid, locationid, txantennamake, txantennatype, txantennaheight, txazimuth, txequipment FROM transmitconfiguration
echo SELECT transmitconfigurationid, licenceid, locationid, txantennamake, txantennatype, txantennaheight, txazimuth, txequipment FROM transmitconfiguration WHERE import_date = \'$newDate\' > transmitconfiguration-new.sql
echo EXCEPT >> transmitconfiguration-new.sql
echo SELECT transmitconfigurationid, licenceid, locationid, txantennamake, txantennatype, txantennaheight, txazimuth, txequipment FROM transmitconfiguration WHERE import_date = \'$oldDate\'\; >> transmitconfiguration-new.sql
sqlite3 -init transmitconfiguration-new.sql prism.sqlite .exit > transmitconfiguration-new-$newDate-$oldDate.txt
rm transmitconfiguration-new.sql
echo SELECT transmitconfigurationid, licenceid, locationid, txantennamake, txantennatype, txantennaheight, txazimuth, txequipment FROM transmitconfiguration WHERE import_date = \'$oldDate\' > transmitconfiguration-deleted.sql
echo EXCEPT >> transmitconfiguration-deleted.sql
echo SELECT transmitconfigurationid, licenceid, locationid, txantennamake, txantennatype, txantennaheight, txazimuth, txequipment FROM transmitconfiguration WHERE import_date = \'$newDate\'\; >> transmitconfiguration-deleted.sql
sqlite3 -init transmitconfiguration-deleted.sql prism.sqlite .exit > transmitconfiguration-deleted-$newDate-$oldDate.txt
rm transmitconfiguration-deleted.sql

mkdir /webroot/rsm.karit.geek.nz/changes/$newDate-$oldDate
mv *.txt /webroot/rsm.karit.geek.nz/changes/$newDate-$oldDate/

cd ..
rm -r rsm-diff

cd /webroot/rsm.karit.geek.nz/changes/$newDate-$oldDate/
sha1sum * > sha1sums	
