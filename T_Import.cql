// T_Admission
:auto LOAD CSV WITH HEADERS FROM 'file:///t_admissions.csv' AS line
CALL {
	WITH line
	CREATE (:Admissions { 
		subject_id: toInteger(line.subject_id), 
		hadm_id: toInteger(line.hadm_id), 
		admittime: datetime( REPLACE(line.admittime, ' ', 'T')), 
		dischtime: datetime( REPLACE(line.dischtime, ' ', 'T')), 
		deathtime: datetime( REPLACE(line.deathtime, ' ', 'T')), 
		admission_type: line.admission_type, 
		admit_provider_id: toInteger(line.admit_provider_id),
		admission_location: line.admission_location, 
		discharge_location: line.discharge_location, 
		insurance: line.insurance, 
		language: line.language, 
		marital_status: line.marital_status, 
		race: line.race, 
		edregtime: datetime( REPLACE(line.edregtime, ' ', 'T')), 
		edouttime: datetime( REPLACE(line.edouttime, ' ', 'T')), 
		hospital_expire_flag: toInteger(line.hospital_expire_flag)
	})
} IN TRANSACTIONS OF 500 ROWS

// T_Diagnoses_ICD_Merged 
:auto LOAD CSV WITH HEADERS FROM 'file:///t_diagnoses_icd_merged.csv' AS line
CALL {
	WITH line
	CREATE (:Diagnoses_ICD { 
		subject_id: toInteger(line.subject_id),
		hadm_id: toInteger(line.hadm_id), 
		seq_num: toInteger(line.seq_num),
		icd_code: line.icd_code,
		icd_version: toInteger(line.icd_version),
        long_title: line.long_title
	})
} IN TRANSACTIONS OF 500 ROWS

// T_DRG_COdes
:auto LOAD CSV WITH HEADERS FROM 'file:///t_drgcodes.csv' AS line
CALL {
	WITH line
	CREATE (:DRG_Codes { 
        subject_id: toInteger(line.subject_id), 
        hadm_id: toInteger(line.hadm_id), 
		drg_type: line.drg_type, 
        drg_code: line.drg_code, 
        description: line.description, 
		drg_severity: toInteger(line.drg_severity), 
        drg_mortality: toInteger(line.drg_mortality)})
} IN TRANSACTIONS OF 500 ROWS


// EMAR_merged 
:auto LOAD CSV WITH HEADERS FROM 'file:///t_emar_merged.csv' AS line
CALL {
	WITH line
	CREATE (:EMAR { 
		subject_id: toInteger(line.subject_id),
		hadm_id: toInteger(line.hadm_id), 
		emar_id: line.emar_id,
		emar_seq: toInteger(line.emar_seq),
		poe_id: line.poe_id,
		pharmacy_id: toInteger(line.pharmacy_id),
		enter_provider_id: toInteger(line.enter_provider_id),
		charttime: datetime( REPLACE(line.charttime, ' ', 'T')),
		medication: line.medication,
		event_txt: line.event_txt,
		scheduletime: datetime( REPLACE(line.scheduletime, ' ', 'T')),
		storetime: datetime( REPLACE(line.storetime, ' ', 'T')),
		parent_field_ordinal: toFloat(line.parent_field_ordinal),
		administration_type: line.administration_type,
		barcode_type: line.barcode_type,
		reason_for_no_barcode: line.reason_for_no_barcode,
		complete_dose_not_given: line.complete_dose_not_given,
		dose_due: toFloat(line.dose_due),
		dose_due_unit: line.dose_due_unit,
		will_remainder_of_dose_be_given: line.will_remainder_of_dose_be_given,
		product_amount_given: toFloat(line.product_amount_given),
		product_unit: line.product_unit,
		product_code: line.product_code,
		product_description: line.product_description, 
		product_description_other: line.product_description_other,
		prior_infusion_rate: toFloat(line.prior_infusion_rate), 
		infusion_rate: toFloat(line.infusion_rate), 
		infusion_rate_adjustment: line.infusion_rate_adjustment,
		infusion_rate_adjustment_amount: toFloat(line.infusion_rate_adjustment_amount),
		infusion_rate_unit: line.infusion_rate_unit, 
		route: line.route, 
		infusion_complete: line.infusion_complete,
		completion_interval: line.completion_interval,
		new_iv_bag_hung: line.new_iv_bag_hung,
		continued_infusion_in_other_location: line.continued_infusion_in_other_location, 
		restart_interval: line.restart_interval, 
		side: line.side,
		site: line.site,
		non_formulary_visual_verification: line.non_formulary_visual_verification
	})
} IN TRANSACTIONS OF 500 ROWS

