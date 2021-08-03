%Yousef Ghanem     1172333
%Mahmoud Sub Laban 1172144
%Issam al-Ashhab   1172602



clear
clc
wrong=0;
right=0;
in=0;
fileID = fopen('output.txt','w');
while in ~= 1 || in ~= 2 || in ~= 3 || in ~= 4
in = input('Which method do you want to use? ([1] cross correlation, [2] Fourier Transform, [3] filter bank ,[4] Project testing(prints in output.txt))\n');

switch in     %get data
    case 1
        data1;
        break;
    case 2
        data2;
        break;
    case 3
        data3;
        break;
    case 4
        data4;
        fileID = fopen('output.txt','w');
        break;
    otherwise
        disp('Unknown method.')
        
end
end

%testing files
if in == 4
    k = 26;
else
    k = 39;
end

for j=1:k
    flag=0;
    high=1;
    for i=1:13
        if in ~= 4 
        if i == ceil(j/3)
            continue
        else
            if in == 1
            if max(xcorr(m{ceil(j/3)},t{j})) < max(xcorr(m{i},t{j}))
            flag=1;
            index=i;
     
            end
            else
                if in == 2 || in == 3
                    if cosSim(t{j},m{ceil(j/3)}) < cosSim(t{j},m{i})
                    flag=1;
                    index=i;
                    end
                end
            end
        end
        end
        if in == 4
            if cosSim(test{j},m{high}) < cosSim(test{j},m{i})
                high=i;
            end
        end
    end
    if in == 1 || in == 2 || in == 3
    if flag == 0
        right=right+1;
        disp('Correct Word is:');
        index = ceil(j/3);
    else
        wrong=wrong+1;
        disp('inCorrect Word is:');
    end
    switch index
                    case 1
                        disp('had');
                        
                    case 2
                        disp('hade');
                        
                    case 3
                        disp('hard');
                        
                    case 4
                        disp('head');
                        
                    case 5
                        disp('heard');
                        
                    case 6
                        disp('heed');
                        
                    case 7
                        disp('hid');
                        
                    case 8
                        disp('hide');
                        
                    case 9
                        disp('hoard');
                        
                    case 10
                        disp('hod');
                        
                    case 11
                        disp('hood');
                        
                    case 12
                        disp('hudd');
                        
                    case 13
                        disp('whod');
                        
    end
    
    else
        if in == 4
            switch high
                    case 1
                        fprintf(fileID,'had');
                        
                    case 2
                        fprintf(fileID,'hade');
                        
                    case 3
                        fprintf(fileID,'hard');
                        
                    case 4
                        fprintf(fileID,'head');
                        
                    case 5
                        fprintf(fileID,'heard');
                        
                    case 6
                        fprintf(fileID,'heed');
                        
                    case 7
                        fprintf(fileID,'hid');
                        
                    case 8
                        fprintf(fileID,'hide');
                        
                    case 9
                        fprintf(fileID,'hoard');
                        
                    case 10
                        fprintf(fileID,'hod');
                        
                    case 11
                        fprintf(fileID,'hood');
                        
                    case 12
                        fprintf(fileID,'hudd');
                        
                    case 13
                        fprintf(fileID,'whod');
                        
            end
            fprintf(fileID,'\n');
        end
    end
end
fclose(fileID);
if in == 1 || in == 2 || in == 3
%calculating accuracy
Accuracy = (right/(wrong+right))*100;
fprintf('Accuracy = %f%%\n',Accuracy);
else
    disp('Result in output.txt');
end


%cosine similarity of 2 signals
function y=cosSim(t,m)
f = abs(fft(t));
f = f(1:floor(length(f)/2));
m=m(1:length(f));
y = dot(f,m)/(norm(f)*norm(m));
end