//
//  BSStructureGenerator.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 10/7/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSStructureGenerator.h"
#import "BSStructure.h"

@implementation BSStructureGenerator
{
    NSOperationQueue *operationQueue;
}

- (id)init{
    self = [super init];
    if (self) {
        
        operationQueue = [[NSOperationQueue alloc] init];
        [operationQueue setMaxConcurrentOperationCount:NSOperationQueueDefaultMaxConcurrentOperationCount];
        
        self.Nuclei          = [NSMutableArray new];
        self.Tracts          = [NSMutableArray new];
        self.Arteries        = [NSMutableArray new];
        self.Miscellaneous   = [NSMutableArray new];
        self.CranialNerves   = [NSMutableArray new];
        
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

-(void)addNuclei
{
    
    BSStructure *n0 = [[BSStructure alloc] initWithName:@"Abducens Nucleus" andType:BSStructureTypeNucleus];
    [n0 setStructureDescription:@"Controls Lateral Rectus muscle --an intrinsic muscle of the eye that pulls the eye laterally. An isolated lesion of this nucleus causes Lateral Rectus Palsy. A lack of muscle tone in the temporal aspect results in a nasal deviation of the orbit --affected eye rests in a more medial position."];
    [self.Nuclei addObject:n0];
    
    
    BSStructure *n1 = [[BSStructure alloc] initWithName:@"Accessory Cuneate Nucleus" andType:BSStructureTypeNucleus];
    [n1 setStructureDescription:@"Located lateral to the cuneate nucleus in the medulla, it receives sensation from the upper extremities and trunk and forwards it to the cerebellum (via cuneocerebellar tracts).  Large diameter fibers from the cuneate fasiculus synapse at this point and project ipsilaterally through the inferior cerebellar peduncle to the cerebellum, forming the cuneatocerebellar tract. "];
    [self.Nuclei addObject:n1];
    
    //TODO : Description
    BSStructure *n2 = [[BSStructure alloc] initWithName:@"Accessory Nucleus" andType:BSStructureTypeNucleus];
    [self.Nuclei addObject:n2];
    
    
    BSStructure *n3 = [[BSStructure alloc] initWithName:@"Anterior Cochlear Nucleus" andType:BSStructureTypeNucleus];
    [n3 setStructureDescription:@"Cell bodies that consists of anteroventral and posterovental cochlear nuclei. Receives input from the cochlea (through the Auditory Nerve). The axonsof the ventral cochlear nucleus project as  the ventral acoustic striae , through trapezoid body to contralateral superior olivary complex."];
    [self.Nuclei addObject:n3];
    
    
    BSStructure *n5 = [[BSStructure alloc] initWithName:@"Cuneate Nucleus" andType:BSStructureTypeNucleus];
    [n5 setStructureDescription:@"Second order cell bodies of the PC-ML pathway; the cuneate fasciculus synapses onto --> cuneate n. --> projects its axons across, through the arcuate fibers, to the contralateral medial lemniscus"];
    [self.Nuclei addObject:n5];
    
    
    BSStructure *n6 = [[BSStructure alloc] initWithName:@"Dorsal Motor Nucleus of Vagus" andType:BSStructureTypeNucleus];
    [n6 setStructureDescription:@"Mediates parasympathetic vagal output to Lungs, Heart, and GI up to the Colic Flexure. "];
    [self.Nuclei addObject:n6];
    
    BSStructure *n7 = [[BSStructure alloc] initWithName:@"Facial Motor Nucleus" andType:BSStructureTypeNucleus];
    [n7 setStructureDescription:@"Cell bodies whose axons generate motor signals to animate facial muscles."];
    [self.Nuclei addObject:n7];
    
    BSStructure *n8 = [[BSStructure alloc] initWithName:@"Edinger-Westphal Nucleus" andType:BSStructureTypeNucleus];
    [n8 setStructureDescription:@"Controls pupillary constriction (Sphincter Pupillae), accommodation (Cilliary muscles of the lens), and convergence. These nn. give rise to the preganglionic parasympathetic fibers that synapse with the cilliary ganglion of the eye. ."];
    [self.Nuclei addObject:n8];
    
    BSStructure *n9 = [[BSStructure alloc] initWithName:@"Gracile Nucleus" andType:BSStructureTypeNucleus];
    [n9 setStructureDescription:@"Second order cell bodies of the PC-ML pathway.  The gracile fasciculus synapses upon the gracile n. whose axons decussate as the Internal Arcuate Fibers and ascends as the contralateral medial lemniscus"];
    [self.Nuclei addObject:n9];
    
    BSStructure *n10 = [[BSStructure alloc] initWithName:@"Hypoglossal Nucleus" andType:BSStructureTypeNucleus];
    [n10 setStructureDescription:@"Cell bodies whose axons innervate all intrinsic and extrinsic muscles of the tongue (EXCEPT palatoglossus)"];
    [self.Nuclei addObject:n10];
    
    BSStructure *n30 = [[BSStructure alloc] initWithName:@"Inferior Olivary Nucleus" andType:BSStructureTypeNucleus];
    [n30 setStructureDescription:@"Involved in learning of specialized motor skills. Think figure skating! It receives sensory feedback from the Spino-olivary tracts, and projects to the cerebellum, via climbing fibers traveling through the Inferior Cerebellar Peduncle."];
    [self.Nuclei addObject:n30];
    
    
    
    BSStructure *n13 = [[BSStructure alloc] initWithName:@"Interpeduncular Nucleus" andType:BSStructureTypeNucleus];
    [n13 setStructureDescription:@"Imposes inhibitory effect on many other brain regions (dampens dopamine effects).  More specifically, receives excitatory input from medial Habenula, the diagonal band, the dorsal tegmentum, Raphe nn., the Central Grey and the Locus Ceruleus. Outputs inhibitory signal to dorsal tegmental structures."];
    [self.Nuclei addObject:n13];
    
    BSStructure *n14 = [[BSStructure alloc] initWithName:@"Lateral Reticular Nucleus" andType:BSStructureTypeNucleus];
    [n14 setStructureDescription:@"Composed of three subnn.  (Parvocellular, Magnocellular, Subtrigeminal) that send signals to the cerebellum. Parvo and Magno receive information mostly from ipsiateral dorsal horn of the spinal cord and project ipsilaterally to cerebellar vermis. The Subtrigeminal receives input mostly from the cortex and projects to the ipsilateral flocconodular lobe. "];
    [self.Nuclei addObject:n14];
    

    
    BSStructure *n21 = [[BSStructure alloc] initWithName:@"Locus Ceruleus" andType:BSStructureTypeNucleus];
    [n21 setStructureDescription:@"Major site for synthesis of Norepinephrin. Receives input from many regions of the brain -- hypothalamus (regulation of autonomic functions), cyngulate gyrus/amygdala (arousal by emotional distress), Raphe nn. , cerebellum, etc -- and, similarly, projects to many different regions -- hypothalamus, cortex, amygdala, cerebellum, thalamus, etc. -- to enable stress response, arousal, neuroplasticity, attention, memory, balance and more. Decreased activity is associated with: Alzheimer’s, Parkinson’s and depression. Increased activity is associated with: anxiety, panic disorder, Opiod withdrawal."];
    [self.Nuclei addObject:n21];
    
    BSStructure *n16 = [[BSStructure alloc] initWithName:@"Medial Geniculate Nucleus" andType:BSStructureTypeNucleus];
    [n6 setStructureDescription:@"A component of the auditory pathway; projects axons to the primary auditory cortex (transverse temporal gyrus/ Heschl's gyrus)."];
    [self.Nuclei addObject:n16];
    
    BSStructure *n17 = [[BSStructure alloc] initWithName:@"Medial Motor Nuclei" andType:BSStructureTypeNucleus];
    [self.Nuclei addObject:n17];
    
    

    
    //TODO: add the tract of this
    BSStructure *t21 = [[BSStructure alloc] initWithName:@"Mesencephalic Nucleus" andType:BSStructureTypeNucleus];
    [t21 setStructureDescription:@"This group of cells carries proprioception sensation from the jaw directly to the motor trigeminal nn. , thus they can be thoguht of as the afferent component of the Jaw Jerk Reflex. Lesion to this structure will result in loss of Jaw Jerk Reflex (dysfunction of afferent component)."];
    [self.Nuclei addObject:t21];
    
    BSStructure *n19 = [[BSStructure alloc] initWithName:@"Nucleus Ambiguus" andType:BSStructureTypeNucleus];
    [n19 setStructureDescription:@"Gives rise to the motor (brachial) fibers of Vagus Nerve that innervate laryngeal and pharyngeal muscles, as well as motor fibers of Glossopharyngeal Nerve (CN IX) that innervate stylopharyngeus "];
    [self.Nuclei addObject:n19];
    
    BSStructure *n20 = [[BSStructure alloc] initWithName:@"Nucleus Centralis Superior" andType:BSStructureTypeNucleus];
    [n20 setStructureDescription:@"Project towards higher brain regions."];
    [self.Nuclei addObject:n20];
    
    BSStructure *n22 = [[BSStructure alloc] initWithName:@"Nucleus Raphe Dorsalis" andType:BSStructureTypeNucleus];
    [n22 setStructureDescription:@"Project towards higher brain regions and release serotonin."];
    [self.Nuclei addObject:n22];
    
    BSStructure *n23 = [[BSStructure alloc] initWithName:@"Nucleus Raphe Magnus" andType:BSStructureTypeNucleus];
    [n23 setStructureDescription:@"Receives input from Periaqueductal Grey, paraventricular nn.  of hypothalamus, and amygdala. It projects within the brainstem and along the spinal chord (dorsal horns) where it releases enkephalin -- endogenous analgesic."];
    
    [self.Nuclei addObject:n23];
    
    BSStructure *n24 = [[BSStructure alloc] initWithName:@"Nucleus Raphe Obscurus" andType:BSStructureTypeNucleus];
    [n24 setStructureDescription:@"Projects to the cerebellum. Experimental abalation of this region suggests functional link to Hypoglossal nerve. Experimental microinjection of 5-HT into this region is followed by increased GI motility."];
    [self.Nuclei addObject:n24];
    
    BSStructure *n25 = [[BSStructure alloc] initWithName:@"Nucleus Raphe Pallidus" andType:BSStructureTypeNucleus];
    [n25 setStructureDescription:@"Receives axons from  the periaquaductal gray, hypothalamic nn. , and amygdala. This n.  is involved in fever activation and tachycardic response to emotional or psychological stress."];
    [self.Nuclei addObject:n25];
    
    BSStructure *n26 = [[BSStructure alloc] initWithName:@"Nucleus Raphe Pontis" andType:BSStructureTypeNucleus];
    [n26 setStructureDescription:@"Cell bodies whose axons project to the cerebellum."];
    [self.Nuclei addObject:n26];
    
    BSStructure *n27 = [[BSStructure alloc]initWithName:@"Oculomotor Nucleus" andType:BSStructureTypeNucleus];
    [n27 setStructureDescription:@"(GSE) Cell Bodies whose axons innervate  4 of the 6 intrinsic muscles of the eye (Superior Rectus, Medial Rectus, Inferior Rectus, Inerior Oblique) and regulates blinking by innervating the Levator palpebrae Superioris m."];
    [self.Nuclei addObject:n27];
    
    
    BSStructure *nn27 = [[BSStructure alloc]initWithName:@"Principal Nucleus" andType:BSStructureTypeNucleus];
    [nn27 setStructureDescription:@"Perceives sensation of light touch on face, and proprioception of jaw muscles. Transfers MOST of this input to contralateral VPM (via ventral trigeminothalamic tract). The sensory information from the oral cavity is sent to ipsilateral VPM via the Dosrsal Trigeminothalamic Tract."];
    [self.Nuclei addObject:nn27];
    
    //TODO: maybe separate these
    BSStructure *n28 = [[BSStructure alloc] initWithName:@"Pontine Nuclei" andType:BSStructureTypeNucleus];
    [n28 setStructureDescription:@"Receive motor signal from ipsilateral motor cortex and send it to contralateral cerebellum (through Middle cerebellar peduncle)"];
    [self.Nuclei addObject:n28];
    
    
    BSStructure *n29 = [[BSStructure alloc] initWithName:@"Posterior Cochlear Nucleus" andType:BSStructureTypeNucleus];
    [n29 setStructureDescription:@"Cell bodies that receive signals from the cochlea, through the 'Auditory Nerve'. The axons project as the Intermediate Acoustic Striae which joins the ascending fibers in the contralateral lateral lemniscus (traveling to Inferior Colliculus)"];
    [self.Nuclei addObject:n29];
    
    BSStructure *n31 = [[BSStructure alloc]initWithName:@"Reticulotegmental Nucleus" andType:BSStructureTypeNucleus];
    [self.Nuclei addObject:n31];
    
    BSStructure *n32 = [[BSStructure alloc]initWithName:@"Red Nucleus" andType:BSStructureTypeNucleus];
    [n32 setStructureDescription:@"Neurons of this center project to  the cerebellum (as the inferior olivary complex) and the spinal cord (as the rubrospinal tracts). They are associated with minor motor functions -- arm flexion during gait and in infant crawling. Palatal myoclonus ."];
    [self.Nuclei addObject:n32];
    
    BSStructure *n33 = [[BSStructure alloc] initWithName:@"Salivatory Nucleus" andType:BSStructureTypeNucleus];
    [n33 setStructureDescription:@"(GVE) Parasympathetic preganglionic cell bodies whose axons synapse on the otic ganglia whose axons will stimulate secretion of saliva by the parotid gland."];
    [self.Nuclei addObject:n33];
    
    //TODO : Put in both nucleus and tracts
    BSStructure *n34 = [[BSStructure alloc] initWithName:@"Solitary Nucleus and Tract" andType:BSStructureTypeNucleus];
    [n34 setStructureDescription:@"The Solitary n.  receives many types of visceral sensory information -- Gustatory information: via CN VII and CN IX; Heart, Lungs and GI visceral sensation: via CN IX and CN X; Carotid Body chemoreceptors: via CN IX; Aortic Body chemoreceptors: via CN X -- The solitary nuclei receive and forward the signals to the paraventricular nuclei of Hypothalamus and Central nuclei of Amygdala."];
    [self.Nuclei addObject:n34];
    
    
    BSStructure *n35 = [[BSStructure alloc] initWithName:@"Spinal Trigeminal Nucleus" andType:BSStructureTypeNucleus];
    [self.Nuclei addObject:n35];
    
    BSStructure *cn5 = [[BSStructure alloc] initWithName:@"Trigeminal Motor Nucleus" andType:BSStructureTypeNucleus];
    [self.Nuclei addObject:cn5];
    
    BSStructure *n36 = [[BSStructure alloc] initWithName:@"Trochlear Nucleus" andType:BSStructureTypeNucleus];
    [self.Nuclei addObject:n36];
    
    BSStructure *n12 = [[BSStructure alloc] initWithName:@"Inferior Vestibular Nucleus" andType:BSStructureTypeNucleus];
    [n12 setStructureDescription:@"Responsible for integrating vestibular signals. Receives input from the semicircular canals, utricle, saccule, and vermis of cerebellum. Efferent fibers project to the reticular nn, as the vestibuloreticular tract, or travel down through the spinal cord as the vestibulospinal tract."];
    [n12 setStructureName:@"Vestibular Nucleus (Inferior)"];
    [self.Nuclei addObject:n12];
    
    BSStructure *n15 = [[BSStructure alloc] initWithName:@"Lateral Vestibular Nucleus" andType:BSStructureTypeNucleus];
    [n15 setStructureName:@"Vestibular Nucleus (Lateral)"];
    [self.Nuclei addObject:n15];
    
    BSStructure *n18 = [[BSStructure alloc] initWithName:@"Medial Vestibular Nucleus" andType:BSStructureTypeNucleus];
    [n18 setStructureName:@"Vestibular Nucleus (Medial)"];
    [n18 setStructureDescription:@"Receives input from the semicircular canals and projects to the cervical spinal cord to innervate neck muscles to help stabilize the head in space."];
    [self.Nuclei addObject:n18];
    
}

-(void) addTracts{
    
    BSStructure *t1 = [[BSStructure alloc] initWithName:@"Anterior Corticospinal Tract" andType:BSStructureTypeTract];
    [t1 setStructureDescription:@"Part of the medial motor system, is responsible for motor control from primary motor cortex and supplementry motor area.  ACST fibers control cervical and thoracic trunk muscles. While most of the fibers of the corticospinal tract decussate at the medullary pyramidal decussation, forming the LATERAL Corticospinal Tract, The ANTERIOR Corticospinal Tract descends uncrossed until it reaches the spinal cord level of innervation."];
    [self.Tracts addObject:t1];
    
    
    //TODO: missing section 5 data?
    BSStructure *t2 = [[BSStructure alloc] initWithName:@"Anterior Spinocerebellar Tract" andType:BSStructureTypeTract];
    [self.Tracts addObject:t2];
    
    
    BSStructure *ttt = [[BSStructure alloc] initWithName:@"Anterolateral System" andType:BSStructureTypeTract];
    [ttt setStructureDescription:@"Composed of secondary sensory neurons Involved in pain, temperature and crude touch sensory experience. This system is composed of three parts: (1) Spinothalamic tracts helps localize a stimulus by relaying information to thalamic VPL nucleus, (2) Spinotectal tracts mediate arousal in response to a stimulus (3) Spinoreticular tracts are involved in movement of the eyes towards a stimulus. (ALS fibers decussated at spinal level via anterior commissure). Lesion manifests as loss of Pain and Temperature sensation on the contralateral side of the body. "];
    [self.Tracts addObject:ttt];
    
    
    BSStructure *t4 = [[BSStructure alloc] initWithName:@"Cerebellothalamic Tract" andType:BSStructureTypeTract];
    [t4 setStructureDescription:@"aka Dentatothalamic Tract; Links the cerebellar (Dentate) nn.  to contralateral thalamus (VA/VL). Associated with hereditary dystonia."];
    [self.Tracts addObject:t4];
    
    
    BSStructure *t6 = [[BSStructure alloc] initWithName:@"Central Tegmental Tract" andType:BSStructureTypeTract];
    [t6 setStructureDescription:@"This pathway has two parts to it: 1) The ascending tracts connect Solitary n.  to VPM of thalamus. 2) The descending tracts connect Parvocellular Red n.  to contralateral cerebellum. Damage to this region can manifest as Palatal Myocolonus, as featured in medial superior pontine syndrome."];
    [self.Tracts addObject:t6];
    
    
    BSStructure *t7 = [[BSStructure alloc] initWithName:@"Corticobulbar Tracts" andType:BSStructureTypeTract];
    [t7 setStructureDescription:@"Also known as  corticonuclear tracts; they deliver motor signals from the motor cortex to various CN nuclei. Its fibers pass through the genu of internal capsule and descend through the cerebral peduncle, medial to the coticospinal tract. Nearly all CN nuclei receive input from both hemispheres, with the EXCEPTION of the Motor n. of CNVII: the lower division of the facial nerve nn. (the component that controls the lower face) receives innervation from the contralateral cortex ONLY. A cerebral stroke causes contralateral paralysis of the lower face, but the forehead, receiving additional innervation ipsilaterally, will be spared "];
    [self.Tracts addObject:t7];
    
    
    BSStructure *t8 = [[BSStructure alloc] initWithName:@"Corticospinal Tract" andType:BSStructureTypeTract];
    [t8 setStructureDescription:@"Transmits motor signals generated by the motor cortex (precentral gyrus). Its fibers squeeze through the anterior limb of the internal capsule, down the cerebral penduncle (midbrain), and through ventro-medial pons and medulla. Most of the fibers decussate within the caudal medualla (pyramidal decussation) to form the LATERAL Conticospinal Tract. LCST provides motor innervation to contralateral body. A subgroup of fibers continue ipsilaterally as the Anterior Corticospinal Tract. Unilateral lesion of this tract (within the brainstem) will result in contralateral spastic paresis with UMN signs (increased DTR, increased muscle tone, (+) Babinsky sign)"];
    [self.Tracts addObject:t8];
    
    
    BSStructure *t9 = [[BSStructure alloc] initWithName:@"Cuneate Fasciculus" andType:BSStructureTypeTract];
    [t9 setStructureDescription:@"Carries fine touch,vibratory, and proprioceptive sensory information from the upper body (T6 and above). Synapses with the second order neurons (i.e. Cuneate n. ) at the caudal medulla.  "];
    [self.Tracts addObject:t9];
    
    
    BSStructure *t11 = [[BSStructure alloc] initWithName:@"Dorsal Trigeminothalamic Tract" andType:BSStructureTypeTract];
    [t11 setStructureName:@"Posterior Trigeminothalamic Tract"];
    [self.Tracts addObject:t11];
    
    BSStructure *t13 = [[BSStructure alloc] initWithName:@"Gracile Fasciculus" andType:BSStructureTypeTract];
    [t13 setStructureDescription:@"Axons that carry fine touch, vibratory, and proprioceptive sensory information from the lower body (T7 and below). Synapses with the second order neurons (i.e. Gracile n. ) at the caudal medulla. "];
    
    [self.Tracts addObject:t13];
    
    //    BSStructure *t14 = [[BSStructure alloc] initWithName:@"Hypoglossal Nerve" andType:BSStructureTypeTract];
    //    [t14 setStructureDescription:@"Carries motor signals to all intrinsic and extrinsic muscles of the tongue (EXCEPT palatoglossus). Lesion here causes tongue to deviate ipsilaterally --towards the lesion-- upon protrusion."];
    //    //    [t14 addXMLFilePath:@"Hypoglossal Nerve2" withFillColor:nil];
    //    //    [t14 addXMLFilePath:@"Hypoglossal Nerve3" withFillColor:nil];
    //    [self.Tracts addObject:t14];
    
    BSStructure *t17 = [[BSStructure alloc] initWithName:@"Lateral Lemniscus" andType:BSStructureTypeTract];
    [t17 setStructureDescription:@"Carries auditory signals from the Cochlear Nuc. to various nn.  in the brainstem. Terminates at the Inferior Colliculus."];
    [self.Tracts addObject:t17];
    
    
    BSStructure *t19 = [[BSStructure alloc] initWithName:@"Medial Lemniscus" andType:BSStructureTypeTract];
    [t9 setStructureDescription:@"The fibers of the dorsal columns synapse with their second order neurons at the Gracile and Cuneate nn. . These 2* neurons decussate as the arcuate fibers and continue up as the medial lemniscus."];
    [self.Tracts addObject:t19];
    
    
    BSStructure *t20 = [[BSStructure alloc] initWithName:@"Medial Longitudinal Fasciculus" andType:BSStructureTypeTract];
    [t20 setStructureDescription:@"Arising from the vestibular nn. , these fibers are part of a system that ensures synchronized contraction/relaxation of intrinsic muscles of the eye.  Lesion (e.g. demyelination due to Multiple Sclerosis) will result in Inter-nuclear Opthalmoplegia (nystagmus and diplopia). ."];
    [self.Tracts addObject:t20];
    
    
    //    BSStructure *t23 = [[BSStructure alloc]initWithName:@"Optic Tract" andType:BSStructureTypeTract];
    //    [t23 setStructureDescription:@"Transmits visual information from the retina to the LGN of Thalamus. Lesion of the Optic Nerve (before the optic chiasm) causes Ipsilateral Blindness; Lesioned Chiasm --> Bitemporal Hemianopia; Lesioned Tract (after the chiasm) --> Contralateral Hemianopia."];
    //    [self.Tracts addObject:t23];
    
    
    BSStructure *t24 = [[BSStructure alloc] initWithName:@"Posterior Longitudinal Fasciculus" andType:BSStructureTypeTract];
    [t24 setStructureDescription:@"1) Ascending fibers convey visceral sensation from Solitary n.  to the hypothalamus (posterior and periventricular nn. ). 2) Descending fibers project from the hypothalamus (paraventricular, periventricular, and supraoptic nn. ), through the periaqueductal grey, carrying autonomic signals to various locations (ventral tegmentum, Dorsal Motor n.  of Vagus, Salivatory n. , medullary autonomic centers, and preganglionic neurons located throughout the spinal cord)."];
    [self.Tracts addObject:t24];
    
    
    BSStructure *t25 = [[BSStructure alloc] initWithName:@"Posterior Spinocerebellar Tract" andType:BSStructureTypeTract];
    [self.Tracts addObject:t25];
    
    
    BSStructure *t27 = [[BSStructure alloc] initWithName:@"Reticulospinal Fibers" andType:BSStructureTypeTract];
    [self.Tracts addObject:t27];
    
    BSStructure *t28 = [[BSStructure alloc] initWithName:@"Rubrospinal Tract" andType:BSStructureTypeTract];
    [t28 setStructureDescription:@"Transfers crude and fine motor movements of the upper extremities; mostly associated with muscles of flexion."];
    [self.Tracts addObject:t28];
    
    BSStructure *t29 = [[BSStructure alloc] initWithName:@"Spinal Trigeminal Tract" andType:BSStructureTypeTract];
    [t29 setStructureDescription:@"Carries pain, temperature, and crude touch sensation from ipsilateral face to contralateral VPM of thalamus. "];
    [self.Tracts addObject:t29];
    
    
    BSStructure *t30 = [[BSStructure alloc] initWithName:@"Tectospinal Tract" andType:BSStructureTypeTract];
    [t30 setStructureDescription:@"Coordinates movements of head, neck and eye in response to visual and auditory stimuli. Fibers run from the tectal brainstem to the cervical spinal cord's Rexed Lamina (layers: VI, VII, VIII). ."];
    [self.Tracts addObject:t30];
    
    
    BSStructure *t32 = [[BSStructure alloc] initWithName:@"Ventral Trigeminothalamic Tract" andType:BSStructureTypeTract];
    [t32 setStructureName:@"Anterior Trigeminothalamic Tract"];
    [t32 setStructureDescription:@"Carries ascending pain, temperature, and crude touch sensations from face, head and neck (afferents of CN: V, VII, IX & X). Travels from spinal trigeminal nucleus to the thalamic VPM nucleus.  Also referred to as the anterior trigeminothalamic tract."];
    [self.Tracts addObject:t32];
    
    BSStructure *t33 = [[BSStructure alloc] initWithName:@"Vestibulospinal and Reticulospinal Tract" andType:BSStructureTypeTract];
    [t33 setStructureName:@"Vestibulospinal Tract"];
    [self.Tracts addObject:t33];
}

-(void) addArteries{
    
    BSStructure *a0 = [[BSStructure alloc] initWithName:@"Anterior Inferior Cerebellar" andType:BSStructureTypeArtery];
    [a0 addArteryNamed:@"anterior-inferior-cerebellar" forIndecies:@[@4, @5]];
    [self.Arteries addObject:a0];
    
    BSStructure *a1 = [[BSStructure alloc] initWithName:@"Anterior Spinal" andType:BSStructureTypeArtery];
    [a1 addArteryNamed:@"anterior-spinal" forIndecies:@[@0, @1, @2]];
    [self.Arteries addObject:a1];
    
    BSStructure *a222 = [[BSStructure alloc] initWithName:@"Basilar" andType:BSStructureTypeArtery];
    [a222 addArteryNamed:@"basilar-paramedian" forIndecies:@[@3, @4, @5, @6, @7 ,@8]]; // TODO: change this to an image of all three basilars composited into one image
    [a222 setStructureName:@"Basilar"];
    [self.Arteries addObject:a222];
    
    BSStructure *a2 = [[BSStructure alloc] initWithName:@"- Basilar Paramedian" andType:BSStructureTypeArtery];
    [a2 addArteryNamed:@"basilar-paramedian" forIndecies:@[@3, @4, @5, @6, @7 ,@8]];
    [self.Arteries addObject:a2];
    
    BSStructure *a21 = [[BSStructure alloc] initWithName:@"- Basilar Long Circumferential" andType:BSStructureTypeArtery];
    [a21 addArteryNamed:@"basilar-long" forIndecies:@[@4, @5, @6]];
    [self.Arteries addObject:a21];
    
    
    BSStructure *a22 = [[BSStructure alloc] initWithName:@"- Basilar Short Circumferential" andType:BSStructureTypeArtery];
    [a22 addArteryNamed:@"basilar-short" forIndecies:@[@4, @5, @6]];
    [self.Arteries addObject:a22];
    
    
    BSStructure *a3 = [[BSStructure alloc] initWithName:@"Posterior Cerebral" andType:BSStructureTypeArtery];
    [a3 addArteryNamed:@"posterior-cerebral" forIndecies:@[@7, @8]];
    [self.Arteries addObject:a3];
    
    BSStructure *a4 = [[BSStructure alloc] initWithName:@"Posterior Communicating" andType:BSStructureTypeArtery];
    [self.Arteries addObject:a4];
    
    BSStructure *a5 = [[BSStructure alloc] initWithName:@"Posterior Inferior Cerebellar" andType:BSStructureTypeArtery];
    [a5 addArteryNamed:@"pica" forIndecies:@[@1, @2, @3]];
    [self.Arteries addObject:a5];
    
    BSStructure *aa0 = [[BSStructure alloc] initWithName:@"Posterior Spinal" andType:BSStructureTypeArtery];
    [aa0 addArteryNamed:@"posterior-spinal" forIndecies:@[@0, @1]];
    [self.Arteries addObject:aa0];
    
    BSStructure *a6 = [[BSStructure alloc] initWithName:@"Superior Cerebellar" andType:BSStructureTypeArtery];
    [a6 addArteryNamed:@"superior-cerebeller" forIndecies:@[@5, @6, @7]];
    [self.Arteries addObject:a6];
    
    BSStructure *a7 = [[BSStructure alloc] initWithName:@"Vertebral" andType:BSStructureTypeArtery];
    [a7 addArteryNamed:@"vertebral" forIndecies:@[@0, @1, @2]];
    [self.Arteries addObject:a7];
}

-(void) addMiscelaneus{
    
    BSStructure *t3 = [[BSStructure alloc] initWithName:@"Brachium of Inferior Colliculus" andType:BSStructureTypeMiscellaneous];
    [t3 setStructureDescription:@"Receives and integrates auditory input from cochlear nuclei (through Lateral Lemniscus), the auditory cortex, and the medial MGB of thalamus; Projects to the ventral MGB. Involved in sound lateralization, startle response, and Vestibulo-Ocular Reflex"];
    [self.Miscellaneous addObject:t3];
    
    BSStructure *m0 = [[BSStructure alloc] initWithName:@"Central Canal" andType:BSStructureTypeMiscellaneous];
    [self.Miscellaneous addObject:m0];
    
    //    BSStructure *t5 = [[BSStructure alloc] initWithName:@"Central Grey" andType:BSStructureTypeMiscellaneous];
    //    //    [t5 addXMLFilePath:@"Central Grey1" withFillColor:nil];
    //    //    [t5 addXMLFilePath:@"Central Grey2" withFillColor:nil];
    //    [self.Miscellaneous addObject:t5];
    
    BSStructure *m1 = [[BSStructure alloc] initWithName:@"Cerebral Aqueduct" andType:BSStructureTypeMiscellaneous];
    [m1 setStructureDescription:@"Drains CSF from Third Ventricle into the Fourth Ventricle. Runs between the tectal (dorsal) and tegmental (ventral) part of midbrain. Occlusion of the lumen (for example, by a tumor or stenosis) will result in a non-communicating hydrocephalus."];
    [self.Miscellaneous addObject:m1];
    
    //    BSStructure *t10 = [[BSStructure alloc] initWithName:@"Crus Cerebri" andType:BSStructureTypeMiscellaneous];
    //    [t10 setStructureDescription:@"Anterior region of the Cerebral Peduncle; contains Corticospinal, Corticobulbar, and Corticopontine fibers."];
    //    [t10 addXMLFilePath:@"Crus Cerebri8" withFillColor:nil];
    //    [t10 addXMLFilePath:@"Crus Cerebri9" withFillColor:nil];
    //    [self.Miscellaneous addObject:t10];
    
    BSStructure *m2 = [[BSStructure alloc] initWithName:@"Fourth Ventricle" andType:BSStructureTypeMiscellaneous];
    [m2 setStructureDescription:@"The circulating CSF flows from the third ventricle, down through the Cerebral Aquaduct, and into the Fourth ventricle. The roof of the fourth ventricle is formed by the cerebellum (superior and inferior medullary vela), the floor by the rhomboid fossa, and the side 'walls' formed by the cerebellar peduncles. "];
    [self.Miscellaneous addObject:m2];
    
    BSStructure *t15 = [[BSStructure alloc] initWithName:@"Inferior Cerebellar Peduncle" andType:BSStructureTypeMiscellaneous];
    [t15 setStructureDescription:@"Integrates proprioception with vestibular functions: it is composed of afferent tracts that bring sensory information to the cerebellum (Posterior Spinocerebellar and Vestibulocerebellar fibers) and efferent tracts that carry signals from cerebellar (purkinje) cells to vestibular nn."];
    
    [self.Miscellaneous addObject:t15];
    
    BSStructure *n11 = [[BSStructure alloc] initWithName:@"Inferior Colliculus" andType:BSStructureTypeMiscellaneous];
    [n11 setStructureDescription:@"Receives and integrates auditory input from cochlear nn.  (through Lateral Lemniscus), the auditory cortex, and the medial MGB of thalamus; Projects to the ventral MGB. Involved in sound lateralization, startle response and Vestibulo-Ocular Reflex."];
    [self.Miscellaneous addObject:n11];
    
    
    
    BSStructure *m3 = [[BSStructure alloc] initWithName:@"Internal Arcuate Fibers" andType:BSStructureTypeMiscellaneous];
    [m3 setStructureDescription:@"The Internal Arcuate fibers mark the decussation of PC-ML within the caudal medulla. Once crossed they will form the Medial Lemniscus."];
    [self.Miscellaneous addObject:m3];
    
    // TODO: FIX PATHS
    BSStructure *t18 = [[BSStructure alloc] initWithName:@"Middle Cerebellar Peduncle" andType:BSStructureTypeMiscellaneous];
    [t18 setStructureDescription:@"Contains axons that project into and out of the cerebellum"];
    [self.Miscellaneous addObject:t18];
    
    // TODO : Misc section
    BSStructure *t26 = [[BSStructure alloc] initWithName:@"Pyramidal Decussation" andType:BSStructureTypeMiscellaneous];
    [t26 setStructureDescription:@"Majority of the descending fibers of the Corticospinal Tract decussate through thsi region to form the Lateral Corticospinal Tract. A lesion here would cause quadriplegia. "];
    [self.Miscellaneous addObject:t26];
    
    BSStructure *n36 = [[BSStructure alloc] initWithName:@"Superior Colliculus" andType:BSStructureTypeMiscellaneous];
    [n36 setStructureDescription:@"Composed of two functionally distinct layers. 1. Superficial layers receive visual stimuli and 2. Deep layers direct eye movements towards the stimuli. This structure has a role in various forms of eye movements (e.g. saccades, smooth pursuit, vergence, and fixation)."];
    [self.Miscellaneous addObject:n36];
    
    BSStructure *n37 = [[BSStructure alloc] initWithName:@"Superior Cerebellar Peduncle" andType:BSStructureTypeMiscellaneous];
    [n37 setStructureDescription:@"Houses the tracts that exit cerebellum to reach motor signal from deep cerebellar nn.  to contralateral Red nn.  and Thalamus. These fibers decussate within the midbrain. A cerebellar lesion will cause IPSILATERAL dystaxia. Although the ascending fibers decussate (pre-thalamus), the descending motor signal will cross back again (pyramidal decussation); the motor deficit will therefore be on the same side as the cerebellar lesion. "];
    [self.Miscellaneous addObject:n37];
}

-(void) addCranialNerves{
    
    BSStructure *cn3 = [[BSStructure alloc]initWithName:@"CN III (Oculomotor)" andType:BSStructureTypeCranialNerve];
    [cn3 setStructureDescription:@"Carries motor signal from Oculomotor (GSE) and Edinger Westphal (GVE) nn. towards the orbit. Oculomotor palsy: Ipsilateral eye droops and points down and out."];
    [self.CranialNerves addObject:cn3];
    
    BSStructure *n27 = [[BSStructure alloc]initWithName:@"Oculomotor Nucleus" andType:BSStructureTypeNucleus];
    [n27 setStructureDescription:@"(GSE) Cell Bodies whose axons innervate  4 of the 6 intrinsic muscles of the eye (Superior Rectus, Medial Rectus, Inferior Rectus, Inerior Oblique) and regulates blinking by innervating the Levator palpebrae Superioris m.  Controls 4/6 intrinsic muscles of the eye: (Superior Rectus, Medial Rectus, Inferior Rectus, Inferior Oblique). Opens eyelid via Levator palpebrae Superioris innervation. Damage to this nucleus or the associated nerve will result in Oculomotor palsy -- Ipsilateral eyelid drooping + pupil that points down and out"];
    n27.structureName = @"- Oculomotor Nucleus";
    [self.CranialNerves addObject:n27];
    
    BSStructure *n8 = [[BSStructure alloc] initWithName:@"Edinger-Westphal Nucleus" andType:BSStructureTypeNucleus];
    [n8 setStructureDescription:@"(GVE) Cell bodies whose preganglionic parasympathetic axons project to the cilliary ganglion of the eye. Functions include pupillary constriction (Sphincter Pupillae) acommodation (Cilliary muscles of the lens), and convergence."];
    n8.structureName = @"- Edinger-Westphal Nucleus";
    [self.CranialNerves addObject:n8];
    
    //////////////////////////////////
    
    BSStructure *cn4 = [[BSStructure alloc]initWithName:@"CN IV (Trochlear)" andType:BSStructureTypeCranialNerve];
    [cn4 setStructureDescription:@"Controls Superior Oblique (an intrinsic eye muscle capable of intorsion and depression of the orbit). If damaged, the affected eye will be extorted and unable to look down. Patient will sidebend head to contralateral side to keep the 'good eye' in an intorted state, and therefore in alignment with the fixed extorted eye on opposite side. Patient may report difficulty with tasks that require looking down such as walking down stairs or navigating a cluttered room."];
    [self.CranialNerves addObject:cn4];
    
    
    BSStructure *n36 = [[BSStructure alloc] initWithName:@"Trochlear Nucleus" andType:BSStructureTypeNucleus];
    n36.structureName = @"- Trochlear Nucleus";
    [self.CranialNerves addObject:n36];
    
    
    
    ///////////////////////////////////
    
    BSStructure *cn5 = [[BSStructure alloc]initWithName:@"CN V (Trigeminal)" andType:BSStructureTypeCranialNerve];
    [self.CranialNerves addObject:cn5];
    
    BSStructure *cn55 = [[BSStructure alloc] initWithName:@"Trigeminal Motor Nucleus" andType:BSStructureTypeNucleus];
    cn55.structureName = @"- Trigeminal Motor Nucleus";
    [cn55 setStructureDescription:@" The motor component of  of the trigeminal system controls all muscles arising from the first branchial arch. These include: muscles of mastication (masseter, temporalis, medial and lateral pterygoids), tensor tympany, tensor veli palatini, mylohyoid, and the anterior belly of digastic. The Trigeminal motor n. sends axons out through foramen ovale as the mandibular branch of the trigeminal nerve (V3)."];
    [self.CranialNerves addObject:cn55];
    
    BSStructure *nn27 = [[BSStructure alloc]initWithName:@"Principal Nucleus" andType:BSStructureTypeNucleus];
    
    nn27.structureName = @"- Principal Nucleus";
    [self.CranialNerves addObject:nn27];
    
    
    BSStructure *n35 = [[BSStructure alloc] initWithName:@"Spinal Trigeminal Nucleus" andType:BSStructureTypeNucleus];
    n35.structureName = @"- Spinal Trigeminal Nucleus";
    [self.CranialNerves addObject:n35];
    
    
    BSStructure *t21 = [[BSStructure alloc] initWithName:@"Mesencephalic Nucleus" andType:BSStructureTypeNucleus];
    [t21 setStructureDescription:@"This group of cells carry proprioception sensation from the jaw directly to the motor trigeminal nn. , thus they can be thoguht of as the afferent component of the Jaw Jerk Reflex. Lesion to this structure will result in loss of Jaw Jerk Reflex (dysfunction of afferent component)"];
    t21.structureName = @"- Mesencephalic Nucleus";
    [self.CranialNerves addObject:t21];
    
    ////////////////////////////////////
    
    BSStructure *cn6 = [[BSStructure alloc]initWithName:@"CN VI (Abducens)" andType:BSStructureTypeCranialNerve];
    [self.CranialNerves addObject:cn6];
    
    BSStructure *n0 = [[BSStructure alloc] initWithName:@"Abducens Nucleus" andType:BSStructureTypeNucleus];
    [n0 setStructureDescription:@"Controls the Lateral Rectus muscle, an intrinsic muscle of the eye, that pulls the eye laterally. An isolated lesion of this nerve  is called 'Lateral Rectus Palsy'. The absence of tone in the lateral aspect will leave the eye in mediosuperior position."];
    n0.structureName = @"- Abducens Nucleus";
    [self.CranialNerves addObject:n0];
    
    
    //////////////////////////////////////
    
    BSStructure *cn7 = [[BSStructure alloc]initWithName:@"CN VII (Facial)" andType:BSStructureTypeCranialNerve];
    [cn7 setStructureDescription:@"Somatic component is involved in control of the muscles of facial expression and the stapedius. Parasympathetic component forms the preganglionic fibers of Submandibular/Sublingual salivary glands (synapse at sublingual ganglion) and lacrimal glands (synapse at cilliary ganglion). The sensory aspect of CNVII conveys taste sensation from anterior 2/3 of tongue to the solitary n. . The facial nerve exits the skull though the stylomastoid foramen. The extracranial part of the facial nerve gives rise to several somatic branches: posterior auricular, temporal, zygomatic, buccal, marginal, and cervical branch. "];
    [self.CranialNerves addObject:cn7];
    
    
    BSStructure *n7 = [[BSStructure alloc] initWithName:@"Facial Motor Nucleus" andType:BSStructureTypeNucleus];
    [n7 setStructureDescription:@"Controls movement of facial muscles"];
    n7.structureName = @"- Facial Motor Nucleus";
    [self.CranialNerves addObject:n7];
    
    BSStructure *n33 = [[BSStructure alloc] initWithName:@"Salivatory Nucleus" andType:BSStructureTypeNucleus];
    [n33 setStructureDescription:@"(GVE) Parasympathetic preganglionic cell bodies whose axons synapse on the otic ganglia whose axons will stimulate secretion of saliva by the parotid gland."];
    n33.structureName = @"- Salivatory Nucleus";
    [self.CranialNerves addObject:n33];
    
    BSStructure *n34 = [[BSStructure alloc] initWithName:@"Solitary Nucleus and Tract" andType:BSStructureTypeNucleus];
    [n34 setStructureDescription:@"Cell bodies that receive taste sensation (Via CN VII and IX), and visceral sensation from Heart, Lungs, GI and Liver (via CN IX and CN X) -- Noteworthy: signal from chemoreceptors of Carotid Bodies associate with CN IX, whereas, signals picked up by Aortic Body chemoreceptors use CN X to reach the brainstem. Send projections to Hypothalamus (paraventricular nuclei) and Amygdala (central Nuclei). Axons centered within the Solitary nucleus; it carries both afferent and efferent fibers"];
    n34.structureName = @"- Solitary Nucleus and Tract";
    [self.CranialNerves addObject:n34];
    
    //////////////////////////////////
    
    BSStructure *cn8 = [[BSStructure alloc]initWithName:@"CN VIII (Vestibulocochlear)" andType:BSStructureTypeCranialNerve];
    [self.CranialNerves addObject:cn8];
    
    
    BSStructure *n12 = [[BSStructure alloc] initWithName:@"Inferior Vestibular Nucleus" andType:BSStructureTypeNucleus];
    [n12 setStructureDescription:@"Responsible for integrating vestibular signals. Receives input from the semicircular canals, utricle, saccule, and vermis of cerebellum. Efferent fibers project to the reticular nn, as the vestibuloreticular tract, or travel down through the spinal cord as the vestibulospinal tract."];
    n12.structureName = @"- Inferior Vestibular Nucleus";
    [self.CranialNerves addObject:n12];
    
    BSStructure *n18 = [[BSStructure alloc] initWithName:@"Medial Vestibular Nucleus" andType:BSStructureTypeNucleus];
    [n18 setStructureDescription:@"Receives input from the semicircular canals and projects to the cervical spinal cord to innervate neck muscles to help stabilize the head in space. "];
    n18.structureName = @"- Medial Vestibular Nucleus";
    [self.CranialNerves addObject:n18];
    
    
    BSStructure *n15 = [[BSStructure alloc] initWithName:@"Lateral Vestibular Nucleus" andType:BSStructureTypeNucleus];
    n15.structureName = @"- Lateral Vestibular Nucleus";
    [self.CranialNerves addObject:n15];
    
    
    BSStructure *n3 = [[BSStructure alloc] initWithName:@"Anterior Cochlear Nucleus" andType:BSStructureTypeNucleus];
    [n3 setStructureDescription:@"Can be further divided into anteroventral and posterovental nuclei. These nuclei receive auditory signal from the cochlea, through the Auditory Nerve). The incoming signal reaches the Spiral Ganglion, passes through the ventral acoustic striae, and through Trapezoid Body to reach contarlateral Superior Olivary Complex."];
    n3.structureName = @"- Anterior Cochlear Nucleus";
    [self.CranialNerves addObject:n3];
    
    BSStructure *n29 = [[BSStructure alloc] initWithName:@"Posterior Cochlear Nucleus" andType:BSStructureTypeNucleus];
    [n29 setStructureDescription:@"Cell bodies that receive signals from the cochlea, through the 'Auditory Nerve'. The axons project as the Intermediate Acoustic Striae which joins the ascending fibers in the contralateral lateral lemniscus (traveling to Inferior Colliculus)"];
    n29.structureName = @"- Posterior Cochlear Nucleus";
    [self.CranialNerves addObject:n29];
    
    
    /////////////////////////////////////
    
    BSStructure *cn9 = [[BSStructure alloc]initWithName:@"CN IX (Glossopharyngeal)" andType:BSStructureTypeCranialNerve];
    [self.CranialNerves addObject:cn9];
    
    BSStructure *cn10 = [[BSStructure alloc]initWithName:@"CN X (Vagus)" andType:BSStructureTypeCranialNerve];
    [self.CranialNerves addObject:cn10];
    
    BSStructure *cn11 = [[BSStructure alloc]initWithName:@"CN XI (Accessory)" andType:BSStructureTypeCranialNerve];
    [self.CranialNerves addObject:cn11];
    
    BSStructure *cn12 = [[BSStructure alloc]initWithName:@"CN XII (Hypoglossal)" andType:BSStructureTypeCranialNerve];
    [self.CranialNerves addObject:cn12];
    
}

- (UIColor *)getColor
{
    UIColor *color;
    color = [UIColor colorWithRed:210/255 green:200/255 blue:124/255 alpha:.55];
    return color;
}

@end


