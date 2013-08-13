//
//  BSStructureGenerator.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 10/7/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSStructureGenerator.h"
#import "BSStructure.h"

@implementation BSStructureGenerator{
    NSOperationQueue *operationQueue;
}

- (id)init{
    self = [super init];
    if (self) {
        
        operationQueue = [[NSOperationQueue alloc] init];
        [operationQueue setMaxConcurrentOperationCount:NSOperationQueueDefaultMaxConcurrentOperationCount];
        
        _Nuclei          = [NSMutableArray new];
        _Tracts          = [NSMutableArray new];
        _Arteries        = [NSMutableArray new];
        _Miscellaneous   = [NSMutableArray new];
        _CranialNerves   = [NSMutableArray new];
        
//        TICK;
//        [self addNuclei];
//        [self addTracts];
//        [self addArteries];
//        [self addMiscelaneus];
//        [self addCranialNerves];
//        TOCK;
        
        [operationQueue addOperationWithBlock:^{
            [self addNuclei];
        }];
        [operationQueue addOperationWithBlock:^{
            [self addTracts];
        }];
        [operationQueue addOperationWithBlock:^{
            [self addArteries];
        }];
        [operationQueue addOperationWithBlock:^{
            [self addMiscelaneus];
        }];
        [operationQueue addOperationWithBlock:^{
            [self addCranialNerves];
        }];

    }
    return self;
}

