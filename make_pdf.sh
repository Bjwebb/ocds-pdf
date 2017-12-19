#!/bin/bash
for lang in en es fr; do
wkhtmltox/bin/wkhtmltopdf \
    --no-stop-slow-scripts --javascript-delay 10000 --disable-smart-shrinking --print-media-type \
    --header-html header.html \
    toc http://standard.open-contracting.org/latest/$lang/{,getting_started/{,use_cases/,contracting_process/,building_blocks/,releases_and_records/,publication_patterns/,validation/},schema/{,reference/,release/,release_package/,records_reference/,record_package/,merging/,identifiers/,codelists/,conformance_and_extensions/,deprecation/,changelog/},implementation/{,levels/,licensing/,publication_policy/,serialization/,hosting/,registration/,related_processes/,amendments/},extensions/{,developing/,community/,bids/,enquiries/,location/,lots/,milestone_documents/,participation_fee/,party_details/,process_title/},support/{,tools/,history_and_development,governance/,credits/}} OCDS_$lang.pdf
done

