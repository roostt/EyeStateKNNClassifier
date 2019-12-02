clc; close all; clear all;

%load training data to a variable named as t_data
load('EEGEyeStateDataSet_Data.mat');
if(exist('t_data', 'var'))
    disp('Data loaded correctly.');
end

%load test data to a variable named t_label
load('EEGEyeStateDataSet_Labels.mat');
if(exist('t_label', 'var'))
    disp('Labels loaded correctly.');
end 

number_of_cv = 10;

%distance metrics
Distance={  'cityblock', ...
            'chebychev', ... 
            'correlation', ...
            'cosine', ...
            'euclidean', ...              
            'mahalanobis', ...
            'minkowski', ...
            'seuclidean', ...
            'spearman' };

%only for 'equal' distance weight
%you can use another <appropriate> weights
DistanceWeight={'equal'};

%cross validate the entire data
indices = crossvalind('Kfold', t_label, number_of_cv);
cp = classperf(t_label);  

%for each folded data train and test it

for cv = 1:number_of_cv
    
    test = (indices == cv); train = ~test;
    train_data = t_data(train,:);   train_label = t_label(train,:);
    test_data = t_data(test,:);     test_actual_labels = t_label(test,:);
    
    disp('==========================');
    disp(['Cross validation number: ',num2str(cv)]);
    disp('==========================');
    
    results_one_cv=[];
     
    for d=1:length(Distance) %for each distance metric
        
        disp('> Training ...');
        [trained_classifier, min_misclassification_rate, best_num_neighbors, mdlKNN] = f_kNNClassifier(train_data, train_label, Distance(d), DistanceWeight(1));
        disp('> Training finished.');
        disp('> Testing ...');
        predicted_labels = predict(trained_classifier, test_data);
        disp('> Testing finished.');
        accuracy=f_calcAccuracy(test_actual_labels, predicted_labels);

        disp(['> Distance metric: ',upper(trained_classifier.Distance)]);
        disp(['> Distance weight: ',upper(trained_classifier.DistanceWeight)]);
        disp(['> Best number of neighbors: ', num2str(best_num_neighbors)]);
        disp(['> Min misclassification rate:', num2str(min_misclassification_rate),'%']);
        disp(['> Accuracy: ',num2str(accuracy), '%']);
        disp('> --------------------------');
                
        results_one_cv=[results_one_cv; d accuracy];
    end
    
    results_all{cv}=results_one_cv;
end

disp('Finished.');



