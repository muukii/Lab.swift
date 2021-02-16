import Foundation

do {
  let userDefaults = UserDefaults(suiteName: "AAA")!
  userDefaults.setValue("Hello", forKey: "X-KEY")
  userDefaults.setValue(Date(), forKey: "mydate")
  userDefaults.setValue(Data(), forKey: "my_data")
  userDefaults.value(forKey: "mydate")
  userDefaults.value(forKey: "my_data")
  userDefaults.dictionaryRepresentation()
}

