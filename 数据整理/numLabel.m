function labelNum = numLabel(spLabels)
validMap = true(size(spLabels));
validLabels = spLabels(validMap);
labelNum = length(unique(validLabels(:)));