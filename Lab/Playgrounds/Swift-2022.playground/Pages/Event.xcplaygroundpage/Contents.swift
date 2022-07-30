
import Foundation
import LetterCase

let json = """
[
  {
    "name": "tab.select.search",
    "nodeID": "3394:81022",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3394%3A81022"
  },
  {
    "name": "tab.select.incoming",
    "nodeID": "3394:108092",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3394%3A108092"
  },
  {
    "name": "tab.select.community",
    "nodeID": "3387:74459",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3387%3A74459"
  },
  {
    "name": "secretLike.send.skip",
    "nodeID": "3390:74537",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3390%3A74537"
  },
  {
    "name": "searchCondition.update.condition",
    "nodeID": "3387:74471",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3387%3A74471"
  },
  {
    "name": "personalView.send.violationReport",
    "nodeID": "3387:74304",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3387%3A74304"
  },
  {
    "name": "personalView.send.thanks",
    "nodeID": "3387:74270",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3387%3A74270"
  },
  {
    "name": "personalView.send.skip",
    "nodeID": "3387:74264",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3387%3A74264"
  },
  {
    "name": "personalView.send.photoRequest",
    "nodeID": "3387:74252",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3387%3A74252"
  },
  {
    "name": "personalView.send.lookWithMessage",
    "nodeID": "3387:74288",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3387%3A74288"
  },
  {
    "name": "personalView.send.look",
    "nodeID": "3387:74282",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3387%3A74282"
  },
  {
    "name": "personalView.send.likeWithMessage",
    "nodeID": "3387:74276",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3387%3A74276"
  },
  {
    "name": "personalView.send.like",
    "nodeID": "3387:74258",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3387%3A74258"
  },
  {
    "name": "personalView.open.view",
    "nodeID": "3387:74246",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3387%3A74246"
  },
  {
    "name": "personalView.make.hidden",
    "nodeID": "3387:74364",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3387%3A74364"
  },
  {
    "name": "personalView.make.blocked",
    "nodeID": "3387:74452",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3387%3A74452"
  },
  {
    "name": "personalView.add.favorite",
    "nodeID": "3387:74298",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3387%3A74298"
  },
  {
    "name": "onboarding.complete.profileItems",
    "nodeID": "3390:74569",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3390%3A74569"
  },
  {
    "name": "onboarding.allow.locationAccess",
    "nodeID": "3390:74575",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3390%3A74575"
  },
  {
    "name": "onboarding.add.profilePicture",
    "nodeID": "3390:74581",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3390%3A74581"
  },
  {
    "name": "messages.start.videoDating",
    "nodeID": "3391:74922",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3391%3A74922"
  },
  {
    "name": "messages.send.message",
    "nodeID": "3391:74912",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3391%3A74912"
  },
  {
    "name": "messages.send.look",
    "nodeID": "3391:74902",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3391%3A74902"
  },
  {
    "name": "messages.awake.fromNotification",
    "nodeID": "3391:74892",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3391%3A74892"
  },
  {
    "name": "identification.complete.ageVerificationSubmission",
    "nodeID": "3391:74932",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3391%3A74932"
  },
  {
    "name": "groupTalk.tap.createRoomButton",
    "nodeID": "3390:74531",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3390%3A74531"
  },
  {
    "name": "groupTalk.start.preparation",
    "nodeID": "3390:74477",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3390%3A74477"
  },
  {
    "name": "groupTalk.end.call",
    "nodeID": "3390:74483",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3390%3A74483"
  },
  {
    "name": "communityChat.send.reaction",
    "nodeID": "3391:74978",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3391%3A74978"
  },
  {
    "name": "communityChat.send.reaction",
    "nodeID": "3391:74998",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3391%3A74998"
  },
  {
    "name": "communityChat.send.message",
    "nodeID": "3391:74988",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3391%3A74988"
  },
  {
    "name": "community.unfollow.topic",
    "nodeID": "3393:75048",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3393%3A75048"
  },
  {
    "name": "community.tap.topicCreation",
    "nodeID": "3391:74958",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3391%3A74958"
  },
  {
    "name": "community.open.topic",
    "nodeID": "3393:75008",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3393%3A75008"
  },
  {
    "name": "community.leave.community",
    "nodeID": "3393:75038",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3393%3A75038"
  },
  {
    "name": "community.join.community",
    "nodeID": "3393:75028",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3393%3A75028"
  },
  {
    "name": "community.follow.topic",
    "nodeID": "3393:75018",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3393%3A75018"
  },
  {
    "name": "community.complete.topicCreation",
    "nodeID": "3391:74968",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3391%3A74968"
  },
  {
    "name": "app.launch",
    "nodeID": "3394:108069",
    "url": "https://www.figma.com/file/SG9710rFozD0t26mOwzlje?node-id=3394%3A108069"
  }
]
""".data(using: .utf8)!

struct Record: Codable {
  let name: String
  let nodeID: String
  let url: String
}

let decoder = JSONDecoder()

let r = try decoder.decode([Record].self, from: json)

for record in r {
  let eventName = record.name
  let domain = record.name.split(separator: ".").first!
  
  let code = #"""
  
  /**
    [\#(domain)]
    \#(eventName)
  
    \#(record.nodeID)
    \#(record.url)
  */
  public static func \#(eventName.normalized().letterCase(.lowerCamel))() -> Self {
    .init(name: "\#(eventName)", attributes: nil)
  }
  """#
  
  print(code)
}

extension String {
  
  func normalized() -> String {
    self
      .replacingOccurrences(of: "_", with: " ")
      .replacingOccurrences(of: "-", with: " ")
      .replacingOccurrences(of: ".", with: " ")
  }
  
}