-(void) addNuclei{
    
    BSStructure *n0 = [[BSStructure alloc] initWithName:@"Abducens Nucleus" andType:BSStructureTypeNucleus];
    [n0 setStructureDescription:@"Cell bodies whose axons innervate the  lateral rectus (intrinsic eye muscle)."];
    [_Nuclei addObject:n0];
    
    
    BSStructure *n1 = [[BSStructure alloc] initWithName:@"Accessory Cuneate Nucleus" andType:BSStructureTypeNucleus];
    [n1 setStructureDescription:@"Carries ascending sensory information from Cervical Spinal nerves to the cerebellum."];
    [_Nuclei addObject:n1];
    
    //TODO : Description
    BSStructure *n2 = [[BSStructure alloc] initWithName:@"Accessory Nucleus" andType:BSStructureTypeNucleus];
    [_Nuclei addObject:n2];
    
    
    BSStructure *n3 = [[BSStructure alloc] initWithName:@"Anterior Cochlear Nucleus" andType:BSStructureTypeNucleus];
    [n3 setStructureDescription:@"Cell bodies that consists of anteroventral and posterovental cochlear nuclei. Receives input from the cochlea (through the Auditory Nerve). The axonsof the ventral cochlear nucleus project as  the ventral acoustic striae , through trapezoid body to contralateral superior olivary complex."];
    [_Nuclei addObject:n3];
    
    
    BSStructure *n5 = [[BSStructure alloc] initWithName:@"Cuneate Nucleus" andType:BSStructureTypeNucleus];
    [n5 setStructureDescription:@"Second order cell bodies of the PC-ML pathway; The cuneate fasciculus synapses upon the cuneate nucleus whose axons decussate as the arcuate fibers and ascends as the contralateral medial lemniscus"];
    [_Nuclei addObject:n5];
    
    
    BSStructure *n6 = [[BSStructure alloc] initWithName:@"Dorsal Motor Nucleus of Vagus" andType:BSStructureTypeNucleus];
    [n6 setStructureDescription:@"Mediates parasympathetic vagal output to Lungs, Heart, and GI up to the Colic Flexure."];
    [_Nuclei addObject:n6];
    
    BSStructure *n7 = [[BSStructure alloc] initWithName:@"Facial Motor Nucleus" andType:BSStructureTypeNucleus];
    [n7 setStructureDescription:@"Cell bodies whose axons generate motor signals to animate facial muscles."];
    [_Nuclei addObject:n7];
    
    BSStructure *n8 = [[BSStructure alloc] initWithName:@"Edinger-Westphal Nucleus" andType:BSStructureTypeNucleus];
    [n8 setStructureDescription:@"(GVE) Cell bodies whose preganglionic parasympathetic axons project to the cilliary ganglion of the eye. Functions include pupillary constriction (Sphincter Pupillae) acommodation (Cilliary muscles of the lens), and convergence."];
    [_Nuclei addObject:n8];
    
    BSStructure *n9 = [[BSStructure alloc] initWithName:@"Gracile Nucleus" andType:BSStructureTypeNucleus];
    [n9 setStructureDescription:@"Second order cell bodies  of  the PC-ML pathway.  The gracile fasciculus synapses upon the gracile nucleus whose axons decussate as the  Internal Arcuate Fibers and ascends as the contralateral medial lemniscus"];
    [_Nuclei addObject:n9];
    
    BSStructure *n10 = [[BSStructure alloc] initWithName:@"Hypoglossal Nucleus" andType:BSStructureTypeNucleus];
    [n10 setStructureDescription:@"Cell bodies whose axons innervate all intrinsic and extrinsic muscles of the tongue (EXCEPT palatoglossus) Unilateral lesion causes tongue to deviate towards lesioned side upon protrusion."];
    [_Nuclei addObject:n10];
    
    BSStructure *n30 = [[BSStructure alloc] initWithName:@"Inferior Olivary Nucleus" andType:BSStructureTypeNucleus];
    [n30 setStructureDescription:@"Thought to be involved in learning of specialized motor skills. Think figure-skating! It receives sensory input from the Spino-olivary tracts, and projects to the cerebellum, though the Inferior Cerebellar Peduncle."];
    [_Nuclei addObject:n30];
    
    BSStructure *n12 = [[BSStructure alloc] initWithName:@"Inferior Vestibular Nucleus" andType:BSStructureTypeNucleus];
    [n12 setStructureDescription:@"Cell bodies that receive information from the semicircular canals, utricle, saccule, and vermis of cerebellum. Responsible for integrating vestibular inputs.  Axons descend to brainstem as the vestibuloreticular tracts and to the spinal cord as the vestibulospinal tracts."];
    [_Nuclei addObject:n12];
    
    
    
    
    BSStructure *n13 = [[BSStructure alloc] initWithName:@"Interpeduncular Nucleus" andType:BSStructureTypeNucleus];
    [n13 setStructureDescription:@"Imposes inhibitory effect on many other brain regions (dampens dopamine effects). More specifically, receives excitatory input from medial Habenula, the diagonal band, the dorsal tegmentum, Raphe Nuclei, the Central Grey and the Locus Ceruleus. Outputs inhibitory signal to dorsal tegmental structures."];
    [_Nuclei addObject:n13];
    
    BSStructure *n14 = [[BSStructure alloc] initWithName:@"Lateral Reticular Nucleus" andType:BSStructureTypeNucleus];
    [n14 setStructureDescription:@"Composed of three subnuclei (Parvocellular, Magnocellular, Subtrigeminal) that send signals to the cerebellum. Parvo and Magno receive information mostly from ipsilateral dorsal horn of the spinal cord and project ipsilaterally to cerebellar vermis. The Subtrigeminal receives input mostly from the cortex and projects to the ipsilateral flocculonodular lobe."];
    [_Nuclei addObject:n14];
    
    BSStructure *n15 = [[BSStructure alloc] initWithName:@"Lateral Vestibular Nucleus" andType:BSStructureTypeNucleus];
    [_Nuclei addObject:n15];
    
    BSStructure *n21 = [[BSStructure alloc] initWithName:@"Locus Ceruleus" andType:BSStructureTypeNucleus];
    [n21 setStructureDescription:@"Major site for synthesis of Norepinephrine. Receives input from many regions of the brain --hypothalamus (regulation of autonomic functions), cyngulate gyrus/amygdala (arousal by emotional distress), Raphe Nuclei, cerebellum, etc -- and, similarly, projects to many different regions -- hypothalamus, cortex, amygdala, cerebellum, thalamus, etc -- to enable stress response, arousal, neuroplasticity, attention, memory, balance and more.Decreased activity is associated with: Alzheimer’s, Parkinson’s, depression, Increase activity is associated with: anxiety, panic disorder, Opiod withdrawal,"];
    [_Nuclei addObject:n21];
    
    BSStructure *n16 = [[BSStructure alloc] initWithName:@"Medial Geniculate Nucleus" andType:BSStructureTypeNucleus];
    [n6 setStructureDescription:@"Cell bodies located in the thalamus that are part of the auditory pathway. The axons will project  and synapse on the primary auditory cortex (transverse temporal gyrus/ Heschl's gyrus)"];
    [_Nuclei addObject:n16];
    
    BSStructure *n17 = [[BSStructure alloc] initWithName:@"Medial Motor Nuclei" andType:BSStructureTypeNucleus];
    [_Nuclei addObject:n17];
    
    
    BSStructure *n18 = [[BSStructure alloc] initWithName:@"Medial Vestibular Nucleus" andType:BSStructureTypeNucleus];
    [n18 setStructureDescription:@"Cell bodies that receive information from the semicircular canals and project to the cervical spinal cord to innervate neck muscles to stabilize the head in space, axons are also part of the vestibulo-occular reflex (VOR)."];
    [_Nuclei addObject:n18];
    
    //TODO: add the tract of this
    BSStructure *t21 = [[BSStructure alloc] initWithName:@"Mesencephalic Nucleus" andType:BSStructureTypeNucleus];
    [t21 setStructureDescription:@"Pseudounipolar cells that carry proprioception sensation from the jaw directly to the  trigeminal motor nuclei. Afferent component of the Jaw Jerk ReflexLoss of Jaw Jerk Reflex (dysfunction of afferent component)"];
    [_Nuclei addObject:t21];
    
    BSStructure *n19 = [[BSStructure alloc] initWithName:@"Nucleus Ambiguus" andType:BSStructureTypeNucleus];
    [n19 setStructureDescription:@"Consists of the (brachial) motor fibers of Vagus Nerve (innervation of larynx, pharynx, and uvula) as well as motor fibers of Glossopharyngeal Nerve (CN IX)."];
    [_Nuclei addObject:n19];
    
    BSStructure *n20 = [[BSStructure alloc] initWithName:@"Nucleus Centralis Superior" andType:BSStructureTypeNucleus];
    [n20 setStructureDescription:@"Project towards higher brain regions."];
    [_Nuclei addObject:n20];
    
    BSStructure *n22 = [[BSStructure alloc] initWithName:@"Nucleus Raphe Dorsalis" andType:BSStructureTypeNucleus];
    [n22 setStructureDescription:@"Cell bodies whose axons project towards higher brain regions and release serotonin."];
    [_Nuclei addObject:n22];
    
    BSStructure *n23 = [[BSStructure alloc] initWithName:@"Nucleus Raphe Magnus" andType:BSStructureTypeNucleus];
    [n23 setStructureDescription:@"Cell bodies that receive input from Periaqueductal Grey, paraventricular nuclei of hypothalamus, and amygdala. Projects axons within the brainstem and along the spinal chord (dorsal horns) where it releases enkephalin -- endogenous analgesic."];

    [_Nuclei addObject:n23];
    
    BSStructure *n24 = [[BSStructure alloc] initWithName:@"Nucleus Raphe Obscurus" andType:BSStructureTypeNucleus];
    [n24 setStructureDescription:@"Cell bodies whose axons project to the cerebellum.Experimental ablation --> modulation of Hypoglossal nerve. Experimental microinjection of 5-HT --> increased GI motility."];
    [_Nuclei addObject:n24];
    
    BSStructure *n25 = [[BSStructure alloc] initWithName:@"Nucleus Raphe Pallidus" andType:BSStructureTypeNucleus];
    [n25 setStructureDescription:@"Receives axons from  the periaquaductal gray, hypothalamic nuclei, and amygdala. This nucleus is involved in fever activation and tachycardic response to emotional or psychological stress."];
    [_Nuclei addObject:n25];
    
    BSStructure *n26 = [[BSStructure alloc] initWithName:@"Nucleus Raphe Pontis" andType:BSStructureTypeNucleus];
    [n26 setStructureDescription:@"Cell bodies whose axons project to the cerebellum."];
    [_Nuclei addObject:n26];
    
    BSStructure *n27 = [[BSStructure alloc]initWithName:@"Oculomotor Nucleus" andType:BSStructureTypeNucleus];
    [n27 setStructureDescription:@"(GSE) Cell Bodies whose axons innervate  4 of the 6 intrinsic muscles of the eye (Superior Rectus, Medial Rectus, Inferior Rectus, Inerior Oblique) and regulates blinking by innervating the Levator palpebrae Superioris m."];
    [_Nuclei addObject:n27];
    
    
    BSStructure *nn27 = [[BSStructure alloc]initWithName:@"Principal Nucleus" andType:BSStructureTypeNucleus];
    [_Nuclei addObject:nn27];
    
    //TODO: maybe separate these
    BSStructure *n28 = [[BSStructure alloc] initWithName:@"Pontine Nucleus and Tract" andType:BSStructureTypeNucleus];
    [n28 setStructureDescription:@"Receive motor signal from ipsilateral motor cortex and carry it to contralateral cerebellum (via Middle cerebellar peduncle)."];
    [_Nuclei addObject:n28];
    
    
    BSStructure *n29 = [[BSStructure alloc] initWithName:@"Posterior Cochlear Nucleus" andType:BSStructureTypeNucleus];
    [n29 setStructureDescription:@"Cell bodies that receive signals from the cochlea, through the 'Auditory Nerve'. The axons project as the Intermediate Acoustic Striae which joins the ascending fibers in the contralateral lateral lemniscus (traveling to Inferior Colliculus)"];
    [_Nuclei addObject:n29];
    
    BSStructure *n31 = [[BSStructure alloc]initWithName:@"Reticulotegmental Nucleus" andType:BSStructureTypeNucleus];
    [_Nuclei addObject:n31];
    
    BSStructure *n32 = [[BSStructure alloc]initWithName:@"Red Nucleus" andType:BSStructureTypeNucleus];
    [n32 setStructureDescription:@"Cell bodies whose axons project to  the cerebellum (via the inferior olivary complex) ; and to the spinal cord ( as the rubrospinal tracts) to allow flexion of the upper extremity. Minor motor functions: arm swing during gait; crawling of infants."];
    [_Nuclei addObject:n32];
    
    BSStructure *n33 = [[BSStructure alloc] initWithName:@"Salivatory Nucleus" andType:BSStructureTypeNucleus];
    [n33 setStructureDescription:@"(GVE) Parasympathetic preganglionic cell bodies whose axons synapse on the otic ganglia whose axons will stimulate secretion of saliva by the parotid gland."];
    [_Nuclei addObject:n33];
    
    //TODO : Put in both nucleus and tracts
    BSStructure *n34 = [[BSStructure alloc] initWithName:@"Solitary Nucleus and Tract" andType:BSStructureTypeNucleus];
    [n34 setStructureDescription:@"Cell bodies that receive taste sensation (Via CN VII and IX), and visceral sensation from Heart, Lungs, GI and Liver (via CN IX and CN X) -- Noteworthy: signal from chemoreceptors of Carotid Bodies associate with CN IX, whereas, signals picked up by Aortic Body chemoreceptors use CN X to reach the brainstem. Send projections to Hypothalamus (paraventricular nuclei) and Amygdala (central Nuclei). Axons centered within the Solitary nucleus; it carries both afferent and efferent fibers"];
    [_Nuclei addObject:n34];
    
    
    BSStructure *n35 = [[BSStructure alloc] initWithName:@"Spinal Trigeminal Nucleus" andType:BSStructureTypeNucleus];
    [_Nuclei addObject:n35];
    
    BSStructure *cn5 = [[BSStructure alloc] initWithName:@"Trigeminal Motor Nucleus" andType:BSStructureTypeNucleus];
    [_Nuclei addObject:cn5];
    
    BSStructure *n36 = [[BSStructure alloc] initWithName:@"Trochlear Nucleus" andType:BSStructureTypeNucleus];
    [_Nuclei addObject:n36];
    
}

