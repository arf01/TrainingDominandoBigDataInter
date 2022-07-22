IMPORT $;

//Dataset bruto
FileRaw := $.File_raw.Dataset_raw;
OUTPUT(FileRaw);
COUNT(FileRaw); 


IMPORT DataPatterns;
// Browse raw input data
OUTPUT($.File_raw.Dataset_raw,NAMED('FileRaw'));
COUNT($.File_raw.Dataset_raw);
// Browse clean input data
 OUTPUT($.Prep02.myDataE,NAMED('CleanProperty'));
 COUNT($.Prep02.myDataE);
// Browse clean train data and test data
 OUTPUT($.Prep02.myTrainData,NAMED('TrainData'));
 COUNT($.Prep02.myTrainData);
 OUTPUT($.Prep02.myTestData,NAMED('TestData'));
 COUNT($.Prep02.myTestData);
// Browse converted train and test data
// OUTPUT($.Convert03.myIndTrainDataNF,NAMED('IndTrain'));
// OUTPUT($.Convert03.myDepTrainDataNF,NAMED('DepTrain'));
// OUTPUT($.Convert03.myIndTestDataNF,NAMED('IndTest'));
// OUTPUT($.Convert03.myDepTestDataNF,NAMED('DepTest'));
