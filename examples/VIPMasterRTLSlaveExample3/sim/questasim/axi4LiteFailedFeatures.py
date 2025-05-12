import os
import yaml

#Compares two files line by line and identifies words and Writes matching words to a difference file.
def compareFileAsStrings(axi4LiteFeatureList, featureViolatedByRTLReport, diffFile):
    with open(axi4LiteFeatureList, 'r') as file1:
        for file1Line in file1:
            temp1 = file1Line.split()
            
            with open(featureViolatedByRTLReport, 'r') as file2:
                for number2, file2line in enumerate(file2, start = 1):
                    temp2 = file2line.split()

                    for word1 in temp1:
                        for word2 in temp2:
                            if word2 in word1:
                                if word2 not in (':','#','-','ASSERTED','NOT','1','0','6','12','0:','command','Handshaking'):
                                    with open(diffFile, "a") as writeFile:
                                        writeFile.write(word2 + "\n")

    # Remove duplicate lines in the difference file
    with open(diffFile, 'r') as file:
        lines = file.readlines()
        uniqueLines = list(dict.fromkeys(lines))
    with open(diffFile, "w") as file:
        file.writelines(uniqueLines)

# Processes a difference file and matches violated features, requirements and DoD from a axi4LiteFeatureList.yaml. 
# Updates the violatedFeatures and violatedReqIDs based on the matches.
def generatedViolatedFeatures(axi4LiteFeatureList, diffFile, axi4LiteViolatedFeatues, violatedFeatures, violatedReqIDs):
    with open(diffFile, 'r') as logFile:
        for line in logFile:
            with open(axi4LiteFeatureList,'r') as file2:
                file = yaml.safe_load(file2)
                for name, feature in file.items():
                    for reqIDLoop in feature:
                        for key, reqID in reqIDLoop.items():
                            if "ReqID" in key:
                                finalProperty(axi4LiteViolatedFeatues, reqID, line, name, key, violatedFeatures, violatedReqIDs)
                            else:
                                for subFeature in reqID:
                                    for keySub, reqIDSub in subFeature.items():
                                        if "ReqID" in keySub:
                                            finalPropertySub(axi4LiteViolatedFeatues, reqIDSub, line, name, key, keySub, violatedFeatures, violatedReqIDs)

# Writes violated features, DoD, properties, and requirement IDs to corresponding files. 
def finalProperty(axi4LiteViolatedFeatues, reqIDList, line, name, key, violatedFeatures, violatedReqIDs):
    for dodKey, propertyDetails in reqIDList.items():
        for propertyKey, propertyList in propertyDetails.items():
            for propertyName in propertyList:
                if propertyKey == "AssertProperty":
                    if propertyName in line:
                        with open(axi4LiteViolatedFeatues, "a") as writeFile:
                            writeFile.write(f"{name} - {key} - {dodKey} - {propertyKey} - {propertyName} \n")
                        with open(violatedFeatures, "a") as violatedFile:
                            violatedFile.write(f"{name}\n")
                        with open(violatedReqIDs, "a") as violatedReqIDFile:
                            violatedReqIDFile.write(f"{key}\n")
                elif propertyKey == "CoverPoint":
                    if propertyName.strip() == line.strip():
                        with open(axi4LiteViolatedFeatues, "a") as writeFile:
                            writeFile.write(f"{name} - {key} - {dodKey} - {propertyKey} - {propertyName} \n")
                        with open(violatedFeatures, "a") as violatedFile:
                            violatedFile.write(f"{name}\n")
                        with open(violatedReqIDs, "a") as violatedReqIDFile:
                            violatedReqIDFile.write(f"{key}\n")
                elif propertyKey == "CrossCoverage":
                    if propertyName.strip() == line.strip():
                        with open(axi4LiteViolatedFeatues, "a") as writeFile:
                            writeFile.write(f"{name} - {key} - {dodKey} - {propertyKey} - {propertyName} \n")
                        with open(violatedFeatures, "a") as violatedFile:
                            violatedFile.write(f"{name}\n")
                        with open(violatedReqIDs, "a") as violatedReqIDFile:
                            violatedReqIDFile.write(f"{key}\n")
                elif propertyKey == "Scoreboard":
                    if propertyName.strip() == line.strip():
                        with open(axi4LiteViolatedFeatues, "a") as writeFile:
                            writeFile.write(f"{name} - {key} - {dodKey} - {propertyKey} - {propertyName} \n")
                        with open(violatedFeatures, "a") as violatedFile:
                            violatedFile.write(f"{name}\n")
                        with open(violatedReqIDs, "a") as violatedReqIDFile:
                            violatedReqIDFile.write(f"{key}\n")

