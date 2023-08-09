#!/bin/bash

# Purpose:
# create folders for QM distance dependent interaction energy curves
# for each element (which I have already done opt for)
# copy *chk from ion-ligand opt to new dir
# use "newzmat" to get *xyz of opt geometry

# Start script in working dir
# make sure element_list.txt is in working dir
working_dir="/work/eew947/sandia/rem-ligand_interaction/sp_dde/water"
opt_dir="/work/eew947/sandia/rem-ligand_interaction/opt/water"

source /home/eew947/.g16.bashrc

# take coords from opt
# save as xyz
while IFS= read -r line; do
    element=$(echo ${line} | awk '{ print $1 }' ) # use awk to grab 1st part of line
    multiplicity=$(echo ${line} | awk '{ print $2 }' ) # use awk to grab 2nd part
    mkdir ${working_dir}/${element}
    cp ${opt_dir}/${element}/${element}_water_opt.chk ${working_dir}/${element}/.
    cd ${working_dir}/${element} ; newzmat -ichk ${element}_water_opt.chk
    echo "${element}_water_opt.com has been created"
    # now make xyz
    cp ${working_dir}/${element}/${element}_water_opt.com ${working_dir}/${element}/${element}_water_opt.xyz
    # find line with 
    # 3,${mult}
    #xyz_match="3,${multiplicity}"
    #echo ${xyz_match}
    # copy all lines after the charge,mult line from the new *com file to an *xyz
    sed -n '/3,/,$p' ${working_dir}/${element}/${element}_water_opt.com > ${working_dir}/${element}/${element}_water_opt.xyz
    # find next blank line and remove everything after
    sed -i '/^$/q' ${working_dir}/${element}/${element}_water_opt.xyz
done < element_listB.txt


# make sure coords are rotated/translated how I want them
# save new coords
echo "note to self / whoever is using this script"
echo "make sure to check the coordinates"
echo "closest ligand atom should be at origin"
echo "interaction should be along x axis"
echo "that way, distance can be changed by changing the ion's x coordinate"
echo "it is easier to check your files later that way also"


# make new gaussian input for single points
# be in single point dir
# have new coords xyz file in dir
# prepare the list of distances and names
# have that in the same dir


