#-----------------------------------------------------------------------
#Description : Opening a file and searching for a pattern in read mode
#Function Used : search()
#-----------------------------------------------------------------------
import re
import sys
import os
import time
from datetime import datetime

## Variables
reg_list_array = []
debug = 0


# Get regression list as input
regression_list = str(sys.argv[1])
if debug:
  print(regression_list);

# Reading the file
path = "../../src/testlists/" + regression_list
if debug:
  print(path)

with open(path,'r') as f:
  for line in f:
    match = re.search('\#',line);
    if(match): 
      continue;

    match = re.search('(.*Test)',line);
    if(match):
      reg_list_array.append(match.group(0))
      if debug:
        print(match.group(0));

outputLogFile = "featureViolatedByRTLReport.log"
open(outputLogFile, "w").close()

def write_into_error_file(logFile, simulationLogFile):
    errorKeywords = ["ERROR","Error","FATAL"]
    errorFound = []

    with open(simulationLogFile,"a") as simulationFile:
        for logFilePath in logFile:
            try:
                with open(logFilePath, "r") as file:
                    simulationFile.write("\n--- Errors from log file: {} ---\n".format(logFilePath))
                    for lineNumber, line in enumerate(file, start = 1):
                        if any(keyword in line for keyword in errorKeywords):
                            errorLine = "{} - Line {}: {}".format(logFilePath, lineNumber, line.strip())
                            errorFound.append(errorLine)
                            simulationFile.write(errorLine + "\n")

            except FileNotFoundError:
                print("Error: The file {} was not found".format(logFilePath))
                simulationFile.write("Error: The file {} was not found\n".format(logFilePath))
            except Exception as e:
                print("An error occurred while reading {}: {}".format(logFilePath, e))
                simulationFile.write("An error occurred while reading {}: {}\n".format(logFilePath, e))

        if not errorFound:
            simulationFile.write("Errors Found in the log file:\n")
            print("No errors found in the log files")
        else:
            print("Errors written to {}".format(simulationLogFile))

for testname in reg_list_array:
  timestr = time.strftime( "%d%m%Y-%H%M%S" )
  if debug:
    print( "time string : ", timestr )

  test_folder = "{}_{}".format(testname,timestr)

  line = "make simulate test_folder={} test={}".format(test_folder, testname)
  if debug:
    print(line)
  os.system(line)

  logFile = ["{}/{}.log".format(test_folder, testname)] 
  write_into_error_file(logFile,"featureViolatedByRTLReport.log")



