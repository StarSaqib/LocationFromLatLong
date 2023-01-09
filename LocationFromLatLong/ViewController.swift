//
//  ViewController.swift
//  LocationFromLatLong
//
//  Created by admin on 04/01/23.
//
import UIKit
import MapKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let location = LocationManager.shared.requestForLocation()
        let latitude = location.latitude
        let longitude = location.longitude
        
        print("latitude: \(latitude)")
        print("longitude: \(longitude)")
    }
}

class LocationManager{
    
    static let shared = LocationManager()
    
    init(){}
    
    func requestForLocation() -> (latitude: Double, longitude: Double) {
        //Code Process
        let locManager = CLLocationManager()
        
        locManager.requestWhenInUseAuthorization()
        var latitude:Double = 0
        var longitude:Double = 0

        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            guard let currentLocation = locManager.location else {
                return (0,0)
            }
            latitude = Double(currentLocation.coordinate.latitude)
            longitude = Double(currentLocation.coordinate.longitude)
        }
        return (latitude, longitude)
    }
}



//import UIKit
//import CoreLocation
//import MapKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        latLong(lat: 28.6109401 , long: 77.23448200000007)
//    }
//
//
//    func latLong(lat: Double,long: Double)  {
//
//        let geoCoder = CLGeocoder()
//        let location = CLLocation(latitude: lat , longitude: long)
//        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
//
//            print("Response GeoLocation : \(placemarks)")
//            var placeMark: CLPlacemark!
//            placeMark = placemarks?[0]
//
//            // Country
//            if let country = placeMark.addressDictionary!["Country"] as? String {
//                print("Country :- \(country)")
//                // City
//                if let city = placeMark.addressDictionary!["City"] as? String {
//                    print("City :- \(city)")
//                    // State
//                    if let state = placeMark.addressDictionary!["State"] as? String{
//                        print("State :- \(state)")
//                        // Street
//                        if let street = placeMark.addressDictionary!["Street"] as? String{
//                            print("Street :- \(street)")
//                            let str = street
//                            let streetNumber = str.components(
//                                separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: "")
//                            print("streetNumber :- \(streetNumber)" as Any)
//
//                            // ZIP
//                            if let zip = placeMark.addressDictionary!["ZIP"] as? String{
//                                print("ZIP :- \(zip)")
//                                // Location name
//                                if let locationName = placeMark?.addressDictionary?["Name"] as? String {
//                                    print("Location Name :- \(locationName)")
//                                    // Street address
//                                    if let thoroughfare = placeMark?.addressDictionary!["Thoroughfare"] as? NSString {
//                                        print("Thoroughfare :- \(thoroughfare)")
//
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        })
//    }
    
//}
