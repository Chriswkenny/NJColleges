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
        let zip: String
        let doctoral: String //literal string in JSON
        
        //properties Enum
        enum CodingKey: String, Codable {
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
    
    //Colleges enum
    enum CodingKeys: String, CodingKey {
        case geometry
        case properties
    }
    
    //initializer for data in JSON file
    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        geometry = try c.decode(Geometry.self, forKey: .geometry)
        properties = try c.decode(Properties.self, forKey: .properties)
        doctorate = properties.doctoral.lowercased() == "yes"
    }
    
    //Assign variables from JSON file, separating properties/geometry
    var id: Int {properties.id}
    var name: String {properties.name}
    var municipali: String {properties.municipali}
    var county: String {properties.county}
    var address: String {properties.address}
    var city: String {properties.city}
    var zip: String {properties.zip}
    var longitude: Double {geometry.coordinates[0]}
    var latitude: Double {geometry.coordinates[1]}
}
