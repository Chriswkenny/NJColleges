//
//  ModelStructs.swift
//  NJColleges
//
//  Created by Christopher W. Kenny on 10/21/26.
//

struct College: Codable, Identifiable{
    
    let geometry: Geometry
    let properties: Properties
    var doctorate: Bool = false //yes-no in JSON file
    
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
        let area: String
        let phone: String
        let zip: String
        let degree: String
        let doctoral: String //literal string in JSON
        
        //properties Enum
        enum CodingKeys: String, CodingKey {
            case id = "FID"
            case name = "Name"
            case municipali = "Municipali"
            case county = "County"
            case address = "ADDRESS"
            case city = "CITY"
            case area = "AREA_CODE"
            case phone = "PHONE"
            case zip = "ZIP"
            case degree = "DEGREE"
            case doctoral = "DOCTORAL"
        }
    }
    
    //Colleges enum
    enum CodingKeys: String, CodingKey {
        case geometry
        case properties
    }

    //Assign variables from JSON file based on properties/geometry
    var id: Int {properties.id}
    var name: String {properties.name}
    var municipali: String {properties.municipali}
    var county: String {properties.county}
    var address: String {properties.address}
    var city: String {properties.city}
    var area: String {properties.area}
    var phone: String {properties.phone}
    var degree: String {properties.degree}
    var zip: String {properties.zip}
    var longitude: Double {geometry.coordinates[0]}
    var latitude: Double {geometry.coordinates[1]}
}
