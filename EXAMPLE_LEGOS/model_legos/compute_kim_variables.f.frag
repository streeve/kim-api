    !-- KIM variables
    integer(kind=8) numberOfAtoms; pointer(pnAtoms,numberOfAtoms)
    integer nAtomTypes;  pointer(pnAtomTypes,nAtomTypes)
    integer atomTypes(1);  pointer(patomTypes,atomTypes)
    

    real*8 model_cutoff;     pointer(pcutoff,model_cutoff)
    real*8 model_epsilon;    pointer(pepsilon,model_epsilon)
    real*8 model_sigma;      pointer(psigma,model_sigma)
    real*8 model_cutnorm;    pointer(pcutnorm,model_cutnorm)
    real*8 model_A;          pointer(pA,model_A)
    real*8 model_B;          pointer(pB,model_B)
    real*8 model_C;          pointer(pC,model_C)
    real*8 model_sigmasq;    pointer(psigmasq,model_sigmasq)
    real*8 model_cutsq;      pointer(pcutsq,model_cutsq)
    real*8 energy;           pointer(penergy,energy)
    real*8 coordum(DIM,1);   pointer(pcoor,coordum)
    real*8 forcedum(DIM,1);  pointer(pforce,forcedum)
    real*8 enepotdum(1);     pointer(penepot,enepotdum)
    real*8 virial;           pointer(pvirial,virial)
    real*8, pointer :: coor(:,:),force(:,:),ene_pot(:)
    integer :: comp_force, comp_enepot, comp_virial
    integer N4     !@@@@@@@@@ NEEDS TO BE FIXED