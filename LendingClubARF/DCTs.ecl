// Data Dictionary MODULE for label enconding of the categorical variables
EXPORT DCTs := MODULE
    EXPORT map_emp_length :=
  dataset([
    {'< 1 year', 0}, 
    {'1 year', 1}, 
    {'2 years', 2}, 
    {'3 years', 3}, 
    {'4 years', 4}, 
    {'5 years', 5}, 
    {'6 years', 6}, 
    {'7 years', 7}, 
    {'8 years', 8}, 
    {'9 years', 9}, 
    {'10+ years', 10}], {STRING3 m1,UNSIGNED1 mcode1});
 
	/*EXPORT Mth_DS :=
  dataset([
    {'jan', 1}, 
    {'feb', 2}, 
    {'apr', 4}, 
    {'aug', 8}, 
    {'dec', 12}, 
    {'jul', 7}, 
    {'jun', 6}, 
    {'mar', 3}, 
    {'may', 5}, 
    {'nov', 11}, 
    {'oct', 10}, 
    {'sep', 9}], {STRING3 mon,UNSIGNED1 mcode});
	EXPORT DOW_DS :=
  dataset([
    {'sun', 1}, 
    {'mon', 2}, 
    {'tue', 3}, 
    {'wed', 4}, 
    {'thu', 5}, 
    {'fri', 6}, 
    {'sat', 7}],{STRING3 dow,UNSIGNED1 dowcode});		
EXPORT POut_DS :=
  dataset([
    {'nonexistant', 1}, 
    {'failure', 2}, 
    {'success', 3}],{STRING11 pout,UNSIGNED1 poutcode});	
    */ //exemplo

//************************************************

EXPORT map1 := DICTIONARY(map_emp_length,{m1 => mcode1});
EXPORT mapcode_emp_length(STRING m1) := map1[m1].mcode1;



/*EXPORT MthDCT := DICTIONARY(Mth_DS,{Mon => MCode});
EXPORT MapMth2Code(STRING Mon) := MthDCT[Mon].MCode;
EXPORT DOWDCT := DICTIONARY(DOW_DS,{DOW => DOWCode});
EXPORT MapDOW2Code(STRING DOW) := DOWDCT[DOW].DOWCode;
EXPORT PODCT  := DICTIONARY(POut_DS,{pout => PoutCode});
EXPORT MapPO2Code(STRING POut) := PODCT[POut].POutCode;
*/ //exemplo
END;
