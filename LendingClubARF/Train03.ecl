IMPORT LogisticRegression as LR;
IMPORT ML_Core;
IMPORT $;
//Training and Test data
XTrain := $.Convert02.myIndTrainDataNF;
YTrain := $.Convert02.myDepTrainDataNF;
XTest  := $.Convert02.myIndTestDataNF;
YTest  := $.Convert02.myDepTestDataNF;
//Train Logistic Regression Model on Banking data
myLearner := LR.BinomialLogisticRegression();
myModel   := myLearner.getModel(XTrain, YTrain);
	 
//Test Logistic Regression Model on Banking data
MyPredict := myLearner.Classify(myModel, XTest);
OUTPUT(MyPredict, NAMED('PredictedValues'));
//Assess Logistic Regression model on Banking data
MyConfMatrix := LR.Confusion(Ytest,MyPredict);
OUTPUT(MyConfMatrix, NAMED('ConfusionMatrix'), ALL);
// OUTPUT(MyConfMatrix, NAMED('ConfusionMatrix'));
MyConfAccy := LR.BinomialConfusion(MyConfMatrix);
OUTPUT(MyConfAccy, NAMED('ConfusionAccuracy'));	 
	 
//Utilize AIC (Akaike Information Criterion) for model optimization
MyBeta := LR.ExtractBeta(myModel);
OUTPUT(MyBeta, NAMED('BetaValues'));
MyScores := LR.LogitScore(MyBeta,Xtest);
OUTPUT(MyScores , NAMED('ScoreValues'));
MyDeviance := LR.Deviance_Detail(YTest,MyScores);
MyAIC := LR.Model_Deviance(MyDeviance,MyBeta);
OUTPUT(MyAIC, NAMED('AIC'));
   

   
//para funcionar preciso adicionar adicionar um record ao codigo file e preciso criar um novo dcts.ecl modificados para a base do loan:

