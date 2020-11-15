function W = train(X, y, centers, widths)
    phi = computePhi(X, centers, widths);
    W = pinv(phi) * y;
end