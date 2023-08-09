# JerryStuff

## Rare Earth Metal Parameterization

### Ions

**Set #1**

     La, Ce, Nd, Sm, Gd, Tb, Yb, Lu
    
**Set #2**

     Y, Sc, Pr, Pm, Eu, Dy, Ho, Er, Tm
    

### Ion...Ligand Interactions
  
  **do steps below for each of these for each ion**
    1. Ion...Water
    2. Ion...Acetate
    3. Ion...Acetamide

  
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

### Ion MD Simulations
  
  **use new MM models to simulate ion in box of water**
  1. **hydration free energy**
     + compare to experimental data
  2. **radial distribution function**
     + hydration shell (number waters and distances)
     + compare to experimental data