-(void) addTracts{
    
    BSStructure *t1 = [[BSStructure alloc] initWithName:@"Anterior Corticospinal Tract" andType:BSStructureTypeTract];
    [t1 setStructureDescription:@"Axons that carry motor signals from the pre-central gyrus or anterior paracentral lobule. These axons continue down ipsilaterally until the level of inervation, where it decussates through the anterior white commisure, and synapses with motor neurons in the anterior horn."];
    [_Tracts addObject:t1];
    
    
    //TODO: missing section 5 data?
    BSStructure *t2 = [[BSStructure alloc] initWithName:@"Anterior Spinocerebellar Tract" andType:BSStructureTypeTract];
    [_Tracts addObject:t2];
    
    
    BSStructure *ttt = [[BSStructure alloc] initWithName:@"Anterolateral System" andType:BSStructureTypeTract];
    [ttt setStructureDescription:@"Axons that carry pain, temperature and crude touch sensory information. It is composed of three distinct parts : 1. Spinothalamic (responsible for localization of the stimulus) 2. Spinoreticular (mediates an arousal response to the stimulus) 3. Spinotectal (involved in the movement of eyes towards the stimulus).Lesion manifests as loss of sensation to Pain and Temperature on contralateral side of the body."];
    [_Tracts addObject:ttt];
    
    
    BSStructure *t4 = [[BSStructure alloc] initWithName:@"Cerebellothalamic Tract" andType:BSStructureTypeTract];
    [t4 setStructureDescription:@"Axons that carry the output of Cerebellar Nuclei to contralateral thalamus (VA/ VL)Associated with hereditary dystonia"];
    [_Tracts addObject:t4];
    
    
    BSStructure *t6 = [[BSStructure alloc] initWithName:@"Central Tegmental Tract" andType:BSStructureTypeTract];
    [t6 setStructureDescription:@"Composed of two groups of axons: 1) The ascending tracts connect Solitary Nucleus to VPM of thalmus. 2) The descending tracts connect Parvocellular Red Nucleus to the inferior olivary nucleusPalatal Myocolonus, observed in medial superior pontine syndrome."];
    [_Tracts addObject:t6];
    
    
    BSStructure *t7 = [[BSStructure alloc] initWithName:@"Corticobulbar Tracts" andType:BSStructureTypeTract];
    [t7 setStructureDescription:@"Axons transmit signal from the motor cortex, through the genu of internal capsule, to the following cranial nerve nuclei: Trigeminal motor nuclei, facial motor nuclei, nucleus ambiguous, spinal accessory nuclei, hypoglossal nuclei. Almost all nuclei receive input from both hemispheres, with the EXCEPTION of one: one half of the facial motor nucleus of CNVII -- the half that controls the lower face-- is innervated by the contralateral corticobulbar tract ONLY."];
    [_Tracts addObject:t7];
    
    
    BSStructure *t8 = [[BSStructure alloc] initWithName:@"Corticospinal Tract" andType:BSStructureTypeTract];
    [t8 setStructureDescription:@"These axons carry motor signals from the precentral gyrus and anterior paracentral lobule. The axons travel through the posterior limb of the internal capsule. Most of the fibers decussate in caudal medulla (pyramidal decussation) to form the lateral corticospinal tract. A smaller group continues ipsilaterally, as the anterior corticospinal tract.Unilateral lesion of this tract (within the brainstem) will result in contralateral spastic paresis with UMN signs (increased DTR, increased muscle tone, (+) Babinsky sign)"];
    [_Tracts addObject:t8];
    
    
    BSStructure *t9 = [[BSStructure alloc] initWithName:@"Cuneate Fasciculus" andType:BSStructureTypeTract];
    [t9 setStructureDescription:@"Axons that carry fine touch, vibratory, and proprioceptive sensory information from the upper body (T6 and above). Synapses with the second order neurons (i.e. Cuneate Nucleus) at the caudal medulla."];
    [_Tracts addObject:t9];
    
    
    BSStructure *t11 = [[BSStructure alloc] initWithName:@"Dorsal Trigeminothalamic Tract" andType:BSStructureTypeTract];
    [_Tracts addObject:t11];
    
    BSStructure *t13 = [[BSStructure alloc] initWithName:@"Gracile Fasciculus" andType:BSStructureTypeTract];
    [t13 setStructureDescription:@"Axons that carry fine touch, vibratory, and proprioceptive sensory information from the lower body (T7 and below). Synapses with the second order neurons (i.e. Gracile Nucleus) at the caudal medulla."];

    [_Tracts addObject:t13];
    
    //    BSStructure *t14 = [[BSStructure alloc] initWithName:@"Hypoglossal Nerve" andType:BSStructureTypeTract];
    //    [t14 setStructureDescription:@"Axons that carry motor signals to all intrinsic and extrinsic muscles of the tongue (EXCEPT palatoglossus)Unilateral lesion causes tongue to deviate towards lesioned side upon protrusion."];
    //    //    [t14 addXMLFilePath:@"Hypoglossal Nerve2" withFillColor:nil];
    //    //    [t14 addXMLFilePath:@"Hypoglossal Nerve3" withFillColor:nil];
    //    [_Tracts addObject:t14];
    
    BSStructure *t17 = [[BSStructure alloc] initWithName:@"Lateral Lemniscus" andType:BSStructureTypeTract];
    [t17 setStructureDescription:@"Axons that relay auditory signals from the cochlear nucleus. to various nuclei in the brainstem. Synapses at the Inferior Colliculus."];
    [_Tracts addObject:t17];
    
    
    BSStructure *t19 = [[BSStructure alloc] initWithName:@"Medial Lemniscus" andType:BSStructureTypeTract];
    [t9 setStructureDescription:@"Second order axons that are part of the PC-ML pathway; It consists of axons arising from the contralateral Gracile and Cuneate Nuclei."];
    [_Tracts addObject:t19];
    
    
    BSStructure *t20 = [[BSStructure alloc] initWithName:@"Medial Longitudinal Fasciculus" andType:BSStructureTypeTract];
    [t20 setStructureDescription:@"Axons that mediate synchronized contraction/relaxation of intrinsic muscles of the eye. Consists of ascending descending tracts.Lesion (e.g. demyelination due to Multiple Sclerosis) will result in Inter-nuclear Opthalmoplegia (nystagmus and diplopia)."];
    [_Tracts addObject:t20];
    
    
    //    BSStructure *t23 = [[BSStructure alloc]initWithName:@"Optic Tract" andType:BSStructureTypeTract];
    //    [t23 setStructureDescription:@"(SSA) Axons that relay visual information from the retina to the LGN of ThalamusLesioning the Nerve (before the chiasm) causes Ipsilateral Blindness; Lesionin the Tract (after the chiasm) results in Contralateral Hemianopia."];
    //    [_Tracts addObject:t23];
    
    
    BSStructure *t24 = [[BSStructure alloc] initWithName:@"Posterior Longitudinal Fasciculus" andType:BSStructureTypeTract];
    [t24 setStructureDescription:@"1) Ascending fibers convey visceral sensation from Solitary Nucleus to the hypothalamus (posterior and periventricular nuclei).  2) Descending fibers project from the hypothalamus (paraventricular, periventricular, and supraoptic nuclei), through the periaqueductal grey, carrying autonomic signals to various locations (ventral tegmentum, Dorsal Motor Nucleus of Vagus, Salivatory Nucleus, medullary autonomic centers, and preganglionic neurons located throughout the spinal cord)"];
    [_Tracts addObject:t24];
    
    
    BSStructure *t25 = [[BSStructure alloc] initWithName:@"Posterior Spinocerebellar Tract" andType:BSStructureTypeTract];
    [_Tracts addObject:t25];
    
    
    BSStructure *t27 = [[BSStructure alloc] initWithName:@"Reticulospinal Fibers" andType:BSStructureTypeTract];
    [_Tracts addObject:t27];
    
    BSStructure *t28 = [[BSStructure alloc] initWithName:@"Rubrospinal Tract" andType:BSStructureTypeTract];
    [t28 setStructureDescription:@"Axons that innervate muscles responsible for fine motor movements of the upper extremities; mostly associated with muscles of flexion"];
    [_Tracts addObject:t28];
    
    BSStructure *t29 = [[BSStructure alloc] initWithName:@"Spinal Trigeminal Tract" andType:BSStructureTypeTract];
    [t29 setStructureDescription:@"Axons that relay pain, temperature, and crude touch sensation from ipsilateral face (from cranial nervesV,  VII, IX and X) to the contralateral VPM of thalamus."];
    [_Tracts addObject:t29];
    
    
    BSStructure *t30 = [[BSStructure alloc] initWithName:@"Tectospinal Tract" andType:BSStructureTypeTract];
    [t30 setStructureDescription:@"Axons that coordinate reflexive head, neck and eye movements in response to visual and auditory stimuli. Terminates in Rexed Lamina (VI, VII, VIII) of the Cervical spinal cord."];
    [_Tracts addObject:t30];
    
    
    BSStructure *t32 = [[BSStructure alloc] initWithName:@"Ventral Trigeminothalamic Tract" andType:BSStructureTypeTract];
    [t32 setStructureDescription:@"Axons that carriy pain, temperature, and crude touch sensations from face, head and neck (afferent signals of CNs V, VII, IX, X)"];
    [_Tracts addObject:t32];
    
    BSStructure *t33 = [[BSStructure alloc] initWithName:@"Vestibulospinal and Reticulospinal Tract" andType:BSStructureTypeTract];
    [_Tracts addObject:t33];
}