//hcpcs_events_merged
:auto LOAD CSV WITH HEADERS FROM 'file:///t_hcpcsevents_merged.csv' AS line
CALL {
	WITH line
	CREATE (:HCPCS_Events { 
		subject_id: toInteger(line.subject_id),
		hadm_id: toInteger(line.hadm_id), 
		chartdate: datetime( REPLACE(line.chartdate, ' ', 'T')),
		hcpcs_cd: line.hcpcs_cd, 
		seq_num: toInteger(line.seq_num),
		short_description: line.short_description,
		long_description: line.long_description
	})
} IN TRANSACTIONS OF 500 ROWS

// lab events merged
:auto LOAD CSV WITH HEADERS FROM 'file:///t_labevents_merged.csv' AS line
CALL {
	WITH line
	CREATE (:Lab_Events { 
        labevent_id: toInteger(line.labevent_id), 
		subject_id: toInteger(line.subject_id), 
		hadm_id: toInteger(line.hadm_id), 
		specimen_id: toInteger(line.specimen_id),
		itemid: toInteger(line.itemid), 
        fluid: line.fluid,
		label: line.label,
		category: line.category,
		order_provider_id: line.order_provider_id,
		charttime: datetime( REPLACE(line.charttime, ' ', 'T')), 
		storetime: datetime( REPLACE(line.storetime, ' ', 'T')), 
		value: toFloat(line.value), 
		valuenum: toFloat(line.valuenum), 
		valueuom: line.valueuom, 
		ref_range_lower: toFloat(line.ref_range_lower),
		ref_range_upper: toFloat(line.ref_range_upper),
		flag: line.flag,
		priority: line.priority,
		comments: line.comments
	})
} IN TRANSACTIONS OF 500 ROWS

// microbiology 
:auto LOAD CSV WITH HEADERS FROM 'file:///t_microbiologyevents.csv' AS line
CALL {
	WITH line
	CREATE (:Microbiology_Events { 
		microbiology_id: toInteger(line.microbiology_id),
		subject_id: toInteger(line.subject_id), 
		hadm_id: toInteger(line.hadm_id), 
		microbiology_specimen_id: toInteger(line.microbiology_specimen_id),
		order_provider_id: line.order_provider_id,
		chartdate: datetime( REPLACE(line.chartdate, ' ', 'T')),
		charttime: datetime( REPLACE(line.charttime, ' ', 'T')),
		spec_itemid: toInteger(line.spec_itemid), 
		spec_type_desc: line.spec_type_desc,
		test_seq: toInteger(line.test_seq),
		storedate: datetime( REPLACE(line.storedate, ' ', 'T')), 
		storetime: datetime( REPLACE(line.storetime, ' ', 'T')), 
		test_itemid: toInteger(line.test_itemid), 
		test_name: line.test_name, 
		org_itemid: toInteger(line.org_itemid), 
		org_name: line.org_name, 
		isolate_num: toInteger(line.isolate_num), 
		quantity: toInteger(line.quantity),
		ab_itemid: toInteger(line.ab_itemid), 
		ab_name: line.ab_name, 
		dilution_text: line.dilution_text, 
		dilution_comparison: line.dilution_comparison, 
		dilution_value: toFloat(line.dilution_value), 
		interpretation: line.interpretation,
		comments: line.comments
	})
} IN TRANSACTIONS OF 500 ROWS

// T_omr 
:auto LOAD CSV WITH HEADERS FROM 'file:///t_omr.csv' AS line
CALL {
	WITH line
	CREATE (:OMR { 
		subject_id: toInteger(line.subject_id),
		chartdate: datetime( REPLACE(line.chartdate, ' ', 'T')),
		seq_num: toInteger(line.seq_num),
		result_name: line.result_name,
		result_value: line.result_value
	})
} IN TRANSACTIONS OF 50 ROWS


