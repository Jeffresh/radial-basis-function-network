function y = predict(X, centers, widths, W)
    phi = computePhi(X, centers, widths);
    y = (phi * W)';
end