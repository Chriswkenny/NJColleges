//
//  CollegesModel.swift
//  NJColleges
//
//  Created by Christopher W. Kenny on 10/21/26.
//

import Foundation

class CollegesModel{
    
    private var njColleges: [College] = []
    
    init(){
        readCollegesData()
    }
    
    func getColleges() -> [College]{
        return self.njColleges
    }
    
    func getCollege(collegeID: Int) -> College?{
        if let college = njColleges.first(where: {$0.id == collegeID}){
            return college
        }else{
            return nil
        }
    }
    
    func updateCollege(collegeID: Int, closed: Bool) -> Bool?{
        if let index = njColleges.firstIndex(where: {$0.id == collegeID}){
            njColleges[index].doctorate = closed
            return true
        }else{
            return nil
        }
    }
    
    func readCollegesData(){
        if let filename = Bundle.main.path(forResource: "NJColleges", ofType: "json"){
            do{
                let jsonStr = try String(contentsOfFile: filename, encoding: .utf8)
                let jsonData = jsonStr.data(using: .utf8)!
                
                njColleges = try JSONDecoder().decode([College].self, from: jsonData)
                print(njColleges.count)
            }
            
            catch let DecodingError.keyNotFound(key, context){
                print("Missing key '\(key.stringValue)' at path: \(codingPathString(context.codingPath))")
                print("Details: \(context.debugDescription)")
            }
            catch let DecodingError.typeMismatch(type, context) {
                print("Type mismatch: expected \(type) at path: \(codingPathString(context.codingPath))")
                print("Details: \(context.debugDescription)")
            }
            catch let DecodingError.valueNotFound(type, context) {
                print("Null/missing value: expected \(type) at path: \(codingPathString(context.codingPath))")
                print("Details: \(context.debugDescription)")
            }
            catch let DecodingError.dataCorrupted(context) {
                print("Data corrupted (invalid JSON?) at path: \(codingPathString(context.codingPath))")
                print("Details: \(context.debugDescription)")
                if let underlying = context.underlyingError {
                    print("Underlying error: \(underlying)")
                }
            }
            catch let error as CocoaError {
                // File reading problems (file not found, no permission, bad encoding, etc.)
                print("File error: \(error.localizedDescription)")
            }
            catch {
                print("Unexpected error: \(error)")
            }
        }
        else { print ("The file could not be found") }
    }
    
    func codingPathString(_ path: [CodingKey]) -> String {
        path.map { $0.intValue.map { "[\($0)]" } ?? ".\($0.stringValue)" }
            .joined()
    }
}
    

