run_analysis<-function(directory,control)
{
        old<-getwd()
        ## go to directory test or train
        setwd(directory)
        list_directory<-list.files(pattern="*.txt")
        ## read files directory
        x<-read.table(list_directory[1])
        z<-read.table(list_directory[2],sep="")
        y<-read.table(list_directory[3])
        ## calcule mean and sd of X_train or test
        z_mean<-apply(z,1,mean)
        z_sd<-apply(z,1,sd)
        ## read files directory Inertial Signals and calculate mean and sd
        list_directory<-list.files(path="Inertial Signals", pattern="*.txt")
        n<-1
        signal_list<-list()
        setwd("Inertial Signals")
        for (i in list_directory)
        {
                signal<-read.table(i,sep="")
                signal_list[n]<-list(apply(signal,1,mean))
                n<-n+1
                signal_list[n]<-list(apply(signal,1,sd))
                n<-n+1
        }
        setwd(old)
        ## build data frame with pretty names
        columns<-c("Individual","Activity","data_mean","data_sd","body_acc_x_mean",
                   "body_acc_x_sd","body_acc_y_mean","body_acc_y_sd",
                   "body_acc_z_mean","body_acc_z_sd","body_gyro_x_mean",
                   "body_gyro_x_sd","body_gyro_y_mean","body_gyro_y_sd",
                   "body_gyro_z_mean","body_gyro_z_sd","total_acc_x_mean",
                   "total_acc_x_sd","total_acc_y_mean","total_acc_y_sd",
                   "total_acc_z_mean","total_acc_z_sd","train")
        data<-data.frame(x,y,z_mean,z_sd,signal_list[1],
                    signal_list[2],signal_list[3],signal_list[4],
                    signal_list[5],signal_list[6],signal_list[7],
                    signal_list[8],signal_list[9],signal_list[10],
                    signal_list[11],signal_list[12],signal_list[13],
                    signal_list[14],signal_list[15],signal_list[16],
                    signal_list[17],signal_list[18],control)
        names(data)<-columns
        return(data)
}

union<-function()
{
        ## execute run_analisys in directory test and train
        data1<-run_analysis("test",FALSE)
        data2<-run_analysis("train",TRUE)
        ## join data
        data3<-rbind(data1,data2)
        
        return(data3)
        
        
        
}

mean_by_subject<-function(data)
{
        ## calculate mean by subject(Individual) and Activity
        attach(data)
        data_mod<-aggregate(data, by=list(Individual,Activity), FUN=mean)
        
        data_mod<-data_mod[,-1:-2]
        
        
        return(data_mod)
}

labels<-function(data)
{
        ## give text names to column Activity
        activity<-data$Activity
        vector<-c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying")
        activity<-vector[activity]
        data$Activity<-activity
        return(data)
}

prepare_data<-function()
{
        data<-union() ## join datas
        data_labelled<-labels(data) ## labelled Activity column
        write.csv(data_labelled,file="getting_data_project.csv")
        data2<-mean_by_subject(data) ## second tidy data
        data2_labelled<-labels(data2) ## labelled Activity secon tidy data
        write.csv(data2_labelled, file="data_aggregate.csv")
        print("The script has ended")
}