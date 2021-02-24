import Foundation
import UIKit
import CoreLocation

struct FacilityInfo {
    var geometry: CLLocationCoordinate2D
    var name: String
    
    init(name: String, geometry: CLLocationCoordinate2D) {
        self.name = name
        self.geometry = geometry
    }
}
