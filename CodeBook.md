---
title: "CodeBook"
author: "V.Mahadev"
date: "Friday, August 22, 2014"
output: html_document
---
# Wearable Computing #

##Data Set : Human Activity Recognition Using Smart Phones  ##
###(The Code Book) - Tidydata.txt###

This code book has the following sections

  1. Data Dictionary or Code book  of Tidydata.txt
    
      - This table has four headings (ColumnName, DataType, Description, Values)
 
  2. Data Dictionary or Code book of TidySummaryData.txt
    
      - This is the same as the above dictionary but mean average of each variables has been calculated hence prefixed with mean_
    
  3. Units of Measure
 
  4. Further reading and refernces
 
  5. References and Information Sources (Source Data Information)
  
  6. Acknowledgement
  
  7. License of original data sample publishers
 
###Tidydata.txt - Code Book###

*Attributes:*


```
##             Column.Name.Attribute.Field. Data.Type
## 1                                Subject   Integer
## 2                               Activity Character
## 3                    Time Domain Signals          
## 4                      td_bodyacc_mean_x    Double
## 5                      td_bodyacc_mean_y    Double
## 6                      td_bodyacc_mean_z    Double
## 7                       td_bodyacc_std_x    Double
## 8                       td_bodyacc_std_y    Double
## 9                       td_bodyacc_std_z    Double
## 10                  td_gravityacc_mean_x    Double
## 11                  td_gravityacc_mean_y    Double
## 12                  td_gravityacc_mean_z    Double
## 13                   td_gravityacc_std_x    Double
## 14                   td_gravityacc_std_y    Double
## 15                   td_gravityacc_std_z    Double
## 16                 td_bodyaccjerk_mean_x    Double
## 17                 td_bodyaccjerk_mean_y    Double
## 18                 td_bodyaccjerk_mean_z    Double
## 19                  td_bodyaccjerk_std_x    Double
## 20                  td_bodyaccjerk_std_y    Double
## 21                  td_bodyaccjerk_std_z    Double
## 22                    td_bodygyro_mean_x    Double
## 23                    td_bodygyro_mean_y    Double
## 24                    td_bodygyro_mean_z    Double
## 25                     td_bodygyro_std_x    Double
## 26                     td_bodygyro_std_y    Double
## 27                     td_bodygyro_std_z    Double
## 28                td_bodygyrojerk_mean_x    Double
## 29                td_bodygyrojerk_mean_y    Double
## 30                td_bodygyrojerk_mean_z    Double
## 31                 td_bodygyrojerk_std_x    Double
## 32                 td_bodygyrojerk_std_y    Double
## 33                 td_bodygyrojerk_std_z    Double
## 34                    td_bodyaccmag_mean    Double
## 35                     td_bodyaccmag_std    Double
## 36                 td_gravityaccmag_mean    Double
## 37                  td_gravityaccmag_std    Double
## 38                td_bodyaccjerkmag_mean    Double
## 39                 td_bodyaccjerkmag_std    Double
## 40                   td_bodygyromag_mean    Double
## 41                    td_bodygyromag_std    Double
## 42               td_bodygyrojerkmag_mean    Double
## 43                td_bodygyrojerkmag_std    Double
## 44              Frequency Domain Signals          
## 45                     fd_bodyacc_mean_x    Double
## 46                     fd_bodyacc_mean_y    Double
## 47                     fd_bodyacc_mean_z    Double
## 48                      fd_bodyacc_std_x    Double
## 49                      fd_bodyacc_std_y    Double
## 50                      fd_bodyacc_std_z    Double
## 51                 fd_bodyaccjerk_mean_x    Double
## 52                 fd_bodyaccjerk_mean_y    Double
## 53                 fd_bodyaccjerk_mean_z    Double
## 54                  fd_bodyaccjerk_std_x    Double
## 55                  fd_bodyaccjerk_std_y    Double
## 56                  fd_bodyaccjerk_std_z    Double
## 57             fd_bodyaccjerk_meanfreq_x    Double
## 58             fd_bodyaccjerk_meanfreq_y    Double
## 59             fd_bodyaccjerk_meanfreq_z    Double
## 60                    fd_bodygyro_mean_x    Double
## 61                    fd_bodygyro_mean_y    Double
## 62                    fd_bodygyro_mean_z    Double
## 63                     fd_bodygyro_std_x    Double
## 64                     fd_bodygyro_std_y    Double
## 65                     fd_bodygyro_std_z    Double
## 66                fd_bodygyro_meanfreq_x    Double
## 67                fd_bodygyro_meanfreq_y    Double
## 68                fd_bodygyro_meanfreq_z    Double
## 69                    fd_bodyaccmag_mean    Double
## 70                     fd_bodyaccmag_std    Double
## 71                fd_bodyaccmag_meanfreq    Double
## 72          angle_td_bodyaccmean_gravity    Double
## 73  angle_td_bodyaccjerkmean_gravitymean    Double
## 74     angle_td_bodygyromean_gravitymean    Double
## 75 angle_td_bodygyrojerkmean_gravitymean    Double
## 76                   angle_x_gravitymean    Double
## 77                   angle_y_gravitymean    Double
## 78                   angle_z_gravitymean    Double
##                                                               Description
## 1                                                Subjects Identity Column
## 2                                             Activity which is labelled 
## 3                                                                        
## 4                           Body acceleration mean value of X - direction
## 5                                      Same as above but in Y - direction
## 6                                      Same as above but in Z - direction
## 7                            Body acceleration std value of X - direction
## 8                                      Same as above but in Y - direction
## 9                                      Same as above but in Z - direction
## 10     Linear acceleration affected by the gravitational force for X Mean
## 11                                     Same as above but in Y - direction
## 12                                     Same as above but in Z - direction
## 13  Linear acceleration affected by the gravitational force for X Std Dev
## 14                                     Same as above but in Y - direction
## 15                                     Same as above but in Z - direction
## 16                    Body acceleration Jerk  mean value of X - direction
## 17                                     Same as above but in Y - direction
## 18                                     Same as above but in Z - direction
## 19                      Body acceleration Jerk  SD value of X - direction
## 20                                     Same as above but in Y - direction
## 21                                     Same as above but in Z - direction
## 22                        Angular Rotation Mean Value of X - Co-ordinate 
## 23                                     Same as above but in Y - direction
## 24                                     Same as above but in Z - direction
## 25                          Angular Rotation SD Value of X - Co-ordinate 
## 26                                     Same as above but in Y - direction
## 27                                     Same as above but in Z - direction
## 28                 Angular Rotational Jerk Mean Value of X - Co-ordinate 
## 29                                     Same as above but in Y - direction
## 30                                     Same as above but in Z - direction
## 31                   Angular Rotational Jerk SD Value of X - Co-ordinate 
## 32                                     Same as above but in Y - direction
## 33                                     Same as above but in Z - direction
## 34                                 Body Acceleration Magnitude Mean Value
## 35                                   Body Acceleration Magnitude SD Value
## 36                                    Gravitational Force Magnitude Value
## 37                                    Gravitational Force Magnitude Value
## 38                          Body acceleration Jerk Magnitude  mean value 
## 39                             Body acceleration Jerk Magnitude  SD value
## 40                             Body Angular Rotation Magnitude Mean value
## 41                               Body Angular Rotation Magnitude SD value
## 42                        Body Angular Rotation Jerk Magnitude Mean value
## 43                          Body Angular Rotation Jerk Magnitude SD value
## 44                                                                       
## 45                          Body acceleration mean value of X - direction
## 46                                     Same as above but in Y - direction
## 47                                     Same as above but in Z - direction
## 48                           Body acceleration std value of X - direction
## 49                                     Same as above but in Y - direction
## 50                                     Same as above but in Z - direction
## 51                    Body acceleration Jerk  mean value of X - direction
## 52                                     Same as above but in Y - direction
## 53                                     Same as above but in Z - direction
## 54                      Body acceleration Jerk  SD value of X - direction
## 55                                     Same as above but in Y - direction
## 56                                     Same as above but in Z - direction
## 57                                 Body acceleration Jerk  Mean Frequency
## 58                                     Same as above but in Y - direction
## 59                                     Same as above but in Z - direction
## 60                 Angular Rotational Jerk Mean Value of X - Co-ordinate 
## 61                                     Same as above but in Y - direction
## 62                                     Same as above but in Z - direction
## 63                   Angular Rotational Jerk SD Value of X - Co-ordinate 
## 64                                     Same as above but in Y - direction
## 65                                     Same as above but in Z - direction
## 66                      Body Angular Motion  Mean Frequency X Co-ordinate
## 67                                     Same as above but in Y - direction
## 68                                     Same as above but in Z - direction
## 69                                 Body Acceleration Magnitude Mean Value
## 70                                   Body Acceleration Magnitude SD Value
## 71                                      Body Acceleration Mean Freq Value
## 72       Angular Motion Component b/w body acceleration mean and gravity 
## 73            Angular Motion Component b/w acc jerk mean and gravity mean
## 74                              Angular Motion body gyro b/w gravity mean
## 75                         Angular Motion body gyro jerk and gravity mean
## 76                                                     Angular Rotation X
## 77                                     Same as above but in Y - direction
## 78                                     Same as above but in Z - direction
##                                                                                                               Value.Range
## 1                                                                                                                 1 To 30
## 2                                                   WALKING,WALKING UPSTAIRS,WALKING DOWNSTAIRS,SITTING, STANDING, LAYING
## 3                                                                                                                        
## 4                                                                                                                        
## 5                                                                                                                        
## 6                                                                                                                        
## 7                                                                                                                        
## 8                                                                                                                        
## 9                                                                                                                        
## 10    Sensors Data Acquisition for Android Devices[http://developer.android.com/guide/topics/sensors/sensors_motion.html]
## 11                                                                                                                       
## 12                                                                                                                       
## 13                                                                                                                       
## 14                                                                                                                       
## 15                                                                                                                       
## 16                                                                                                                       
## 17                                                                                                                       
## 18                                                                                                                       
## 19                                                                                                                       
## 20                                                                                                                       
## 21                                                                                                                       
## 22 A primer on Co-ordinate system[http://developer.android.com/guide/topics/sensors/sensors_overview.html#sensors-coords]
## 23                                                                                                                       
## 24                                                                                                                       
## 25                                                                                                                       
## 26                                                                                                                       
## 27                                                                                                                       
## 28                                                                                                                       
## 29                                                                                                                       
## 30                                                                                                                       
## 31                                                                                                                       
## 32                                                                                                                       
## 33                                                                                                                       
## 34                                                                                                                       
## 35                                                                                                                       
## 36                                                                                                                       
## 37                                                                                                                       
## 38                                                                                                                       
## 39                                                                                                                       
## 40                                                                                                                       
## 41                                                                                                                       
## 42                                                                                                                       
## 43                                                                                                                       
## 44                                                                                                                       
## 45                                                                                                                       
## 46                                                                                                                       
## 47                                                                                                                       
## 48                                                                                                                       
## 49                                                                                                                       
## 50                                                                                                                       
## 51                                                                                                                       
## 52                                                                                                                       
## 53                                                                                                                       
## 54                                                                                                                       
## 55                                                                                                                       
## 56                                                                                                                       
## 57                                                                                                                       
## 58                                                                                                                       
## 59                                                                                                                       
## 60                                                                                                                       
## 61                                                                                                                       
## 62                                                                                                                       
## 63                                                                                                                       
## 64                                                                                                                       
## 65                                                                                                                       
## 66                                                                                                                       
## 67                                                                                                                       
## 68                                                                                                                       
## 69                                                                                                                       
## 70                                                                                                                       
## 71                                                                                                                       
## 72                                                                                                                       
## 73                                                                                                                       
## 74                                                                                                                       
## 75                                                                                                                       
## 76                                                                                                                       
## 77                                                                                                                       
## 78
```