// T_Patients
:auto LOAD CSV WITH HEADERS FROM 'file:///t_patients.csv' AS line
CALL {
	WITH line
	CREATE (:Patients { 
        subject_id: toInteger(line.subject_id), 
        gender: line.gender, 
        anchor_age: toInteger(line.anchor_age), 
        anchor_year: toInteger(line.anchor_year), 
        anchor_year_group: line.anchor_year_group, 
        dod: datetime( REPLACE(line.DOD, ' ', 'T'))})
} IN TRANSACTIONS OF 500 ROWS 

//pharmacy 
:auto LOAD CSV WITH HEADERS FROM 'file:///t_pharmacy.csv' AS line
CALL {
	WITH line
	CREATE (:Pharmacy { 
		subject_id: toInteger(line.subject_id), 
		hadm_id: toInteger(line.hadm_id), 
		pharmacy_id: toInteger(line.pharmacy_id),
		poe_id: toInteger(line.poe_id),
		starttime: datetime( REPLACE(line.starttime, ' ', 'T')), 
		stoptime: datetime( REPLACE(line.stoptime, ' ', 'T')), 
		medication: line.medication,
		proc_type: line.proc_type,
		status: line.status,
		entertime: datetime( REPLACE(line.entertime, ' ', 'T')), 
		verifiedtime: datetime( REPLACE(line.verifiedtime, ' ', 'T')), 
		route: line.route,
		frequency: line.frequency,
		disp_sched: line.disp_sched,
		infusion_type: line.infusion_type,
		sliding_scale: line.sliding_scale,
		lockout_interval: toInteger(line.lockout_interval),
		basal_rate: toFloat(line.basal_rate),
		one_hr_max: line.one_hr_max,
		doses_per_24_hrs: toInteger(line.doses_per_24_hrs),
		duration: toInteger(line.duration),
		duration_interval: line.duration_interval,//starttimeamount
		expiration_value: toInteger(line.expiration_value),
		expiration_unit: line.expiration_unit,
		expirationdate: datetime( REPLACE(line.expirationdate, ' ', 'T')), 
		dispensation: line.dispensation,
		fill_quantity: toFloat(line.fill_quantity)

	})
} IN TRANSACTIONS OF 500 ROWS


//poe_merged 
:auto LOAD CSV WITH HEADERS FROM 'file:///t_poe_merged.csv' AS line
CALL {
	WITH line
	CREATE (:POE { 
		poe_id: line.poe_id,
		poe_seq: toInteger(line.poe_seq),
		subject_id: toInteger(line.subject_id),
		field_name: line.field_name, 
		field_value: line.field_value,
		hadm_id: toInteger(line.hadm_id), 
		ordertime: datetime( REPLACE(line.ordertime, ' ', 'T')),
		order_type: line.order_type,
		order_subtype: line.order_subtype,
		transaction_type: line.transaction_type,
		discontinue_of_poe_id: line.discontinue_of_poe_id,
		discontinued_by_poe_id: line.discontinued_by_poe_id,
		order_provider_id: line.order_provider_id,
		order_status: line.order_status
	})
} IN TRANSACTIONS OF 500 ROWS


// prescriptions 
:auto LOAD CSV WITH HEADERS FROM 'file:///t_prescriptions.csv' AS line
CALL {
	WITH line
	CREATE (:Prescriptions { 
		subject_id: toInteger(line.subject_id), 
		hadm_id: toInteger(line.hadm_id), 
		pharmacy_id: toInteger(line.pharmacy_id),
		poe_id: toInteger(line.poe_id),
		poe_seq: toInteger(line.poe_seq),
		order_provider_id: line.order_provider_id,
		starttime: datetime( REPLACE(line.starttime, ' ', 'T')), 
		stoptime: datetime( REPLACE(line.stoptime, ' ', 'T')), 
		drug: line.drug, 
		drug_type: line.drug_type, 
		formulary_drug_cd: line.formulary_drug_cd, 
		gsn: toInteger(line.gsn), 
		ndc: toInteger(line.ndc), 
		prod_strength: line.prod_strength, 
		form_rx: line.form_rx,
		dose_val_rx: line.dose_val_rx, 
		form_val_disp: line.form_val_disp, 
		form_unit_disp: line.form_unit_disp, 
		doses_per_24_hrs: toInteger(line.doses_per_24_hrs),
		route: line.route
	})
} IN TRANSACTIONS OF 500 ROWS

