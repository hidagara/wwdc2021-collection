/*
    Code samples for WWDC Video https://developer.apple.com/wwdc21/10216

 */

import Foundation

class Traveler {
    var name: String
    var destination: String?
}

func test() {
    let traveler1 = Traveler(name: "Roman")
    let traveler2 = traveler1
    traveler2.destination = "Big Sur"
    print("Done traveling")
}
