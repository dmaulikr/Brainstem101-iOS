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
    
    [wallenberg setDesc:@"AKA Lateral Medullary Syndrome. Occlusion of Vertabral a. or PICA  lateral medullary infaction."];
    
    [wallenberg addSymptoms:@"Nystagmus, Diplopia, Nausea, Vertigo"
                 andDeficit:@"Vestibular Nuc."];
    
    [wallenberg addSymptoms:@"Ipsilateral cerebellar signs – dystaxia, dysmetria, dysdiadokokinesia"
                 andDeficit: @"Inferior Cerebellar Peduncle"];
    
    [wallenberg addSymptoms:@"Palatal myoclonus (rapid spasms of palatal roof produces a clicking sound)"
                 andDeficit:@"Central Tegmental Tract"];
    
    [wallenberg addSymptoms:@"Contralateral hemianalgesia of body"
                 andDeficit:@"ALS"];
    
    [wallenberg addSymptoms:@"Ipsilateral hemianalgesia of face and absent corneal reflex"
                 andDeficit:@"Spinal Trigeminal Nuc."];
    
    [wallenberg addSymptoms:@"Paralysis of laryngeal, pharyngeal, and palatal muscles results in dysarthria (difficulty with articulation of speech), hoarseness, dysphagia, and diminished gag reflex."
                 andDeficit:@"Nuc. Ambiguus (CN IX, X)"];
    
    [wallenberg addSymptoms:@"Ipsilateral Horner's Syndrome (ptosis, miosis, anhydrosis) with facial flushing."
                 andDeficit:@"Sympathetic (Hypothalamo-spinal) Tracts"];
    
    //Medial Medullary
    BSSyndrome *medialMedullary = [[BSSyndrome alloc] initWithName:@"Medial Medullary"];
    [medialMedullary setDesc:@"Occlusion of ASA or Basilar’s Paramedian branches  medial medullary infarction"];
    
    [medialMedullary addSymptoms:@"Paresis (and possible atrophy) of ipsilateral tongue muscles; protruded tongue points towards lesion)"
                      andDeficit:@"CN XII Nuc."];
    
    [medialMedullary addSymptoms:@"Contralateral spastic hemiparesis or hemiplegia"
                      andDeficit:@"Corticospinal Tract"];
    
    [medialMedullary addSymptoms:@"Contralateral loss of conscious proprioception, discriminative touch, and vibratory sensation from trunk and extremities"
                      andDeficit:@"Medial Lemniscus"];
    
    
    //Jackson's
    BSSyndrome *jacksons = [[BSSyndrome alloc] initWithName:@"Jackson's"];
    [jacksons setDesc:@"Occlusion of Vertebral a. infarction of tegmental medulla"];
    
    [jacksons addSymptoms:@"Ipsilateral paralysis of tongue, soft palate, and vocal chords."
               andDeficit:@"Motor Nucleus of Vagus"];
    
    [jacksons addSymptoms:@"Palatal myoclonus (rapid spasms of palatal roof that produce a clicking sound)"
               andDeficit:@"Central Tegmental Tract"];
    
    [jacksons addSymptoms:@"Contralateral Body Hemianalgesia"
               andDeficit:@"ALS"];
    
    [jacksons addSymptoms:@"Ipsilateral paralysis of trapezius and SCM muscles inability to shrug the affected side shoulder or turn head, to opposite side, against resistance"
               andDeficit:@"Spinal Accesory Nuc."];
    
    
    // Millard Gubler
    BSSyndrome *millardGubler = [[BSSyndrome alloc] initWithName:@"Millard Gubler's"];
    
    [millardGubler setDesc:@" AKA Ventral Pontine Syndrome. Occlusion of perforating branches of Basilar a.infarction of ventro-caudal pons"];
    
    [millardGubler addSymptoms:@"Contralateral spastic hemiparesis or hemiplegia"
                    andDeficit:@"Corticospinal Tract"];
    
    [millardGubler addSymptoms:@"Diplopia due to Lateral Rectus Palsy"
                    andDeficit:@"CN VI"];
    
    [millardGubler addSymptoms:@"Ipsilateral facial droop and loss of corneal and stapedial reflex (efferent component)"
                    andDeficit:@"CN VII"];
    
    
    //Foville's
    BSSyndrome *foville = [[BSSyndrome alloc]initWithName:@"Foville's"];
    [foville setDesc:@"Occlusion of perforating branches of Basilar Artery  infarction of dorso-caudal pons."];
    
    [foville addSymptoms:@"Contralateral spastic hemiparesis or hemiplegia"
              andDeficit:@"Corticospinal Tract"];
    
    [foville addSymptoms:@"Diplopia due to Lateral Rectus Palsy"
              andDeficit:@"CN VI"];
     
     [foville addSymptoms:@"Internuclear Opthalmoplegia (INO)"
               andDeficit:@"MLF"];
     
     [foville addSymptoms:@"Contralateral loss of conscious proprioception, discriminative touch, and vibratory sensation from trunk and extremities"
               andDeficit:@"Medial Lemniscus"];
     
     [foville addSymptoms:@" Ipsilateral facial droop and loss of corneal and stapedial reflex (efferent component)"
               andDeficit:@"Motor Nuc. of CN VII"];
     
     [foville addSymptoms:@"Ipsilateral loss of taste sensation from the anterior 2/3 of tongue"
               andDeficit:@"Solitary Nuc."];
     
     [foville addSymptoms:@"Problem with lacrimation and salivation"
               andDeficit:@"Superior Salivary Nuc."];
     
     
     //Raymond-Cestan's
     BSSyndrome *raymondCestan = [[BSSyndrome alloc] initWithName:@"Raymond-Cestan's"];
     
     [raymondCestan setDesc:@"Occlusion of Circumferential Branches of Basilar Artery  Infarction of Dorso-rostral Pons:"];
     
     [raymondCestan addSymptoms:@"Ipsilateral ataxia with coarse intention tremors"
                     andDeficit:@"Middle Cerebellar Peduncle"];
     
     [raymondCestan addSymptoms:@"Contralateral Hemisensory Loss (all modalities from both face and body)"
                     andDeficit:@"ALS, Medial Lemniscus, Trigeminothalamic Tract"];
     
     [raymondCestan addSymptoms:@"Contralateral Hemiparesis (face and body)"
                     andDeficit:@"Corticobulbar & Corticospinal tracts"];
     
     [raymondCestan addSymptoms: @"Ipsilateral paralysis of muscls of mastication"
                     andDeficit:@"Trigeminal Motor Nuc."];
     
     [raymondCestan addSymptoms:@"Ipsilateral loss of light touch sensation face to light touch and proprioception of jaw muscles."
                     andDeficit:@"Principal Sensory Nuc."];
     
     [raymondCestan addSymptoms:@"Internal Strabismus due to Ipsilateral Lateral Rectus Palsy or Paresis (results in diplopia)"
                     andDeficit:@"CN VI"];
     
     
     // Weber's
     BSSyndrome *webers = [[BSSyndrome alloc] initWithName:@"Weber's"];
     
     [webers setDesc:@"AKA Medial Midbrain Syndrome.  Occlusion of Posterior Cerebral Artery (PCA) —> Infarction of ventral midbrain area."];
     
     [webers addSymptoms:@"Contralateral spastic hemiparesis or Hemiplegia of upper and lower extremeties"
              andDeficit:@"Corticospinal Tract"];
     
     [webers addSymptoms:@"Contralateral hemiparesis or hemiplegia of lower face (CN VII), tongue (CN XII) and palate (CN X). Tongue points towards lesion, uvula, away from."
              andDeficit:@"Corticobulbar Tract"];
     
     [webers addSymptoms:@"Ipsilateral Oculomotor Palsy: dialated pupil, diplopia (secondary to ipsilateral eye pointing down and out), and ptosis"
              andDeficit:@"CN III Fibers"];
     
     [webers addSymptoms:@"Contralateral Parkinsonism (tremor, hypokinesia, rigidity, postural instability)"
              andDeficit:@"Substantia Nigra"];
     
     
     // Benedikt's
     BSSyndrome *benedikts = [[BSSyndrome alloc] initWithName:@"Benedikt's"];
     
     [benedikts setDesc:@" Occlusion of PCA or paramedian branches of Basilar a.  Infaction of Tegmental Midbrain and Cerebellum. AKA Paramedian Midbrain Syndrome.  "];
     
     [benedikts addSymptoms:@"Ipsilateral Oculomotor Palsy: dialated pupil, diplopia (ipsilateral eye points down and out), and ptosis (paralysis of levator palpebrae superioris)"
                 andDeficit:@"CN III Fibers"];
     
     [benedikts addSymptoms:@"Contralateral cerebellar dystaxia with intention tremor, hemichorea, hemiathetosis"
                 andDeficit:@"Dentatothalamic Fibers"];
     
     [benedikts addSymptoms:@"Contrallatral loss of sensation to discriminative touch, vibration, and conscious proprioception of trunk and extremeties"
                 andDeficit:@"Medial Lemniscus"];
     
     [benedikts addSymptoms:@"Contralateral hemiparesis or hemiplegia"
                 andDeficit:@"Corticospinal Tract"];
     
     // Nothnagel's
     
     BSSyndrome *nothnagels = [[BSSyndrome alloc]initWithName:@"Nothnagel's"];
     
     [nothnagels setDesc:@"Occlusion of Medial Posterior Choroidal Artery (branch of PCA)  infarction within Dorso-rostral Midbrain."];
      
      [nothnagels addSymptoms:@"Ipsilateral Oculomotor Palsy: Mydriasis, strabismus (eye points down and out), ptosis (Levator Palpebrae Superioris)"
                   andDeficit:@"CN III Fibers"];
      
      [nothnagels addSymptoms:@"Cerebellar Ataxia"
                   andDeficit:@"Dentatorubral Fibers"];
      
      [nothnagels setPerfusionDiagram:@"perfusion-background-nothnagel.png"]; // special case
      
      
      // Claude's
      BSSyndrome *claudes = [[BSSyndrome alloc]initWithName:@"Claude's"];
      
      [claudes setDesc:@"Occlusion of a branch of the PCA  infarction of ventral midbrain. Note: The cerebral peduncle is less involved in comparison to Weber’s."];
      
      
      [claudes addSymptoms:@"Ipsilateral Oculomotor Palsy: Mydriasis, strabismus (eye points down and out), ptosis (Levator Palpebrae Superioris)"
                andDeficit:@"CN III Fibers"];
      
      [claudes addSymptoms:@"Ipsilateral cerebellar signs -- dystaxia, dysmetria, dysdiadokokinesia"
                andDeficit:@"Red Nuc. & Cerebello-thalamic Fibers"];
      
      
      // Parinaud's
      BSSyndrome *parinauds = [[BSSyndrome alloc]initWithName:@"Parinaud's"];
      
      [parinauds setDesc:@"Usually due to compression of the Dorsal Midbrain area by a pineal mass. AKA Dorsal Midbrain Syndrome. "];
       
       [parinauds addSymptoms:@"Supranuclear Upgaze Palsy (Upgaze attempt causes convergence-retraction nystagmus). Collier's sign (eyelids are retracted, sclera is visible above the iris)."
                   andDeficit:@"Superior Colliculi & post-tectal area"];
       
       [parinauds addSymptoms:@"Mydriasis and Light-Near Dissociation (loss of pupilary light reflex, with intact accomodation)."
                   andDeficit:@"CN III Nucleus (Edinger-Westphal & Oculomotor Nuc.)"];
       
       [parinauds addSymptoms:@"Non-communicating hydrocephalus and cerebral edema."
                   andDeficit:@"Cerebral Aqueduct (obstructed)"];
       
       
       //Locked-In
       BSSyndrome *lockedIn = [[BSSyndrome alloc]initWithName:@"Locked-In"];
       
       [lockedIn setDesc:@"Occlusion of Basilar a. (or major branches of) results in extensive damage in the pons"];
       
       [lockedIn addSymptoms:@"Complete paralysis of all voluntary muscles and sensory modalities. Some patients retain the ability to blink; this is because the oculomotor nuclei continues to receive blood from "
                  andDeficit:@"Various Pontine Nuclei/Tracts"];
       
       //Raymond's
       BSSyndrome *raymonds = [[BSSyndrome alloc]initWithName:@"Raymond's"];
       [raymonds setDesc :@"AKA Ventral Pontine Syndrome.  Occlusion of perforating branches of Basilar Artery causes deficits in ventro-caudal pons. (unlike Millard-Gubler's Syndrome, CN VII is not involved.)"];
       
       [raymonds addSymptoms:@"Contralateral spastic hemiparesis or hemiplegia"
                  andDeficit:@"Corticospinal Tract"];
       
       [raymonds addSymptoms:@"Diplopia due to Lateral Rectus Palsy"
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
