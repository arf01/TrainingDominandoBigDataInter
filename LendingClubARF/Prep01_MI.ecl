IMPORT $;
raw := $.File_Binomial.Dataset_binomial;
ML_raw  := $.File_raw.MLraw;
// */
//////////////////////////////////////////////////////////////////////////////////////////

EXPORT Prep01_MI := MODULE
  MLrawExt := RECORD(ML_raw)
    UNSIGNED4 rnd; // A random number
  END;  
  // Clean the data and assign a random number to each record
  CleanFilter := raw.loan_amnt <> 0 AND raw.fico_range_low <> 0 AND raw.annual_inc >= 5000 AND raw.all_util <> 0 AND raw.hardship_flag <> 'Y';//AND raw.all_util <> 'all_util'; //AND raw.year_acquired <> 0 AND 
                 //raw.land_square_footage <> 0 AND raw.living_square_feet <> 0 AND 
                // reaw.bedrooms <> 0 AND raw.year_Built <> 0; //preciso definir como as colunas vao ser filtradas


  MLrawExt ML_Clean(raw le, INTEGER Cnt) := TRANSFORM
   SELF.rnd            := RANDOM(); 
  // SELF.emp_title_code := (UNSIGNED1)IF(Le.emp_title = 'Unemployed' OR Le.emp_title = 'unemployed' OR Le.emp_title = 'Jobless' OR Le.emp_title = 'jobless' OR Le.emp_title = 'Unplaced' OR Le.emp_title = 'unplaced' OR Le.emp_title = '',0,1);       
 //  SELF.acc_now_delinq_code   := IF(Le.acc_now_delinq <> 0 ,0,1);    
 //  SELF.home_ownership_code1  := (UNSIGNED1)IF(Le.home_ownership = 'MORTGAGE' OR Le.home_ownership = 'ANY' ,0,1); 
 //  SELF.emp_length_code := $.DCTs.mapcode_emp_length(Le.emp_length); 
   //SELF.grade_code := $.DCTs.mapcode_grade(Le.grade); 
 //  SELF.home_ownership_code  := $.DCTs.mapcode_home_ownership(Le.home_ownership); 
  // SELF.initial_list_status_code  := $.DCTs.mapcode_initial_list_status(Le.initial_list_status); 
   //SELF.sub_grade_code  := $.DCTs.mapcode_sub_grade(Le.sub_grade);
 //  SELF.term_code  := $.DCTs.mapcode_term(Le.term);
 //  SELF.application_type_code  := $.DCTs.mapcode_application_type(Le.application_type);
 //  SELF.purpose_code  := $.DCTs.mapcode_purpose(Le.purpose);
 //  SELF.verification_status_code  := $.DCTs.mapcode_verification_status(Le.verification_status);
 //  SELF.verification_status_joint_code  := $.DCTs.mapcode_verification_status_joint(Le.verification_status_joint);


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
