function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

    % ===========================================================
    % Compute the F1 score of choosing epsilon as the
    % threshold and place the value in F1. The code at the
    % end of the loop will compare the F1 score for this
    % choice of epsilon and set it to be the best epsilon if
    % it is better than the current choice of epsilon.
    %               
    % Note: We can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions

bestEpsilon = 0;
bestF1 = 0;
stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
	truepositive=0;
	falsepositive=0;
	falsenegative=0;
	predictedvalue=zeros(size(pval));
	predictedvalue=(pval<epsilon); %Remember that in case of anomaly y=1
	for i=1:size(pval)
		if(predictedvalue(i)==1&&yval(i)==1)
			truepositive++;
		elseif(predictedvalue(i)==1&&yval(i)==0)
			falsepositive++;
		elseif(predictedvalue(i)==0&&yval(i)==1)
			falsenegative++;
		endif
	endfor
	precision=truepositive/(truepositive+falsepositive);
	recall=truepositive/(truepositive+falsenegative);
	F1=2*precision*recall/(precision+recall);

    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
