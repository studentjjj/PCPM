// PATIENTS 

//  Patients --ADMITTED_TO--> Admissions 
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:Patients)
    MATCH (m:Admissions)
    WHERE n.subject_id = m.subject_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:ADMITTED_TO]->(m)", 
    {batchSize:1000}
 )

//  !PATIENTS --CONTAINS--> LAB EVENTS (note: no/blank hadm_id )
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:Patients)
    MATCH (m:Lab_Events)
    WHERE n.subject_id = m.subject_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:RECEIVED_LABS]->(m)", 
    {batchSize:1000}
 )

//  Patients -HAS -->  OMR 
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:Patients)
    MATCH (m:OMR)
    WHERE n.subject_id = m.subject_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:HAS]->(m)", 
    {batchSize:1000}
 )


// ADMISISONS

// Admissions --HAS_PRESCRIPTION--> Prescriptions
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:Admissions)
    MATCH (m:Prescriptions)
    WHERE n.hadm_id = m.hadm_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:HAS_PRESCRIPTION]->(m)", 
    {batchSize:1000}
 )

//  Admissions --HAS_TRANSFER--> Transfers
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:Admissions)
    MATCH (m:Transfers)
    WHERE n.hadm_id = m.hadm_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:HAS_TRANSFER]->(m)", 
    {batchSize:1000}
 )

//  Admissions --HAS_SERVICE--> Services
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:Admissions)
    MATCH (m:Services)
    WHERE n.hadm_id = m.hadm_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:HAS_SERVICE]->(m)", 
    {batchSize:1000}
 )
 
//  Admissions --HAS_DRG_CODE--> DRG_Codes
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:Admissions)
    MATCH (m:DRG_Codes)
    WHERE n.hadm_id = m.hadm_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:HAS_DRG_CODE]->(m)", 
    {batchSize:1000}
 )

//  Admissions --HAS_MICROBIOLOGY_EVENT--> Microbiology_Events
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:Admissions)
    MATCH (m:Microbiology_Events)
    WHERE n.hadm_id = m.hadm_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:HAS_MICROBIOLOGY_EVENT]->(m)", 
    {batchSize:1000}
 )

//  Admissions --HAS_PROCEDURE--> Procedures_ICD (merged)
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:Admissions)
    MATCH (m:Procedures_ICD)
    WHERE n.hadm_id = m.hadm_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:HAS_PROCEDURE]->(m)", 
    {batchSize:1000}
 )

//  Admissions --HAS_HCPCS_EVENT--> HCPCS_Events (merged)
 
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:Admissions)
    MATCH (m:HCPCS_Events)
    WHERE n.hadm_id = m.hadm_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:HAS_HCPCS_EVENT]->(m)", 
    {batchSize:1000}
 )
 
//  Admissions --HAS_POE--> POE (merged)
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:Admissions)
    MATCH (m:POE)
    WHERE n.hadm_id = m.hadm_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:HAS_POE]->(m)", 
    {batchSize:1000}
 )
  
//  Admissions --HAS_DIAGNOSIS--> Diagnoses_ICD (merged)
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:Admissions)
    MATCH (m:Diagnoses_ICD)
    WHERE n.hadm_id = m.hadm_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:HAS_DIAGNOSIS]->(m)", 
    {batchSize:1000}
 )
  
//  Admissions --HAS_PHARMACY--> Pharmacy 
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:Admissions)
    MATCH (m:Pharmacy)
    WHERE n.hadm_id = m.hadm_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:HAS_PHARMACY]->(m)", 
    {batchSize:1000}
 )
 
 
//  Admissions --HAS_EMAR--> EMAR (merged)
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:Admissions)
    MATCH (m:EMAR)
    WHERE n.hadm_id = m.hadm_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:HAS_EMAR]->(m)", 
    {batchSize:1000}
 )
  
//  Admissions --HAS_ICU_STAY--> ICU_Stays 
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:Admissions)
    MATCH (m:ICU_Stays)
    WHERE n.hadm_id = m.hadm_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:HAS_ICU_STAY]->(m)", 
    {batchSize:1000}
 )
 
 // ICU STAYs --> EVENTS 


//  ICU_Stays --INVOLVED--> Input_Events  
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:ICU_Stays)
    MATCH (m:Input_Events)
    WHERE n.stay_id = m.stay_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:INVOLVED]->(m)", 
    {batchSize:1000}
 )

//  ICU_Stays --INVOLVED--> Output_Events  
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:ICU_Stays)
    MATCH (m:Output_Events)
    WHERE n.stay_id = m.stay_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:INVOLVED]->(m)", 
    {batchSize:1000}
 )
 
 //  ICU_Stays --INVOLVED--> Procedure_Events  
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:ICU_Stays)
    MATCH (m:Procedure_Events)
    WHERE n.stay_id = m.stay_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:INVOLVED]->(m)", 
    {batchSize:1000}
 )

 //  ICU_Stays --INVOLVED--> Chart_Events  
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:ICU_Stays)
    MATCH (m:Chart_Events)
    WHERE n.stay_id = m.stay_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:INVOLVED]->(m)", 
    {batchSize:1000}
 )
 
 //  ICU_Stays --INVOLVED--> Datetime_Events  
CALL apoc.periodic.iterate(
    // 1
    "MATCH (n:ICU_Stays)
    MATCH (m:Datetime_Events)
    WHERE n.stay_id = m.stay_id
    RETURN n, m",
    //2 
    "MERGE(n)-[r:INVOLVED]->(m)", 
    {batchSize:1000}
 )


// NEXT 
CALL apoc.periodic.iterate(
    'MATCH (p:Patients) RETURN p',
    'MATCH (p)-[:HAS_ADMISSION]->(e:Admissions)
    WITH e
    ORDER BY e.admittime
    WITH collect(e) AS admissions
    WITH admissions, admissions[1..] as nextAdmissions
    UNWIND range(0,size(nextAdmissions)-1,1) as index
    WITH admissions[index] as first, nextAdmissions[index] as second
    CREATE (first)-[:NEXT]->(second)',{iterateList:false});

// END 
:auto
MATCH (n:Admissions)
WHERE NOT (n)-[:NEXT]->() 
CALL { 
WITH n
SET n.lastAdmission = true
} IN TRANSACTIONS OF 500 ROWS;


// START 
:auto
MATCH (n:Admissions)
WHERE NOT (n)<-[:NEXT]-() 
CALL { 
WITH n
SET n.firstAdmission = true
} IN TRANSACTIONS OF 500 ROWS;