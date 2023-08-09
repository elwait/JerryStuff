ion="Ce"
ligand="water"
B3LYP="UB3LYP"
touch ${ion}_${ligand}_results.csv
#echo "$PWD" > ${ion}_${ligand}_results.csv
echo "Name,Dist,Complex,Frag1_Full,Frag2_Full,Frag1_Part,Frag2_Part,CounterCorrEnergy,BSSE,SumFrag,CompRawKCal,CompCorrKCal" > ${ion}_${ligand}_results.csv

for log in ?-?/${ion}_${ligand}_?-?.log; do
    #echo "${log}"
    name=$(echo "${log}" }| awk -F/ '{print $1}')
    echo ${name}
    dist=$(grep "(Fragment=1)" ${PWD}/${name}/${ion}_${ligand}_${name}.com | awk '{ print $2 }' | sed 's/-//g' )
    #echo ${dist}
    # look only at the part of the log file for first step of counterpoise calc, which is full system
    # find energy in that part of the file (sometimes there are 2, take last one)
    # keep just the energy value from that line
    comp=$(sed -n '/Counterpoise: doing full-system calculation/,/Counterpoise: doing calculation for fragment   1 using the basis set of the full-system/p; /Counterpoise: doing calculation for fragment   1 using the basis set of the full-system/q' ${log} | grep "${B3LYP}"  | tail -1 | awk '{ print $5 }' )
    #echo $comp
    # find energy for calc of fragment 1 using full basis
    f1_full=$(sed -n '/Counterpoise: doing calculation for fragment   1 using the basis set of the full-system/,/Counterpoise: doing calculation for fragment   2 using the basis set of the full-system/p; /Counterpoise: doing calculation for fragment   2 using the basis set of the full-system/q' ${log} | grep "${B3LYP}" | awk '{ print $5  }' )
    #echo $f1_full
    # find energy for calc of fragment 2 using full basis
    f2_full=$(sed -n '/Counterpoise: doing calculation for fragment   2 using the basis set of the full-system/,/Counterpoise: doing calculation for fragment   1 using the basis set of the fragment/p; /Counterpoise: doing calculation for fragment   1 using the basis set of the fragment/q' ${log} | grep "${B3LYP}" | awk '{ print $5  }' )
    #echo $f2_full
    # find energy for calc of frag 1 with only frag 1 basis set
    f1_part=$(sed -n '/Counterpoise: doing calculation for fragment   1 using the basis set of the fragment/,/Counterpoise: doing calculation for fragment   2 using the basis set of the fragment/p; /Counterpoise: doing calculation for fragment   2 using the basis set of the fragment/q' ${log} | grep "${B3LYP}" | awk '{ print $5  }' )
    #echo $f1_part
    # find energy for calc of frag 2 with only frag 2 basis set
    f2_part=$(sed -n '/Counterpoise: doing calculation for fragment   2 using the basis set of the fragment/,/Counterpoise corrected energy/p; /Counterpoise corrected energy/q' ${log} | grep "${B3LYP}" | awk '{ print $5  }' )
    #echo $f2_part
    # store values gaussian prints at end of counterpoise calc
    c_corr_energy=$(grep "Counterpoise corrected energy" "${log}" | awk '{ print $5 }')
    #echo $c_corr_energy    
    BSSE=$(grep "BSSE energy" "${log}" | awk '{ print $4 }')
    #echo $BSSE
    sum_frag=$(grep "sum of fragments" "${log}" | awk '{ print $5 }')
    #echo $sum_frag
    comp_raw=$(grep "kcal/mole (raw)" "${log}" | awk '{ print $4 }')
    #echo $comp_raw
    comp_corr=$(grep "kcal/mole (corrected)" "${log}" | awk '{ print $4 }')
    #echo $comp_corr
    # print result values to results.csv (comma delimited)
    echo "${name},${dist},${comp},${f1_full},${f2_full},${f1_part},${f2_part},${c_corr_energy},${BSSE},${sum_frag},${comp_raw},${comp_corr}" >> ${ion}_${ligand}_results.csv
done
