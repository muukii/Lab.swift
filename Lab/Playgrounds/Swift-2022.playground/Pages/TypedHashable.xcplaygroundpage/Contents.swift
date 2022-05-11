
public enum PrimitiveIdentifier: Hashable {
  
  case string(String)
  case int64(Int64)
  case uint64(UInt64)
  case int(Int)
  
}

MemoryLayout<PrimitiveIdentifier>.size
MemoryLayout<AnyHashable>.size

