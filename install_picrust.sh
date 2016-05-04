#!/bin/bash
cd /galaxy-central/tools
git clone git://github.com/picrust/picrust.git picrust
cd picrust && git checkout tags/1.0.0 -b 1.0.0 && cd ..
hg clone https://bitbucket.org/biobakery/galaxy_picrust
cp /galaxy-central/tools/galaxy_picrust/*.xml /galaxy-central/tools/picrust
mkdir -p /galaxy-central/tools/picrust/data
cd /galaxy-central/tools/picrust/data
wget ftp://ftp.microbio.me/pub/picrust-references/picrust-1.0.0/16S_13_5_precalculated.tab.gz
wget ftp://ftp.microbio.me/pub/picrust-references/picrust-1.0.0/ko_13_5_precalculated.tab.gz
cd /galaxy-central/tools/picrust
python setup.py install
chown -Rf galaxy:galaxy /galaxy-central/tools /galaxy-central/lib