-(void) addArteries{
    
    BSStructure *a0 = [[BSStructure alloc] initWithName:@"Anterior Inferior Cerebellar" andType:BSStructureTypeArtery];
    [a0 addArteryNamed:@"anterior-inferior-cerebellar" forIndecies:@[@4, @5]];
    [_Arteries addObject:a0];
    
    BSStructure *a1 = [[BSStructure alloc] initWithName:@"Anterior Spinal" andType:BSStructureTypeArtery];
    [a1 addArteryNamed:@"anterior-spinal" forIndecies:@[@0, @1, @2]];
    [_Arteries addObject:a1];
    
    BSStructure *a2 = [[BSStructure alloc] initWithName:@"Basilar Paramedian" andType:BSStructureTypeArtery];
    [a2 addArteryNamed:@"basilar-paramedian" forIndecies:@[@3, @4, @5, @6, @7 ,@8]];
    [_Arteries addObject:a2];
    
    BSStructure *a21 = [[BSStructure alloc] initWithName:@"Basilar Long Circumferential" andType:BSStructureTypeArtery];
    [a21 addArteryNamed:@"basilar-long" forIndecies:@[@4, @5, @6]];
    [_Arteries addObject:a21];
    
    
    BSStructure *a22 = [[BSStructure alloc] initWithName:@"Basilar Short Circumferential" andType:BSStructureTypeArtery];
    [a22 addArteryNamed:@"basilar-short" forIndecies:@[@4, @5, @6]];
    [_Arteries addObject:a22];
    
    
    BSStructure *a3 = [[BSStructure alloc] initWithName:@"Posterior Cerebral" andType:BSStructureTypeArtery];
    [a3 addArteryNamed:@"posterior-cerebral" forIndecies:@[@7, @8]];
    [_Arteries addObject:a3];
    
    BSStructure *a4 = [[BSStructure alloc] initWithName:@"Posterior Communicating" andType:BSStructureTypeArtery];
    [_Arteries addObject:a4];

    BSStructure *a5 = [[BSStructure alloc] initWithName:@"Posterior Inferior Cerebellar" andType:BSStructureTypeArtery];
    [a5 addArteryNamed:@"pica" forIndecies:@[@1, @2, @3]];
    [_Arteries addObject:a5];
    
    BSStructure *aa0 = [[BSStructure alloc] initWithName:@"Posterior Spinal" andType:BSStructureTypeArtery];
    [aa0 addArteryNamed:@"posterior-spinal" forIndecies:@[@0, @1]];
    [_Arteries addObject:aa0];
    
    BSStructure *a6 = [[BSStructure alloc] initWithName:@"Superior Cerebellar" andType:BSStructureTypeArtery];
    [a6 addArteryNamed:@"superior-cerebeller" forIndecies:@[@5, @6, @7]];
    [_Arteries addObject:a6];
    
    BSStructure *a7 = [[BSStructure alloc] initWithName:@"Vertebral" andType:BSStructureTypeArtery];
    [a7 addArteryNamed:@"vertebral" forIndecies:@[@0, @1, @2]];
    [_Arteries addObject:a7];
}

