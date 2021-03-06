function walkconstantT0001f1 = importfile(filename, dataLines)
%IMPORTFILE Import data from a text file
%  WALKCONSTANTT0001F1 = IMPORTFILE(FILENAME) reads data from text file
%  FILENAME for the default selection.  Returns the data as a table.
%
%  WALKCONSTANTT0001F1 = IMPORTFILE(FILE, DATALINES) reads data for the
%  specified row interval(s) of text file FILENAME. Specify DATALINES as
%  a positive scalar integer or a N-by-2 array of positive scalar
%  integers for dis-contiguous row intervals.
%
%  Example:
%  walkconstantT0001f1 = importfile("/Users/rjhorn/Documents/DocumentsCopiedFromiCloud/GitHub/Research Techniques/walk_constantT0001_f_1.tsv", [28, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 26-Jan-2020 13:40:49

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [28, Inf];
end

%% Setup the Import Options
opts = delimitedTextImportOptions("NumVariables", 9);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["Force_X", "Force_Y", "Force_Z", "Moment_X", "Moment_Y", "Moment_Z", "COP_X", "COP_Y", "Var9"];
opts.SelectedVariableNames = ["Force_X", "Force_Y", "Force_Z", "Moment_X", "Moment_Y", "Moment_Z", "COP_X", "COP_Y"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "string"];
opts = setvaropts(opts, 9, "WhitespaceRule", "preserve");
opts = setvaropts(opts, 9, "EmptyFieldRule", "auto");
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
walkconstantT0001f1 = readtable(filename, opts);

end