Unit of Measure
==================

*NOTE : All data unless otherwise mentioned are double and all forces and magnitudes are in m/s2 and angles are in radians/second*


Further Reading and references
=================================

Complete technical documentation with sample code available at the following link 

  Sensors Data Acquisition for Android Devices[http://developer.android.com/guide/topics/sensors/sensors_motion.html]
  
  A primer on Co-ordinate system [http://developer.android.com/guide/topics/sensors/sensors_overview.html#sensors-coords]
The gyroscope measures the rate or rotation in rad/s around a device's x, y, and z axis

The units are the same as those used by the acceleration sensor (m/s2), and the coordinate system is the same as the one used by the acceleration sensor.

-If you push the device on the left side (so it moves to the right), the x acceleration value is positive.
-If you push the device on the bottom (so it moves away from you), the y acceleration value is positive.
-If you push the device toward the sky with an acceleration of A m/s2, the z acceleration value is equal to A + 9.81, which corresponds to the acceleration of the device (+A m/s2) minus the force of gravity (-9.81 m/s2).

The stationary device will have an acceleration value of +9.81, which corresponds to the acceleration of the device (0 m/s2 minus the force of gravity, which is -9.81 m/s2).

SOURCE DATA
==============
For further details and readings 
=================================

Data set is built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are **radians/second**. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


For more information about this dataset contact: activityrecognition@smartlab.ws

Acknowledgement
===============

We would like to thank the original researchers for sharing the data of thier research.

If you are planning to use this work or any part of this research do not forget to acknowledge the original publishers

License text has been pasted at the tail of this document for the reference

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

