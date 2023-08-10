#!/bin/bash

opt_dir=$PWD

echo "source /home/eew947/.g16.bashrc" > ${opt_dir}/XYZFromOptChk.sh

for chk in ??/??_water_opt.chk; do
    file="${chk%.chk}"
    #echo $file
    base="${file#*/}"
    #echo $base
    element="${base%%_*}"
    #echo $element
    job="cd ${opt_dir}/${element} ; newzmat -ichk -oxyz ${element}_water_opt ${element}_water_min"
    echo "${job}" >> ${opt_dir}/XYZFromOptChk.sh
    echo "sleep 5" >> ${opt_dir}/XYZFromOptChk.sh
done

echo "Done!"
echo "Now run XYZFromOptChk.sh like this:"
echo "nohup bash XYZFromOptChk.sh &"
