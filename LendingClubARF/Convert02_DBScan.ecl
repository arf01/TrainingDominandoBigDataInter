IMPORT $;
IMPORT ML_Core;
myTrainData := $.Prep01.myTrainData;
//Add a sequential ID
ML_Core.AppendSeqId(myTrainData,id,myTrainIDData); 
//OUTPUT(myTrainIDData, NAMED('TrainDataID'));  //Uncomment to spot the sequential recid field created
//Numeric Field Matrix conversion
ML_Core.ToField(myTrainIDData, myTrainIDDataNF);
//OUTPUT(myTrainIDDataNF, NAMED('TrainDataNF'));  //Uncomment to spot the Numeric Field Matrix conversion
//* <-- Delete the first forward slash (/) just before the asterisk (*) to comment out the entire MODULE
EXPORT Convert02_DBScan := MODULE
  //Calculate basic statistics for the field values
  EXPORT myAggs := ML_Core.FieldAggregates(myTrainIDDataNF).simple;
  
	//Function to standardize the field values 
  fSTD(REAL fieldval, UNSIGNED varnum):= (fieldval-myAggs(number=varnum)[1].mean)/myAggs(number=varnum)[1].sd;
  RECORDOF(myTrainIDData) ML_STD(myTrainIDData Le) := TRANSFORM

	    SELF.funded_amnt_inv        := fSTD(Le.funded_amnt_inv,1);
	    SELF.installment     := fSTD(Le.installment,2);
	    SELF.out_prncp   := fSTD(Le.out_prncp,3);
	    SELF.out_prncp_inv := fSTD(Le.out_prncp_inv,4);
	//  SELF.total_pymnt             := fSTD(Le.total_pymnt,5);
	//	SELF.total_pymnt_inv        := fSTD(Le.total_pymnt_inv,6);
	//	SELF.total_rec_prncp       := fSTD(Le.total_rec_prncp,7);
	//  SELF.total_rec_int              := fSTD(Le.total_rec_int,8);
		SELF.total_rec_late_fee        := fSTD(Le.total_rec_late_fee,9);
		SELF.recoveries            := fSTD(Le.recoveries,10);
	//	SELF.collection_recovery_fee         := fSTD(Le.collection_recovery_fee,11);
		SELF.last_pymnt_amnt             := fSTD(Le.last_pymnt_amnt,12);
		//ELF.annual_inc_joint           := fSTD(Le.annual_inc_joint,13);
	//	SELF.dti_joint := fSTD(Le.dti_joint,14);
	//  SELF.bc_util             := fSTD(Le.bc_util,15);
		SELF.pct_tl_nvr_dlq        := fSTD(Le.pct_tl_nvr_dlq,16);
	//	SELF.percent_bc_gt_75       := fSTD(Le.percent_bc_gt_75,17);
	//	SELF.sec_app_revol_util              := fSTD(Le.sec_app_revol_util,18);
	//	SELF.hardship_amount        := fSTD(Le.hardship_amount,19);
	//	SELF.orig_projected_additional_accrued_interest            := fSTD(Le.orig_projected_additional_accrued_interest,20);
	//	SELF.hardship_payoff_balance_amount         := fSTD(Le.hardship_payoff_balance_amount,21);
	//	SELF.hardship_last_payment_amount             := fSTD(Le.hardship_last_payment_amount,22);
		SELF.annual_inc         := fSTD(Le.annual_inc,23);
		SELF.dti             := fSTD(Le.dti,24);
    SELF                       := Le;
   END;
	 
  //Project for value standardization
  EXPORT myTrainDataSTD := PROJECT(myTrainIDData,ML_STD(LEFT));
  //Numeric Field Matrix conversion for standardized values
	ML_Core.ToField(myTrainDataSTD,myTrainDataSTDNF);
	
  //We have 10 numeric attributes for clustering  
	EXPORT myTrainAttrNF := myTrainDataSTDNF(number < 10);
END;
// */
