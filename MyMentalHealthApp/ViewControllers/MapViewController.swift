import UIKit
import CoreLocation
import GoogleMaps

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapPlaceholderView: UIView!
    
    private let locationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
        CLLocationManager.authorizationStatus() == .authorizedAlways) {
            currentLocation = locationManager.location?.coordinate
        }
        let camera = GMSCameraPosition.camera(withLatitude: currentLocation?.latitude ?? 53.6, longitude: currentLocation?.longitude ?? 27.3, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        mapPlaceholderView.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: currentLocation?.latitude ?? 53.6, longitude: currentLocation?.longitude ?? 27.3)
        marker.title = "Me"
        marker.icon = GMSMarker.markerImage(with: .black)
          marker.map = mapView
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            currentLocation = location.coordinate
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch(CLLocationManager.authorizationStatus()) {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .denied, .notDetermined, .restricted:
            locationManager.stopUpdatingLocation()
        }
    }
    
    func setPlaceOnMap(_ locations: [CLLocationCoordinate2D],_ mapView: GMSMapView) {
        for location in locations {
            let marker = GMSMarker()
              marker.position = location
              marker.map = mapView
        }
    }
}
