//
//  ModelStructs.swift
//  NJColleges
//
//  Created by Christopher W. Kenny on 10/13/26.
//

struct College: Codable, Identifiable {
    
    let geometry: Geometry
    let properties: Properties
    
    struct Geometry: Codable {
        let coordinates: [Double]
    }
    
    struct Properties: Codable {
        let id: Int
        let name: String
        let municipali: String
        let county: String
        let address: String
        let city: String
        let zip: String
        let doctoral: String
      
        
        enum CodingKeys: String, CodingKey {
            case id = "FID"
            case name = "Name"
            case municipali = "Municipali"
            case county = "County"
            case address = "ADDRESS"
            case city = "CITY"
            case zip = "ZIP"
            case doctoral = "DOCTORAL"
        }
    }
    
    var id: Int{properties.id}
    var name: String{properties.name}
    var longitude: Double{geometry.coordinates[0]}
    var latitude: Double{geometry.coordinates[1]}
    var doctoral: Bool {properties.doctoral.uppercased() == "YES"}
    
}
struct CollegeCollection {
    let features: [College]
}
