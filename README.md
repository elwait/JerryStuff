# Rare Earth Metal Parameterization

## Ions

### Set #1
    1. La
    2. Ce
    3. Nd
    4. Sm
    5. Gd
    6. Tb
    7. Yb
    8. Lu
    
### Set #2
    1. Y
    2. Sc
    3. Pr
    4. Pm
    5. Eu
    6. Dy
    7. Ho
    8. Er
    9. Tm  

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

1. matplotlib script for automatically plotting
2. finish opt for Yb (and any other problem ions)
3. distance-dependent interaction energty curves for all the remaining ions
4. ForceBalance for some ions (I need to do a few first and test HFE, analyze, etc)




