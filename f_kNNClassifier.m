function [ trained_classifier, min_misclassification_rate, best_num_neighbors, mdl] = f_kNNClassifier(t_data, t_label, distance, distanceweight)

    feat_vec_train=t_data;
   
    mdl = ClassificationKNN.fit(feat_vec_train,t_label);
    mdl.Distance=char(distance);
    mdl.DistanceWeight=char(distanceweight);
    knn=1:2:101;
    for i=1:length(knn)
        mdl.NumNeighbors=knn(i);
        knn_regf = @(XTRAIN,ytrain,XTEST) predict(ClassificationKNN.fit(XTRAIN,ytrain),XTEST);
        knn_err(i) = crossval('mcr',feat_vec_train,t_label,'predfun',knn_regf);
    end

    min_misclassification_rate=min(knn_err);

    bestKNN=knn(knn_err==min(knn_err));
    mdl.NumNeighbors=min(bestKNN);

    best_num_neighbors=mdl.NumNeighbors;

    trained_classifier= mdl;
end

