load("ShapeContextData.mat")
imgIdx = 5;
nPoints = 100;
shift = 4;
img = train_data(:,:,imgIdx);
img2 = train_data(:,:,imgIdx+shift);
label = label_train(imgIdx);
label2 = label_train(imgIdx+shift);
edgePoints = getEdgePoints(img, nPoints);
edgePoints2 = getEdgePoints(img2, nPoints);

P = [0.5, 0.5];
nBinsTheta = 10;            % Anzahl Bins für die Winkel von 0° bis 360°
nBinsR = 10;                % Anzahl Bins für Abstand von r_min bis r_max
rMin = 0.1;
rMax = 10;

SC = scCompute(P, edgePoints, nBinsTheta, nBinsR, rMin, rMax);
SC2 = scCompute(P, edgePoints2, nBinsTheta, nBinsR, rMin, rMax);

x_edges = 1:size(SC, 2);
y_edges = 1:size(SC, 1);

x_edges2 = 1:size(SC2, 2);
y_edges2 = 1:size(SC2, 1);


subplot(2, 3, 1);
imshow(img);

subplot(2, 3, 2);
plot(edgePoints(:, 1), edgePoints(:, 2), "x");

subplot(2, 3, 3);
imagesc(x_edges, y_edges, SC);
colormap("gray");
colorbar;




subplot(2, 3, 4);
imshow(img2);

subplot(2, 3, 5);
plot(edgePoints2(:, 1), edgePoints2(:, 2), "x");

subplot(2, 3, 6);
imagesc(x_edges2, y_edges2, SC2);
colormap("gray");
colorbar;

disp(histCost(SC, SC2));