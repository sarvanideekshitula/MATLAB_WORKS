function bayes()
    meas = [
  2 14 33 50
  2 10 36 46
  2 16 31 48
  1 14 36 49
  2 13 32 44
  2 16 38 51
  2 16 30 50
  4 19 38 51
  2 14 30 49
  2 14 36 50
  4 15 34 54
  2 14 42 55
  2 14 29 44
  1 14 30 48
  3 17 38 57
  4 15 37 51
  2 13 35 55
  2 13 30 44
  2 16 32 47
  2 12 32 50
  1 11 30 43
  2 14 35 51
  4 16 34 50
  1 15 41 52
  2 15 31 49
  4 17 39 54
  2 13 32 47
  2 15 34 51
  1 15 31 49
  2 15 37 54
  4 13 39 54
  3 13 23 45
  3 15 38 51
  2 15 35 52
  3 14 34 46
  5 17 33 51
  2 14 34 52
  6 16 35 50
  3 14 30 48
  2 19 34 48
  2 12 40 58
  2 14 32 46
  4 15 44 57
  2 15 34 52
  2 15 31 46
  3 13 35 50
  3 14 35 51
  2 16 34 48
  2 17 34 54
  2 15 37 53
 13 45 28 57
 16 47 33 63
 14 47 32 70
 12 40 26 58
 10 33 23 50
 10 41 27 58
 15 45 29 60
 10 33 24 49
 14 39 27 52
 12 39 27 58
 15 42 30 59
 13 44 23 63
 15 49 25 63
 11 30 25 51
 13 36 29 56
 14 44 30 66
 17 50 30 67
 15 45 22 62
 14 46 30 61
 11 39 25 56
 15 45 32 64
 15 45 30 54
 14 44 31 67
 10 35 26 57
 13 42 26 57
 13 42 27 56
 16 45 34 60
 10 35 20 50
 13 54 29 62
 10 50 22 60
 12 47 28 61
 13 41 28 57
 15 49 31 69
 13 40 25 55
 14 48 28 68
 15 46 28 65
 18 48 32 59
 16 51 27 60
 13 40 28 61
 11 38 24 55
 12 44 26 55
 15 45 30 56
 12 42 30 57
 13 56 29 66
 10 37 24 55
 15 47 31 67
 13 41 30 56
 13 43 29 64
 14 47 29 61
 13 40 23 55
 24 56 31 67
 23 51 31 69
 20 52 30 65
 19 51 27 58
 17 45 25 49
 19 50 25 63
 18 49 27 63
 21 56 28 64
 19 51 27 58
 18 55 31 64
 15 50 22 60
 23 57 32 69
 20 49 28 56
 18 58 25 67
 21 54 31 69
 25 61 36 72
 21 55 30 68
 22 56 28 64
 15 51 28 63
 23 59 32 68
 23 54 34 62
 25 57 33 67
 18 51 30 59
 23 53 32 64
 21 57 33 67
 18 60 32 72
 18 49 30 61
 23 61 30 77
 18 48 30 60
 20 51 32 65
 25 60 33 63
 18 55 30 65
 22 67 38 77
 21 66 30 76
 13 52 30 67
 20 64 38 79
 20 67 28 77
 14 56 26 61
 18 48 28 62
 24 56 34 63
 16 58 30 72
 21 59 30 71
 18 56 29 63
 23 69 26 77
 19 61 28 74
 18 63 29 73
 22 58 30 65
 19 53 27 64
 20 50 25 57
 24 51 28 58];
%rng(30);
ind = randperm(150);
ti = ind(1:105);
vi = ind(106:150);
p1 = sum(ti<=50)/length(ti);
p2 = sum(ti>50 & ti<=100)/length(ti);
p3 = sum(ti>100 & ti<=150)/length(ti);
meas1 = meas(ti<=50, :);
meas2 = meas(ti>50 & ti<=100, :);
meas3 = meas(ti>100 & ti<=150, :);
M1 = mean(meas1);
cov1 = cov(meas1);
M2 = mean(meas2);
cov2 = cov(meas2);
M3 = mean(meas3);
cov3 = cov(meas3);
trainlabel = zeros(150, 1); 
for i=51:100
    trainlabel(i) = 1;
end
for i=101:150
    trainlabel(i) = 2;
end
predictivelabel = zeros(length(trainlabel), 1);
for i=1:length(meas1)
    x = meas1(i, :);
    likelihood1 = (1/((2*pi)^(4/2))*sqrt(det(cov1)))*(exp((-1/2)*(x-M1)*inv(cov1)*transpose(x-M1)));
end
for i=1:length(meas2)
    x = meas(i, :);
    likelihood2 = (1/((2*pi)^(4/2))*sqrt(det(cov2)))*(exp((-1/2)*(x-M2)*inv(cov2)*transpose(x-M2)));
end
for i=1:length(meas3)
    x = meas(i, :);
    likelihood3 = (1/((2*pi)^(4/2))*sqrt(det(cov3)))*(exp((-1/2)*(x-M3)*inv(cov3)*transpose(x-M3)));
end
evidence = likelihood1*p1 + likelihood2*p2+likelihood3*p3;
pos1 = likelihood1*p1/evidence;
pos2 = likelihood2*p2/evidence;
pos3 = likelihood3*p3/evidence;

if pos1 >= pos2 && pos1 >= pos3
    predictivelabel(i) = 0;
elseif pos2 >= pos1 && pos1 >= pos3
     predictivelabel(i) = 1;
elseif pos3 >= pos1 && pos3 >= pos2
    predictivelabel(i) = 2;
end

trainCount = sum(predictivelabel == trainlabel)/length(predictivelabel);
trainCount*100