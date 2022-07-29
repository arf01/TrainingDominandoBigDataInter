IMPORT $;
Import ML_Core;


//ataset bruto
FileRaw := $.File_raw.Dataset_optimized;
//OUTPUT(FileRaw);
//COUNT(FileRaw); 


IMPORT DataPatterns;


// Browse raw input data
//OUTPUT($.File_raw.Dataset_optimized,NAMED('FileRaw'));
//COUNT($.File_raw.Dataset_optimized);
// Browse clean input data
 OUTPUT($.Prep01.myDataE,NAMED('CleanProperty'));
 COUNT($.Prep01.myDataE);
// Browse clean train data and test data
 OUTPUT($.Prep01.myTrainData,NAMED('TrainData'));
 COUNT($.Prep01.myTrainData);
 OUTPUT($.Prep01.myTestData,NAMED('TestData'));
 COUNT($.Prep01.myTestData);
// Browse converted train and test data
 OUTPUT($.Convert02.myIndTrainDataNF,NAMED('IndTrain'));
 OUTPUT($.Convert02.myDepTrainDataNF,NAMED('DepTrain'));
 OUTPUT($.Convert02.myIndTestDataNF,NAMED('IndTest'));
 OUTPUT($.Convert02.myDepTestDataNF,NAMED('DepTest'));

//Dataset filtrado com loan_status (0/1)
// OUTPUT($.File_Binomial.Dataset_binomial);
//OUTPUT(DataPatterns.Profile($.File_Binomial.Dataset_binomial),ALL);
