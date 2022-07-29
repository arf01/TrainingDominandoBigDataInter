EXPORT File_Raw := MODULE
  EXPORT Layout := RECORD
    STRING field1;
    STRING id;
    STRING loan_amnt;
    STRING funded_amnt;
    STRING funded_amnt_inv;
    STRING term;
    STRING int_rate;
    STRING installment;
    STRING grade;
    STRING sub_grade;
    STRING emp_title;
    STRING emp_length;
    STRING home_ownership;
    STRING annual_inc;
    STRING verification_status;
    STRING issue_d;
    STRING loan_status;
    STRING pymnt_plan;
    STRING url;
    STRING purpose;
    STRING title;
    STRING zip_code;
    STRING addr_state;
    STRING dti;
    STRING delinq_2yrs;
    STRING earliest_cr_line;
    STRING fico_range_low;
    STRING fico_range_high;
    STRING inq_last_6mths;
    STRING mths_since_last_delinq;
    STRING mths_since_last_record;
    STRING open_acc;
    STRING pub_rec;
    STRING revol_bal;
    STRING revol_util;
    STRING total_acc;
    STRING initial_list_status;
    STRING out_prncp;
    STRING out_prncp_inv;
    STRING total_pymnt;
    STRING total_pymnt_inv;
    STRING total_rec_prncp;
    STRING total_rec_int;
    STRING total_rec_late_fee;
    STRING recoveries;
    STRING collection_recovery_fee;
    STRING last_pymnt_d;
    STRING last_pymnt_amnt;
    STRING next_pymnt_d;
    STRING last_credit_pull_d;
    STRING last_fico_range_high;
    STRING last_fico_range_low;
    STRING collections_12_mths_ex_med;
    STRING mths_since_last_major_derog;
    STRING policy_code;
    STRING application_type;
    STRING annual_inc_joint;
    STRING dti_joint;
    STRING verification_status_joint;
    STRING acc_now_delinq;
    STRING tot_coll_amt;
    STRING tot_cur_bal;
    STRING open_acc_6m;
    STRING open_act_il;
    STRING open_il_12m;
    STRING open_il_24m;
    STRING mths_since_rcnt_il;
    STRING total_bal_il;
    STRING il_util;
    STRING open_rv_12m;
    STRING open_rv_24m;
    STRING max_bal_bc;
    STRING all_util;
    STRING total_rev_hi_lim;
    STRING inq_fi;
    STRING total_cu_tl;
    STRING inq_last_12m;
    STRING acc_open_past_24mths;
    STRING avg_cur_bal;
    STRING bc_open_to_buy;
    STRING bc_util;
    STRING chargeoff_within_12_mths;
    STRING delinq_amnt;
    STRING mo_sin_old_il_acct;
    STRING mo_sin_old_rev_tl_op;
    STRING mo_sin_rcnt_rev_tl_op;
    STRING mo_sin_rcnt_tl;
    STRING mort_acc;
    STRING mths_since_recent_bc;
    STRING mths_since_recent_bc_dlq;
    STRING mths_since_recent_inq;
    STRING mths_since_recent_revol_delinq;
    STRING num_accts_ever_120_pd;
    STRING num_actv_bc_tl;
    STRING num_actv_rev_tl;
    STRING num_bc_sats;
    STRING num_bc_tl;
    STRING num_il_tl;
    STRING num_op_rev_tl;
    STRING num_rev_accts;
    STRING num_rev_tl_bal_gt_0;
    STRING num_sats;
    STRING num_tl_120dpd_2m;
    STRING num_tl_30dpd;
    STRING num_tl_90g_dpd_24m;
    STRING num_tl_op_past_12m;
    STRING pct_tl_nvr_dlq;
    STRING percent_bc_gt_75;
    STRING pub_rec_bankruptcies;
    STRING tax_liens;
    STRING tot_hi_cred_lim;
    STRING total_bal_ex_mort;
    STRING total_bc_limit;
    STRING total_il_high_credit_limit;
    STRING revol_bal_joint;
    STRING sec_app_fico_range_low;
    STRING sec_app_fico_range_high;
    STRING sec_app_earliest_cr_line;
    STRING sec_app_inq_last_6mths;
    STRING sec_app_mort_acc;
    STRING sec_app_open_acc;
    STRING sec_app_revol_util;
    STRING sec_app_open_act_il;
    STRING sec_app_num_rev_accts;
    STRING sec_app_chargeoff_within_12_mths;
    STRING sec_app_collections_12_mths_ex_med;
    STRING hardship_flag;
    STRING hardship_type;
    STRING hardship_reason;
    STRING hardship_status;
    STRING deferral_term;
    STRING hardship_amount;
    STRING hardship_start_date;
    STRING hardship_end_date;
    STRING payment_plan_start_date;
    STRING hardship_length;
    STRING hardship_dpd;
    STRING hardship_loan_status;
    STRING orig_projected_additional_accrued_interest;
    STRING hardship_payoff_balance_amount;
    STRING hardship_last_payment_amount;
    STRING debt_settlement_flag;
  END;

  EXPORT NewLayout := RECORD
    UNSIGNED3 field1;
    STRING40 id;
    UNSIGNED3 loan_amnt;
    UNSIGNED3 funded_amnt;
    REAL8 funded_amnt_inv;
    STRING9 term;
    STRING6 int_rate;
    REAL4 installment;
    STRING1 grade;
    STRING2 sub_grade;
    STRING78 emp_title;
    STRING9 emp_length;
    STRING8 home_ownership;
    REAL8 annual_inc;
    STRING15 verification_status;
    STRING8 issue_d;
    STRING51 loan_status;
    STRING1 pymnt_plan;
    STRING66 url;
    STRING18 purpose;
    STRING81 title;
    STRING5 zip_code;
    STRING2 addr_state;
    REAL4 dti;
    UNSIGNED1 delinq_2yrs;
    STRING8 earliest_cr_line;
    UNSIGNED2 fico_range_low;
    UNSIGNED2 fico_range_high;
    UNSIGNED1 inq_last_6mths;
    UNSIGNED2 mths_since_last_delinq;
    UNSIGNED2 mths_since_last_record;
    UNSIGNED2 open_acc;
    UNSIGNED1 pub_rec;
    UNSIGNED4 revol_bal;
    STRING6 revol_util;
    UNSIGNED2 total_acc;
    STRING1 initial_list_status;
    REAL8 out_prncp;
    REAL8 out_prncp_inv;
    REAL8 total_pymnt;
    REAL8 total_pymnt_inv;
    REAL8 total_rec_prncp;
    REAL8 total_rec_int;
    REAL8 total_rec_late_fee;
    REAL8 recoveries;
    REAL8 collection_recovery_fee;
    STRING8 last_pymnt_d;
    REAL8 last_pymnt_amnt;
    STRING8 next_pymnt_d;
    STRING8 last_credit_pull_d;
    UNSIGNED2 last_fico_range_high;
    UNSIGNED2 last_fico_range_low;
    UNSIGNED1 collections_12_mths_ex_med;
    UNSIGNED2 mths_since_last_major_derog;
    UNSIGNED1 policy_code;
    STRING10 application_type;
    REAL8 annual_inc_joint;
    REAL4 dti_joint;
    STRING15 verification_status_joint;
    UNSIGNED1 acc_now_delinq;
    UNSIGNED4 tot_coll_amt;
    UNSIGNED4 tot_cur_bal;
    UNSIGNED1 open_acc_6m;
    UNSIGNED1 open_act_il;
    UNSIGNED1 open_il_12m;
    UNSIGNED1 open_il_24m;
    UNSIGNED2 mths_since_rcnt_il;
    UNSIGNED4 total_bal_il;
    UNSIGNED2 il_util;
    UNSIGNED1 open_rv_12m;
    UNSIGNED1 open_rv_24m;
    UNSIGNED4 max_bal_bc;
    UNSIGNED2 all_util;
    UNSIGNED4 total_rev_hi_lim;
    UNSIGNED1 inq_fi;
    UNSIGNED2 total_cu_tl;
    UNSIGNED1 inq_last_12m;
    UNSIGNED1 acc_open_past_24mths;
    UNSIGNED3 avg_cur_bal;
    UNSIGNED3 bc_open_to_buy;
    REAL4 bc_util;
    UNSIGNED1 chargeoff_within_12_mths;
    UNSIGNED3 delinq_amnt;
    UNSIGNED2 mo_sin_old_il_acct;
    UNSIGNED2 mo_sin_old_rev_tl_op;
    UNSIGNED2 mo_sin_rcnt_rev_tl_op;
    UNSIGNED2 mo_sin_rcnt_tl;
    UNSIGNED1 mort_acc;
    UNSIGNED2 mths_since_recent_bc;
    UNSIGNED2 mths_since_recent_bc_dlq;
    UNSIGNED1 mths_since_recent_inq;
    UNSIGNED2 mths_since_recent_revol_delinq;
    UNSIGNED1 num_accts_ever_120_pd;
    UNSIGNED1 num_actv_bc_tl;
    UNSIGNED1 num_actv_rev_tl;
    UNSIGNED1 num_bc_sats;
    UNSIGNED1 num_bc_tl;
    UNSIGNED2 num_il_tl;
    UNSIGNED1 num_op_rev_tl;
    UNSIGNED2 num_rev_accts;
    UNSIGNED1 num_rev_tl_bal_gt_0;
    UNSIGNED2 num_sats;
    UNSIGNED1 num_tl_120dpd_2m;
    UNSIGNED1 num_tl_30dpd;
    UNSIGNED1 num_tl_90g_dpd_24m;
    UNSIGNED1 num_tl_op_past_12m;
    REAL4 pct_tl_nvr_dlq;
    REAL4 percent_bc_gt_75;
    UNSIGNED1 pub_rec_bankruptcies;
    UNSIGNED1 tax_liens;
    UNSIGNED4 tot_hi_cred_lim;
    UNSIGNED4 total_bal_ex_mort;
    UNSIGNED4 total_bc_limit;
    UNSIGNED4 total_il_high_credit_limit;
    UNSIGNED4 revol_bal_joint;
    UNSIGNED2 sec_app_fico_range_low;
    UNSIGNED2 sec_app_fico_range_high;
    STRING8 sec_app_earliest_cr_line;
    UNSIGNED1 sec_app_inq_last_6mths;
    UNSIGNED1 sec_app_mort_acc;
    UNSIGNED1 sec_app_open_acc;
    REAL4 sec_app_revol_util;
    UNSIGNED1 sec_app_open_act_il;
    UNSIGNED2 sec_app_num_rev_accts;
    UNSIGNED1 sec_app_chargeoff_within_12_mths;
    UNSIGNED1 sec_app_collections_12_mths_ex_med;
    STRING1 hardship_flag;
    STRING31 hardship_type;
    STRING21 hardship_reason;
    STRING9 hardship_status;
    UNSIGNED1 deferral_term;
    REAL4 hardship_amount;
    STRING8 hardship_start_date;
    STRING8 hardship_end_date;
    STRING8 payment_plan_start_date;
    UNSIGNED1 hardship_length;
    UNSIGNED1 hardship_dpd;
    STRING18 hardship_loan_status;
    REAL8 orig_projected_additional_accrued_interest;
    REAL8 hardship_payoff_balance_amount;
    REAL8 hardship_last_payment_amount;
    STRING1 debt_settlement_flag;
