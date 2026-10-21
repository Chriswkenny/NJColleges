//
//  CollegesVM.swift
//  NJColleges
//
//  Created by Christopher W. Kenny on 10/21/26.
//

import Observation

@Observable

class CollegesVM{
    private let collegesModel = CollegesModel()
    
    var njColleges: [College] = []
    
    init(){
        njColleges = collegesModel.getColleges()
    }
    /*
    func updateCollege(college: College, doctorate: Bool){
        if let index = njColleges.firstIndex(where: {$0.id == college.id}){
            njColleges[index].doctorate = doctorate
            _ = collegesModel.updateCollege(collegeID: college.id, closed: njColleges[index].doctorate)
        }
     */
}

