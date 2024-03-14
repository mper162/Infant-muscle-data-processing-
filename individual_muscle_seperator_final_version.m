clc; clear all;

%  mainImageFile = 'PD_Thigh.nii.gz';
%  uncompressedImageFile = gunzip(mainImageFile, tempdir);
% 
% % Load the main image
% % mainImage = load_nii(uncompressedImageFile{1});
% 
% %mainImage = load_nii('pd_upper_2024_1.nii'); 
% mainImage = load_untouch_nii(uncompressedImageFile);


mainImageFile = 'pd_thigh.nii.gz';
uncompressedImageFile = gunzip(mainImageFile, tempdir);

% Extract the uncompressed file path from the cell array
uncompressedImageFile = uncompressedImageFile{1};

% Load the main image
mainImage = load_untouch_nii(uncompressedImageFile);


%mainImage = load_nii(pd_thigh2.nii);

% Save the main image as main.nii inside the muscle_segmentations folder
outputDir = 'Individual_muscle_segmentations';
if ~exist(outputDir, 'dir')
    mkdir(outputDir);
end
mainNiiFile = fullfile(outputDir, 'main.nii');
save_untouch_nii(mainImage, mainNiiFile);

% Clean up temporary files
%delete(uncompressedImageFile{1});

disp('Main image saved as main.nii');

% Load the main segmentation file (compressed)
mainSegFile = 'p35_2024.nii.gz' ;                            
                    
uncompressedSegFile = gunzip(mainSegFile, tempdir);
uncompressedSegFile = uncompressedSegFile{1};
mainSeg = load_untouch_nii(uncompressedSegFile);
mainSegData = mainSeg.img;


 mainsegFile = fullfile(outputDir, 'mainSeg.nii');
 save_untouch_nii(mainSeg, mainsegFile);

% Define the file path for the label description
labelFile = 'Label_1.txt';

% Open the file for reading
fid = fopen(labelFile, 'r');

% Check if the file opened successfully
if fid == -1
    error('Could not open the label description file.');
end

% Initialize arrays to store color codes and muscle names
colorCodes = [];
muscleNames = {};

% Read each line of the file
tline = fgetl(fid);
while ischar(tline)
    % Skip empty lines
    if ~isempty(tline)
        % Split the line into individual components
        components = strsplit(tline, {' ', '  ', '    ', '       ', '        ', '         ', '          '});
        
        % Extract color code and muscle name
        colorCode = str2double(components{1});
        muscleName = components{end}(2:end-1); % Remove quotes from muscle name
        
        % Add color code and muscle name to arrays
        colorCodes(end+1) = colorCode;
        muscleNames{end+1} = muscleName;
    end
    
    % Read the next line
    tline = fgetl(fid);
end

% Close the file
fclose(fid);

% Create a directory to save individual muscle segmentations
if ~exist(outputDir, 'dir')
    mkdir(outputDir);
end

%colorCodes = [1; 2; 4; 6; 7; 8; 18; 19; 20; 21; 22; 23; 24; 25; 26; 27; 28; 29; 30; 31];
colorCodes = colorCodes';
% Loop through each muscle and extract corresponding segmentation

for i = 1:numel(colorCodes)
    colorCode = colorCodes(i);
    muscleName = muscleNames{i};
    
    % Extract segmentation for the current muscle
    muscleSeg = mainSegData;
    muscleSeg(muscleSeg ~= colorCode) = 0;
    
    % Save the muscle segmentation as a separate NIfTI file inside the muscle_segmentations folder
    muscleSegFile = fullfile(outputDir, [muscleName '_segmentation.nii']);
    nii = make_nii(muscleSeg, mainSeg.hdr.dime.pixdim(2:4), [], [], 'Muscle Segmentation');
    save_nii(nii, muscleSegFile);
    
    disp(['Segmentation saved for ' muscleName]);
end

% Clean up temporary files
%delete(uncompressedSegFile{1});