/* file:

// The dataset we are using shows direct marketing campaigns (phone calls) of a 
// Portuguese banking institution. The classification goal is to predict whether the client 
// will subscribe (1/0) to a term deposit (variable y).
// https://archive.ics.uci.edu/ml/datasets/bank+marketing (bank-additional-full.csv)
EXPORT File_Banking := MODULE
//** = categorical
  EXPORT Layout := RECORD
    STRING age;
    STRING job;            //**
    STRING marital;        //**
    STRING education;      //**
    STRING default;        //** - has credit in default?
    STRING housing;        //** - has housing loan?
    STRING loan;           //** - has personal loan?
    STRING contact;        //** - cellular, telephone
    STRING month;          //** - last contact
    STRING day_of_week;    //**
    STRING duration;       //contact time in seconds
    STRING campaign;       //how many times contacted
    STRING pdays;          //days passed after last contact
    STRING previous;       //previous contacts 
    STRING poutcome;       //previous outcome
    STRING emp_var_rate;   //employment variation rate
    STRING cons_price_idx; //consumer price index
    STRING cons_conf_idx;  //consumer confidence index
    STRING euribor3m;      //euribor 3 month rate
    STRING nr_employed;    //number of employees
    STRING y;              //subscribed? Yes/No - dependent
  END;
  EXPORT File := DATASET('~Tutorial::LogisticRegression::banking',layout,CSV(HEADING(1)));
  //New record structure for training the client subscription model
  EXPORT MLBank := RECORD
   UNSIGNED4 RecID;
  //*****quantitative below:
   UNSIGNED1 age;
   UNSIGNED2 duration;            //contact time in seconds
   UNSIGNED1 campaign;            //how many times contacted
   UNSIGNED2 pdays;               //days passed after last contact
   UNSIGNED1 previous;            //previous contacts 
   DECIMAL4_2 emp_var_rate;       //emplyment variation rate
   DECIMAL4_2 cons_price_idx;     //consumer price index
   DECIMAL4_2 cons_conf_idx;      //consumer confidence index
   DECIMAL4_2 euribor3m;          //euribor 3 month rate
   UNSIGNED2 nr_employed;         //number of employees
  //*****qualitative below
   UNSIGNED1 poutcode;            //previous outcome
   UNSIGNED1 jobcode;        //**
   UNSIGNED1 maritalcode;    //**
   UNSIGNED1 educationcode;  //**
   UNSIGNED1 defaultcode;    //** - has credit in default?
   UNSIGNED1 housingcode;    //** - has housing loan?
   UNSIGNED1 loancode;       //** - has personal loan?
   UNSIGNED1 contactcode;    //** - cellular, telephone
   UNSIGNED1 monthcode;      //** - last contact
   UNSIGNED1 day_of_weekcode;//** 
   UNSIGNED1 y;              //subscribed? Yes/No - dependent data
  END;
END;

///////////////////////////////

dcts.ecl:

// Data Dictionary MODULE for label enconding of the categorical variables
EXPORT DCTs := MODULE
 EXPORT Ed_DS :=
  DATASET([
    {'university.degree',1}, 
    {'high.school',2}, 
    {'basic.9y',3}, 
    {'professional.course',4}, 
    {'basic.4y',3}, 
    {'basic.6y',3}, 
    {'unknown',5}, 
    {'illiterate',6}], {STRING18 education,UNSIGNED1 edcode});
 EXPORT YN_DS :=
   DATASET([
    {'yes',1}, 
    {'no',2}, 
    {'unknown',3}], {STRING7 choice,UNSIGNED1 yncode});
	EXPORT Job_DS :=
  dataset([
    {'admin.', 1}, 
    {'blue-collar', 2}, 
    {'entrepreneur', 3}, 
    {'housemaid', 4}, 
    {'management', 5}, 
    {'retired', 6}, 
    {'self-employed', 7}, 
    {'services', 8}, 
    {'student', 9}, 
    {'technician', 10}, 
    {'unemployed', 11}, 
    {'unknown', 12}], {STRING13 job,UNSIGNED1 jobcode});	
	EXPORT Mth_DS :=
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
EXPORT Marital_DS :=
  dataset([
    {'divorced', 3}, 
    {'married', 1}, 
    {'single', 2}, 
    {'unknown', 4}], {STRING8 marital,UNSIGNED1 mtlcode});
EXPORT POut_DS :=
  dataset([
    {'nonexistant', 1}, 
    {'failure', 2}, 
    {'success', 3}],{STRING11 pout,UNSIGNED1 poutcode});		
//************************************************
EXPORT EdDCT  := DICTIONARY(Ed_DS,{Education => EdCode});
EXPORT MapEd2Code(STRING Education) := EdDCT[Education].EdCode;
EXPORT YNDCT  := DICTIONARY(YN_DS,{Choice => YNCode});
EXPORT MapYN2Code(STRING Choice) := YNDCT[Choice].YNCode;
EXPORT JobDCT := DICTIONARY(Job_DS,{Job => JobCode});
EXPORT MapJob2Code(STRING Job) := JobDCT[Job].JobCode;
EXPORT MthDCT := DICTIONARY(Mth_DS,{Mon => MCode});
EXPORT MapMth2Code(STRING Mon) := MthDCT[Mon].MCode;
EXPORT DOWDCT := DICTIONARY(DOW_DS,{DOW => DOWCode});
EXPORT MapDOW2Code(STRING DOW) := DOWDCT[DOW].DOWCode;
EXPORT MarDCT := DICTIONARY(Marital_DS,{marital => mtlCode});
EXPORT MapMar2Code(STRING Marital) := MarDCT[Marital].mtlCode;
EXPORT PODCT  := DICTIONARY(POut_DS,{pout => PoutCode});
EXPORT MapPO2Code(STRING POut) := PODCT[POut].POutCode;
END;


*/

