CODE BOOK

VARIABLES

Individual: subject analyzed in the studio
Value: 1 to 30 (integer)

Activity: activities who are doing the subjects
value: character labels
1 walking
2 walking_upstairs
3 walking_downstairs
4 sitting
5 standing
6 laying

data_mean: mean of data x_test or x_train
value: real number

data_sd: standard deviation of data x_test or x_train
value: real number

body_acc_x_mean: mean of body_acc_x_test|train
value: real number

body_acc_x_sd: standard deviation of body_acc_x_test|train
value: real number
 
body_acc_y_mean: mean of body_acc_y_test|train
value: real number 

body_acc_y_sd: standard deviation of body_acc_y_test|train
value: real number

body_acc_z_mean: mean of body_acc_z_test|train
value: real number 

body_acc_z_sd: standard deviation of body_acc_z_test|train
value: real number 

body_gyro_x_mean: mean of body_gyro_x_test|train
value: real number

body_gyro_x_sd: standard deviation of body_gyro_x_test|train
value: real number 

body_gyro_y_mean: mean of body_gyro_y_test|train
value: real number

body_gyro_y_sd: standard deviation of body_gyro_y_test|train
value: real number

body_gyro_z_mean: mean of body_gyro_z_test|train
value: real number 

body_gyro_z_sd: standard deviation of body_gyro_z_test|train
value: real number

total_acc_x_mean: mean of total_acc_x_test|train
value: real number

total_acc_x_sd: standard deviation of total_acc_x_test|train
value: real number
 
total_acc_y_mean: mean of total_acc_y_test|train
value: real number
 
total_acc_y_sd: standard deviation of total_acc_y_test|train
value: real number

total_acc_z_mean: mean of total_acc_z_test|train
value: real number
 
total_acc_z_sd: standard deviation of total_acc_z_test|train
value: real number
 
train: if is a train data TRUE, if is a test data FALSE
value: boolean (TRUE or FALSE)

TRANSFORMATIONS

In getting_data_project.csv

I have calculated the mean and standard deviation of differents tables. I have created a column (train), I keep the information
of data origin (train or test directories)

In data_aggregate.csv I have grouped the data for subject. Any subject (Individual) has six rows, one row per activity with the average of activity values