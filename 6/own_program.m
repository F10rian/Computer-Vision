load("ShapeContextData.mat")
imgIdx = 1;
nPoints = 100;
img = train_data(:,:,imgIdx);
label = label_train(imgIdx);

edgePoints = getEdgePoints(img, nPoints);

P = [0.5, 0.5];
nBinsTheta = 10;            % Anzahl Bins für die Winkel von 0° bis 360°
nBinsR = 10;                % Anzahl Bins für Abstand von r_min bis r_max
rMin = 0.1;
rMax = 10;

SC = scCompute(P, edgePoints, nBinsTheta, nBinsR, rMin, rMax);

x_edges = 1:size(SC, 2);
y_edges = 1:size(SC, 1);


subplot(1, 3, 1);
imshow(img);

subplot(1, 3, 2);
plot(edgePoints(:, 1), edgePoints(:, 2), "x");

subplot(1, 3, 3);
imagesc(x_edges, y_edges, SC);
colormap("gray");
colorbar;