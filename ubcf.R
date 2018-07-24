#movie recommendations using user based collaborative filtering

library(recommenderlab)

#getting the data set 
data("MovieLense")


# set the seed to reproduce my sample or  it will output same output when ever the model is executed
set.seed(2)

#split data into test and train 
train_obs <- floor (0.8*nrow (MovieLense))
print(train_obs)

train_ind<-sample(seq_len(nrow(MovieLense)),size=train_obs)
test = -train_ind

#assigning samples for training and testing 
train<-MovieLense[train_ind,]
test<-MovieLense[test,]

#calling the recommender function 
rec_model_ubcf<-Recommender(data= train, method="UBCF")
rec_model_ubcf

n_rec_ubcf<- 10

rec_pred_ubcf<- predict(object=rec_model_ubcf, newdata= test, n=n_rec_ubcf)
rec_pred_ubcf

#getting prediction for a user
#Running the recommender function and obtaining top-10 recommendations for a particular user,
#looks like this:

rec_user_1_ubcf<- rec_pred_ubcf@items[[1]]

movies_user_1_ubcf<- rec_pred_ubcf@itemLabels[rec_user_1_ubcf]
movies_user_1_ubcf
