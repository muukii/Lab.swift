import TabularData

var dataFrame = DataFrame()  // Mark 1
let idColumn = Column(name: "id", contents: [1, 2, 3])  // Mark 2
let nameColumn = Column(name: "name", contents: ["Mike", "Alan", "Pepjin"])  // Mark 2
let ageColumn = Column(name: "Age", contents: [34, 30, 23])  // Mark 2

dataFrame.append(column: idColumn)  // Mark 3
dataFrame.append(column: nameColumn)  // Mark 3
dataFrame.append(column: ageColumn)  // Mark 3
print(dataFrame)

