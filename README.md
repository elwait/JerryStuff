# Rare Earth Metal Parameterization

## Ions

### Set #1
Element, Multiplicity
1. Sc	1
2. Y	1
3. La	1
4. Ce	2
5. Pr	3
6. Nd	4
7. Pm	5
8. Sm	6
9. Eu	7
10. Gd	8
11. Tb	7
12. Dy	6
13. Ho	5
14. Er	4
15. Tm	3
16. Yb	2
17. Lu	1
   


## Ion...Ligand Interactions
### 3 important ligands
    1. Water
    2. Acetate
    3. Acetamide

### for each ion-ligand combination
  1. **optimize ion...ligand geometry (QM)**
  2. **single point energies at various distances (QM)**
     + take opt structure, move ion closer or farther by 0.1 A (from closest ligand atom)
     + plot X=distance, Y=interaction energy, series=Element
  4. **ForceBalance - parameter optimization**
     + MM parameters to match QM curve (and experimental data) as closely as possible
  5. **MM single point energies**
     + use same structures as Step 2
     + get single point energies using Tinker/AMOEBA (including new parameters from Step 3)
     + plot X=distance, Y=interaction energy, series=Element

## Ion MD Simulations

### use new MM models to simulate ion in box of water

  1. **hydration free energy**
     + compare to experimental data
  2. **radial distribution function**
     + hydration shell (number waters and distances)
     + compare to experimental data
    
## To Do (Jerry)

1. distance-dependent interaction energy curves for all the remaining ions
2. ForceBalance for some ions (I need to do a few first and test HFE, analyze, etc)




