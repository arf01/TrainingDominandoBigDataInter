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

    EXPORT map_grade :=
  dataset([
    {'A', 1}, 
    {'B', 2}, 
    {'C', 3}, 
    {'D', 4}, 
    {'E', 5}, 
    {'F', 6}, 
    {'G', 7}], {STRING3 m2,UNSIGNED1 mcode2});

    EXPORT map_home_ownership :=
  dataset([
    {'MORTGAGE', 0}, 
    {'RENT', 1}, 
    {'OWN', 2}, 
    {'ANY', 3}, 
    {'OTHER', 4}, 
    {'NONE', 5}], {STRING3 m3,UNSIGNED1 mcode3});

    EXPORT map_initial_list_status :=
    dataset([
    {'w', 1}, 
    {'f', 2}], {STRING3 m4,UNSIGNED1 mcode4});


    EXPORT map_sub_grade :=
  dataset([
    {'A1', 1}, 
    {'B1', 1}, 
    {'C1', 1}, 
    {'D1', 1}, 
    {'E1', 1}, 
    {'F1', 1}, 
    {'G1', 1},
    {'A2', 2}, 
    {'B2', 2}, 
    {'C2', 2}, 
    {'D2', 2}, 
    {'E2', 2}, 
    {'F2', 2}, 
    {'G2', 2},
    {'A3', 3}, 
    {'B2', 3}, 
    {'C3', 3}, 
    {'D3', 3}, 
    {'E3', 3}, 
    {'F3', 3}, 
    {'G3', 3},
    {'A4', 4}, 
    {'B4', 4}, 
    {'C4', 4}, 
    {'D4', 4}, 
    {'E4', 4}, 
    {'F4', 4}, 
    {'G4', 4},
    {'A5', 5}, 
    {'B5', 5}, 
    {'C5', 5}, 
    {'D5', 5}, 
    {'E5', 5}, 
    {'F5', 5}, 
    {'G5', 5}], {STRING3 m5,UNSIGNED1 mcode5});

    EXPORT map_term :=
    dataset([
    {'36 months', 1}, 
    {'60 months', 2}], {STRING3 m6,UNSIGNED1 mcode6});

 
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

EXPORT map2 := DICTIONARY(map_grade,{m2 => mcode2});
EXPORT mapcode_grade(STRING m2) := map2[m2].mcode2;

EXPORT map3 := DICTIONARY(map_home_ownership,{m3 => mcode3});
EXPORT mapcode_home_ownership(STRING m3) := map3[m3].mcode3;

EXPORT map4 := DICTIONARY(map_initial_list_status,{m4 => mcode4});
EXPORT mapcode_initial_list_status(STRING m4) := map4[m4].mcode4;

EXPORT map5 := DICTIONARY(map_sub_grade,{m5 => mcode5});
EXPORT mapcode_sub_grade(STRING m5) := map5[m5].mcode5;

EXPORT map6 := DICTIONARY(map_terms,{m6 => mcode6});
EXPORT mapcode_terms(STRING m6) := map6[m6].mcode6;




/*EXPORT MthDCT := DICTIONARY(Mth_DS,{Mon => MCode});
EXPORT MapMth2Code(STRING Mon) := MthDCT[Mon].MCode;
EXPORT DOWDCT := DICTIONARY(DOW_DS,{DOW => DOWCode});
EXPORT MapDOW2Code(STRING DOW) := DOWDCT[DOW].DOWCode;
EXPORT PODCT  := DICTIONARY(POut_DS,{pout => PoutCode});
EXPORT MapPO2Code(STRING POut) := PODCT[POut].POutCode;
*/ //exemplo
END;
