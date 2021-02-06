//: [Previous](@previous)

let codes: [(String, String)] = [
  (name: "firstMatchFirstHourPremium", json_key: "matching_nhour"),
  (name: "max120PointsRebate", json_key: "point_back"),
  (name: "max1YearFreePremium", json_key: "premiumpack"),
  (name: "fullPointsRebate", json_key: "full_point_back"),
  (name: "doublePoints", json_key: "point_double"),
  (name: "messageFreeLike", json_key: "free_message_like"),
  (name: "freeNLikes", json_key: "free_nlikes"),
  (name: "reactivateSale", json_key: "reactivate_sale"),
  (name: "yearEndSaleoffOld", json_key: "year_end_saleoff_old"),
  (name: "yearEnd_6_12_InMonth", json_key: "year_end_6_12_in_mo"),
  (name: "free_30like_30_min", json_key: "free_30like_30_min"),
  (name: "campaignA", json_key: "campaign_a"),
  (name: "campaignB", json_key: "campaign_b"),
  (name: "campaignC", json_key: "campaign_c"),
  (name: "campaignD", json_key: "campaign_d"),
  (name: "historyPremiumFree123ForFTS", json_key: "_premium_1_2_3_fts"),
  (name: "historyPremiumFree123ForResub", json_key: "_premium_1_2_3_resub"),
  (name: "historyMysteryOfferForFTS", json_key: "_mystery_offer_fts"),
  (name: "historyMysteryOfferForResub", json_key: "_mystery_offer_resub"),
  (name: "history3DaysSaleOff", json_key: "__sale_off"),
  (name: "history50SaleOffForFTS", json_key: "_sale_off_50_fts"),
  (name: "history50SaleOffForResub", json_key: "_sale_off_50_resub"),
  (name: "history50SaleOffForOldFTS", json_key: "_sale_off_50_old_fts"),
  (name: "history50SaleOffForOldResub", json_key: "_sale_off_50_old_resub"),
  (name: "historyMax12MonthPremiumFreeForFTS", json_key: "_premium_full_1_3_6_12_fts"),
  (name: "historyMax12MonthPremiumFreeForResub", json_key: "_premium_full_1_3_6_12_resub"),
  (name: "historyMax12MonthPremiumFree3Day", json_key: "__premium_full_6_12"),
  (name: "historyMax12MonthPremiumFree612ForFTS", json_key: "_premium_full_6_12_fts"),
  (name: "historyMax12MonthPremiumFree612ForResub", json_key: "_premium_full_6_12_resub"),
  (name: "ftsResubInMonth", json_key: "d_r_6_12_in_mo"),
  (name: "ftsResubOld", json_key: "d_r_saleoff_old"),
  (name: "externalBrowser", json_key: "external_browser"),
]
  
  //for code in codes {
  //
//  let a = code.first!.uppercased() + code.dropFirst()
//
//  print("case \(code)(\(a))")
//}
//
//for code in codes {
//
//  let a = code.first!.uppercased() + code.dropFirst()
//
//  print("case .\(code)(let c): return c")
//}

//
//for code in codes {
//
//  let a = code.first!.uppercased() + code.dropFirst()
//
//  print(#"""
//    case \#(a).code:
//      self = try .\#(code)(.init(from: json))
//  """#)
//}
//
//
for code in codes {

  let a = code.0.first!.uppercased() + code.0.dropFirst()


  print("""
    public struct \(a): _Entities_Campaign {

      public static let code: String = "\(code.1)"

      public let info: CampaignInfo

      public init(from json: JSON) throws {
        self.info = try .init(json: json)
      }
    }

    """)

}

//: [Next](@next)