-(void) addMiscelaneus{
    
    BSStructure *t3 = [[BSStructure alloc] initWithName:@"Brachium of Inferior Colliculus" andType:BSStructureTypeMiscellaneous];
    [t3 setStructureDescription:@"Receives and integrates auditory input from cochlear nuclei (through Lateral Lemniscus), the auditory cortex, and the medial MGB of thalamus; Projects to the ventral MGB. Involved in sound lateralization, startle response (...) and Vestibulo-Ocular Reflex"];
    [_Miscellaneous addObject:t3];
    
    BSStructure *m0 = [[BSStructure alloc] initWithName:@"Central Canal" andType:BSStructureTypeMiscellaneous];
    [_Miscellaneous addObject:m0];
    
    //    BSStructure *t5 = [[BSStructure alloc] initWithName:@"Central Grey" andType:BSStructureTypeMiscellaneous];
    //    //    [t5 addXMLFilePath:@"Central Grey1" withFillColor:nil];
    //    //    [t5 addXMLFilePath:@"Central Grey2" withFillColor:nil];
    //    [_Miscellaneous addObject:t5];
    
    BSStructure *m1 = [[BSStructure alloc] initWithName:@"Cerebral Aqueduct" andType:BSStructureTypeMiscellaneous];
    [_Miscellaneous addObject:m1];
    
    
    //    BSStructure *t10 = [[BSStructure alloc] initWithName:@"Crus Cerebri" andType:BSStructureTypeMiscellaneous];
    //    [t10 setStructureDescription:@"Anterior region of the Cerebral Peduncle; contains Corticospinal, Corticobulbar, and Corticopontine fibers."];
    //    [t10 addXMLFilePath:@"Crus Cerebri8" withFillColor:nil];
    //    [t10 addXMLFilePath:@"Crus Cerebri9" withFillColor:nil];
    //    [_Miscellaneous addObject:t10];
    
    BSStructure *m2 = [[BSStructure alloc] initWithName:@"Fourth Ventricle" andType:BSStructureTypeMiscellaneous];
    [m2 setStructureDescription:@"The circulating CSF flows from the third ventricle, down through the Cerebral Aquaduct, and into the Fourth ventricle(ependymoma?)"];
    [_Miscellaneous addObject:m2];
    
    BSStructure *t15 = [[BSStructure alloc] initWithName:@"Inferior Cerebellar Peduncle" andType:BSStructureTypeMiscellaneous];
    [t15 setStructureDescription:@"Integrates proprioception with vestibular functions: it is composed of afferent tracts that bring sensory information to the cerebellum (Posterior Spinocerebellar and Vestibulocerebellar fibers) and efferent tracts that carry signal from cerebellar (purkinje) cells to vestibular nuclei."];

    [_Miscellaneous addObject:t15];
    
    BSStructure *n11 = [[BSStructure alloc] initWithName:@"Inferior Colliculus" andType:BSStructureTypeMiscellaneous];
    [_Miscellaneous addObject:n11];
    
    BSStructure *m3 = [[BSStructure alloc] initWithName:@"Internal Arcuate Fibers" andType:BSStructureTypeMiscellaneous];
    [m3 setStructureDescription:@"The Internal Arcuate fibers mark the decussation of PC-ML within the caudal medulla. Once crossed they will form the Medial Lemniscus."];
    [_Miscellaneous addObject:m3];
    
    // TODO: FIX PATHS
    BSStructure *t18 = [[BSStructure alloc] initWithName:@"Middle Cerebellar Peduncle" andType:BSStructureTypeMiscellaneous];
    [t18 setStructureDescription:@"Contains axons that project into and out of the cerebellum."];
    [_Miscellaneous addObject:t18];
    
    // TODO : Misc section
    BSStructure *t26 = [[BSStructure alloc] initWithName:@"Pyramidal Decussation" andType:BSStructureTypeMiscellaneous];
    [t26 setStructureDescription:@"Here, the descending corticospinal fibers decussate."];
    [_Miscellaneous addObject:t26];
    
    BSStructure *n36 = [[BSStructure alloc] initWithName:@"Superior Colliculus" andType:BSStructureTypeMiscellaneous];
    [n36 setStructureDescription:@"Cell bodies composed of :1.superficial layers that receive visual stimulus and 2.deep layers that direct eye movements towards the stimuli.Saccades"];
    [_Miscellaneous addObject:n36];
    
    BSStructure *n37 = [[BSStructure alloc] initWithName:@"Superior Cerebellar Peduncle" andType:BSStructureTypeMiscellaneous];
    [_Miscellaneous addObject:n37];
}

