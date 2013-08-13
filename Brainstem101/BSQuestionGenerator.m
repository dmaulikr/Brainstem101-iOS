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
        
        // generated using gen.py in Images/Quiz
        
        [self addQuestionWithAnswer:@"ACCESSORY NUCLEUS (CNXI)" imageName:@"accessory-nucleus-(CNXI)-0.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"ANTERIOR CORTICOSPINAL TRACT" imageName:@"anterior-corticospinal-tract-0.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"CUNEATE NUCLEUS" imageName:@"cuneate-nucleus-0.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"GRACILE NUCLEUS" imageName:@"gracile-nucleus-0.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"IPSILATERAL LOSS OF PAIN AND TEMPERATURE OF THE FACE" imageName:@"ipsilateral-loss-of-pain-and-temperature-of-the-face-0.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"PROPRIOCEPTION FROM IPSILATERAL ARM" imageName:@"proprioception-from-ipsilateral-arm-0.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"PYRAMIDAL DECUSSATION" imageName:@"pyramidal-decussation-0.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"QUADRIPLEGIA" imageName:@"quadriplegia-0.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"SPINAL TRIGEMINAL NUCLEUS" imageName:@"spinal-trigeminal-nucleus-0.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"SPINAL TRIGEMINAL TRACT" imageName:@"spinal-trigeminal-tract-0.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"SPINOCEREBELLAR TRACTS" imageName:@"spinocerebellar-tracts-0.png" andBackgroundImageName:@"quiz-background-0.png"];
        [self addQuestionWithAnswer:@"ALS" imageName:@"als-1.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"CONTRALATERAL HEMIPLEGIA" imageName:@"contralateral-hemiplegia-1.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"CUNEATE FASCICULUS" imageName:@"cuneate-fasciculus-1.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"GRACILE FASCICULUS" imageName:@"gracile-fasciculus-1.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"GRACILE NUCLEUS" imageName:@"gracile-nucleus-1.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"HYPOGLOSSAL NUCLEI (CNXI)" imageName:@"hypoglossal-nuclei-(CNXI)-1.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"INTERNAL ARCUATE FIBERS" imageName:@"internal-arcuate-fibers-1.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"MEDIAL LEMNISCUS" imageName:@"medial-lemniscus-1.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"NUCLEUS AMBIGUUS" imageName:@"nucleus-ambiguus-1.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"PROPRIOCEPTION VIBRATION & FINE TOUCH" imageName:@"proprioception-vibration-&-fine-touch-1.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"SOLITARY NUCLEUS" imageName:@"solitary-nucleus-1.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"SPINAL TRIGEMINAL NUCLEUS" imageName:@"spinal-trigeminal-nucleus-1.png" andBackgroundImageName:@"quiz-background-1.png"];
        [self addQuestionWithAnswer:@"ALS" imageName:@"als-2.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"ANTERIOR SPINOCEREBELLAR TRACT" imageName:@"anterior-spinocerebellar-tract-2.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"CLINICAL WALLENBERG'S" imageName:@"clinical-wallenberg's-2.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"CORTICOSPINAL TRACT" imageName:@"corticospinal-tract-2.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"HYPOGLOSSAL NUCLEUS" imageName:@"hypoglossal-nucleus-2.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"INFERIOR CEREBELLAR PEDUNCLE" imageName:@"inferior-cerebellar-peduncle-2.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"INFERIOR OLIVARY NUCLEUS" imageName:@"inferior-olivary-nucleus-2.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"INFERIOR VESTIBULAR NUCLEUS" imageName:@"inferior-vestibular-nucleus-2.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"MEDIAL LEMNISCUS" imageName:@"medial-lemniscus-2.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"MEDIAL MEDULLARY SYNDROME" imageName:@"medial-medullary-syndrome-2.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"MEDIAL VESTIBULAR NUCLEUS" imageName:@"medial-vestibular-nucleus-2.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"MLF" imageName:@"mlf-2.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"MOTOR NUCLEUS OF VAGUS" imageName:@"motor-nucleus-of-vagus-2.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"NUCLEUS AMBIGUUS" imageName:@"nucleus-ambiguus-2.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"SOLITARY TRACT" imageName:@"solitary-tract-2.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"SPINAL TRIGEMINAL NUCLEUS" imageName:@"spinal-trigeminal-nucleus-2.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"SPINAL TRIGEMINAL TRACT" imageName:@"spinal-trigeminal-tract-2.png" andBackgroundImageName:@"quiz-background-2.png"];
        [self addQuestionWithAnswer:@"ALS" imageName:@"als-3.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"ANTERIOR COCHLEAR NUCLEUS" imageName:@"anterior-cochlear-nucleus-3.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"CENTRAL TEGMENTAL TRACT" imageName:@"central-tegmental-tract-3.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"CORTICOSPINAL TRACT" imageName:@"corticospinal-tract-3.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"INFERIOR CEREBELLAR PEDUNCLE" imageName:@"inferior-cerebellar-peduncle-3.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"LATERAL VESTIBULAR NUCLEUS" imageName:@"lateral-vestibular-nucleus-3.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"MEDIAL LEMNISCUS" imageName:@"medial-lemniscus-3.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"MEDIAL VESTIBULAR NUCLEUS" imageName:@"medial-vestibular-nucleus-3.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"MLF" imageName:@"mlf-3.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"NUCLEUS RAPHE MAGNUS" imageName:@"nucleus-raphe-magnus-3.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"NUCLEUS RAPHE PALIDUS" imageName:@"nucleus-raphe-palidus-3.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"POSTERIOR COCHLEAR NUCLEUS" imageName:@"posterior-cochlear-nucleus-3.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"SOLITARY NUCLEUS" imageName:@"solitary-nucleus-3.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"SPINAL TRIGEMINAL NUCLEUS" imageName:@"spinal-trigeminal-nucleus-3.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"SPINAL TRIGEMINAL TRACT" imageName:@"spinal-trigeminal-tract-3.png" andBackgroundImageName:@"quiz-background-3.png"];
        [self addQuestionWithAnswer:@"ABDUCENS NUCLEUS" imageName:@"abducens-nucleus-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"ALS" imageName:@"als-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"CENTRAL TEGMENTAL TRACT" imageName:@"central-tegmental-tract-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"CORTICOSPINAL TRACT" imageName:@"corticospinal-tract-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"FACIAL MOTOR NUCLEUS" imageName:@"facial-motor-nucleus-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"FACIAL NERVE (CNVII)" imageName:@"facial-nerve-(CNVII)-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"FOURTH VENTRICLE" imageName:@"fourth-ventricle-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"LATERAL RECTUS & STAPEDIUS" imageName:@"lateral-rectus-&-stapedius-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"MEDIAL LEMNISCUS" imageName:@"medial-lemniscus-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"MEDIAL VESTIBULAR NUCLEUS" imageName:@"medial-vestibular-nucleus-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"MIDDLE CEREBELLAR PEDUNCLE" imageName:@"middle-cerebellar-peduncle-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"MLF" imageName:@"mlf-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"NUCLEUS RAPHE MAGNUS" imageName:@"nucleus-raphe-magnus-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"PONTINE TRACTS" imageName:@"pontine-tracts-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"POSTERIOR LONGITUDINAL FASCICULUS" imageName:@"posterior-longitudinal-fasciculus-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"SPINAL TRIGEMINAL NUCLEUS" imageName:@"spinal-trigeminal-nucleus-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"SUPERIOR VESTIBULAR NUCLEUS" imageName:@"superior-vestibular-nucleus-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"VENTRAL PONTINE SYNDROME" imageName:@"ventral-pontine-syndrome-4.png" andBackgroundImageName:@"quiz-background-4.png"];
        [self addQuestionWithAnswer:@"ALS" imageName:@"als-5.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"CENTRAL TEGMENTAL TRACT" imageName:@"central-tegmental-tract-5.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"LOCKED IN" imageName:@"locked-in-5.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"LOCUS CERULEUS" imageName:@"locus-ceruleus-5.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"MEDIAL LEMNISCUS" imageName:@"medial-lemniscus-5.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"MESENCEPHALIC NUCLEUS AND TRACT" imageName:@"mesencephalic-nucleus-and-tract-5.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"MIDDLE CEREBELLAR PEDUNCLE" imageName:@"middle-cerebellar-peduncle-5.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"MLF" imageName:@"mlf-5.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"NUCLEUS RAPHE PONTIS" imageName:@"nucleus-raphe-pontis-5.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"PONTINE NUCLEI" imageName:@"pontine-nuclei-5.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"PRINCIPAL AND MOTOR NUCLEI OF TRIGEMINAL" imageName:@"principal-and-motor-nuclei-of-trigeminal-5.png" andBackgroundImageName:@"quiz-background-5.png"];
        [self addQuestionWithAnswer:@"ALS" imageName:@"als-6.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"AQUEDUCTAL GREY" imageName:@"aqueductal-grey-6.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"CENTRAL TEGMENTAL TRACT" imageName:@"central-tegmental-tract-6.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"CEREBRAL AQUEDUCT" imageName:@"cerebral-aqueduct-6.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"LATERAL LEMNISCUS" imageName:@"lateral-lemniscus-6.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"MEDIAL LEMNISCUS" imageName:@"medial-lemniscus-6.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"MESENCEPHALIC NUCLEUS" imageName:@"mesencephalic-nucleus-6.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"MIDDLE CEREBELLAR PEDUNCLE" imageName:@"middle-cerebellar-peduncle-6.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"MLF" imageName:@"mlf-6.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"NUCLEUS CENTRALIS SUPERIOR" imageName:@"nucleus-centralis-superior-6.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"SUPERIOR CEREBELLAR PEDUNCLE" imageName:@"superior-cerebellar-peduncle-6.png" andBackgroundImageName:@"quiz-background-6.png"];
        [self addQuestionWithAnswer:@"ALS" imageName:@"als-7.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"CENTRAL TEGMENTAL TRACT" imageName:@"central-tegmental-tract-7.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"CEREBRAL AQUEDUCT" imageName:@"cerebral-aqueduct-7.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"CEREBRAL PEDUNCLE" imageName:@"cerebral-peduncle-7.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"CORTICOBULBAR TRACT" imageName:@"corticobulbar-tract-7.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"CORTICOSPINAL TRACT" imageName:@"corticospinal-tract-7.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"INFERIOR COLLICULUS" imageName:@"inferior-colliculus-7.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"LATERAL LEMNISCUS" imageName:@"lateral-lemniscus-7.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"MEDIAL LEMNISCUS" imageName:@"medial-lemniscus-7.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"MLF" imageName:@"mlf-7.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"PERIAQUEDUCTAL GREY" imageName:@"periaqueductal-grey-7.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"SUPERIOR CEREBELLAR PEDUNCLE" imageName:@"superior-cerebellar-peduncle-7.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"TROCHLEAR NUCLEUS" imageName:@"trochlear-nucleus-7.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"VENTRAL TRIGEMINOTHALAMIC TRACT" imageName:@"ventral-trigeminothalamic-tract-7.png" andBackgroundImageName:@"quiz-background-7.png"];
        [self addQuestionWithAnswer:@"ALS" imageName:@"als-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"BENEDIKT'S" imageName:@"benedikt's-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"CENTRAL TEGMENTAL TRACT" imageName:@"central-tegmental-tract-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"CEREBELLOTHALAMIC TRACTS" imageName:@"cerebellothalamic-tracts-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"CEREBRAL AQUEDUCT" imageName:@"cerebral-aqueduct-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"CLAUDE'S" imageName:@"claude's-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"CORTICOBULBAR TRACTS" imageName:@"corticobulbar-tracts-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"CORTICOSPINAL TRACT" imageName:@"corticospinal-tract-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"CRUS CEREBRI" imageName:@"crus-cerebri-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"FALSE" imageName:@"false-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"HOMONOMOUS HEMIANOPIA" imageName:@"homonomous-hemianopia-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"MEDIAL GENICULATE NUCLEUS" imageName:@"medial-geniculate-nucleus-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"MEDIAL LEMNISCUS" imageName:@"medial-lemniscus-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"MESENCEPHALIC NUCLEUS" imageName:@"mesencephalic-nucleus-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"MLF" imageName:@"mlf-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"OBSTRUCTIVE HYDROCEPHALUS" imageName:@"obstructive-hydrocephalus-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"OCULOMOTOR NUCLEUS" imageName:@"oculomotor-nucleus-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"OPTIC TRACT" imageName:@"optic-tract-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"PARALYSIS OF UPGAZE" imageName:@"paralysis-of-upgaze-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"PARKINSON'S DISEASE" imageName:@"parkinson's-disease-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"PERIAQUEDUCTAL GREY" imageName:@"periaqueductal-grey-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"RED NUCLEUS" imageName:@"red-nucleus-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"SUPERIOR COLLICULUS" imageName:@"superior-colliculus-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"WEBER'S" imageName:@"weber's-8.png" andBackgroundImageName:@"quiz-background-8.png"];
        [self addQuestionWithAnswer:@"AICA" imageName:@"aica-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"ANTERIOR SPINAL ARTERY" imageName:@"anterior-spinal-artery-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"BASILAR" imageName:@"basilar-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"LONG CIRCUMFRENTIALS" imageName:@"long-circumfrentials-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"PICA" imageName:@"pica-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"POSTERIOR CEREBRAL" imageName:@"posterior-cerebral-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"POSTERIOR COMMUNICATING ARTERY" imageName:@"posterior-communicating-artery-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"SHORT CIRCUMFRENTIALS" imageName:@"short-circumfrentials-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"SUPERIOR CEREBELLAR" imageName:@"superior-cerebellar-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"VERTEBRAL ARTERY" imageName:@"vertebral-artery-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"];
        [self addQuestionWithAnswer:@"(CNIII) OCULOMOTOR NERVE" imageName:@"(CNIII)-oculomotor-nerve-side.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNIV) TROCHLEAR NERVE" imageName:@"(CNIV)-trochlear-nerve-side.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNIX) GLOSSOPHARENGEAL NERVE" imageName:@"(CNIX) glossopharengeal nerve-side.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNV) SPINAL TRIGEMINAL NUCLEUS & TRACT" imageName:@"(CNV)-spinal-trigeminal-nucleus-&-tract-side.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNV) TRIGEMINAL NERVE" imageName:@"(CNV)-trigeminal-nerve-side.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNVI) ABDUCENS NERVE" imageName:@"(CNVI)-abducens-nerve-side.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNVII)FACIAL NERVE" imageName:@"(CNVII)facial-nerve-side.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNVIII) VESTIBULOCOCHLEAR NERVE" imageName:@"(CNVIII)-vestibulocochlear-nerve-side.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNX) VAGUS NERVE ROOTS" imageName:@"(CNX)-vagus-nerve-roots-side.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNXI) ACCESSORY NERVE ROOTS" imageName:@"(CNXI)-accessory-nerve-roots-side.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"(CNXII) HYPOGLOSSAL NERVE ROOTS" imageName:@"(CNXII)-hypoglossal-nerve-roots-side.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"ACCESSORY NUCLEUS" imageName:@"accessory-nucleus-side.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"MESENCEPHALIC NUCLEUS" imageName:@"mesencephalic-nucleus-side.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"OCULOMOTOR & EDINGER WESTPHAL NUCLEI" imageName:@"oculomotor-&-edinger-westphal-nuclei-side.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"PRINCIPAL SENSORY NUCLEUS" imageName:@"principal-sensory-nucleus-side.png" andBackgroundImageName:@"quiz-background-side.png"];
        [self addQuestionWithAnswer:@"SUPERIOR & INFERIOR COLLICULI" imageName:@"superior-&-inferior-colliculi-side.png" andBackgroundImageName:@"quiz-background-side.png"];
        
    }
    _questions = [self shuffleArray:_questions];
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

- (NSMutableArray*)shuffleArray:(NSMutableArray*)array {
    
    NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:array];
    
    for(NSUInteger i = [array count]; i > 1; i--) {
        NSUInteger j = arc4random_uniform(i);
        [temp exchangeObjectAtIndex:i-1 withObjectAtIndex:j];
    }
    
    return temp;
}

@end
