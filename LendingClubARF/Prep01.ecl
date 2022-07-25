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
  CleanFilter := raw.all_util <> 0 AND  raw.fico_range_low < 10000 AND raw.mort_acc > 0 AND raw.tax_liens > 0;//AND raw.all_util <> 'all_util'; //AND raw.year_acquired <> 0 AND 
                 //raw.land_square_footage <> 0 AND raw.living_square_feet <> 0 AND 
                // reaw.bedrooms <> 0 AND raw.year_Built <> 0; //preciso definir como as colunas vao ser filtradas
							 
  EXPORT myDataE := PROJECT(raw(CleanFilter), TRANSFORM(MLrawExt, 
                                                             SELF.rnd := RANDOM(),
                                                             SELF := LEFT));
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
