run_analysis<-function(working.directory) {
  ## run_analysis() processes test and training
  ## measurements for the "Getting and Cleaning Data"
  ## class project.  Source data is from the link:
  ## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
  ## data is expected to be unpacked to a working directory.
  
  ## Arguments: path to the working directory.  Note that this is
  ## not the unpack directory, but the complete directory to the highest level containing
  ## the actual data files.
  
  
  ## Load required packages
  if(!require(plyr)) {
    install.packages("plyr")
    if(!require(plyr)) {
      stop("can't install plyr package")
    }
  }
  if(!require(stringr)) {
    install.packages("stringr")
    if(!require(stringr)) {
      stop("can't install stringr package")      
    }
  }
  
  if(!require(dplyr)) {
    install.packages("dplyr")
    if(!require(dplyr)) {
      stop("can't install dplyr package")      
    }
  }
  
  if(!require(data.table)) {
    install.packages("data.table")
    if(!require(data.table)) {
      stop("can't install data.table package")      
    }
  }
  
  if(!require(R.utils)) {
    install.packages("R.utils")
    if(!require(R.utils)) {
      stop("can't install R.utils package")      
    }
  }
  
  ## Set data directory within working directory
  if(is.null(setwd(working.directory))) {
    stop(paste("Invalid working directory path: ",working.directory))
  }
  
  
  ## STEP 1 - Build merged dataset
  ## get x test data
  xtest<-read.table("test/x_test.txt")
  
  ## get y test data
  ytest<-read.table("test/y_test.txt")
  
  ## get subject test data
  stest<-read.table("test/subject_test.txt")
  stest[,1]<-as.numeric(stest[,1])
  
  ## get x train data
  xtrain<-read.table("train/x_train.txt")
  
  ## get y train data
  ytrain<-read.table("train/y_train.txt")
  
  ## get subject train data
  strain<-read.table("train/subject_train.txt")
  strain[,1]<-as.numeric(strain[,1])
  
  ## rename column names of subject DFs to 'subject'
  ## k1 variable is built for later use during filtering
  k1=NULL
  ws<-"Subject"
  colnames(stest)<-ws
  colnames(strain)<-ws
  k1<-c(k1,ws)
  
  
  
  ## rename colummn names for test label (y) DFs to Test_Code
  ws<-"TestCode"
  colnames(ytest)<-ws
  colnames(ytrain)<-ws
  k1<-c(k1,ws)
  
  ## merge subject (subject), test label (y), and activity(x) data
  m1test<-cbind(stest,ytest,xtest)
  m1train<-cbind(strain,ytrain,xtrain)
  
  ## merge test and train data
  mdata<-rbind(m1train,m1test)
  
  ## add column for descriptive test names
  activities<-read.table("activity_labels.txt")
  f<-function(x,y) {y[x,2]}
  tx<-sapply(mdata$TestCode,f,y=activities)
  wx<-data.frame(tx)
  ws<-"Activity"
  colnames(wx)<-"Activity"
  k1<-c(k1,ws)
  mdata<-cbind(mdata,wx)
  
  ## STEP 2 - Scan feature label file as it is
  ## the best way available to determine what is
  ## a mean or standard deviation.
  ## We will then use the selected fields to filter
  ## the data.
  ## Criteria: feature containing -mean(), -std(),
  ## meanFreq() and gravityMean.
  ## While kurtosis correlates to std, it is classified
  ## as a distinct property so is omitted.
  
  ## load features table
  actf<-read.table("features.txt")
  
  ## find required measurements
  work<-actf$V2
  okm<-grep("-mean()",work,fixed=TRUE)
  oks<-grep("-std()",work,fixed=TRUE)
  okmf<-grep("meanFreq",work,fixed=TRUE)
  okg<-grep("gravityMean",work,fixed=TRUE)
  okAM<-grep("tBodyAccMean",work,fixed=TRUE)
  okAJ<-grep("tBodyAccJerkMean",work,fixed=TRUE)
  okGM<-grep("tBodyGyroMean",work,fixed=TRUE)
  okJM<-grep("tBodyGyroJerkMean",work,fixed=TRUE)
  
  ## merge into a single sorted vector
  ok<-c(okm,oks,okmf,okg,okAM,okAJ,okGM,okJM)
  ok1<-sort(unique(ok))

  ## create list of column names to retain
  f<-function(x) {paste("V",x,sep="",collapse=NULL)}
  klist<-sapply(ok1,f)
  wlist<-c(k1,klist)
  odata<-mdata[wlist]
  
  
  ## Steps 3 and 4: Finally, rename column names  To minimize confusion
  ## we are using the same names as in the feature file,
  ## removing punctuation and special characters.
  
  keeplabels=NULL
  ctr<-length(ok1)
  for(j in 1:ctr) {
    label<-as.character(actf[ok1[j],2])
    keeplabels<-c(keeplabels,label)
  }

  f1colnames<-str_replace_all(keeplabels,"\\(|\\)|,|-","")
  f2colnames<-capitalize(f1colnames)
  f3colnames<-paste("Avg",f2colnames,sep="")
  fcolnames<-c(k1,f3colnames)
  colnames(odata)<-fcolnames
  odata<-arrange(odata,Activity,Subject)
  
  ##  Step 5 - Assemble new dataframe averaging data by subject and activity
  
  sdata<-data.table(odata[,!(names(odata) %in% "TestCode")])
  results<-sdata[,lapply(.SD,mean), by=.(Activity,Subject)]

  return(results)
}
