#!/bin/bash

wget -q -O /tmp/prism-$(date +%Y%m%d).zip http://www.rsm.govt.nz/online-services-resources/pdf-and-documents-library/tools/spectrum-search-lite/prism.zip

NewFileSha1Sum=`sha1sum /tmp/prism-$(date +%Y%m%d).zip | awk '{print $1}'`
echo $NewFileSha1Sum
CurrentFileSha1Sum=`ls -t /webroot/rsm.karit.geek.nz/access/*.zip | head -1 | xargs sha1sum | awk '{print $1}'`
echo $CurrentFileSha1Sum
if [[ "$NewFileSha1Sum" == "$CurrentFileSha1Sum" ]] ; then
    echo "Same"
else
    echo "Different"
    cp /tmp/prism-$(date +%Y%m%d).zip /www/rsm.karit.geek.nz/access/
    /home/rsm/rsm/importer.sh
    /home/rsm/rsm/differ.sh
    rm /tmp/prism*
    #rm /tmp/setDates.sql
    cd /webroot/rsm.karit.geek.nz/access
    sha1sum * > sha1sum
    cd /webroot/rsm.karit.geek.nz/sqlite/full
    sha1sum * > sha1sum
    cd /webroot/rsm.karit.geek.nz/sqlite/singles
    sha1sum * > sha1sum
fi
#rm /tmp/prism-$(date +%Y%m%d).zip
