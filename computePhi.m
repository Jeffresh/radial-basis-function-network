function phi = computePhi(X, centers, width)
    if size(width, 2) == 1
        variances = width * ones(1, size(centers, 2));
    else
        variances = width;
    end
    
    phi(size(X , 1), size(centers, 2)) = 0;
    
    for i=1:size(centers, 2),
        phi(:, i) = normpdf(X, centers(:, i), variances(i));
    end
end