//
//  BSQuestionGenerator.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 3/31/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSQuestionGenerator.h"

@implementation BSQuestionGenerator{
    int currentQuestionIndex;
}
- (id)init
{
    self = [super init];
    if (self) {
        _questions = [NSMutableArray new];
        
        /*
         Generated using this python script
         
         from os import listdir
         
         def generateCodeFor(files, folder_name):
            for f in files:
                print("[self addQuestionWithAnswer:@\"" + answerFromFileName(f) +"\" imageName:@\"" + f + "\" andBackgroundImageName:@\"quiz-background-" + folder_name + ".png\"];")
         
         
         def answerFromFileName(file_name):
            file_name = file_name.replace(".png", "")
            file_name = file_name.replace("-", " ")
            return file_name.title()
         
         
         path_to_quiz_folder = "/Users/Cam/Desktop/QUIZ"
         folders_to_use = ['0', '1', '2', '3', '4', '5', '6', '7', '8', 'perfusion', 'side']
         
         for folder_name in folders_to_use:
            generateCodeFor(listdir(path_to_quiz_folder + "/" + folder_name), folder_name)
         
         */
        
        [self addQuestionWithAnswer:@"Anterior Corticospinal Tract" imageName:@"anterior-corticospinal-tract.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"Background" imageName:@"background.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"Cnxi Accessory Nucleus" imageName:@"CNXI-accessory-nucleus.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"Cuneate Nucleus" imageName:@"cuneate-nucleus.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"Gracile Nucleus" imageName:@"gracile-nucleus.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"Ipsilateral Loss Of Pain And Temperature Of Face" imageName:@"ipsilateral-loss-of-pain-and-temperature-of face.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"Proprioception In Ipsilateral Arm" imageName:@"proprioception-in-ipsilateral-arm.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"Pyramidal Decussation" imageName:@"pyramidal-decussation.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"Quadriplegia" imageName:@"quadriplegia.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"Spinal Trigeminal Nucleus" imageName:@"spinal-trigeminal-nucleus.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"Spinal Trigeminal Tract" imageName:@"spinal-trigeminal-tract.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"Spinocerebellar Tracts" imageName:@"spinocerebellar-tracts.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"Als" imageName:@"als.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"Contralateral Hemiplegia" imageName:@"contralateral-hemiplegia.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"Cuneate Fasciculus" imageName:@"cuneate-fasciculus.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"Gracile Fasciculus" imageName:@"gracile-fasciculus.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"Gracile Nucleus" imageName:@"gracile-nucleus.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"Hypoglossal Nuclei" imageName:@"hypoglossal-nuclei.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"Internal Arcuate Fibers" imageName:@"internal-arcuate-fibers.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"Lower Medulla Background" imageName:@"lower-medulla-background.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"Lower Medulla" imageName:@"lower-medulla.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"Medial Lemniscus" imageName:@"medial-lemniscus.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"Nucleus Ambiguus" imageName:@"nucleus-ambiguus.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"Proprioception Vibration Fine Touch" imageName:@"Proprioception-vibration-fine-touch.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"Solitary Nucleus" imageName:@"solitary-nucleus.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"Spinal Trigeminal Nucleus" imageName:@"spinal-trigeminal-nucleus.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"Als" imageName:@"als.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Anterior Spinocerebellar Tract" imageName:@"anterior-spinocerebellar-tract.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Clinical Medial Medullary" imageName:@"clinical-medial-medullary.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Clinical Wallenberg'S" imageName:@"clinical-wallenberg's.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Corticospinal Tract" imageName:@"corticospinal-tract.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Hypoglossal Nucleus" imageName:@"hypoglossal-nucleus.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Inferior Cerebellar Peduncle" imageName:@"inferior-cerebellar-peduncle.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Inferior Olivary Nucleus" imageName:@"inferior-olivary-nucleus.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Inferior Vestibular Nucleus" imageName:@"inferior-vestibular-nucleus.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Medial Lemniscus" imageName:@"medial-lemniscus.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Medial Vestibular Nucleus" imageName:@"medial-vestibular-nucleus.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Mlf" imageName:@"mlf.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Motor Nucleus Of Vagus" imageName:@"motor-nucleus-of-vagus.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Nucleus Ambiguus" imageName:@"nucleus-ambiguus.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Rostral Medulla Background" imageName:@"rostral-medulla-background.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Solitary Tract" imageName:@"solitary-tract.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Spinal Trigeminal Nucleus" imageName:@"spinal-trigeminal-nucleus.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Spinal Trigeminal Tract" imageName:@"spinal-trigeminal-tract.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"Als" imageName:@"als.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"Anterior Cochlear Nucleus" imageName:@"anterior-cochlear-nucleus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"Central Tegmental Tract" imageName:@"central-tegmental-tract.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"Corticospinal Tract" imageName:@"corticospinal-tract.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"Inferior Cerebellar Peduncle" imageName:@"inferior-cerebellar-peduncle.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"Lateral Vestibular Nucleus" imageName:@"lateral-vestibular-nucleus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"Medial Lemniscus" imageName:@"medial-lemniscus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"Medial Vestibular Nucleus" imageName:@"medial-vestibular-nucleus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"Mlf" imageName:@"mlf.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"Nucleus Raphe Magnus" imageName:@"nucleus-raphe-magnus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"Nucleus Raphe Palidus" imageName:@"nucleus-raphe-palidus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"Ponto Medullary Background" imageName:@"ponto-medullary-background.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"Posterior Cochlear Nucleus" imageName:@"posterior-cochlear-nucleus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"Solitary Nucleus" imageName:@"solitary-nucleus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"Spinal Trigeminal Nucleus" imageName:@"spinal-trigeminal-nucleus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"Spinal Trigeminal Tract" imageName:@"spinal-trigeminal-tract.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"Abducens Nucleus" imageName:@"abducens-nucleus.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"All" imageName:@"all.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Als" imageName:@"als.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Caudal Pons Background" imageName:@"caudal-pons-background.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Central Tegmental Tract" imageName:@"central-tegmental-tract.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Cnvii Facial Nerve" imageName:@"cnvii-facial-nerve.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Corticospinal Tract" imageName:@"corticospinal-tract.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Facial Motor Nucleus" imageName:@"facial-motor-nucleus.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Fourth Ventricle" imageName:@"fourth-ventricle.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Lateral Rectus And Stapedius" imageName:@"lateral-rectus-and-stapedius.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Medial Lemniscus" imageName:@"medial-lemniscus.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Medial Vestibular Nucleus" imageName:@"medial-vestibular-nucleus.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Middle Cerebellar Peduncle" imageName:@"middle-cerebellar-peduncle.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Mlf" imageName:@"mlf.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Nucleus Raphe Magnus" imageName:@"nucleus-raphe-magnus.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Pontine Tracts" imageName:@"pontine-tracts.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Posterior Longitudinal Fasciculus" imageName:@"posterior-longitudinal-fasciculus.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Spinal Trigeminal Nucleus" imageName:@"spinal-trigeminal-nucleus.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Superior Vestibular Nucleus" imageName:@"superior-vestibular-nucleus.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Ventral Pontine" imageName:@"ventral-pontine.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"Als" imageName:@"als.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"Central Tegmental Tract" imageName:@"central-tegmental-tract.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"Locked In" imageName:@"locked-in.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"Locus Ceruleus" imageName:@"locus-ceruleus.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"Medial Lemniscus" imageName:@"medial-lemniscus.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"Mesencephalic Nucleus And Tract" imageName:@"mesencephalic-nucleus-and-tract.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"Mid Pons Background" imageName:@"mid-pons-background.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"Mid Pons" imageName:@"mid-pons.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"Middle Cerebellar Peduncle" imageName:@"middle-cerebellar-peduncle.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"Mlf" imageName:@"mlf.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"Nucleus Raphe Pontis" imageName:@"nucleus-raphe-pontis.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"Pontine Nuclei" imageName:@"pontine-nuclei.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"Trigeminal Sensory And Motor Nuclei" imageName:@"trigeminal-sensory-and-motor-nuclei.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"Als" imageName:@"als.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"Aqueductal Grey" imageName:@"aqueductal-grey.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"Central Tegmental Tract" imageName:@"central-tegmental-tract.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"Cerebral Aqueduct" imageName:@"cerebral-aqueduct.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"Lateral Lemniscus" imageName:@"lateral-lemniscus.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"Medial Lemniscus" imageName:@"medial-lemniscus.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"Mesencephalic Nucleus" imageName:@"mesencephalic-nucleus.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"Middle Cerebellar Peduncle" imageName:@"middle-cerebellar-peduncle.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"Mlf" imageName:@"mlf.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"Nucleus Centralis Superior" imageName:@"nucleus-centralis-superior.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"Rostral Pons Background" imageName:@"rostral-pons-background.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"Rostral Pons" imageName:@"rostral-pons.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"Superior Cerebellar Peduncle" imageName:@"superior-cerebellar-peduncle.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"Als" imageName:@"als.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"Caudal Midbrain Background" imageName:@"caudal-midbrain-background.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"Caudal Midbrain" imageName:@"caudal-midbrain.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"Central Tegmental Tract" imageName:@"central-tegmental-tract.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"Cerebral Aqueduct" imageName:@"cerebral-aqueduct.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"Cerebral Peduncle" imageName:@"cerebral-peduncle.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"Corticobulbar Tract" imageName:@"corticobulbar-tract.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"Corticospinal Tract" imageName:@"corticospinal-tract.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"Inferior Colliculus" imageName:@"inferior-colliculus.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"Lateral Lemniscus" imageName:@"lateral-lemniscus.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"Medial Lemniscus" imageName:@"medial-lemniscus.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"Mlf" imageName:@"mlf.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"Periaqueductal Grey" imageName:@"periaqueductal-grey.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"Superior Cerebellar Peduncle" imageName:@"superior-cerebellar-peduncle.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"Trochlear Nucleus" imageName:@"trochlear-nucleus.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"Ventral Trigeminothalamic Tract" imageName:@"ventral-trigeminothalamic-tract.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"Als" imageName:@"als.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Benedikt'S" imageName:@"benedikt's.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Central Tegmental Tract" imageName:@"central-tegmental-tract.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Cerebellothalamic Tracts" imageName:@"cerebellothalamic-tracts.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Cerebral Aqueduct" imageName:@"cerebral-aqueduct.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Claude'S" imageName:@"claude's.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Corticobulbar Tracts" imageName:@"corticobulbar-tracts.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Corticospinal Tract" imageName:@"corticospinal-tract.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Crus Cerebri" imageName:@"crus-cerebri.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"False" imageName:@"false.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Homonomous Hemianopia" imageName:@"homonomous-hemianopia.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Medial Geniculate Nucleus" imageName:@"medial-geniculate-nucleus.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Medial Lemniscus" imageName:@"medial-lemniscus.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Mesencephalic Nucleus" imageName:@"mesencephalic-nucleus.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Midbrain Background" imageName:@"midbrain-background.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Midbrain" imageName:@"midbrain.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Mlf" imageName:@"mlf.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Obstructive Hydrocephalus" imageName:@"obstructive-hydrocephalus.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Oculomotor Nucleus" imageName:@"oculomotor-nucleus.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Optic Tract" imageName:@"optic-tract.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Paralysis Of Upgaze" imageName:@"paralysis-of-upgaze.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Parkinson'S Disease" imageName:@"parkinson's-disease.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Periaqueductal Grey" imageName:@"periaqueductal-grey.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Red Nucleus" imageName:@"red-nucleus.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Superior Colliculus" imageName:@"superior-colliculus.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Weber'S" imageName:@"weber's.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"Aica" imageName:@"aica.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"Anterior Spinal Artery" imageName:@"anterior-spinal-artery.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"Basilar" imageName:@"basilar.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"Long Circumfrentials" imageName:@"long-circumfrentials.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"Perfusion Copy 2" imageName:@"perfusion copy 2.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"Photo Apr 06, 5 38 15 Pm" imageName:@"Photo Apr 06, 5 38 15 PM.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"Pica" imageName:@"pica.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"Posterior Cerebral" imageName:@"posterior-cerebral.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"Posterior Communicating Artery" imageName:@"posterior-communicating-artery.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"Short Circumfrentials" imageName:@"short-circumfrentials.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"Superior Cerebellar" imageName:@"superior-cerebellar.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"Vertebral Artery" imageName:@"vertebral-artery.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"Accessory Nerve Roots" imageName:@"accessory-nerve-roots.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"Accessory Nucleus" imageName:@"accessory-nucleus.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"Hypoglossal Nerve Roots" imageName:@"hypoglossal-nerve-roots.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"Mesencephalic Nucleus" imageName:@"mesencephalic-nucleus.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"Oculomotor Nerve" imageName:@"oculomotor-nerve.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"Om And Ew Nuclei" imageName:@"om-and-ew-nuclei.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"Principal Sensory" imageName:@"principal sensory.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"S And I Colliculi" imageName:@"s-and-i-colliculi.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"Side View Copy 3" imageName:@"side-view copy 3.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"Side View Copy 4" imageName:@"side-view copy 4.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"Side View Copy 5" imageName:@"side-view copy 5.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"Side View Background" imageName:@"side-view-background.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"Side View" imageName:@"side-view.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"Spinal Trigeminal Nucleus And Tract" imageName:@"spinal-trigeminal-nucleus-and-tract.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"Trigeminal Nerve" imageName:@"trigeminal-nerve.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"Trochlear Nerve" imageName:@"trochlear-nerve.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"Vagus Nerve Roots" imageName:@"vagus-nerve-roots.png" andBackgroundImageName:@"quiz-background-side.png"];
        
    }
    return self;
}


-(void) addQuestionWithAnswer:(NSString *) answer imageName:(NSString *) image andBackgroundImageName:(NSString *) background {
   [_questions addObject:@{@"answer": answer, @"background" : background, @"image" : image}];
}



-(NSDictionary *)getNextQuestion{
    currentQuestionIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentQuestionIndex"];
    currentQuestionIndex++;
    [[NSUserDefaults standardUserDefaults] setInteger:currentQuestionIndex forKey:@"currentQuestionIndex"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return _questions[currentQuestionIndex % _questions.count];
}

@end