END;


  EXPORT Dataset_optimized := DATASET('~arf::loan_status_2007-2020q3.gzip',NewLayout,CSV(HEADING(1)));

  //New record structure for training the property price model
	EXPORT MLraw := RECORD
    //////////////////////
    REAL funded_amnt_inv;  //rodou
    REAL installment;   ///////////////////////////////s
    //REAL out_prncp;    //////xxxxx
    //REAL out_prncp_inv;   ///////////xxxxxx
    //REAL total_pymnt;      ///////////xxxx
    //REAL total_pymnt_inv;   //////xxxxx
    //REAL total_rec_prncp;    ///////////xxxx
    //REAL total_rec_int;     ///xxxxxxxx
    //REAL total_rec_late_fee;   /////////xxxxxxxx
    //REAL recoveries;  ////////xxxxxxxxxxxxx
    //REAL collection_recovery_fee;   ////////////xxxxxxx
    //REAL last_pymnt_amnt;  //////xxxxxxxx
    //REAL annual_inc_joint;      ///xxxxxxxxxxxxxxxx
    //REAL dti_joint;   ////XXXXXXXXXXX
    //REAL bc_util;        /////XXXXXXX
    REAL pct_tl_nvr_dlq;     ///////////rodou
    //REAL percent_bc_gt_75;  /////xxxxxxx
    //REAL sec_app_revol_util;     /////xxxxxxx
    //REAL hardship_amount;   ///////xxxx
    //REAL orig_projected_additional_accrued_interest; //////xxxxxx
    //REAL hardship_payoff_balance_amount;   //////////xxxxxx
    //REAL hardship_last_payment_amount;   /////xxxxxxx

    
		REAL annual_inc;    			//renda anual
		REAL dti;           			//razão entre pagamento mensal de dividas e renda mensal
		UNSIGNED2 fico_range_low; // Score de credito do individuo
		UNSIGNED3 loan_amnt;      // valor do emprestimo
		UNSIGNED1 mort_acc;       // numero de hipotecas
		UNSIGNED1 tax_liens;      // numero de propriedades penhoradas para pagamento de impostos
		
    UNSIGNED2 all_util;  			//razão entre saldo e limite de crédito
    //////////////////////////
    //UNSIGNED2 emp_title_code;   //ns
    //UNSIGNED2 acc_now_delinq_code;  //n
    //UNSIGNED2 home_ownership_code1;   //n
    //UNSIGNED2 emp_length_code;   //n
    //UNSIGNED2 grade_code;   //sn
    //UNSIGNED2 home_ownership_code;  //n
    //UNSIGNED2 initial_list_status_code;   //sn
    //UNSIGNED2 sub_grade_code; //n
    //UNSIGNED2 term_code;  //n
    //UNSIGNED2 application_type_code; //n
    //UNSIGNED2 purpose_code;  //n
    //UNSIGNED2 verification_status_code;  //n
    //UNSIGNED2 verification_status_joint_code;  //n
    UNSIGNED1 loan_status;
    
    
  END;  //*/// preciso decidir quais colunas entram
END;