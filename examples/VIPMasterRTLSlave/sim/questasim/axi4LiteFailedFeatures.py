import os
import yaml

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
    with open(diffFile, 'r') as file:
        lines = file.readlines()
        uniqueLines = list(dict.fromkeys(lines))
    with open(diffFile, "w") as file:
        file.writelines(uniqueLines)


def generatedViolatedFeatures(axi4LiteFeatureList, diffFile, axi4LiteViolatedFeatues):
    with open(diffFile, 'r') as logFile:
        for line in logFile:
            with open(axi4LiteFeatureList,'r') as file2:
                file = yaml.safe_load(file2)
                for name, feature in file.items():
                    for reqIDLoop in feature:
                        for key, reqID in reqIDLoop.items():
                            if "ReqID" in key:
                                finalProperty(axi4LiteViolatedFeatues, reqID, line, name, key)
                            else:
                                for subFeature in reqID:
                                    for keySub, reqIDSub in subFeature.items():
                                        if "ReqID" in keySub:
                                            finalProperty(axi4LiteViolatedFeatues, reqIDSub, line, name, key)

                                
def finalProperty(axi4LiteViolatedFeatues, reqIDList, line, name, key):
    for dodKey, propertyDetails in reqIDList.items():
        for propertyKey, propertyList in propertyDetails.items():
            for propertyName in propertyList:
                if propertyKey == "AssertProperty":
                    if propertyName in line:
                        with open(axi4LiteViolatedFeatues, "a") as writeFile:
                            writeFile.write(f"{name} - {key} - {dodKey} - {propertyKey} - {propertyName} \n")
                elif propertyKey == "CoverPoint":
                    if propertyName.strip() == line.strip():
                        with open(axi4LiteViolatedFeatues, "a") as writeFile:
                            writeFile.write(f"{name} - {key} - {dodKey} - {propertyKey} - {propertyName} \n")
                elif propertyKey == "CrossCoverage":
                    if propertyName.strip() == line.strip():
                        with open(axi4LiteViolatedFeatues, "a") as writeFile:
                            writeFile.write(f"{name} - {key} - {dodKey} - {propertyKey} - {propertyName} \n")
              #  elif propertyKey == "CoverProperty":
              #      #print(propertyKey)
              #      #print(propertyList)
              #      #print(propertyName)
              #      #print(line)
              #      if propertyName in line:
              #          with open(axi4LiteViolatedFeatues, "a") as writeFile:
              #              writeFile.write(f"{name} - {key} - {dodKey} - {propertyKey} - {propertyName} \n")

def writeCoverageIntoErrorFile(coverageLogFile, coverpointCrossReport):
    errorKeywords = ["Coverpoint","Cross"]
    notHit = ["ZERO","Uncovered"]

    with open(coverpointCrossReport,"a") as simulationFile:
        with open(coverageLogFile, "r") as file:
            for lineNumber, line in enumerate(file, start = 1):
                if any(keyword in line for keyword in errorKeywords):
                    if any(keyword in line for keyword in notHit):
                        simulationFile.write(line)


axi4LiteFeatureList = "axi4LiteFeatureList.yaml"
featureViolatedByRTLReport = "featureViolatedByRTLReport.log"
diffFile = "differences.log"
axi4LiteViolatedFeatues = "axi4LiteViolatedFeatues.log"
coverageLogFile = "coverage_report.log"

open(axi4LiteViolatedFeatues, "w").close()

writeCoverageIntoErrorFile(coverageLogFile, featureViolatedByRTLReport)
compareFileAsStrings(axi4LiteFeatureList, featureViolatedByRTLReport, diffFile)
generatedViolatedFeatures(axi4LiteFeatureList, diffFile, axi4LiteViolatedFeatues)

os.remove(diffFile)
os.remove(coverageLogFile)
os.remove(featureViolatedByRTLReport)
