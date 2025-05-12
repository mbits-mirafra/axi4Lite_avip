import re
import sys
import os

# Writing error info from all log files to featureViolatedByRTLReport.log file and this function calling in regression_handling.py because every testcase need to write error info
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

