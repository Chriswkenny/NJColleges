//
//  CollegeRow.swift
//  NJColleges
//
//  Created by Christopher W. Kenny on 10/12/26.
//

import SwiftUI

struct CollegeRow: View{
    let college: College
    var body: some View{
        VStack(alignment: .leading){
            Text(college.name).font(.headline)
            HStack {
                Text(college.municipali)
                Text(college.city)
                Text(college.address)
                Spacer()
            }
            HStack{
                Text(String(college.zip))
            }
        }
        .padding()
    }
}
