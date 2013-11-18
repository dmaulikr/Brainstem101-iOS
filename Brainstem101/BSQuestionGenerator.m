//
//  BSQuestionGenerator.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 3/31/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSQuestionGenerator.h"

@implementation BSQuestionGenerator

+ (NSArray *) questions {
    NSMutableArray *tmp = [NSMutableArray new];
    // generated using gen.py in Images/Quiz
    [tmp addObject:[self questionWithAnswer:@"ACCESSORY NUCLEUS (CNXI)" foregroundImageName:@"accessory-nucleus-(CNXI)-0.png" andBackgroundImageName:@"quiz-background-0.png"]];
    [tmp addObject:[self questionWithAnswer:@"ANTERIOR CORTICOSPINAL TRACT" foregroundImageName:@"anterior-corticospinal-tract-0.png" andBackgroundImageName:@"quiz-background-0.png"]];
    [tmp addObject:[self questionWithAnswer:@"CUNEATE NUCLEUS" foregroundImageName:@"cuneate-nucleus-0.png" andBackgroundImageName:@"quiz-background-0.png"]];
    [tmp addObject:[self questionWithAnswer:@"GRACILE NUCLEUS" foregroundImageName:@"gracile-nucleus-0.png" andBackgroundImageName:@"quiz-background-0.png"]];
    [tmp addObject:[self questionWithAnswer:@"IPSILATERAL LOSS OF PAIN AND TEMPERATURE OF THE FACE" foregroundImageName:@"ipsilateral-loss-of-pain-and-temperature-of-the-face-0.png" andBackgroundImageName:@"quiz-background-0.png"]];
    [tmp addObject:[self questionWithAnswer:@"PROPRIOCEPTION FROM IPSILATERAL ARM" foregroundImageName:@"proprioception-from-ipsilateral-arm-0.png" andBackgroundImageName:@"quiz-background-0.png"]];
    [tmp addObject:[self questionWithAnswer:@"PYRAMIDAL DECUSSATION" foregroundImageName:@"pyramidal-decussation-0.png" andBackgroundImageName:@"quiz-background-0.png"]];
    [tmp addObject:[self questionWithAnswer:@"QUADRIPLEGIA" foregroundImageName:@"quadriplegia-0.png" andBackgroundImageName:@"quiz-background-0.png"]];
    [tmp addObject:[self questionWithAnswer:@"SPINAL TRIGEMINAL NUCLEUS" foregroundImageName:@"spinal-trigeminal-nucleus-0.png" andBackgroundImageName:@"quiz-background-0.png"]];
    [tmp addObject:[self questionWithAnswer:@"SPINAL TRIGEMINAL TRACT" foregroundImageName:@"spinal-trigeminal-tract-0.png" andBackgroundImageName:@"quiz-background-0.png"]];
    [tmp addObject:[self questionWithAnswer:@"SPINOCEREBELLAR TRACTS" foregroundImageName:@"spinocerebellar-tracts-0.png" andBackgroundImageName:@"quiz-background-0.png"]];
    [tmp addObject:[self questionWithAnswer:@"ALS" foregroundImageName:@"als-1.png" andBackgroundImageName:@"quiz-background-1.png"]];
    [tmp addObject:[self questionWithAnswer:@"CONTRALATERAL HEMIPLEGIA" foregroundImageName:@"contralateral-hemiplegia-1.png" andBackgroundImageName:@"quiz-background-1.png"]];
    [tmp addObject:[self questionWithAnswer:@"CUNEATE FASCICULUS" foregroundImageName:@"cuneate-fasciculus-1.png" andBackgroundImageName:@"quiz-background-1.png"]];
    [tmp addObject:[self questionWithAnswer:@"GRACILE FASCICULUS" foregroundImageName:@"gracile-fasciculus-1.png" andBackgroundImageName:@"quiz-background-1.png"]];
    [tmp addObject:[self questionWithAnswer:@"GRACILE NUCLEUS" foregroundImageName:@"gracile-nucleus-1.png" andBackgroundImageName:@"quiz-background-1.png"]];
    [tmp addObject:[self questionWithAnswer:@"HYPOGLOSSAL NUCLEI (CNXI)" foregroundImageName:@"hypoglossal-nuclei-(CNXI)-1.png" andBackgroundImageName:@"quiz-background-1.png"]];
    [tmp addObject:[self questionWithAnswer:@"INTERNAL ARCUATE FIBERS" foregroundImageName:@"internal-arcuate-fibers-1.png" andBackgroundImageName:@"quiz-background-1.png"]];
    [tmp addObject:[self questionWithAnswer:@"MEDIAL LEMNISCUS" foregroundImageName:@"medial-lemniscus-1.png" andBackgroundImageName:@"quiz-background-1.png"]];
    [tmp addObject:[self questionWithAnswer:@"NUCLEUS AMBIGUUS" foregroundImageName:@"nucleus-ambiguus-1.png" andBackgroundImageName:@"quiz-background-1.png"]];
    [tmp addObject:[self questionWithAnswer:@"PROPRIOCEPTION VIBRATION & FINE TOUCH" foregroundImageName:@"proprioception-vibration-&-fine-touch-1.png" andBackgroundImageName:@"quiz-background-1.png"]];
    [tmp addObject:[self questionWithAnswer:@"SOLITARY NUCLEUS" foregroundImageName:@"solitary-nucleus-1.png" andBackgroundImageName:@"quiz-background-1.png"]];
    [tmp addObject:[self questionWithAnswer:@"SPINAL TRIGEMINAL NUCLEUS" foregroundImageName:@"spinal-trigeminal-nucleus-1.png" andBackgroundImageName:@"quiz-background-1.png"]];
    [tmp addObject:[self questionWithAnswer:@"ALS" foregroundImageName:@"als-2.png" andBackgroundImageName:@"quiz-background-2.png"]];
    [tmp addObject:[self questionWithAnswer:@"ANTERIOR SPINOCEREBELLAR TRACT" foregroundImageName:@"anterior-spinocerebellar-tract-2.png" andBackgroundImageName:@"quiz-background-2.png"]];
    [tmp addObject:[self questionWithAnswer:@"CLINICAL WALLENBERG'S" foregroundImageName:@"clinical-wallenberg's-2.png" andBackgroundImageName:@"quiz-background-2.png"]];
    [tmp addObject:[self questionWithAnswer:@"CORTICOSPINAL TRACT" foregroundImageName:@"corticospinal-tract-2.png" andBackgroundImageName:@"quiz-background-2.png"]];
    [tmp addObject:[self questionWithAnswer:@"HYPOGLOSSAL NUCLEUS" foregroundImageName:@"hypoglossal-nucleus-2.png" andBackgroundImageName:@"quiz-background-2.png"]];
    [tmp addObject:[self questionWithAnswer:@"INFERIOR CEREBELLAR PEDUNCLE" foregroundImageName:@"inferior-cerebellar-peduncle-2.png" andBackgroundImageName:@"quiz-background-2.png"]];
    [tmp addObject:[self questionWithAnswer:@"INFERIOR OLIVARY NUCLEUS" foregroundImageName:@"inferior-olivary-nucleus-2.png" andBackgroundImageName:@"quiz-background-2.png"]];
    [tmp addObject:[self questionWithAnswer:@"INFERIOR VESTIBULAR NUCLEUS" foregroundImageName:@"inferior-vestibular-nucleus-2.png" andBackgroundImageName:@"quiz-background-2.png"]];
    [tmp addObject:[self questionWithAnswer:@"MEDIAL LEMNISCUS" foregroundImageName:@"medial-lemniscus-2.png" andBackgroundImageName:@"quiz-background-2.png"]];
    [tmp addObject:[self questionWithAnswer:@"MEDIAL MEDULLARY SYNDROME" foregroundImageName:@"medial-medullary-syndrome-2.png" andBackgroundImageName:@"quiz-background-2.png"]];
    [tmp addObject:[self questionWithAnswer:@"MEDIAL VESTIBULAR NUCLEUS" foregroundImageName:@"medial-vestibular-nucleus-2.png" andBackgroundImageName:@"quiz-background-2.png"]];
    [tmp addObject:[self questionWithAnswer:@"MLF" foregroundImageName:@"mlf-2.png" andBackgroundImageName:@"quiz-background-2.png"]];
    [tmp addObject:[self questionWithAnswer:@"MOTOR NUCLEUS OF VAGUS" foregroundImageName:@"motor-nucleus-of-vagus-2.png" andBackgroundImageName:@"quiz-background-2.png"]];
    [tmp addObject:[self questionWithAnswer:@"NUCLEUS AMBIGUUS" foregroundImageName:@"nucleus-ambiguus-2.png" andBackgroundImageName:@"quiz-background-2.png"]];
    [tmp addObject:[self questionWithAnswer:@"SOLITARY TRACT" foregroundImageName:@"solitary-tract-2.png" andBackgroundImageName:@"quiz-background-2.png"]];
    [tmp addObject:[self questionWithAnswer:@"SPINAL TRIGEMINAL NUCLEUS" foregroundImageName:@"spinal-trigeminal-nucleus-2.png" andBackgroundImageName:@"quiz-background-2.png"]];
    [tmp addObject:[self questionWithAnswer:@"SPINAL TRIGEMINAL TRACT" foregroundImageName:@"spinal-trigeminal-tract-2.png" andBackgroundImageName:@"quiz-background-2.png"]];
    [tmp addObject:[self questionWithAnswer:@"ALS" foregroundImageName:@"als-3.png" andBackgroundImageName:@"quiz-background-3.png"]];
    [tmp addObject:[self questionWithAnswer:@"ANTERIOR COCHLEAR NUCLEUS" foregroundImageName:@"anterior-cochlear-nucleus-3.png" andBackgroundImageName:@"quiz-background-3.png"]];
    [tmp addObject:[self questionWithAnswer:@"CENTRAL TEGMENTAL TRACT" foregroundImageName:@"central-tegmental-tract-3.png" andBackgroundImageName:@"quiz-background-3.png"]];
    [tmp addObject:[self questionWithAnswer:@"CORTICOSPINAL TRACT" foregroundImageName:@"corticospinal-tract-3.png" andBackgroundImageName:@"quiz-background-3.png"]];
    [tmp addObject:[self questionWithAnswer:@"INFERIOR CEREBELLAR PEDUNCLE" foregroundImageName:@"inferior-cerebellar-peduncle-3.png" andBackgroundImageName:@"quiz-background-3.png"]];
    [tmp addObject:[self questionWithAnswer:@"LATERAL VESTIBULAR NUCLEUS" foregroundImageName:@"lateral-vestibular-nucleus-3.png" andBackgroundImageName:@"quiz-background-3.png"]];
    [tmp addObject:[self questionWithAnswer:@"MEDIAL LEMNISCUS" foregroundImageName:@"medial-lemniscus-3.png" andBackgroundImageName:@"quiz-background-3.png"]];
    [tmp addObject:[self questionWithAnswer:@"MEDIAL VESTIBULAR NUCLEUS" foregroundImageName:@"medial-vestibular-nucleus-3.png" andBackgroundImageName:@"quiz-background-3.png"]];
    [tmp addObject:[self questionWithAnswer:@"MLF" foregroundImageName:@"mlf-3.png" andBackgroundImageName:@"quiz-background-3.png"]];
    [tmp addObject:[self questionWithAnswer:@"NUCLEUS RAPHE MAGNUS" foregroundImageName:@"nucleus-raphe-magnus-3.png" andBackgroundImageName:@"quiz-background-3.png"]];
    [tmp addObject:[self questionWithAnswer:@"NUCLEUS RAPHE PALIDUS" foregroundImageName:@"nucleus-raphe-palidus-3.png" andBackgroundImageName:@"quiz-background-3.png"]];
    [tmp addObject:[self questionWithAnswer:@"POSTERIOR COCHLEAR NUCLEUS" foregroundImageName:@"posterior-cochlear-nucleus-3.png" andBackgroundImageName:@"quiz-background-3.png"]];
    [tmp addObject:[self questionWithAnswer:@"SOLITARY NUCLEUS" foregroundImageName:@"solitary-nucleus-3.png" andBackgroundImageName:@"quiz-background-3.png"]];
    [tmp addObject:[self questionWithAnswer:@"SPINAL TRIGEMINAL NUCLEUS" foregroundImageName:@"spinal-trigeminal-nucleus-3.png" andBackgroundImageName:@"quiz-background-3.png"]];
    [tmp addObject:[self questionWithAnswer:@"SPINAL TRIGEMINAL TRACT" foregroundImageName:@"spinal-trigeminal-tract-3.png" andBackgroundImageName:@"quiz-background-3.png"]];
    [tmp addObject:[self questionWithAnswer:@"ABDUCENS NUCLEUS" foregroundImageName:@"abducens-nucleus-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"ALS" foregroundImageName:@"als-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"CENTRAL TEGMENTAL TRACT" foregroundImageName:@"central-tegmental-tract-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"CORTICOSPINAL TRACT" foregroundImageName:@"corticospinal-tract-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"FACIAL MOTOR NUCLEUS" foregroundImageName:@"facial-motor-nucleus-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"FACIAL NERVE (CNVII)" foregroundImageName:@"facial-nerve-(CNVII)-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"FOURTH VENTRICLE" foregroundImageName:@"fourth-ventricle-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"LATERAL RECTUS & STAPEDIUS" foregroundImageName:@"lateral-rectus-&-stapedius-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"MEDIAL LEMNISCUS" foregroundImageName:@"medial-lemniscus-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"MEDIAL VESTIBULAR NUCLEUS" foregroundImageName:@"medial-vestibular-nucleus-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"MIDDLE CEREBELLAR PEDUNCLE" foregroundImageName:@"middle-cerebellar-peduncle-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"MLF" foregroundImageName:@"mlf-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"NUCLEUS RAPHE MAGNUS" foregroundImageName:@"nucleus-raphe-magnus-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"PONTINE TRACTS" foregroundImageName:@"pontine-tracts-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"POSTERIOR LONGITUDINAL FASCICULUS" foregroundImageName:@"posterior-longitudinal-fasciculus-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"SPINAL TRIGEMINAL NUCLEUS" foregroundImageName:@"spinal-trigeminal-nucleus-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"SUPERIOR VESTIBULAR NUCLEUS" foregroundImageName:@"superior-vestibular-nucleus-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"VENTRAL PONTINE SYNDROME" foregroundImageName:@"ventral-pontine-syndrome-4.png" andBackgroundImageName:@"quiz-background-4.png"]];
    [tmp addObject:[self questionWithAnswer:@"ALS" foregroundImageName:@"als-5.png" andBackgroundImageName:@"quiz-background-5.png"]];
    [tmp addObject:[self questionWithAnswer:@"CENTRAL TEGMENTAL TRACT" foregroundImageName:@"central-tegmental-tract-5.png" andBackgroundImageName:@"quiz-background-5.png"]];
    [tmp addObject:[self questionWithAnswer:@"LOCKED IN" foregroundImageName:@"locked-in-5.png" andBackgroundImageName:@"quiz-background-5.png"]];
    [tmp addObject:[self questionWithAnswer:@"LOCUS CERULEUS" foregroundImageName:@"locus-ceruleus-5.png" andBackgroundImageName:@"quiz-background-5.png"]];
    [tmp addObject:[self questionWithAnswer:@"MEDIAL LEMNISCUS" foregroundImageName:@"medial-lemniscus-5.png" andBackgroundImageName:@"quiz-background-5.png"]];
    [tmp addObject:[self questionWithAnswer:@"MESENCEPHALIC NUCLEUS AND TRACT" foregroundImageName:@"mesencephalic-nucleus-and-tract-5.png" andBackgroundImageName:@"quiz-background-5.png"]];
    [tmp addObject:[self questionWithAnswer:@"MIDDLE CEREBELLAR PEDUNCLE" foregroundImageName:@"middle-cerebellar-peduncle-5.png" andBackgroundImageName:@"quiz-background-5.png"]];
    [tmp addObject:[self questionWithAnswer:@"MLF" foregroundImageName:@"mlf-5.png" andBackgroundImageName:@"quiz-background-5.png"]];
    [tmp addObject:[self questionWithAnswer:@"NUCLEUS RAPHE PONTIS" foregroundImageName:@"nucleus-raphe-pontis-5.png" andBackgroundImageName:@"quiz-background-5.png"]];
    [tmp addObject:[self questionWithAnswer:@"PONTINE NUCLEI" foregroundImageName:@"pontine-nuclei-5.png" andBackgroundImageName:@"quiz-background-5.png"]];
    [tmp addObject:[self questionWithAnswer:@"PRINCIPAL AND MOTOR NUCLEI OF TRIGEMINAL" foregroundImageName:@"principal-and-motor-nuclei-of-trigeminal-5.png" andBackgroundImageName:@"quiz-background-5.png"]];
    [tmp addObject:[self questionWithAnswer:@"ALS" foregroundImageName:@"als-6.png" andBackgroundImageName:@"quiz-background-6.png"]];
    [tmp addObject:[self questionWithAnswer:@"AQUEDUCTAL GREY" foregroundImageName:@"aqueductal-grey-6.png" andBackgroundImageName:@"quiz-background-6.png"]];
    [tmp addObject:[self questionWithAnswer:@"CENTRAL TEGMENTAL TRACT" foregroundImageName:@"central-tegmental-tract-6.png" andBackgroundImageName:@"quiz-background-6.png"]];
    [tmp addObject:[self questionWithAnswer:@"CEREBRAL AQUEDUCT" foregroundImageName:@"cerebral-aqueduct-6.png" andBackgroundImageName:@"quiz-background-6.png"]];
    [tmp addObject:[self questionWithAnswer:@"LATERAL LEMNISCUS" foregroundImageName:@"lateral-lemniscus-6.png" andBackgroundImageName:@"quiz-background-6.png"]];
    [tmp addObject:[self questionWithAnswer:@"MEDIAL LEMNISCUS" foregroundImageName:@"medial-lemniscus-6.png" andBackgroundImageName:@"quiz-background-6.png"]];
    [tmp addObject:[self questionWithAnswer:@"MESENCEPHALIC NUCLEUS" foregroundImageName:@"mesencephalic-nucleus-6.png" andBackgroundImageName:@"quiz-background-6.png"]];
    [tmp addObject:[self questionWithAnswer:@"MIDDLE CEREBELLAR PEDUNCLE" foregroundImageName:@"middle-cerebellar-peduncle-6.png" andBackgroundImageName:@"quiz-background-6.png"]];
    [tmp addObject:[self questionWithAnswer:@"MLF" foregroundImageName:@"mlf-6.png" andBackgroundImageName:@"quiz-background-6.png"]];
    [tmp addObject:[self questionWithAnswer:@"NUCLEUS CENTRALIS SUPERIOR" foregroundImageName:@"nucleus-centralis-superior-6.png" andBackgroundImageName:@"quiz-background-6.png"]];
    [tmp addObject:[self questionWithAnswer:@"SUPERIOR CEREBELLAR PEDUNCLE" foregroundImageName:@"superior-cerebellar-peduncle-6.png" andBackgroundImageName:@"quiz-background-6.png"]];
    [tmp addObject:[self questionWithAnswer:@"ALS" foregroundImageName:@"als-7.png" andBackgroundImageName:@"quiz-background-7.png"]];
    [tmp addObject:[self questionWithAnswer:@"CENTRAL TEGMENTAL TRACT" foregroundImageName:@"central-tegmental-tract-7.png" andBackgroundImageName:@"quiz-background-7.png"]];
    [tmp addObject:[self questionWithAnswer:@"CEREBRAL AQUEDUCT" foregroundImageName:@"cerebral-aqueduct-7.png" andBackgroundImageName:@"quiz-background-7.png"]];
    [tmp addObject:[self questionWithAnswer:@"CEREBRAL PEDUNCLE" foregroundImageName:@"cerebral-peduncle-7.png" andBackgroundImageName:@"quiz-background-7.png"]];
    [tmp addObject:[self questionWithAnswer:@"CORTICOBULBAR TRACT" foregroundImageName:@"corticobulbar-tract-7.png" andBackgroundImageName:@"quiz-background-7.png"]];
    [tmp addObject:[self questionWithAnswer:@"CORTICOSPINAL TRACT" foregroundImageName:@"corticospinal-tract-7.png" andBackgroundImageName:@"quiz-background-7.png"]];
    [tmp addObject:[self questionWithAnswer:@"INFERIOR COLLICULUS" foregroundImageName:@"inferior-colliculus-7.png" andBackgroundImageName:@"quiz-background-7.png"]];
    [tmp addObject:[self questionWithAnswer:@"LATERAL LEMNISCUS" foregroundImageName:@"lateral-lemniscus-7.png" andBackgroundImageName:@"quiz-background-7.png"]];
    [tmp addObject:[self questionWithAnswer:@"MEDIAL LEMNISCUS" foregroundImageName:@"medial-lemniscus-7.png" andBackgroundImageName:@"quiz-background-7.png"]];
    [tmp addObject:[self questionWithAnswer:@"MLF" foregroundImageName:@"mlf-7.png" andBackgroundImageName:@"quiz-background-7.png"]];
    [tmp addObject:[self questionWithAnswer:@"PERIAQUEDUCTAL GREY" foregroundImageName:@"periaqueductal-grey-7.png" andBackgroundImageName:@"quiz-background-7.png"]];
    [tmp addObject:[self questionWithAnswer:@"SUPERIOR CEREBELLAR PEDUNCLE" foregroundImageName:@"superior-cerebellar-peduncle-7.png" andBackgroundImageName:@"quiz-background-7.png"]];
    [tmp addObject:[self questionWithAnswer:@"TROCHLEAR NUCLEUS" foregroundImageName:@"trochlear-nucleus-7.png" andBackgroundImageName:@"quiz-background-7.png"]];
    [tmp addObject:[self questionWithAnswer:@"VENTRAL TRIGEMINOTHALAMIC TRACT" foregroundImageName:@"ventral-trigeminothalamic-tract-7.png" andBackgroundImageName:@"quiz-background-7.png"]];
    [tmp addObject:[self questionWithAnswer:@"ALS" foregroundImageName:@"als-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"BENEDIKT'S" foregroundImageName:@"benedikt's-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"CENTRAL TEGMENTAL TRACT" foregroundImageName:@"central-tegmental-tract-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"CEREBELLOTHALAMIC TRACTS" foregroundImageName:@"cerebellothalamic-tracts-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"CEREBRAL AQUEDUCT" foregroundImageName:@"cerebral-aqueduct-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"CLAUDE'S" foregroundImageName:@"claude's-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"CORTICOBULBAR TRACTS" foregroundImageName:@"corticobulbar-tracts-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"CORTICOSPINAL TRACT" foregroundImageName:@"corticospinal-tract-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"CRUS CEREBRI" foregroundImageName:@"crus-cerebri-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"FALSE" foregroundImageName:@"false-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"HOMONOMOUS HEMIANOPIA" foregroundImageName:@"homonomous-hemianopia-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"MEDIAL GENICULATE NUCLEUS" foregroundImageName:@"medial-geniculate-nucleus-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"MEDIAL LEMNISCUS" foregroundImageName:@"medial-lemniscus-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"MESENCEPHALIC NUCLEUS" foregroundImageName:@"mesencephalic-nucleus-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"MLF" foregroundImageName:@"mlf-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"OBSTRUCTIVE HYDROCEPHALUS" foregroundImageName:@"obstructive-hydrocephalus-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"OCULOMOTOR NUCLEUS" foregroundImageName:@"oculomotor-nucleus-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"OPTIC TRACT" foregroundImageName:@"optic-tract-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"PARALYSIS OF UPGAZE" foregroundImageName:@"paralysis-of-upgaze-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"PARKINSON'S DISEASE" foregroundImageName:@"parkinson's-disease-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"PERIAQUEDUCTAL GREY" foregroundImageName:@"periaqueductal-grey-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"RED NUCLEUS" foregroundImageName:@"red-nucleus-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"SUPERIOR COLLICULUS" foregroundImageName:@"superior-colliculus-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"WEBER'S" foregroundImageName:@"weber's-8.png" andBackgroundImageName:@"quiz-background-8.png"]];
    [tmp addObject:[self questionWithAnswer:@"AICA" foregroundImageName:@"aica-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"]];
    [tmp addObject:[self questionWithAnswer:@"ANTERIOR SPINAL ARTERY" foregroundImageName:@"anterior-spinal-artery-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"]];
    [tmp addObject:[self questionWithAnswer:@"BASILAR" foregroundImageName:@"basilar-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"]];
    [tmp addObject:[self questionWithAnswer:@"LONG CIRCUMFRENTIALS" foregroundImageName:@"long-circumfrentials-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"]];
    [tmp addObject:[self questionWithAnswer:@"PICA" foregroundImageName:@"pica-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"]];
    [tmp addObject:[self questionWithAnswer:@"POSTERIOR CEREBRAL" foregroundImageName:@"posterior-cerebral-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"]];
    [tmp addObject:[self questionWithAnswer:@"POSTERIOR COMMUNICATING ARTERY" foregroundImageName:@"posterior-communicating-artery-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"]];
    [tmp addObject:[self questionWithAnswer:@"SHORT CIRCUMFRENTIALS" foregroundImageName:@"short-circumfrentials-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"]];
    [tmp addObject:[self questionWithAnswer:@"SUPERIOR CEREBELLAR" foregroundImageName:@"superior-cerebellar-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"]];
    [tmp addObject:[self questionWithAnswer:@"VERTEBRAL ARTERY" foregroundImageName:@"vertebral-artery-perfusion.png" andBackgroundImageName:@"quiz-background-perfusion.png"]];
    [tmp addObject:[self questionWithAnswer:@"(CNIII) OCULOMOTOR NERVE" foregroundImageName:@"(CNIII)-oculomotor-nerve-side.png" andBackgroundImageName:@"quiz-background-side.png"]];
    [tmp addObject:[self questionWithAnswer:@"(CNIV) TROCHLEAR NERVE" foregroundImageName:@"(CNIV)-trochlear-nerve-side.png" andBackgroundImageName:@"quiz-background-side.png"]];
    [tmp addObject:[self questionWithAnswer:@"(CNIX) GLOSSOPHARENGEAL NERVE" foregroundImageName:@"(CNIX) glossopharengeal nerve-side.png" andBackgroundImageName:@"quiz-background-side.png"]];
    [tmp addObject:[self questionWithAnswer:@"(CNV) SPINAL TRIGEMINAL NUCLEUS & TRACT" foregroundImageName:@"(CNV)-spinal-trigeminal-nucleus-&-tract-side.png" andBackgroundImageName:@"quiz-background-side.png"]];
    [tmp addObject:[self questionWithAnswer:@"(CNV) TRIGEMINAL NERVE" foregroundImageName:@"(CNV)-trigeminal-nerve-side.png" andBackgroundImageName:@"quiz-background-side.png"]];
    [tmp addObject:[self questionWithAnswer:@"(CNVI) ABDUCENS NERVE" foregroundImageName:@"(CNVI)-abducens-nerve-side.png" andBackgroundImageName:@"quiz-background-side.png"]];
    [tmp addObject:[self questionWithAnswer:@"(CNVII)FACIAL NERVE" foregroundImageName:@"(CNVII)facial-nerve-side.png" andBackgroundImageName:@"quiz-background-side.png"]];
    [tmp addObject:[self questionWithAnswer:@"(CNVIII) VESTIBULOCOCHLEAR NERVE" foregroundImageName:@"(CNVIII)-vestibulocochlear-nerve-side.png" andBackgroundImageName:@"quiz-background-side.png"]];
    [tmp addObject:[self questionWithAnswer:@"(CNX) VAGUS NERVE ROOTS" foregroundImageName:@"(CNX)-vagus-nerve-roots-side.png" andBackgroundImageName:@"quiz-background-side.png"]];
    [tmp addObject:[self questionWithAnswer:@"(CNXI) ACCESSORY NERVE ROOTS" foregroundImageName:@"(CNXI)-accessory-nerve-roots-side.png" andBackgroundImageName:@"quiz-background-side.png"]];
    [tmp addObject:[self questionWithAnswer:@"(CNXII) HYPOGLOSSAL NERVE ROOTS" foregroundImageName:@"(CNXII)-hypoglossal-nerve-roots-side.png" andBackgroundImageName:@"quiz-background-side.png"]];
    [tmp addObject:[self questionWithAnswer:@"ACCESSORY NUCLEUS" foregroundImageName:@"accessory-nucleus-side.png" andBackgroundImageName:@"quiz-background-side.png"]];
    [tmp addObject:[self questionWithAnswer:@"MESENCEPHALIC NUCLEUS" foregroundImageName:@"mesencephalic-nucleus-side.png" andBackgroundImageName:@"quiz-background-side.png"]];
    [tmp addObject:[self questionWithAnswer:@"OCULOMOTOR & EDINGER WESTPHAL NUCLEI" foregroundImageName:@"oculomotor-&-edinger-westphal-nuclei-side.png" andBackgroundImageName:@"quiz-background-side.png"]];
    [tmp addObject:[self questionWithAnswer:@"PRINCIPAL SENSORY NUCLEUS" foregroundImageName:@"principal-sensory-nucleus-side.png" andBackgroundImageName:@"quiz-background-side.png"]];
    [tmp addObject:[self questionWithAnswer:@"SUPERIOR & INFERIOR COLLICULI" foregroundImageName:@"superior-&-inferior-colliculi-side.png" andBackgroundImageName:@"quiz-background-side.png"]];
    
    // Shuffle array
    for(NSUInteger i = [tmp count]; i > 1; i--) {
        NSUInteger j = arc4random_uniform(i);
        [tmp exchangeObjectAtIndex:i-1 withObjectAtIndex:j];
    }
    
    return [tmp copy];
}


+(BSQuizQuestion *)questionWithAnswer:(NSString *) answer foregroundImageName:(NSString *) foreground andBackgroundImageName:(NSString *) background
{
    
    BSQuizQuestion *question = [[BSQuizQuestion alloc] init];
    [question setAnswer:answer];
    [question setBackgroundImageName:background];
    [question setForegroundImageName:foreground];
    
    return question;
}


//-(NSDictionary *)getNextQuestion{
//    currentQuestionIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentQuestionIndex"];
//    currentQuestionIndex++;
//    [[NSUserDefaults standardUserDefaults] setInteger:currentQuestionIndex forKey:@"currentQuestionIndex"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    return _questions[currentQuestionIndex % _questions.count];
//}

@end
