---
title: "CodeBook"
author: "V.Mahadev"
date: "Friday, August 22, 2014"
output: html_document
---
# Wearble Computing #

##Data Set : Human Activity Recognition Using Smart Phones  ##
###(The Code Book) - Tidydata.txt###

*Attributes:*

**Name**                    |   **Description**

----------------------------|-------------------------------------------------------

Subject                     | Subjects Identity Column (Width 2 Digit)

Activity                    | Labled Activity 
                              VALUES (WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING, STANDING, LAYING

td_bodyacc_mean_x	          | Body acceleration mean value of X - direction

td_bodyacc_mean_y	          | Body acceleration mean value of Y - direction

td_bodyacc_mean_z	          | Body acceleration mean value of Z - direction

td_bodyacc_std_x            |	Body acceleration std value of X - direction

td_bodyacc_std_y	          | Body acceleration std value of Y - direction

td_bodyacc_std_z	          | Body acceleration std value of Z - direction

td_gravityacc_mean_x	      | Linear acceleration affected by the gravitational force for XY and Z direction 

td_gravityacc_mean_y	      |

td_gravityacc_mean_z	      |

td_gravityacc_std_x	        | Linear acceleration affected by the gravitational force for XY and Z direction std dev values
td_gravityacc_std_y	        |

td_gravityacc_std_z	        |

td_bodyaccjerk_mean_x	      | Feature extracted a computed value Body Jerk 

td_bodyaccjerk_mean_y	      | X Y and Z directions its mean value

td_bodyaccjerk_mean_z	      |

td_bodyaccjerk_std_x	      |

td_bodyaccjerk_std_y	      |

td_bodyaccjerk_std_z	      |

td_bodygyro_mean_x	        | Feature extracted of Angular motion mean values

td_bodygyro_mean_y	        |

td_bodygyro_mean_z	        |

td_bodygyro_std_x	          |Feature extracted of Angular motion standard deviation

td_bodygyro_std_y	          |values

td_bodygyro_std_z	          |

td_bodygyrojerk_mean_x	    |Feature extracted of Angular jerk mean values

td_bodygyrojerk_mean_y	    |

td_bodygyrojerk_mean_z	    |

td_bodygyrojerk_std_x	      |Feature extracted of Angular jerk standard deviation

td_bodygyrojerk_std_y	      |Values in X Y Z directions

td_bodygyrojerk_std_z	      |

td_bodyaccmag_mean	        | Body Acceleration Magnitude Mean Value

td_bodyaccmag_std	          | Body Acceleration Magnitude Std.Dev. Value

td_gravityaccmag_mean	      | Gravity - Magnitude (Sensor Value) Mean and Std.Dev.

td_gravityaccmag_std	      |

td_bodyaccjerkmag_mean	    | Body Acc Jerk Magnitude Mean and Std.Dev. Values

td_bodyaccjerkmag_std	      |

td_bodygyromag_mean	        | Body Angular Movement Magnitude Mean and Std.Dev.

td_bodygyromag_std	        | Values

td_bodygyrojerkmag_mean	    | Body Angular Jerk Magnitude mean and std. dev.

td_bodygyrojerkmag_std	    |

fd_bodyacc_mean_x	          | Frequency Domain Values

fd_bodyacc_mean_y	          |

fd_bodyacc_mean_z	          |

fd_bodyacc_std_x	          |

fd_bodyacc_std_y	          |

fd_bodyacc_std_z	          |

fd_bodyaccjerk_mean_x	      |

fd_bodyaccjerk_mean_y	      |

fd_bodyaccjerk_mean_z	      |

fd_bodyaccjerk_std_x	      |

fd_bodyaccjerk_std_y	      |

fd_bodyaccjerk_std_z	      |

fd_bodyaccjerk_meanfreq_x	  |

fd_bodyaccjerk_meanfreq_y	  |

fd_bodyaccjerk_meanfreq_z	  |

fd_bodygyro_mean_x	        |

fd_bodygyro_mean_y	        |

fd_bodygyro_mean_z	        |

fd_bodygyro_std_x	          |

fd_bodygyro_std_y	          |

fd_bodygyro_std_z	          |

fd_bodygyro_meanfreq_x	    |

fd_bodygyro_meanfreq_y	    |

fd_bodygyro_meanfreq_z	    |

fd_bodyaccmag_mean	        |

fd_bodyaccmag_std	          |

fd_bodyaccmag_meanfreq	    | 

angle_td_bodyaccmean_gravity|	 Angular Measurement b/w Body Acceleration & Gravity

angle_td_bodyaccjerkmean_gravitymean|	Angular Measurement b/w BodyAccJerk and Gravitational Component

angle_td_bodygyromean_gravitymean| Angular Measure b/w bodyGyro and Gravity component

angle_td_bodygyrojerkmean_gravitymean|	Angle Measure b/w body gyro jerk and Gravity component

angle_x_gravitymean         | Angle X component Gravity mean

angle_y_gravitymean         |	Angle Y component Gravity mean 

angle_z_gravitymean         | Angle Z component Gravity mean

NOTE : All data unless otherwise mentioned are double 

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

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


For more information about this dataset contact: activityrecognition@smartlab.ws


```r
summary(cars)
```

```
##      speed           dist    
##  Min.   : 4.0   Min.   :  2  
##  1st Qu.:12.0   1st Qu.: 26  
##  Median :15.0   Median : 36  
##  Mean   :15.4   Mean   : 43  
##  3rd Qu.:19.0   3rd Qu.: 56  
##  Max.   :25.0   Max.   :120
```

You can also embed plots, for example:

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 





License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

