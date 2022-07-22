IMPORT $;  //ok
IMPORT ML_Core;   //ok
myTrainData := $.Prep02.myTrainData;  //ok
myTestData  := $.Prep02.myTestData;   //ok
//Add a sequential ID - CRITICAL to this bundle
ML_Core.AppendSeqId(myTrainData,id2,myTrainIDData);   // adiciona o indice 1,2,3,4... depois da filtragem
ML_Core.AppendSeqId(myTestData,id2,myTestIDData);
//Numeric Field Matrix conversion
ML_Core.ToField(myTrainIDData, myTrainDataNF);  // transforma matriz em vetor e vetorna os valores e os indices 1111,2222,3333,4444...
ML_Core.ToField(myTestIDData, myTestDataNF);
// OUTPUT(myTrainDataNF, NAMED('TrainDataNF'));  //Uncomment to spot the Numeric Field Matrix conversion
// OUTPUT(myTestDataNF, NAMED('TestDataNF'));  //Uncomment to spot the Numeric Field Matrix conversion
/* <-- Delete the first forward slash (/) just before the asterisk (*) to comment out the entire MODULE
EXPORT Convert03 := MODULE
   //We have 8 independent fields and the last field (9) is the dependent    //   9 é o numero de colunas da matriz antes de virar vetor
   EXPORT myIndTrainDataNF := myTrainDataNF(number < 9); // Number is the field number
   EXPORT myDepTrainDataNF := PROJECT(myTrainDataNF(number = 9), 
                                      TRANSFORM(RECORDOF(LEFT), 
                                                SELF.number := 1,
                                                SELF := LEFT));
   EXPORT myIndTestDataNF := myTestDataNF(number < 9); // Number is the field number
   EXPORT myDepTestDataNF := PROJECT(myTestDataNF(number = 9), 
                                     TRANSFORM(RECORDOF(LEFT), 
                                               SELF.number := 1,
                                               SELF := LEFT));
   																									
END;
// */
