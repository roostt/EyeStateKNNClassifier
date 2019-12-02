function [accuracy] = f_calcAccuracy(actual_label, predicted_label)

    if(isequal(size(actual_label), size(predicted_label)))
            true_match=0;
            false_match=0;

            for indis=1:1:length(actual_label)
                if( isequal(actual_label(indis, 1), predicted_label(indis, 1)) )
                    true_match = true_match + 1;
                else
                    false_match = false_match + 1;
                end
            end

            accuracy = true_match / (true_match + false_match) * 100;
    else
        error('Test and label data have different size. Accuracy could not calculated.');
    end
    
end


    

