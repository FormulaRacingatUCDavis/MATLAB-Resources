function PlotInLineText( Text, Line, Location, Size )
%% PlotInLineText - Plots Text Object on Give Line of Data
% This function comes in handy for carpet plots to label isocontours of a
% given variable.
% 
% Inputs:
%   Text     - Character vector label to be plotted
%   Line     - The data the string should be wrapped on
%   Location - [1x2] double 
%       Location(1) - (x|y)-coordinate where text should be placed
%       Location(2) - Axis selection
%   Size     - Desired font size
% 
% Notes:
% - Does not currently work on subplots
%
% Authors:
% Blake Christierson (bechristierson@ucdavis.edu)

if Location(2) == 1
    Idx = find( Line(1,:) < Location(1), 1, 'last' );
else
    Idx = find( Line(2,:) < Location(1), 1, 'last' );
end

% Rest of the code is from: 
Angle = atan2d( (Line(2,Idx+1)-Line(2,Idx-1)) / range(ylim(gca)) , ...
                (Line(1,Idx+1)-Line(1,Idx-1)) / range(xlim(gca)) ); 

text( Line(1,Idx), Line(2,Idx), Text, 'Rotation', Angle, ...
    'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Middle', ...
    'BackgroundColor', 'white', 'FontSize', Size, 'Interpreter', 'latex' ); 

end