    //
    //  BSSyndromeGenerator.m
    //  Brainstem101
    //
    //  Created by Brian Freese on 12/5/12.
    //  Copyright (c) 2012 Brainstem101. All rights reserved.
    //

#import "BSSyndromeGenerator.h"

@implementation BSSyndromeGenerator

+(NSMutableArray *)Syndromes {
    
    NSMutableArray *allSyndromes = [NSMutableArray new];
    
    // Wallenberg
    BSSyndrome *wallenberg = [[BSSyndrome alloc] initWithName:@"Wallenberg's"];
    
    [wallenberg setDescription:@"AKA Latteral Medullary Syndrome. Occlusion of Vertabral Artery or PICA causes deficit in lateral part of the medulla."];
    
    [wallenberg addSymptoms:@"Nystagmus, Diplopia, Nausea, Vertigo"
               andDeficit:@"Vestibular Nuclei"];
    
    [wallenberg addSymptoms:@"Ipsilateral cerebellar signs -- dystaxia (a mild form of ataxia), dysmetria (fail past pointing), dysdiadokokinesia (unable to perform rapid alternating motions)"
               andDeficit: @"Inferior Cerebellar Peduncle"];
    
    [wallenberg addSymptoms:@"Palatal myoclonus (Rapid spasms of palatal roof resulting in clicking noise in the ear)"
               andDeficit:@"Central Tegmental Tract"];
    
    [wallenberg addSymptoms:@"Contralateral Body Hemianalgesia (loss of sensation of pain and temperature)"
               andDeficit:@"ALS"];
    
    [wallenberg addSymptoms:@"Ipsilateral Facial Hemianalgesia (loss of sensation of pain and temperature) -- Clinical sign: absence of corneal reflex"
               andDeficit:@"Spinal Trigeminal Nucleus and Tract"];

    [wallenberg addSymptoms:@"Ipsilateral laryngeal, pharyngeal, and palatal hemiparalysis. Presents as dysarthria (difficulty with articulation of speech), hoarseness, dysphagia (Laryngeal muscles), diminished gag reflex (efferent limb of CN X)"
               andDeficit:@"Nucleus Ambiguus (CN IX, X)"];
    
    [wallenberg addSymptoms:@"Diminished gag reflex (Afferent limb of CN X)" // TODO
               andDeficit:@"CN IX (Glossopharyngeal Nerve) Roots"]; 
    
    [wallenberg addSymptoms:@"Ipsilateral Horner's Syndrome -- ptosis (Drooping of eyelid), miosis (Constriction of pupil), anhydrosis (Lack of sweating), facial flushing"
               andDeficit:@"Hypothalamospinal (Sympathetic) Tract"];
    
    
    //Medial Medullary
    BSSyndrome *medialMedullary = [[BSSyndrome alloc] initWithName:@"Medial Medullary"];
    [medialMedullary setDescription:@"Occlusion of the anterior spinal artery orparamedian braches of the basilar artery causes deficit in medial part of the medulla."];
    
    [medialMedullary addSymptoms:@"Ipsilateral flaccid hemiparalysis and atrophy of the tongue (tongue deviates towards lesion upon protrusion)"
                      andDeficit:@"CN XII Nucleus and/or Fibers"];
    
    [medialMedullary addSymptoms:@"Contralateral spastic hemiparesis or hemiplegia of upper and lower extremeties"
                      andDeficit:@"Corticospinal Tract"];
    
    [medialMedullary addSymptoms:@"Contralateral loss of conscious proprioception, discriminative touch, vibratory sensation from trunk and extremities"
                      andDeficit:@"Medial Lemniscus"];
   
    
    //Jackson's
    BSSyndrome *jacksons = [[BSSyndrome alloc] initWithName:@"Jackson's"];
    [jacksons setDescription:@"AKA MacKenzie's Syndrome. Occlusion of the vertebral artery resulting in deficit in the tegmentum of the medulla."];
    
    [jacksons addSymptoms:@"Ipsilateral paralysis of tongue, soft palate, and vocal chords." 
             andDeficit:@"Motor Nucleus of Vegus"];
    
    [jacksons addSymptoms:@"Palatal myoclonus (Rapid spasms of palatal roof resulting in clicking noise in the ear)"
             andDeficit:@"Central Tegmental Tract"];
    
    [jacksons addSymptoms:@"Contralateral Body Hemianalgesia (loss of sensation of pain and temperature)"
             andDeficit:@"ALS"];
    
    [jacksons addSymptoms:@"Unilateral paralysis of sternocleidomastoid and trapezius muscle"
             andDeficit:@"Spinal Accesory Nucleus"];

    
    // Millard Gubler
    BSSyndrome *millardGubler = [[BSSyndrome alloc] initWithName:@"Millard Gubler's"];
    
    [millardGubler setDescription:@"AKA Ventral Pontine Syndrome.  Occlusion of perforating branches of Basilar Artery resulting in deficits in ventrocaudal pons."];
    
    [millardGubler addSymptoms:@"Contralateral spastic hemiparesis or hemiplegia of upper and lower extremeties"
                    andDeficit:@"Corticospinal Tract"];
    
    [millardGubler addSymptoms:@"Internal Strabismus (eye deviated inwards) due to Ipsilateral Lateral Rectus Palsy or Paresis (results in diplopia)"
                    andDeficit:@"CN VI"];
    
    [millardGubler addSymptoms:@"Ipsilateral hemiparesis or flaccid paralysis of facial muscles; loss of corneal reflex (efferent component)"
                    andDeficit:@"CN VII"];

    
    //Foville's
    BSSyndrome *foville = [[BSSyndrome alloc]initWithName:@"Foville's"];
    [foville setDescription:@"Occlusion of perforating branches of Basilar Artery resulting in deficits of dorsocaudal pons."];
    
    [foville addSymptoms:@"Contralateral spastic hemiparesis or hemiplegia of upper and lower extremeties"
              andDeficit:@"Corticospinal Tract"];
    
    [foville addSymptoms:@"Internal Strabismus due to Ipsilateral Lateral Rectus Palsy or Paresis (results in diplopia)"
              andDeficit:@"CN VI"];
    
    [foville addSymptoms:@"Internuclear Opthalmoplegia (INO)"
              andDeficit:@"MLF"];
    
    [foville addSymptoms:@"Contrallatral loss of conscious proprioception, discriminative touch, and vibratory sensation in trunk and extremeties"
              andDeficit:@"Medial Lemniscus"];
    
    [foville addSymptoms:@"Ipsilateral hemiparesis or flaccid paralysis of facial muscles; Ipsilateral loss of corneal and stapedial reflex (efferent component)"
              andDeficit:@"Motor nucleus of CN VII (SVE)"];
    
    [foville addSymptoms:@"Ipsilateral loss of taste (anterior 2/3 of tongue)"
              andDeficit:@"Solitary Nucleus of CN VII (SVA)"];
    
    [foville addSymptoms:@"Reduced lacrimation and salivation"
              andDeficit:@"Superior Salivatory Nucleus of CN VII (GVE)"];
    

    //Raymond-Cestan's
    BSSyndrome *raymondCestan = [[BSSyndrome alloc] initWithName:@"Raymond-Cestan's"];
    
    [raymondCestan setDescription:@"Occlusion of Circumfrencial Branch of Basilar Artery resulting in deficits of Dorsorostral Pons:"];
    
    [raymondCestan addSymptoms:@"Ipsilateral ataxia with coarse intention tremors"
                    andDeficit:@"Middle Cerebellar Peduncle"];
    
    [raymondCestan addSymptoms:@"Contralateral Hemisensory Loss (all modalities from both face and body)"
                    andDeficit:@"ML+TTT"]; // TODO: Possible ALS
    
    [raymondCestan addSymptoms:@"Contralateral Hemiparesis of face and body"
                    andDeficit:@"Corticospinal, Corticobulbar tracts"];
    
    [raymondCestan addSymptoms: @"Ipsilateral paralysis of muscls of mastication"
                    andDeficit:@"Trigeminal Motor"];
    
    [raymondCestan addSymptoms:@"Ipsilateral loss of sensation of the face to light touch and proprioception of jaw muscles."
                    andDeficit:@"Principal Sensory Nucleus"];
    
    [raymondCestan addSymptoms:@"Internal Strabismus due to Ipsilateral Lateral Rectus Palsy or Paresis (results in diplopia)"
                    andDeficit:@"CN VI"];
    

    // Weber's
    BSSyndrome *webers = [[BSSyndrome alloc] initWithName:@"Weber's"];
    
    [webers setDescription:@"AKA Medial Midbrain Syndrome.  Occlusion of Posterior Cerebral Artery (PCA) resulting in deficit of ventral midbrain."];
    
    [webers addSymptoms:@"Contralateral spastic hemiparesis or Hemiplegia of upper and lower extremeties"
             andDeficit:@"Corticospinal Tract"];
    
    [webers addSymptoms:@"Contralateral hemiparesis or hemiplegia of lower face (CN VII), tongue (CN XII) and palate (CN X). Tongue points towards lesion, uvula, away from."
             andDeficit:@"Corticobulbar Tract"];
    
    [webers addSymptoms:@"Ipsilateral Oculomotor Palsy: dialated pupil, diplopia (due to ipsilateral eye pointing down and out), and ptosis"
             andDeficit:@"CN III Fibers"];
    
    [webers addSymptoms:@"Contralateral Parkinsonism (tremor, hypokinesia, rigidity, postural instability)"
             andDeficit:@"Substantia Nigra"];
    
    
    // Benedikt's
    BSSyndrome *benedikts = [[BSSyndrome alloc] initWithName:@"Benedikt's"];
    
    [benedikts setDescription:@"AKA Paramedian Midbrain Syndrome.  Occlusion of PCA or paramedian branches of Basilar Artery causes deficits in Tegmental Midbrain and Cerebellum."];
    
    [benedikts addSymptoms:@"Ipsilateral Oculomotor Palsy: dialated pupil, diplopia (due to ipsilateral eye pointing down and out), and ptosis (paralysis of levator palpebrae superioris)"
                andDeficit:@"CN III Fibers"];
    
    [benedikts addSymptoms:@"Contralateral cerebellar dystaxia with intention tremor, hemichorea, hemiathetosis"
                andDeficit:@"Dentatothalamic Fibers"];
    
    [benedikts addSymptoms:@"Contrallatral loss of sensation to discriminative touch, vibration, and conscious proprioception of trunk and extremeties"
                andDeficit:@"Medial Lemniscus"];
    
    [benedikts addSymptoms:@"Contralateral hemiparesis or hemiplegia of upper and lower extremeties"
                andDeficit:@"Corticospinal Tract"];
    
    
    // Nothnagel's
    
    BSSyndrome *nothnagels = [[BSSyndrome alloc]initWithName:@"Nothnagel's"];
    
    [nothnagels setDescription:@"Dorsal aspect of Rostral Midbrain.  Occlusion of Medial Posterior choroidal Artery (branch of Posterior Cerebral Artery."];
    
    
    [nothnagels addSymptoms:@"Ipsilateral Oculomotor Palsy: dialated pupil, diplopia (due to ipsilateral eye pointing down and out), and ptosis (paralysis of levator palpebrae superioris)"
                andDeficit:@"CN III Fibers"];
    
    [nothnagels addSymptoms:@"Cerebellar Ataxia (inability to coordinate balance, gait, extremity and eye movements.)"
                 andDeficit:@"Dentatorubral Fibers"];
    
    [nothnagels setPerfusionDiagram:@"perfusion-background-nothnagel.png"]; // special case

    
    // Claude's
    BSSyndrome *claudes = [[BSSyndrome alloc]initWithName:@"Claude's"];
    
    [claudes setDescription:@"Occlusion in branch of the Posterior Cerebral Artery (PCA) resulting in deficit of ventral midbrain. In contrast to Weber's Syndrome, the cerebral peduncle is less commonly affected."];
    
    
    [claudes addSymptoms:@"Ipsilateral Oculomotor Palsy: Mydriasis (dialated pupil), strabismus (eye pointing down and out) causing diplopia (double vision) , ptosis (eyelid droops due to paralysis of Levator Palpebrae Superioris)"
              andDeficit:@"CN III Fibers"];
    
    [claudes addSymptoms:@"Ipsilateral cerebellar signs -- dystaxia (a mild form of ataxia), dysmetria (fail past pointing), dysdiadokokinesia (unable to perform rapid alternating motions)"
              andDeficit:@"Red Nucleus and Cerebello-thalamic Fibers"]; // TODO: Check on the Red Nucleus

    
    // Parinaud's
    BSSyndrome *parinauds = [[BSSyndrome alloc]initWithName:@"Parinaud's"];
    
    [parinauds setDescription:@"AKA Dorsal Midbrain Syndrome. Often due to the compression of the Dorsal Midbrain area by a mass in pineal region."];
    
    [parinauds addSymptoms:@"Supranuclear Upgaze Palsy (unable to look up). Upgaze attempt causes convergence-retraction nystagmus. Collier's sign (retracted eyelids, sclera is exposed above iris). Lid lag."
                andDeficit:@"Superior Colliculi and postectal area"];
    
    [parinauds addSymptoms:@"Mydriasis (Dialated Pupil). Light-Near Dissociation (loss of pupilary light reflex, but intact accomodation)."
                andDeficit:@"CN III Nucleus (Edinger Westphal and Oculomotor Nuclei)"];
    
    [parinauds addSymptoms:@"Non-communicating hydrocephalus and cerebral edema."
                andDeficit:@"Obstruction of Cerebral Aqueduct"];

    
    //Locked-In
    BSSyndrome *lockedIn = [[BSSyndrome alloc]initWithName:@"Locked-In"];
    
    [lockedIn setDescription:@"Caused by occlusion of the basilar artery or its major branches resulting in bilateral deficit of ventral pons.  Ability to blink may be preserved if CN III is spared."];
    
    [lockedIn addSymptoms:@"Complete loss of all sensory modalities along with quardiplegia (bilateral paralysis of extremeties)."
               andDeficit:@"Extensive damage of Ventral Pons"];
    
    
    //Raymond's
    BSSyndrome *raymonds = [[BSSyndrome alloc]initWithName:@"Raymond's"];
    [raymonds setDescription:@"AKA Ventral Pontine Syndrome.  Occlusion of perforating branches of Basilar Artery resulting in deficits in ventrocaudal pons. (In contrast to Millard-Gubler's Syndrome, CN VII is not involved.)"];
    
    [raymonds addSymptoms:@"Contralateral spastic hemiparesis or hemiplegia of upper and lower extremeties"
                    andDeficit:@"Corticospinal Tract"];
    
    [raymonds addSymptoms:@"Internal Strabismus (eye deviated inwards) due to Ipsilateral Lateral Rectus Palsy or Paresis (results in diplopia)"
                    andDeficit:@"CN VI"];


    //Configure order of syndromes
    [allSyndromes addObject:webers];
    [allSyndromes addObject:claudes];
    [allSyndromes addObject:benedikts];
    [allSyndromes addObject:nothnagels];
    [allSyndromes addObject:parinauds];
    [allSyndromes addObject:raymondCestan];
    [allSyndromes addObject:raymonds];
    [allSyndromes addObject:millardGubler];
    [allSyndromes addObject:foville];
    [allSyndromes addObject:wallenberg];
    [allSyndromes addObject:medialMedullary];
    [allSyndromes addObject:jacksons];
    [allSyndromes addObject:lockedIn];
    
    return allSyndromes;
        
}

@end
