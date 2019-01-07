#!/bin/bash

mkdir /docker/eventgen/configs
mkdir /docker/eventgen/configs/bluecoat
cp bluecoat/default/eventgen.conf /docker/eventgen/configs/bluecoat/eventgen.conf

mkdir /docker/eventgen/samples
cp bluecoat/samples/* /docker/eventgen/samples/

docker run -v /docker/logfile1:/logfiles -v /docker/eventgen/configs:/configs -v /docker/eventgen/samples:/opt/splunk/etc/samples -i -t schose/eventgen:6.3.2 python -m splunk_eventgen -v generate /configs/bluecoat/eventgen.conf
docker run -v /docker/logfile2:/logfiles -v /docker/eventgen/configs:/configs -v /docker/eventgen/samples:/opt/splunk/etc/samples -i -t schose/eventgen:6.3.2 python -m splunk_eventgen -v generate /configs/bluecoat/eventgen.conf