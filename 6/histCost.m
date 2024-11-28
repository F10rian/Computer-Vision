function HC = histCost(P, Q)
% Chi^2-Test zum Vergleich zweier Histogramme
    
    
    % TODO
    numP = size(P, 1);
    numQ = size(Q, 1);

    % Preallocate for efficiency
    minChi2_P_to_Q = zeros(numP, 1); % To store min chi^2 for each p in P
    minChi2_Q_to_P = zeros(numQ, 1); % To store min chi^2 for each q in Q

    % Compute min chi^2 distance from each p in P to Q
    for i = 1:numP
        p = P(i, :); % Extract i-th histogram from P
        chi2_vals = zeros(numQ, 1); % Temporary storage for chi^2 distances
        for j = 1:numQ
            q = Q(j, :); % Extract j-th histogram from Q
            chi2_vals(j) = 0.5 * sum((p - q).^2 ./ max((p + q), 1e-10));
        end
        minChi2_P_to_Q(i) = min(chi2_vals); % Find the minimum chi^2 for p
    end

    % Compute min chi^2 distance from each q in Q to P
    for j = 1:numQ
        q = Q(j, :); % Extract j-th histogram from Q
        chi2_vals = zeros(numP, 1); % Temporary storage for chi^2 distances
        for i = 1:numP
            p = P(i, :); % Extract i-th histogram from P
            chi2_vals(i) = 0.5 * sum((p - q).^2 ./ max((p + q), 1e-10));
        end
        minChi2_Q_to_P(j) = min(chi2_vals); % Find the minimum chi^2 for q
    end

    % Compute final distance D(P, Q)
    HC = (1 / numP) * sum(minChi2_P_to_Q) + (1 / numQ) * sum(minChi2_Q_to_P);
    
end
