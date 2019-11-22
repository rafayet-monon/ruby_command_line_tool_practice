#!/bin/bash

current_dir=$(pwd)
ln -s $current_dir/checktrip.rb /usr/local/bin/checktrip
ln -s $current_dir/checktrip_program.rb /usr/local/bin/checktrip_program.rb
ln -s $current_dir/station.json /usr/local/bin/station.json
chmod 755 /usr/local/bin/checktrip
echo 'Checktrip Installed Successfully'