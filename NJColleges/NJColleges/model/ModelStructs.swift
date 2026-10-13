//
//  ModelStructs.swift
//  NJColleges
//
//  Created by Christopher W. Kenny on 10/12/26.
//

struct College: Codable, Identifiable{
    
    let id: Int
    let name: String
    let municipali: String
    let county: String
    let address: String
    let city: String
    let zip: String
    let latitude: Double
    let longitude: Double
    var doctorate: Bool = false
    


/*
//Need lat/long
//geometry" : {
    "type" : "Point",
    "coordinates" : [
     -74.450847996722231,
     40.503851973654783
    ]
*/

    enum PropertyKeys: String, CodingKey{
        case id = "FID"
        case name = "Name"
        case municipali = "Municipali"
        case county = "County"
        case address = "Address"
        case city = "City"
        case zip = "ZIP"
    }
}
