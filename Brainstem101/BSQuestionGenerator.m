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
         from os import listdir
         
         def generateCodeFor(files, folder_name):
         for f in files:
            if "QUIZ BACKGROUND" not in answerFromFileName(f):
                print("[self addQuestionWithAnswer:@\"" + answerFromFileName(f) +"\" imageName:@\"" + f + "\" andBackgroundImageName:@\"quiz-background-" + folder_name + ".png\"];")
         
         
         def answerFromFileName(file_name):
            file_name = file_name.replace(".png", "")
            file_name = file_name.replace("-", " ")
            return file_name.upper()
         
         
         path_to_quiz_folder = "/Users/Cam/Code/Brainstem101/Brainstem101-iOS/Images/Quiz"
         folders_to_use = ['0', '1', '2', '3', '4', '5', '6', '7', '8', 'perfusion', 'side']
         
         for folder_name in folders_to_use:
            generateCodeFor(listdir(path_to_quiz_folder + "/" + folder_name), folder_name)

         
         */
        
        [self addQuestionWithAnswer:@"ACCESSORY NUCLEUS (CNXI)" imageName:@"accessory-nucleus-(CNXI).png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"ANTERIOR CORTICOSPINAL TRACT" imageName:@"anterior-corticospinal-tract.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"CUNEATE NUCLEUS" imageName:@"cuneate-nucleus.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"GRACILE NUCLEUS" imageName:@"gracile-nucleus.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"IPSILATERAL LOSS OF PAIN AND TEMPERATURE OF THE FACE" imageName:@"ipsilateral-loss-of-pain-and-temperature-of-the-face.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"PROPRIOCEPTION FROM IPSILATERAL ARM" imageName:@"proprioception-from-ipsilateral-arm.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"PYRAMIDAL DECUSSATION" imageName:@"pyramidal-decussation.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"QUADRIPLEGIA" imageName:@"quadriplegia.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"SPINAL TRIGEMINAL NUCLEUS" imageName:@"spinal-trigeminal-nucleus.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"SPINAL TRIGEMINAL TRACT" imageName:@"spinal-trigeminal-tract.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"SPINOCEREBELLAR TRACTS" imageName:@"spinocerebellar-tracts.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"ALS" imageName:@"als.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"CONTRALATERAL HEMIPLEGIA" imageName:@"contralateral-hemiplegia.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"CUNEATE FASCICULUS" imageName:@"cuneate-fasciculus.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"GRACILE FASCICULUS" imageName:@"gracile-fasciculus.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"GRACILE NUCLEUS" imageName:@"gracile-nucleus.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"HYPOGLOSSAL NUCLEI (CNXI)" imageName:@"hypoglossal-nuclei-(CNXI).png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"INTERNAL ARCUATE FIBERS" imageName:@"internal-arcuate-fibers.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"MEDIAL LEMNISCUS" imageName:@"medial-lemniscus.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"NUCLEUS AMBIGUUS" imageName:@"nucleus-ambiguus.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"PROPRIOCEPTION VIBRATION & FINE TOUCH" imageName:@"proprioception-vibration-&-fine-touch.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"SOLITARY NUCLEUS" imageName:@"solitary-nucleus.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"SPINAL TRIGEMINAL NUCLEUS" imageName:@"spinal-trigeminal-nucleus.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"ALS" imageName:@"als.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"ANTERIOR SPINOCEREBELLAR TRACT" imageName:@"anterior-spinocerebellar-tract.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"CLINICAL WALLENBERG'S" imageName:@"clinical-wallenberg's.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"CORTICOSPINAL TRACT" imageName:@"corticospinal-tract.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"HYPOGLOSSAL NUCLEUS" imageName:@"hypoglossal-nucleus.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"INFERIOR CEREBELLAR PEDUNCLE" imageName:@"inferior-cerebellar-peduncle.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"INFERIOR OLIVARY NUCLEUS" imageName:@"inferior-olivary-nucleus.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"INFERIOR VESTIBULAR NUCLEUS" imageName:@"inferior-vestibular-nucleus.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"MEDIAL LEMNISCUS" imageName:@"medial-lemniscus.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"MEDIAL MEDULLARY SYNDROME" imageName:@"medial-medullary-syndrome.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"MEDIAL VESTIBULAR NUCLEUS" imageName:@"medial-vestibular-nucleus.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"MLF" imageName:@"mlf.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"MOTOR NUCLEUS OF VAGUS" imageName:@"motor-nucleus-of-vagus.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"NUCLEUS AMBIGUUS" imageName:@"nucleus-ambiguus.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"SOLITARY TRACT" imageName:@"solitary-tract.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"SPINAL TRIGEMINAL NUCLEUS" imageName:@"spinal-trigeminal-nucleus.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"SPINAL TRIGEMINAL TRACT" imageName:@"spinal-trigeminal-tract.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"ALS" imageName:@"als.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"ANTERIOR COCHLEAR NUCLEUS" imageName:@"anterior-cochlear-nucleus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"CENTRAL TEGMENTAL TRACT" imageName:@"central-tegmental-tract.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"CORTICOSPINAL TRACT" imageName:@"corticospinal-tract.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"INFERIOR CEREBELLAR PEDUNCLE" imageName:@"inferior-cerebellar-peduncle.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"LATERAL VESTIBULAR NUCLEUS" imageName:@"lateral-vestibular-nucleus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"MEDIAL LEMNISCUS" imageName:@"medial-lemniscus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"MEDIAL VESTIBULAR NUCLEUS" imageName:@"medial-vestibular-nucleus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"MLF" imageName:@"mlf.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"NUCLEUS RAPHE MAGNUS" imageName:@"nucleus-raphe-magnus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"NUCLEUS RAPHE PALIDUS" imageName:@"nucleus-raphe-palidus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"POSTERIOR COCHLEAR NUCLEUS" imageName:@"posterior-cochlear-nucleus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"SOLITARY NUCLEUS" imageName:@"solitary-nucleus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"SPINAL TRIGEMINAL NUCLEUS" imageName:@"spinal-trigeminal-nucleus.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"SPINAL TRIGEMINAL TRACT" imageName:@"spinal-trigeminal-tract.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"ABDUCENS NUCLEUS" imageName:@"abducens-nucleus.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"ALS" imageName:@"als.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"CENTRAL TEGMENTAL TRACT" imageName:@"central-tegmental-tract.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"CORTICOSPINAL TRACT" imageName:@"corticospinal-tract.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"FACIAL MOTOR NUCLEUS" imageName:@"facial-motor-nucleus.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"FACIAL NERVE (CNVII)" imageName:@"facial-nerve-(CNVII).png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"FOURTH VENTRICLE" imageName:@"fourth-ventricle.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"LATERAL RECTUS & STAPEDIUS" imageName:@"lateral-rectus-&-stapedius.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"MEDIAL LEMNISCUS" imageName:@"medial-lemniscus.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"MEDIAL VESTIBULAR NUCLEUS" imageName:@"medial-vestibular-nucleus.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"MIDDLE CEREBELLAR PEDUNCLE" imageName:@"middle-cerebellar-peduncle.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"MLF" imageName:@"mlf.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"NUCLEUS RAPHE MAGNUS" imageName:@"nucleus-raphe-magnus.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"PONTINE TRACTS" imageName:@"pontine-tracts.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"POSTERIOR LONGITUDINAL FASCICULUS" imageName:@"posterior-longitudinal-fasciculus.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"SPINAL TRIGEMINAL NUCLEUS" imageName:@"spinal-trigeminal-nucleus.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"SUPERIOR VESTIBULAR NUCLEUS" imageName:@"superior-vestibular-nucleus.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"VENTRAL PONTINE SYNDROME" imageName:@"ventral-pontine-syndrome.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"ALS" imageName:@"als.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"CENTRAL TEGMENTAL TRACT" imageName:@"central-tegmental-tract.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"LOCKED IN" imageName:@"locked-in.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"LOCUS CERULEUS" imageName:@"locus-ceruleus.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"MEDIAL LEMNISCUS" imageName:@"medial-lemniscus.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"MESENCEPHALIC NUCLEUS AND TRACT" imageName:@"mesencephalic-nucleus-and-tract.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"MIDDLE CEREBELLAR PEDUNCLE" imageName:@"middle-cerebellar-peduncle.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"MLF" imageName:@"mlf.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"NUCLEUS RAPHE PONTIS" imageName:@"nucleus-raphe-pontis.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"PONTINE NUCLEI" imageName:@"pontine-nuclei.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"PRINCIPAL AND MOTOR NUCLEI OF TRIGEMINAL" imageName:@"principal-and-motor-nuclei-of-trigeminal.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"ALS" imageName:@"als.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"AQUEDUCTAL GREY" imageName:@"aqueductal-grey.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"CENTRAL TEGMENTAL TRACT" imageName:@"central-tegmental-tract.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"CEREBRAL AQUEDUCT" imageName:@"cerebral-aqueduct.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"LATERAL LEMNISCUS" imageName:@"lateral-lemniscus.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"MEDIAL LEMNISCUS" imageName:@"medial-lemniscus.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"MESENCEPHALIC NUCLEUS" imageName:@"mesencephalic-nucleus.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"MIDDLE CEREBELLAR PEDUNCLE" imageName:@"middle-cerebellar-peduncle.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"MLF" imageName:@"mlf.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"NUCLEUS CENTRALIS SUPERIOR" imageName:@"nucleus-centralis-superior.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"SUPERIOR CEREBELLAR PEDUNCLE" imageName:@"superior-cerebellar-peduncle.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"ALS" imageName:@"als.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"CENTRAL TEGMENTAL TRACT" imageName:@"central-tegmental-tract.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"CEREBRAL AQUEDUCT" imageName:@"cerebral-aqueduct.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"CEREBRAL PEDUNCLE" imageName:@"cerebral-peduncle.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"CORTICOBULBAR TRACT" imageName:@"corticobulbar-tract.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"CORTICOSPINAL TRACT" imageName:@"corticospinal-tract.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"INFERIOR COLLICULUS" imageName:@"inferior-colliculus.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"LATERAL LEMNISCUS" imageName:@"lateral-lemniscus.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"MEDIAL LEMNISCUS" imageName:@"medial-lemniscus.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"MLF" imageName:@"mlf.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"PERIAQUEDUCTAL GREY" imageName:@"periaqueductal-grey.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"SUPERIOR CEREBELLAR PEDUNCLE" imageName:@"superior-cerebellar-peduncle.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"TROCHLEAR NUCLEUS" imageName:@"trochlear-nucleus.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"VENTRAL TRIGEMINOTHALAMIC TRACT" imageName:@"ventral-trigeminothalamic-tract.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"ALS" imageName:@"als.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"BENEDIKT'S" imageName:@"benedikt's.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"CENTRAL TEGMENTAL TRACT" imageName:@"central-tegmental-tract.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"CEREBELLOTHALAMIC TRACTS" imageName:@"cerebellothalamic-tracts.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"CEREBRAL AQUEDUCT" imageName:@"cerebral-aqueduct.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"CLAUDE'S" imageName:@"claude's.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"CORTICOBULBAR TRACTS" imageName:@"corticobulbar-tracts.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"CORTICOSPINAL TRACT" imageName:@"corticospinal-tract.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"CRUS CEREBRI" imageName:@"crus-cerebri.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"FALSE" imageName:@"false.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"HOMONOMOUS HEMIANOPIA" imageName:@"homonomous-hemianopia.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"MEDIAL GENICULATE NUCLEUS" imageName:@"medial-geniculate-nucleus.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"MEDIAL LEMNISCUS" imageName:@"medial-lemniscus.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"MESENCEPHALIC NUCLEUS" imageName:@"mesencephalic-nucleus.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"MLF" imageName:@"mlf.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"OBSTRUCTIVE HYDROCEPHALUS" imageName:@"obstructive-hydrocephalus.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"OCULOMOTOR NUCLEUS" imageName:@"oculomotor-nucleus.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"OPTIC TRACT" imageName:@"optic-tract.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"PARALYSIS OF UPGAZE" imageName:@"paralysis-of-upgaze.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"PARKINSON'S DISEASE" imageName:@"parkinson's-disease.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"PERIAQUEDUCTAL GREY" imageName:@"periaqueductal-grey.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"RED NUCLEUS" imageName:@"red-nucleus.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"SUPERIOR COLLICULUS" imageName:@"superior-colliculus.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"WEBER'S" imageName:@"weber's.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"AICA" imageName:@"aica.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"ANTERIOR SPINAL ARTERY" imageName:@"anterior-spinal-artery.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"BASILAR" imageName:@"basilar.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"LONG CIRCUMFRENTIALS" imageName:@"long-circumfrentials.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"PICA" imageName:@"pica.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"POSTERIOR CEREBRAL" imageName:@"posterior-cerebral.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"POSTERIOR COMMUNICATING ARTERY" imageName:@"posterior-communicating-artery.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"SHORT CIRCUMFRENTIALS" imageName:@"short-circumfrentials.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"SUPERIOR CEREBELLAR" imageName:@"superior-cerebellar.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"VERTEBRAL ARTERY" imageName:@"vertebral-artery.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"(CNIII) OCULOMOTOR NERVE" imageName:@"(CNIII)-oculomotor-nerve.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNIV) TROCHLEAR NERVE" imageName:@"(CNIV)-trochlear-nerve.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNIX) GLOSSOPHARENGEAL NERVE" imageName:@"(CNIX) glossopharengeal nerve.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNV) SPINAL TRIGEMINAL NUCLEUS & TRACT" imageName:@"(CNV)-spinal-trigeminal-nucleus-&-tract.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNV) TRIGEMINAL NERVE" imageName:@"(CNV)-trigeminal-nerve.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNVI) ABDUCENS NERVE" imageName:@"(CNVI)-abducens-nerve.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNVII)FACIAL NERVE" imageName:@"(CNVII)facial-nerve.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNVIII) VESTIBULOCOCHLEAR NERVE" imageName:@"(CNVIII)-vestibulocochlear-nerve.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNX) VAGUS NERVE ROOTS" imageName:@"(CNX)-vagus-nerve-roots.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNXI) ACCESSORY NERVE ROOTS" imageName:@"(CNXI)-accessory-nerve-roots.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNXII) HYPOGLOSSAL NERVE ROOTS" imageName:@"(CNXII)-hypoglossal-nerve-roots.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"ACCESSORY NUCLEUS" imageName:@"accessory-nucleus.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"MESENCEPHALIC NUCLEUS" imageName:@"mesencephalic-nucleus.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"OCULOMOTOR & EDINGER WESTPHAL NUCLEI" imageName:@"oculomotor-&-edinger-westphal-nuclei.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"PRINCIPAL SENSORY NUCLEUS" imageName:@"principal-sensory-nucleus.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"SUPERIOR & INFERIOR COLLICULI" imageName:@"superior-&-inferior-colliculi.png" andBackgroundImageName:@"quiz-background-side.png"];
        
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
