IMPORT $;
raw := $.File_Binomial.Dataset_binomial;
ML_raw  := $.File_raw.MLraw;
// */
//////////////////////////////////////////////////////////////////////////////////////////

EXPORT Prep01 := MODULE
  MLrawExt := RECORD(ML_raw)
    UNSIGNED4 rnd; // A random number
  END;  
  // Clean the data and assign a random number to each record
  CleanFilter := raw.loan_amnt > 0 AND raw.fico_range_low <> 0 AND raw.Loan_Status= 0 ;// AND raw.total_rec_late_fee < 100 AND raw.out_prncp =0 AND raw.out_prncp_inv =0 AND raw.pct_tl_nvr_dlq= 0 AND raw.mort_acc=0  AND raw.tax_liens =0  and raw.all_util =0 AND raw.annual_inc >= 12000 AND raw.installment > 0 AND raw.fico_range_low >=640 AND raw.hardship_flag <> 'Y' and raw.funded_amnt_inv >=1000 and raw.funded_amnt_inv<=100000;
  //AND raw.Loan_Status= 0 ;//AND raw.pct_tl_nvr_dlq   AND raw.installment <> 0 AND raw.fico_range_low >= 660 AND raw.annual_inc >= 10000 AND raw.all_util <> 0 ;
  //raw.annual_inc <= 150000  AND raw.loan_amnt >= 1000 AND raw.loan_amnt <=35000 AND raw.installment <= 1000;

  MLrawExt ML_Clean(raw le, INTEGER Cnt) := TRANSFORM
   SELF.rnd            := RANDOM(); 
   /*SELF.emp_title_code := (UNSIGNED1)IF(Le.emp_title = 'Unemployed' OR Le.emp_title = 'unemployed' OR Le.emp_title = 'Jobless' OR Le.emp_title = 'jobless' OR Le.emp_title = 'Unplaced' OR Le.emp_title = 'unplaced' OR Le.emp_title = '',0,1);       
   SELF.acc_now_delinq_code   := IF(Le.acc_now_delinq <> 0 ,0,1);    
   SELF.home_ownership_code1  := (UNSIGNED1)IF(Le.home_ownership = 'MORTGAGE' OR Le.home_ownership = 'ANY' ,0,1); 
   SELF.emp_length_code := $.DCTs.mapcode_emp_length(Le.emp_length); 
   SELF.grade_code := $.DCTs.mapcode_grade(Le.grade); 
   SELF.home_ownership_code  := $.DCTs.mapcode_home_ownership(Le.home_ownership); 
   SELF.initial_list_status_code  := $.DCTs.mapcode_initial_list_status(Le.initial_list_status); 
   SELF.sub_grade_code  := $.DCTs.mapcode_sub_grade(Le.sub_grade);
   SELF.term_code  := $.DCTs.mapcode_term(Le.term);
   SELF.application_type_code  := $.DCTs.mapcode_application_type(Le.application_type);
   SELF.purpose_code  := $.DCTs.mapcode_purpose(Le.purpose);
   SELF.verification_status_code  := $.DCTs.mapcode_verification_status(Le.verification_status);
   SELF.verification_status_joint_code  := $.DCTs.mapcode_verification_status_joint(Le.verification_status_joint);
   */

   // SELF.emp_title_code := (UNSIGNED1)IF(Le.emp_title = 'Unemployed' OR Le.emp_title = 'unemployed' OR Le.emp_title = 'Jobless' OR Le.emp_title = 'jobless' OR Le.emp_title = 'Unplaced' OR Le.emp_title = 'unplaced' OR Le.emp_title = '',0,1);       
 //  SELF.acc_now_delinq_code   := IF(Le.acc_now_delinq <> 0 ,0,1);    
  // SELF.home_ownership_code1  := (UNSIGNED1)IF(Le.home_ownership = 'MORTGAGE' OR Le.home_ownership = 'ANY' ,0,1); 
 //  SELF.emp_length_code := $.DCTs.mapcode_emp_length(Le.emp_length); 
  // SELF.grade_code := $.DCTs.mapcode_grade(Le.grade); 
 //  SELF.home_ownership_code  := $.DCTs.mapcode_home_ownership(Le.home_ownership); 
  // SELF.initial_list_status_code  := $.DCTs.mapcode_initial_list_status(Le.initial_list_status); 
 //  SELF.sub_grade_code  := $.DCTs.mapcode_sub_grade(Le.sub_grade);
  // SELF.term_code  := $.DCTs.mapcode_term(Le.term);
 //  SELF.application_type_code  := $.DCTs.mapcode_application_type(Le.application_type);
 //  SELF.purpose_code  := $.DCTs.mapcode_purpose(Le.purpose);
 //  SELF.verification_status_code  := $.DCTs.mapcode_verification_status(Le.verification_status);
  // SELF.verification_status_joint_code  := $.DCTs.mapcode_verification_status_joint(Le.verification_status_joint);


   //SELF.monthcode      := $.DCTs.MapMth2Code(Le.Month);  //exemplo
   SELF := Le;
  END;

  EXPORT myDataE := PROJECT(raw(CleanFilter), ML_Clean(LEFT,COUNTER));
//	*/		//preciso definir como as colunas vao ser filtradas


///////////////////////////////////////////////////////////////////////////////////////////////////////////



  // Shuffle your data by sorting on the random field
  SHARED myDataES := SORT(myDataE, rnd);
  // Now cut the deck and you have random samples within each set
  // While you're at it, project back to your original format -- we dont need the rnd field anymore
  // Treat first 5000 as training data.  Transform back to the original format.
  EXPORT myTrainData := PROJECT(myDataES[1..5000], ML_raw);  
  // Treat next 2000 as test data
  EXPORT myTestData  := PROJECT(myDataES[5001..7000], ML_raw); // 
END; 