# Writes violated features, DoD, properties, and requirement IDs with subFeatures to corresponding files. 
def finalPropertySub(axi4LiteViolatedFeatues, reqIDList, line, name, key, keySub, violatedFeatures, violatedReqIDs):
    for dodKey, propertyDetails in reqIDList.items():
        for propertyKey, propertyList in propertyDetails.items():
            for propertyName in propertyList:
                if propertyKey == "AssertProperty":
                    if propertyName in line:
                        with open(axi4LiteViolatedFeatues, "a") as writeFile:
                            writeFile.write(f"{name} - {key} - {keySub} - {dodKey} - {propertyKey} - {propertyName} \n")
                        with open(violatedFeatures, "a") as violatedFile:
                            violatedFile.write(f"{name}\n")
                        with open(violatedReqIDs, "a") as violatedReqIDFile:
                            violatedReqIDFile.write(f"{keySub}\n")
                elif propertyKey == "CoverPoint":
                    if propertyName.strip() == line.strip():
                        with open(axi4LiteViolatedFeatues, "a") as writeFile:
                            writeFile.write(f"{name} - {key} - {keySub} - {dodKey} - {propertyKey} - {propertyName} \n")
                        with open(violatedFeatures, "a") as violatedFile:
                            violatedFile.write(f"{name}\n")
                        with open(violatedReqIDs, "a") as violatedReqIDFile:
                            violatedReqIDFile.write(f"{keySub}\n")
                elif propertyKey == "CrossCoverage":
                    if propertyName.strip() == line.strip():
                        with open(axi4LiteViolatedFeatues, "a") as writeFile:
                            writeFile.write(f"{name} - {key} - {keySub} - {dodKey} - {propertyKey} - {propertyName} \n")
                        with open(violatedFeatures, "a") as violatedFile:
                            violatedFile.write(f"{name}\n")
                        with open(violatedReqIDs, "a") as violatedReqIDFile:
                            violatedReqIDFile.write(f"{keySub}\n")
                elif propertyKey == "Scoreboard":
                    if propertyName.strip() == line.strip():
                        with open(axi4LiteViolatedFeatues, "a") as writeFile:
                            writeFile.write(f"{name} - {key} - {keySub} - {dodKey} - {propertyKey} - {propertyName} \n")
                        with open(violatedFeatures, "a") as violatedFile:
                            violatedFile.write(f"{name}\n")
                        with open(violatedReqIDs, "a") as violatedReqIDFile:
                            violatedReqIDFile.write(f"{keySub}\n")

# searching coverpoint and cross coverage and adding not hiting coverage to report file
def writeCoverageIntoErrorFile(coverageLogFile, coverpointCrossReport):
    errorKeywords = ["Coverpoint","Cross"]
    notHit = ["ZERO","Uncovered"]

    with open(coverpointCrossReport,"a") as simulationFile:
        with open(coverageLogFile, "r") as file:
            for lineNumber, line in enumerate(file, start = 1):
                if any(keyword in line for keyword in errorKeywords):
                    if any(keyword in line for keyword in notHit):
                        simulationFile.write(line)

#counting lines and adding total, passed and failed feature number and reqID number in the violated files.
def countingFeaturesReqID(axi4LiteFeatureList, violatedFeatures, violatedReqIDs):
    with open(violatedFeatures, 'r') as file:
        lines = file.readlines()
        uniqueLines = list(dict.fromkeys(lines))
    with open(violatedFeatures, "w") as file:
        file.writelines(uniqueLines)

    featureCount = 0
    ReqIDCount = 0

    with open(axi4LiteFeatureList,'r') as file2:
        file = yaml.safe_load(file2)
        for name, feature in file.items():
            featureCount += 1
        for name, feature in file.items():
            for reqIDLoop in feature:
                for key, reqID in reqIDLoop.items():
                    if "ReqID" in key:
                        ReqIDCount += 1
                    else:
                        for subFeature in reqID:
                            for keySub, reqIDSub in subFeature.items():
                                if "ReqID" in keySub:
                                    ReqIDCount += 1
       
        with open(violatedFeatures, 'r') as file:
            featureLines = file.readlines()
        with open(violatedReqIDs, 'r') as file:
            reqIDLines = file.readlines()

        addFeature = [f"-------------------------------------------------------\n",f"Total Number of Implemented Features : {featureCount}\n",f"Failed Features : {len(featureLines)}\n",f"-------------------------------------------------------\n"]
        addReqID = [f"-------------------------------------------------------\n",f"Total Number of Implemented Requirements : {ReqIDCount}\n",f"Failed Requirements : {len(reqIDLines)}\n",f"-------------------------------------------------------\n"]
        featureLines[0:0] = addFeature
        reqIDLines[0:0] = addReqID
        with open(violatedFeatures, 'w') as file:
            file.writelines(featureLines)
        with open(violatedReqIDs, 'w') as file:
            file.writelines(reqIDLines)

# Giving files path
axi4LiteFeatureList = "axi4LiteFeatureList.yaml"
featureViolatedByRTLReport = "featureViolatedByRTLReport.log"
diffFile = "differences.log"
axi4LiteViolatedFeatues = "axi4LiteFinalRTLViolatedFeatures.log"
coverageLogFile = "coverage_report.log"
violatedFeatures = "axi4LiteViolatedFeatues.log"
violatedReqIDs = "axi4LiteViolatedReqIDs.log"

# at the starting removing contents in the files
open(axi4LiteViolatedFeatues, "w").close()
open(violatedFeatures, "w").close()
open(violatedReqIDs, "w").close()

#calling the functions
writeCoverageIntoErrorFile(coverageLogFile, featureViolatedByRTLReport)
compareFileAsStrings(axi4LiteFeatureList, featureViolatedByRTLReport, diffFile)
generatedViolatedFeatures(axi4LiteFeatureList, diffFile, axi4LiteViolatedFeatues,violatedFeatures,violatedReqIDs)
countingFeaturesReqID(axi4LiteFeatureList, violatedFeatures, violatedReqIDs)

print("-------------------------------------------------------------------------------------------")
print("axi4Lite final violated features report in details : axi4LiteFinalRTLViolatedFeatures.log")
print("-------------------------------------------------------------------------------------------")
print("axi4Lite violated ReqIDs report : axi4LiteViolatedReqIDs.log")
print("-------------------------------------------------------------------------------------------")
print("axi4Lite final violated features report : axi4LiteViolatedFeatues.log")
print("-------------------------------------------------------------------------------------------")

# at the last not required files removing
os.remove(diffFile)
os.remove(coverageLogFile)
os.remove(featureViolatedByRTLReport)