//procedures_icd_merged 
:auto LOAD CSV WITH HEADERS FROM 'file:///t_procedures_icd_merged.csv' AS line
CALL {
	WITH line
	CREATE (:Procedures_ICD { 
		subject_id: toInteger(line.subject_id),
		hadm_id: toInteger(line.hadm_id), 
		seq_num: toInteger(line.seq_num),
		chartdate: datetime( REPLACE(line.chartdate, ' ', 'T')),
		icd_code: line.icd_code,
		icd_version: toInteger(line.icd_version),
		long_title: line.long_title
	})
} IN TRANSACTIONS OF 500 ROWS

//services 
:auto LOAD CSV WITH HEADERS FROM 'file:///t_services.csv' AS line
CALL {
	WITH line
	CREATE (:Services { 
		subject_id: toInteger(line.subject_id),
		hadm_id: toInteger(line.hadm_id), 
		transfertime: datetime( REPLACE(line.transfertime, ' ', 'T')),
		prev_service: line.prev_service,
		curr_service: line.curr_service
	})
} IN TRANSACTIONS OF 500 ROWS

//transgers 
:auto LOAD CSV WITH HEADERS FROM 'file:///t_transfers.csv' AS line
CALL {
	WITH line
	CREATE (:Transfers { 
		subject_id: toInteger(line.subject_id),
		hadm_id: toInteger(line.hadm_id), 
		transfer_id: toInteger(line.transfer_id), 
		eventtype: line.eventtype,
		careunit: line.careunit,
		intime: datetime( REPLACE(line.intime, ' ', 'T')),
		outtime: datetime( REPLACE(line.outtime, ' ', 'T'))
	})
} IN TRANSACTIONS OF 500 ROWS


// ICU

:auto LOAD CSV WITH HEADERS FROM 'file:///t_icustays.csv' AS line
CALL {
	WITH line
	CREATE (:ICU_Stays { 
		subject_id: toInteger(line.subject_id),
		hadm_id: toInteger(line.hadm_id), 
		stay_id: toInteger(line.stay_id),
		first_careunit: line.first_careunit, 
		last_careunit: line.last_careunit,
		intime: datetime( REPLACE(line.intime, ' ', 'T')),
		outtime: datetime( REPLACE(line.outtime, ' ', 'T')),
		los: toFloat(line.LOS)
	})
} IN TRANSACTIONS OF 500 ROWS

// input 
:auto LOAD CSV WITH HEADERS FROM 'file:///t_inputevents_merged.csv' AS line
CALL {
	WITH line
	CREATE (:Input_Events { 
		subject_id: toInteger(line.subject_id),
		hadm_id: toInteger(line.hadm_id), 
		stay_id: toInteger(line.stay_id),
		caregiver_id: toInteger(line.caregiver_id),
		starttime: datetime( REPLACE(line.starttime, ' ', 'T')), 
		endtime: datetime( REPLACE(line.endtime, ' ', 'T')), 
		storetime: datetime( REPLACE(line.storetime, ' ', 'T')), 
		itemid: toInteger(line.itemid),
		label: line.label, 
		category: line.category,
		unitname: line.unitname,
		param_type: line.param_type,
		lownormalvalue: line.lownormalvalue, 
		highnormalvalue: line.highnormalvalue,
		amount: toFloat(line.amount),
		amountuom: line.amountuom,
		rate: toFloat(line.rate),
		rateuom: line.rateuom,
		orderid: toInteger(line.orderid),
		linkorderid: toInteger(line.linkorderid),
		ordercategoryname: line.ordercategoryname,
		secondaryordercategoryname: line.secondaryordercategoryname,
		ordercomponenttypedescription: line.ordercomponenttypedescription,
		ordercategorydescription: line.ordercategorydescription,
		patientweight: toFloat(line.patientweight),
		totalamount: toInteger(line.totalamount),
		totalamountuom: line.totalamountuom,
		isopenbag: toInteger(line.isopenbag),
		continueinnextdept: toInteger(line.continueinnextdept),
		statusdescription: line.statusdescription,
		originalamount: toFloat(line.originalamount),
		originalrate: toFloat(line.originalrate)
	})
} IN TRANSACTIONS OF 500 ROWS


