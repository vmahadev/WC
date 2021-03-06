#1. Read from standard list files
  
  #a. Activity List
    
    dfActivityLabels=read.table("data/activity_labels.txt",col.names=c("Code","Activity"));

    
    
  #b. Features List
    
    dfFeatureList=read.table("data/features.txt",col.names=c("Code","Feature"))
    
    
    
#2. Combine Labelled Activity from Training and Test set
  
    #a. Read Activity Labels from the Training
  
    yTrainingActivityLabels <- read.table('data/train/y_train.txt');

    
  
    #b. Read Subjects Activity Identity column  from Test set
  
    yTestActivityLabels <- read.table('data/test/y_test.txt');

    
    #c. Combine both Training and Test Activity Identity rows of the subjects
  
    #ActivityLabels <- rbind(yTrainingActivityLabels,yTestActivityLabels)
  
    ActivityLabels<- mapply(c,yTrainingActivityLabels,yTestActivityLabels)

    
  
    #d. Prepare Labelled Activity of the Subjects Column for the tidy dataset
  
    Activity<-factor(ActivityLabels,label=dfActivityLabels[,2])
    
    
    rm("yTrainingActivityLabels","yTestActivityLabels","ActivityLabels")



    #3. Selection and Transformation of Features List


    #a. Transformation of Feature names
    #copy original 

    dfModifiedFeatureList<-dfFeatureList
    
    
    #Remove open brackets
    
    dfModifiedFeatureList$Feature<-sub("\\(","",dfFeatureList$Feature)

    
    #Remove closing brackets
    
    dfModifiedFeatureList$Feature<-sub("\\)","",dfModifiedFeatureList$Feature)

    
    #Remove closing brackets
    
    dfModifiedFeatureList$Feature<-sub("\\)","",dfModifiedFeatureList$Feature)
    
    
    #Replace hyphen character with an underscore
    
    dfModifiedFeatureList$Feature<-sub("-","_",dfModifiedFeatureList$Feature)

    
    #Replace hyphen character with an underscore
    
    dfModifiedFeatureList$Feature<-sub("-","_",dfModifiedFeatureList$Feature)

    
    #Replace comma character with an underscore
    
    dfModifiedFeatureList$Feature<-sub(",","_",dfModifiedFeatureList$Feature)

    
    #verify
    #ifelse(length(levels(factor(dfModifiedFeatureList$Feature)))==length(levels(factor(dfFeatureList$Feature))),"Equal","Not Equal")

    
    #Substitute time domain t with TD (Same can be achieved using ^t and ^f inconsistent results)
    
    dfModifiedFeatureList$Feature<-sub("tBody","TD_Body",dfModifiedFeatureList$Feature)
    
    
    #Substitute time domain t with TD
    
    dfModifiedFeatureList$Feature<-sub("tGravity","TD_Gravity",dfModifiedFeatureList$Feature)

    
    #Substitute freq domain f with FD
    
    dfModifiedFeatureList$Feature<-sub("fGravity","FD_Gravity",dfModifiedFeatureList$Feature)

    
    #Substitute freq domain f with FD 
    
    dfModifiedFeatureList$Feature<-sub("fBody","FD_Body",dfModifiedFeatureList$Feature)

    
    #Substitute angle with Angle_
    
    dfModifiedFeatureList$Feature<-sub("angle","Angle_",dfModifiedFeatureList$Feature)

    #Not mandatory
    #convert all uppercase characters in the names to lowercase as per defn of tidy data
    
    dfModifiedFeatureList$Feature<-tolower(dfModifiedFeatureList$Feature)

  #b.Sorting 
    
    #Require sorting of code hence Sort using arrange 

    require(plyr)
    
    dfModifiedFeatureList<-arrange(dfModifiedFeatureList,Code)

  
    #c.Select Measures - Std and Means of Measures

    SelectedFieldsOfMeasurementMeanStdValues <- c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,
                                                121,122,123,124,125,126,161,162,163,164,165,166,
                                                201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,
                                                345,346,347,348,349,350,373,374,375,
                                                424,425,426,427,428,429,452,453,454,
                                                503,504,513,555,556,557,558,559,560,561)
    
  
    #d. Extract names of Selected Measures (Means and Std plus Freq Component and Angle)
  
    FieldNames<-tolower(dfModifiedFeatureList[SelectedFieldsOfMeasurementMeanStdValues,2])

  
    #e. prepare column names for the final result set
  
    ColNames<-t(cbind(c("Subject","Activity",t(FieldNames))))
  
    #f. Cleanup
  
    rm("dfFeatureList","dfModifiedFeatureList")
  

    #4.Subjects Identity Column 
  
    
    #a.Read Subjects Identity Column from the Training Set
    
    SubjectsFromTainingSet<-read.table('data/train/subject_train.txt')

    
    #b. Read Subjects Identity Column from the Test Set
    
    SubjectsFromTestSet<-read.table('data/test/subject_test.txt')

    
    #c. Combine Subjects Identity Column of both Training and Test set 
    
    Subjects<-as.vector(c(SubjectsFromTainingSet,SubjectsFromTestSet,recursive=TRUE))
    
    
    #d. Cleanup
    
    rm("SubjectsFromTainingSet","SubjectsFromTestSet")
    

    #5. Captured Sensor and Computed data extraction
    
    #a. Read Captured Sensor and Computed data from the Training Set
  
    CapturedDataTrainingSet <- read.table('data/train/x_train.txt',)

  
    #b.Read Captured Sensor and Computed data from the Test Set
  
    CapturedDataTestSet <- read.table('data/test/x_test.txt')

  
    #c.Combine Captured Sensor and Computed data of both Trainig and The Test Set
  
    #CapturedDataCombined <- rbind(CapturedDataTrainingSet,CapturedDataTestSet)
  
    CapturedDataCombined <- mapply(c,CapturedDataTrainingSet,CapturedDataTestSet)
  
    
    #Cleanup unused datasets
    
    rm("CapturedDataTestSet","CapturedDataTrainingSet")

    #6. Final Step - Merge -> Tidy Data

    # Combining 1. Subjects Identity Column

    #           2. Labled Activity Column  <- from (4.c)

    #           3. Captured and Computed Std and Means plus Angles and Freq Component Columns <- from (5.c)
    

  
    #a. Combine Subjects from Step 2, Labelled Activity from Step 1 and   
  
    WearableCompTidyDataset<-data.frame(Subjects,Activity,CapturedDataCombined[,SelectedFieldsOfMeasurementMeanStdValues])
  
   
    rm("CapturedDataCombined","Subjects","Activity","dfActivityLabels")
  
    #b. Update Column names
  
    colnames(WearableCompTidyDataset)<-ColNames
  
    wout<-WearableCompTidyDataset[order(WearableCompTidyDataset$Subject),]
  
    #Just to create the interest
    table(wout$Subject,wout$Activity)
    #clean up
  
    rm(WearableCompTidyDataset)

    # write tidydata.txt file
  
    
    #.a Generate file name
    
    fileName<-paste0("tidyDataWC",format(Sys.time(),"%a_%Y_%b_%d_%H_%M_%S.txt"))  
 
    #.b write 
    
    #nCols <- ncol(WearableCompTidyDataset)
    #write(as.vector(WearableCompTidyDatasetV),file=fileName,ncolumns=nCols,sep=",")
    #fileName<-paste0("tidyDataWC",format(Sys.time(),"%a_%Y_%b_%d_%H_%M_%S.txt"))  
    
    #as per the instruction used write.table
    
    # 7. Calculate Mean of all the variables
    write.table(wout,file=fileName,row.names=F)
  
    require(reshape)
    
    x <- melt(wout, id=1:2, measured=3:76)
    
    SummaryDS<-cast(x, Activity + Subject ~ variable, mean)
    
    
    # The below method is the fastest but the above used for flexibility
    
    #check time & verify
    
    #dt<-data.table(wout)
    
    #x<-dt[,list(mean(td_bodyacc_mean_x),mean(td_bodyacc_mean_y),mean(td_bodyacc_mean_z),	
    #             mean(td_bodyacc_std_x),mean(td_bodyacc_std_y),mean(td_bodyacc_std_z),
    #             mean(td_gravityacc_mean_x),mean(td_gravityacc_mean_y),
    #             mean(td_gravityacc_mean_z),mean(td_gravityacc_std_x),	
    #             mean(td_gravityacc_std_y),mean(td_gravityacc_std_z),
    #             mean(td_bodyaccjerk_mean_x),mean(td_bodyaccjerk_mean_y),
    #             mean(td_bodyaccjerk_mean_z),mean(td_bodyaccjerk_std_x),
    #             mean(td_bodyaccjerk_std_y),mean(td_bodyaccjerk_std_z),
    #             mean(td_bodygyro_mean_x),mean(td_bodygyro_mean_y),
    #             mean(td_bodygyro_mean_z),mean(td_bodygyro_std_x),
    #             mean(td_bodygyro_std_y),mean(td_bodygyro_std_z),
    #             mean(td_bodygyrojerk_mean_x),mean(td_bodygyrojerk_mean_y),
    #             mean(td_bodygyrojerk_std_y),mean(td_bodygyrojerk_std_z),
    #             mean(td_bodyaccmag_mean),mean(td_bodyaccmag_std),
    #             mean(td_gravityaccmag_mean),mean(td_gravityaccmag_std),
    #             mean(td_bodyaccjerkmag_mean),mean(td_bodyaccjerkmag_std),
    #             mean(td_bodygyromag_mean),mean(td_bodygyromag_std),
    #             mean(td_bodygyrojerkmag_mean),mean(td_bodygyrojerkmag_std),
    #             mean(fd_bodyacc_mean_x),mean(fd_bodyacc_mean_y),
    #             mean(fd_bodyacc_mean_z),mean(fd_bodyacc_std_x),
    #             mean(fd_bodyacc_std_y),mean(fd_bodyacc_std_z),
    #             mean(fd_bodyaccjerk_mean_x),mean(fd_bodyaccjerk_mean_y),
    #             mean(fd_bodyaccjerk_mean_z),mean(fd_bodyaccjerk_std_x),
    #             mean(fd_bodyaccjerk_std_y),mean(fd_bodyaccjerk_std_z),
    #             mean(fd_bodyaccjerk_meanfreq_x),mean(fd_bodyaccjerk_meanfreq_y),
    #             mean(fd_bodyaccjerk_meanfreq_z),mean(fd_bodygyro_mean_x),
    #             mean(fd_bodygyro_mean_y),mean(fd_bodygyro_mean_z),
    #             mean(fd_bodygyro_std_x),mean(fd_bodygyro_std_y),
    #             mean(fd_bodygyro_std_z),mean(fd_bodygyro_meanfreq_x),
    #             mean(fd_bodygyro_meanfreq_y),mean(fd_bodygyro_meanfreq_z),	
    #             mean(fd_bodyaccmag_mean),mean(fd_bodyaccmag_std),	
    #             mean(fd_bodyaccmag_meanfreq),mean(angle_td_bodyaccmean_gravity),
    #             mean(angle_td_bodyaccjerkmean_gravitymean),mean(angle_td_bodygyromean_gravitymean),
    #             mean(angle_td_bodygyrojerkmean_gravitymean),mean(angle_x_gravitymean),
    #             mean(angle_y_gravitymean),mean(angle_z_gravitymean)),by=c("Activity","Subject")]

    
    #cleanup
    
    rm("wout")
    
    
    #Sort on Activity and Subject
    
    SummaryFeatureMeasures <- SummaryDS[order(SummaryDS$Activity,SummaryDS$Subject),]
    
    
    #Copy selected Feature Measures
    
    ColMeanNames<-ColNames
    
    
    #Prefix with mean_
    
    for(i in 3:length(ColNames))
    
      ColMeanNames[i]=paste0("mean_",ColNames[i])
    
    
    #set the column names prefixed with a mean_
    
    colnames(SummaryFeatureMeasures)<-ColMeanNames
    
    
    #Generate a new filename with time and date stamp
    
    fileName<-paste0("TidyDataMeans_",format(Sys.time(),"%a_%Y_%b_%d_%H_%M_%S.txt")) 
    
    
    #write to file 
    
    write.table(SummaryFeatureMeasures,file=fileName,row.names=F)
    
    
    #Cleanup
    
    rm("ColMeanNames","SummaryDS","SummaryFeatureMeasures","x","ColNames","FieldNames","SelectedFieldsOfMeasurementMeanStdValues","i","fileName")
    
    ls()
    
    #done
    #===========================================================================
    # resultset<-read.table("TidyDataMeans_Sun_2014_Aug_24_12_29_51.txt")
    #===========================================================================
   
    
    
    