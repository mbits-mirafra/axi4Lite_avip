import os
import yaml

def compareFileAsStrings(axi4LiteFeatureList, featureViolatedByRTLReport, diffFile):
    with open(axi4LiteFeatureList, 'r') as file1:
        for file1Line in file1:
            temp1 = file1Line.split()
            #print(file1Line.strip())
            
            with open(featureViolatedByRTLReport, 'r') as file2:
                for number2, file2line in enumerate(file2, start = 1):
                    temp2 = file2line.split()
                    #print("The split temp1",temp1)
                    #print("The split temp2",temp2)

                    for word1 in temp1:
                        for word2 in temp2:
                            #print("The word1",word1)
                            #print("The word2",word2)
                            if word2 in word1:
                                #if word2 != ":" and word2 != "#" and word2 != "-" and word2 != "ASSERTED" and word2 != "NOT" and word2 != '1' and  word2 != '0' and word2 != '6' and word2 != '12' and word2 != '0:' and word2 != 'command' and word2 != 'Handshaking':
                                if word2 not in (':','#','-','ASSERTED','NOT','1','0','6','12','0:','command','Handshaking'):
                                    with open(diffFile, "a") as writeFile:
                                        writeFile.write(word2 + "\n")
                                        #print("The word1",word1)
                                        #print("The word2",word2)
    with open(diffFile, 'r') as file:
        lines = file.readlines()
        uniqueLines = list(dict.fromkeys(lines))
    with open(diffFile, "w") as file:
        file.writelines(uniqueLines)


def generatedViolatedFeatures(axi4LiteFeatureList, diffFile, axi4LiteViolatedFeatues):
    with open(diffFile, 'r') as logFile:
        for line in logFile:
            #print(line)
            with open(axi4LiteFeatureList,'r') as file2:
                file = yaml.safe_load(file2)
                for name, feature in file.items():
                    #print(name)
                    #print(feature)
                    for reqIDLoop in feature:
                        #print(reqIDLoop)
                        for key, reqID in reqIDLoop.items():
                            #print(key)
                            #print(reqID)
                            if "ReqID" in key:
                                finalProperty(axi4LiteViolatedFeatues, reqID, line, name, key)
                            else:
                                for subFeature in reqID:
                                    #print(subFeature)
                                    for keySub, reqIDSub in subFeature.items():
                                        #print(keySub)
                                        #print(reqIDSub)
                                        if "ReqID" in keySub:
                                            finalProperty(axi4LiteViolatedFeatues, reqIDSub, line, name, key)

                                
def finalProperty(axi4LiteViolatedFeatues, reqIDList, line, name, key):
    #print(reqIDList)
    for dodKey, property in reqIDList.items():
        #print(dodKey)
        #print(property)
        for propertyKey, assertCover in property.items():
            #print(propertyKey)
            #print(assertCover)
            for assertCoverProperty in assertCover:
                #print(assertCoverProperty)
                if propertyKey == "AssertProperty":
                   #print(propertyKey)
                   #print(assertCover)
                   #print(assertCoverProperty)
                   #print(line)
                    if assertCoverProperty in line:
                        with open(axi4LiteViolatedFeatues, "a") as writeFile:
                            writeFile.write(f"{name} - {key} - {dodKey} - {propertyKey} - {assertCoverProperty} \n")
              #  elif propertyKey == "CoverProperty":
              #      #print(propertyKey)
              #      #print(assertCover)
              #      #print(assertCoverProperty)
              #      #print(line)
              #      if assertCoverProperty in line:
              #          with open(axi4LiteViolatedFeatues, "a") as writeFile:
              #              writeFile.write(f"{name} - {key} - {dodKey} - {propertyKey} - {assertCoverProperty} \n")


axi4LiteFeatureList = "axi4LiteFeatureList.yaml"
featureViolatedByRTLReport = "featureViolatedByRTLReport.log"
diffFile = "differences.log"
axi4LiteViolatedFeatues = "axi4LiteViolatedFeatues.log"

open(diffFile, "w").close()
open(axi4LiteViolatedFeatues, "w").close()

compareFileAsStrings(axi4LiteFeatureList, featureViolatedByRTLReport, diffFile)
generatedViolatedFeatures(axi4LiteFeatureList, diffFile, axi4LiteViolatedFeatues)

os.remove(diffFile)
