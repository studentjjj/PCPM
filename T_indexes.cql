// INDEXES AND CONSTRAINTS 

// Admissions 
CREATE INDEX FOR (n:Admissions) ON (n.admittime, n.dischtime, n.deathtime);

// Diagnoses_ICD 
CREATE INDEX FOR (n:Diagnoses_ICD) ON (n.long_title);

//Procedures_ICD 
CREATE INDEX FOR (n:Procedures_ICD) ON (n.long_title);

//drgcodes
CREATE INDEX FOR (n:DRG_Codes) ON (n.description, n.drg_severity);
CREATE INDEX FOR (n:DRG_Codes) ON (n.drg_code, n.drg_type);


// emar_merged
CREATE INDEX FOR (n:EMAR) ON (n.poe_id);
CREATE INDEX FOR (n:EMAR) ON (n.pharmacy_id);
CREATE INDEX FOR (n:EMAR) ON (n.medication);
CREATE INDEX FOR (n:EMAR) ON (n.charttime, n.scheduletime, n.storetime);
CREATE INDEX FOR (n:EMAR) ON (n.product_code);
CREATE INDEX FOR (n:EMAR) ON (n.product_description);
CREATE INDEX FOR (n:EMAR) ON (n.route, n.site, n.side);


// HCPCSEVENTS
CREATE INDEX FOR (n:HCPCS_Events) ON (n.short_description);

// labevents
CREATE INDEX FOR (n:Lab_Events) ON  (n.charttime, n.storetime);
CREATE INDEX FOR (n:Lab_Events) ON  (n.specimen_id);
CREATE INDEX FOR (n:Lab_Events) ON (n.label, n.fluid, n.category);

// microbiologyevents
CREATE INDEX FOR (n:Microbiology_Events) ON (n.chartdate, n.charttime, n.storedate, n.storetime);
CREATE INDEX FOR (n:Microbiology_Events) ON (n.spec_itemid, n.test_itemid, n.org_itemid, n.ab_itemid);
CREATE INDEX FOR (n:Microbiology_Events) ON (n.micro_specimen_id);

// patients

CREATE INDEX FOR (n:Patients) ON (n.anchor_age);
CREATE INDEX FOR (n:Patients) ON (n.anchor_year);

// pharmacy
CREATE INDEX FOR (n:Pharmacy) ON (n.poe_id);
CREATE INDEX FOR (n:Pharmacy) ON (n.starttime, n.stoptime);
CREATE INDEX FOR (n:Pharmacy) ON (n.medication);
CREATE INDEX FOR (n:Pharmacy) ON (n.route);

// poe
CREATE INDEX FOR (n:POE) ON (n.order_type);

// prescriptions
CREATE INDEX FOR (n:Prescriptions) ON (n.starttime, n.stoptime);

// transfers
CREATE INDEX FOR (n:Transfers) ON (n.hadm_id);
CREATE INDEX FOR (n:Transfers) ON (n.intime);
CREATE INDEX FOR (n:Transfers) ON (n.careunit);

////////-
// icu //
////////-

//SET search_path TO mimiciv_icu;

// chartevents
CREATE INDEX FOR (n:Chart_Events) ON (n.charttime, n.storetime);
CREATE INDEX FOR (n:Chart_Events) ON (n.label);
CREATE INDEX FOR (n:Chart_Events) ON (n.category);

// datetimeevents
CREATE INDEX FOR (n:Datetime_Events) ON (n.charttime, n.storetime);
CREATE INDEX FOR (n:Datetime_Events) ON (n.value);
CREATE INDEX FOR (n:Datetime_Events) ON (n.label);
CREATE INDEX FOR (n:Datetime_Events) ON (n.category);

// icustays
CREATE INDEX FOR (n:ICU_Stays) ON (n.first_careunit, n.ast_careunit);
CREATE INDEX FOR (n:ICU_Stays) ON (n.intime, n.outtime);
CREATE INDEX FOR (n:ICU_Stays) ON (n.label);
CREATE INDEX FOR (n:ICU_Stays) ON (n.category);

// inputevents
CREATE INDEX FOR (n:Input_Events) ON (n.starttime, n.endtime);
CREATE INDEX FOR (n:Input_Events) ON (n.ordercategorydescription);
CREATE INDEX FOR (n:Input_Events) ON (n.label);
CREATE INDEX FOR (n:Input_Events) ON (n.category);

// outputevents
CREATE INDEX FOR (n:Output_Events) ON (n.charttime, n.storetime);
CREATE INDEX FOR (n:Output_Events) ON (n.label);
CREATE INDEX FOR (n:Output_Events) ON (n.category);
  
// procedureevents
CREATE INDEX FOR (n:Procedure_Events) ON (n.starttime, n.endtime);
CREATE INDEX FOR (n:Procedure_Events) ON (n.ordercategoryname);
CREATE INDEX FOR (n:Procedure_Events) ON (n.label);
CREATE INDEX FOR (n:Procedure_Events) ON (n.category);