// output 
:auto LOAD CSV WITH HEADERS FROM 'file:///t_outputevents_merged.csv' AS line
CALL {
	WITH line
	CREATE (:Output_Events { 
		subject_id: toInteger(line.subject_id), 
		hadm_id: toInteger(line.hadm_id), 
		stay_id: toInteger(line.stay_id),
		caregiver_id: toInteger(line.caregiver_id),
		charttime: datetime( REPLACE(line.charttime, ' ', 'T')), 
		storetime: datetime( REPLACE(line.storetime, ' ', 'T')), 
		itemid: toInteger(line.itemid), 
		label: line.label,  
		category: line.category,
		unitname: line.unitname,
		param_type: line.param_type,
		lownormalvalue: line.lownormalvalue, 
		highnormalvalue: line.highnormalvalue,
		value: toFloat(line.value),
		valueuom: line.valueuom 
	})
} IN TRANSACTIONS OF 500 ROWS


// procedure
:auto LOAD CSV WITH HEADERS FROM 'file:///t_procedureevents_merged.csv' AS line
CALL {
	WITH line
	CREATE (:Procedure_Events { 
		subject_id: toInteger(line.subject_id),
		hadm_id: toInteger(line.hadm_id), 
		stay_id: toInteger(line.stay_id),
		caregiver_id: toInteger(line.caregiver_id),
		starttime: datetime( REPLACE(line.starttime, ' ', 'T')), 
		endtime: datetime( REPLACE(line.endtime, ' ', 'T')), 
		storetime: datetime( REPLACE(line.storetime, ' ', 'T')), 
		itemid: toInteger(line.itemid),
		label: line.label,  
		category: line.category,
		unitname: line.unitname,
		param_type: line.param_type,
		lownormalvalue: line.lownormalvalue, 
		highnormalvalue: line.highnormalvalue,
		value: toInteger(line.value), 
		valueuom: line.valueuom,
		location: line.location,
		locationcategory: line.locationcategory,
		orderid: toInteger(line.orderid),
		ordercategoryname: line.ordercategoryname,
		ordercategorydescription: line.ordercategorydescription,
		patientweight: toFloat(line.patientweight),
		isopenbag: toInteger(line.isopenbag),
		continueinnextdept: toInteger(line.continueinnextdept),
		statusdescription: line.statusdescription,
		originalamount: toFloat(line.originalamount),
		originalrate: toFloat(line.originalrate)
	})
} IN TRANSACTIONS OF 500 ROWS


//datetimeevent 
:auto LOAD CSV WITH HEADERS FROM 'file:///t_datetimeevents_merged.csv' AS line
CALL {
	WITH line
	CREATE (:Datetime_Events { 
		subject_id: toInteger(line.subject_id), 
		hadm_id: toInteger(line.hadm_id), 
		stay_id: toInteger(line.stay_id),
		caregiver_id: toInteger(line.caregiver_id),
		charttime: datetime( REPLACE(line.charttime, ' ', 'T')), 
		storetime: datetime( REPLACE(line.storetime, ' ', 'T')), 
		itemid: toInteger(line.itemid), 
		label: line.label,  
		category: line.category,
		unitname: line.unitname,
		param_type: line.param_type,
		lownormalvalue: line.lownormalvalue, 
		highnormalvalue: line.highnormalvalue,
		value: line.value, 
		valueuom: line.valueuom, 
		warning: line.warning
	})
} IN TRANSACTIONS OF 500 ROWS


//chart 
:auto LOAD CSV WITH HEADERS FROM 'file:///t_chartevents_merged.csv' AS line
CALL {
	WITH line
	CREATE (:Chart_Events { 
		subject_id: toInteger(line.subject_id), 
		hadm_id: toInteger(line.hadm_id), 
		stay_id: toInteger(line.stay_id),
		caregiver_id: toInteger(line.caregiver_id),
		charttime: datetime( REPLACE(line.charttime, ' ', 'T')), 
		storetime: datetime( REPLACE(line.storetime, ' ', 'T')), 
		itemid: toInteger(line.itemid), 
		label: line.label,  
		category: line.category,
		unitname: line.unitname,
		param_type: line.param_type,
		lownormalvalue: line.lownormalvalue, 
		highnormalvalue: line.highnormalvalue,
		value: line.value, 
		valuenum: toFloat(line.valuenum), 
		valueuom: line.valueuom, 
		warning: line.warning
	})
} IN TRANSACTIONS OF 500 ROWS
