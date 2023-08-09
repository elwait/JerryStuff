#!/bin/bash

# PURPOSE
# this script is for preparing inputs for QM calculations
# starting from optimized ion-ligand structures
# to calculate single point energies along various distances
# "distance - dependent interaction energies"
# how energy changes as distance between ion and ligand change

# NEED TO HAVE
# optimized ion-ligand structure
#    xyz coordinates should have closest atom of ligand at the origin
#    with the interaction ("bond" b/w ion and ligand) along x axis
# template G16 input file for single point QM calcuations
#    should only have to copy template and change x coord
# file called ${name}_${ligand}_dist_names.txt with x coord for ion
#    at desired distances and name for respective job
#    for example:
#        -1.588158    1-6
#        -1.688158    1-7
#        -1.788158    1-8
# note: run this script from your working dir that has the template

# NOTE TO SELF ABOUT CURRENT JOBS (best to keep updated for reference)
# ion and ligand:
#    La water
# theory level used:
#     B3LYP/def2-QZVPP and Sapporo-DKH3-TZVP for ion with “int=DKH”

DIR=$PWD
echo $DIR
g16_rc="/home/eew947/.g16.bashrc"
ion="Ce"                                # atomic symbol for current ion
echo ${ion}
ligand="water"                          # current ligand (water, acetate, amide)
echo ${ligand}
g16_template="Ce_water_template.com" # set up for single point energy calculation with optimized geometry
#x_to_replace="-2.273562"                # ion x coord from template, only works if number not anywhere else

touch QM_jobs.txt
echo "source /home/eew947/.g16.bashrc" > QM_jobs.txt
### Setting up input files ###
while IFS= read -r line; do
# for each distance listed in the file
    echo ${line}
    NEWCOORD=$(echo ${line} | awk '{ print $1 }' )
    #echo $x_coord
    name=$(echo ${line} | awk '{ print $2 }' )
    #echo $name
    mkdir ${DIR}/${name}
    # copy G16 template input file and change ion x coord
    cp ${DIR}/${g16_template} ${DIR}/${name}/${ion}_${ligand}_${name}.com
    sed -i "s+name+${name}+g" ${DIR}/${name}/${ion}_${ligand}_${name}.com
    sed -i "s+NEWCOORD+${NEWCOORD}+g" ${DIR}/${name}/${ion}_${ligand}_${name}.com
    jobline="cd ${DIR}/${name}; nohup g16 ${ion}_${ligand}_${name}.com > ${ion}_${ligand}_${name}.out &"
    echo "${jobline}" >> QM_jobs.txt
    echo "wait" >> QM_jobs.txt
done < Ce_water_dist_names.txt

