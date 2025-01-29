# Rare Earth Metal Parameterization

This repository is intended as a guide for generating parameters for
rare earth metal (REM) ions for molecular dynamics (MD) simulations
with the AMOEBA polarizable force field using Tinker.

That sentence is doing a lot of heavy lifting.

This is how the explanation will be organized:
1. What are rare earth metals (REMs)?
     + What elements are included and how are they classified?
     + Why do we care about them?
     + Why do we want to model them?
2. What are parameters?
     + What is molecular dynamics?
     + Where do parameters come from?
3. What is different about AMOEBA?
4. What is the scope of the current work?
     + What elements are we getting parameters for?
     + What parameters are we getting?
     + How do we get those parameters?
5. Summary and getting started




## 1. What are rare earth metals (REMs)?
### What elements are included and how are they classified?
Rare earth metals (REMs) include Yttrium, Scandium, and the row of the periodic table starting with Lanthanum.
Because of this, the elements in that row are often called lanthanides.
REMs are typically +3 charge in solution, so you may see them referred to as Ln3+.

They are transition metals with an interesting electronic structure.
The 4f electrons are not great at shielding the other electrons from the nucleus.
As the number of protons goes up with increasing atomic number, the electrons are pulled more strongly towards the nucleus.
Therefore, as the rare earth elements get heavier down the periodic series, the ionic radii also get smaller.
This is called the "Lanthanide Contraction."

### Why do we care about them?
REMs are absolutely essential resources in our technological era.
They are important components of electronics (phone screens, hard drives) and batteries.
They are used in electric vehicles, glass manufacturing, and green energy generation and storage.

### Why do we want to model them?
Conventional methods for separating and refining REMs are expensive, inefficient, and environmentally damaging.
Typically, separation is done using small synthetic molecule chelators. They are not very specific for REMs.
Refinement takes several steps and yields are not great. Therefore, the starting materials have to be high quality,
with high concentration of REMs and as few impurities as possible. These materials have to be mined, which is expensive
and can be catastrophic for the environment. Additionally, the chelating molecules are often toxic.

In 2018, it was discovered that a fairly common bacteria makes a protein which is VERY good at binding REMs.
The protein was named lanmodulin (LanM). This is because it has four EF-hand sites that coordinate one ion each.
This is similar to calmodulin (CaM), although the protein sequences are not very similar.

LanM binds REMs with high affinity and specificity, which means it binds them much more readily than other ions.
We want to learn how LanM does this so we can try to do the same thing on an industrial scale.
This would allow us to harvest REMs from conventional sources more efficiently, but also to take advantage of waste sources such as mine leechate.

Additionally, LanM does not differentiate much between REMs



## 2. What are parameters?
### What is molecular dynamics?
### Where do parameters come from?

## 3. What is different about AMOEBA?

## 4. What is the scope of the current work?
### What elements are we getting parameters for?
Lanthanum 


### What parameters are we getting?
### How do we get those parameters?

## 5. Summary and getting started




## Ions of Current Interest
Element, Multiplicity (+3 charge), Atomic Number
La	1 57
Gd	8 64
Lu 1 71


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