-(void) addCranialNerves{
    
    BSStructure *cn3 = [[BSStructure alloc]initWithName:@"CN III (Oculomotor)" andType:BSStructureTypeCranialNerve];
    [_CranialNerves addObject:cn3];
    
    BSStructure *n27 = [[BSStructure alloc]initWithName:@"Oculomotor Nucleus" andType:BSStructureTypeNucleus];
    [n27 setStructureDescription:@"(GSE) Cell Bodies whose axons innervate  4 of the 6 intrinsic muscles of the eye (Superior Rectus, Medial Rectus, Inferior Rectus, Inerior Oblique) and regulates blinking by innervating the Levator palpebrae Superioris m."];
    n27.structureName = @"- Oculomotor Nucleus";
    [_CranialNerves addObject:n27];
    
    BSStructure *n8 = [[BSStructure alloc] initWithName:@"Edinger-Westphal Nucleus" andType:BSStructureTypeNucleus];
    [n8 setStructureDescription:@"(GVE) Cell bodies whose preganglionic parasympathetic axons project to the cilliary ganglion of the eye. Functions include pupillary constriction (Sphincter Pupillae) acommodation (Cilliary muscles of the lens), and convergence."];
    n8.structureName = @"- Edinger-Westphal Nucleus";
    [_CranialNerves addObject:n8];
    
    //////////////////////////////////
    
    BSStructure *cn4 = [[BSStructure alloc]initWithName:@"CN IV (Trochlear)" andType:BSStructureTypeCranialNerve];
    [cn4 setStructureDescription:@"Axons that innervate the  Superior Oblique m., (an intrinsic muscle of the eye)"];
    [_CranialNerves addObject:cn4];
    
    
    BSStructure *n36 = [[BSStructure alloc] initWithName:@"Trochlear Nucleus" andType:BSStructureTypeNucleus];
    n36.structureName = @"- Trochlear Nucleus";
    [_CranialNerves addObject:n36];
    
    
    
    ///////////////////////////////////
    
    BSStructure *cn5 = [[BSStructure alloc]initWithName:@"CN V (Trigeminal)" andType:BSStructureTypeCranialNerve];
    [_CranialNerves addObject:cn5];
    
    BSStructure *cn55 = [[BSStructure alloc] initWithName:@"Trigeminal Motor Nucleus" andType:BSStructureTypeNucleus];
    cn55.structureName = @"- Trigeminal Motor Nucleus";
    [_CranialNerves addObject:cn55];
    
    BSStructure *nn27 = [[BSStructure alloc]initWithName:@"Principal Nucleus" andType:BSStructureTypeNucleus];

    nn27.structureName = @"- Principal Nucleus";
    [_CranialNerves addObject:nn27];
    
    
    BSStructure *n35 = [[BSStructure alloc] initWithName:@"Spinal Trigeminal Nucleus" andType:BSStructureTypeNucleus];
    n35.structureName = @"- Spinal Trigeminal Nucleus";
    [_CranialNerves addObject:n35];
    
    
    BSStructure *t21 = [[BSStructure alloc] initWithName:@"Mesencephalic Nucleus" andType:BSStructureTypeNucleus];
    [t21 setStructureDescription:@"Pseudounipolar cells that carry proprioception sensation from the jaw directly to the  trigeminal motor nuclei. Afferent component of the Jaw Jerk ReflexLoss of Jaw Jerk Reflex (dysfunction of afferent component)"];
    t21.structureName = @"- Mesencephalic Nucleus";
    [_CranialNerves addObject:t21];
    
    ////////////////////////////////////
    
    BSStructure *cn6 = [[BSStructure alloc]initWithName:@"CN VI (Abducens)" andType:BSStructureTypeCranialNerve];
    [_CranialNerves addObject:cn6];
    
    BSStructure *n0 = [[BSStructure alloc] initWithName:@"Abducens Nucleus" andType:BSStructureTypeNucleus];
    [n0 setStructureDescription:@"Cell bodies whose axons innervate the  lateral rectus (intrinsic eye muscle)."];
    n0.structureName = @"- Abducens Nucleus";
    [_CranialNerves addObject:n0];
    
    
    //////////////////////////////////////
    
    BSStructure *cn7 = [[BSStructure alloc]initWithName:@"CN VII (Facial)" andType:BSStructureTypeCranialNerve];
    [cn7 setStructureDescription:@"Axons that carry efferent motor signals to ALL muscles of  facial expression"];
    [_CranialNerves addObject:cn7];
    
    
    BSStructure *n7 = [[BSStructure alloc] initWithName:@"Facial Motor Nucleus" andType:BSStructureTypeNucleus];
    [n7 setStructureDescription:@"Cell bodies whose axons generate motor signals to animate facial muscles."];
    n7.structureName = @"- Facial Motor Nucleus";
    [_CranialNerves addObject:n7];
    
    BSStructure *n33 = [[BSStructure alloc] initWithName:@"Salivatory Nucleus" andType:BSStructureTypeNucleus];
    [n33 setStructureDescription:@"(GVE) Parasympathetic preganglionic cell bodies whose axons synapse on the otic ganglia whose axons will stimulate secretion of saliva by the parotid gland."];
    n33.structureName = @"- Salivatory Nucleus";
    [_CranialNerves addObject:n33];
    
    BSStructure *n34 = [[BSStructure alloc] initWithName:@"Solitary Nucleus and Tract" andType:BSStructureTypeNucleus];
    [n34 setStructureDescription:@"Cell bodies that receive taste sensation (Via CN VII and IX), and visceral sensation from Heart, Lungs, GI and Liver (via CN IX and CN X) -- Noteworthy: signal from chemoreceptors of Carotid Bodies associate with CN IX, whereas, signals picked up by Aortic Body chemoreceptors use CN X to reach the brainstem. Send projections to Hypothalamus (paraventricular nuclei) and Amygdala (central Nuclei). Axons centered within the Solitary nucleus; it carries both afferent and efferent fibers"];
    n34.structureName = @"- Solitary Nucleus and Tract";
    [_CranialNerves addObject:n34];
    
    //////////////////////////////////
    
    BSStructure *cn8 = [[BSStructure alloc]initWithName:@"CN VIII (Vestibulocochlear)" andType:BSStructureTypeCranialNerve];
    [_CranialNerves addObject:cn8];
    
    
    BSStructure *n12 = [[BSStructure alloc] initWithName:@"Inferior Vestibular Nucleus" andType:BSStructureTypeNucleus];
    [n12 setStructureDescription:@"Cell bodies that receive information from the semicircular canals, utricle, saccule, and vermis of cerebellum. Responsible for integrating vestibular inputs.  Axons descend to brainstem as the vestibuloreticular tracts and to the spinal cord as the vestibulospinal tracts."];
    n12.structureName = @"- Inferior Vestibular Nucleus";
    [_CranialNerves addObject:n12];
    
    BSStructure *n18 = [[BSStructure alloc] initWithName:@"Medial Vestibular Nucleus" andType:BSStructureTypeNucleus];
    [n18 setStructureDescription:@"Cell bodies that receive information from the semicircular canals and project to the cervical spinal cord to innervate neck muscles to stabilize the head in space, axons are also part of the vestibulo-occular reflex (VOR)."];
    n18.structureName = @"- Medial Vestibular Nucleus";
    [_CranialNerves addObject:n18];
    
    
    BSStructure *n15 = [[BSStructure alloc] initWithName:@"Lateral Vestibular Nucleus" andType:BSStructureTypeNucleus];
    n15.structureName = @"- Lateral Vestibular Nucleus";
    [_CranialNerves addObject:n15];
    
    
    BSStructure *n3 = [[BSStructure alloc] initWithName:@"Anterior Cochlear Nucleus" andType:BSStructureTypeNucleus];
    [n3 setStructureDescription:@"Cell bodies that consists of anteroventral and posterovental cochlear nuclei. Receives input from the cochlea (through the Auditory Nerve). The axonsof the ventral cochlear nucleus project as  the ventral acoustic striae , through trapezoid body to contralateral superior olivary complex."];
    n3.structureName = @"- Anterior Cochlear Nucleus";
    [_CranialNerves addObject:n3];
    
    BSStructure *n29 = [[BSStructure alloc] initWithName:@"Posterior Cochlear Nucleus" andType:BSStructureTypeNucleus];
    [n29 setStructureDescription:@"Cell bodies that receive signals from the cochlea, through the 'Auditory Nerve'. The axons project as the Intermediate Acoustic Striae which joins the ascending fibers in the contralateral lateral lemniscus (traveling to Inferior Colliculus)"];
    n29.structureName = @"- Posterior Cochlear Nucleus";
    [_CranialNerves addObject:n29];
    
    
    /////////////////////////////////////
    
    BSStructure *cn9 = [[BSStructure alloc]initWithName:@"CN IX (Glossopharyngeal)" andType:BSStructureTypeCranialNerve];
    [_CranialNerves addObject:cn9];
    
    BSStructure *cn10 = [[BSStructure alloc]initWithName:@"CN X (Vagus)" andType:BSStructureTypeCranialNerve];
    [_CranialNerves addObject:cn10];
    
    BSStructure *cn11 = [[BSStructure alloc]initWithName:@"CN XI (Accessory)" andType:BSStructureTypeCranialNerve];
    [_CranialNerves addObject:cn11];
    
    BSStructure *cn12 = [[BSStructure alloc]initWithName:@"CN XII (Hypoglossal)" andType:BSStructureTypeCranialNerve];
    [_CranialNerves addObject:cn12];
    
}

-(UIColor *) getColor{
    UIColor *color;
    color = [UIColor colorWithRed:210/255 green:200/255 blue:124/255 alpha:.55];
    return color;
}

@end
