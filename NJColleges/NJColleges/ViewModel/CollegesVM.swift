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
}

