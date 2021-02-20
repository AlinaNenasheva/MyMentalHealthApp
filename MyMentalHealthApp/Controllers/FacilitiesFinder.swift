import Foundation
import GooglePlaces

class FacilitiesFinder{
    
    private let mapViewController = MapViewController()
    private let session = URLSession.shared
    
    init() {
        findAPlace()
    }
    
    func findAPlace() {
        let url = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(mapViewController.currentLocation?.latitude ?? 53.6),\(mapViewController.currentLocation?.longitude ?? 27.3)2&radius=1000&type=health&keyword=mental&key=AIzaSyC6p75HXO69_mzOISH3ZB6LEYtOesvZHWg")!
//        let url = URL(string: "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Sydney&key=AIzaSyC6p75HXO69_mzOISH3ZB6LEYtOesvZHWg&sensor=true")!
        let task = session.dataTask(with: url) { data, response, error in

            if error != nil || data == nil {
                print("Client error!")
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }

            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }

        task.resume()
    }
}
