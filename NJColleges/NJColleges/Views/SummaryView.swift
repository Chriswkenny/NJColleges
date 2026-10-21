//
//  SummaryView.swift
//  NJColleges
//
//  Created by Christopher W. Kenny on 10/21/26.
//

import SwiftUI

struct SummaryView: View {
    
    @State var collegeVM = CollegesVM()
    private var total: Int {collegeVM.njColleges.count}
    //Use filter to gather totals of North/South/East/West
    private var north: Int {collegeVM.njColleges.filter {$0.latitude > 40.47368}.count}
    private var south: Int {collegeVM.njColleges.filter {$0.latitude < 39.95219}.count}
    private var central: Int {collegeVM.njColleges.filter {$0.latitude > 39.95219 && $0.latitude <= 40.47378}.count}
    
    var body: some View {
        VStack{
            Image("new-jersey").resizable()
            Text("New Jersey Colleges").font(.title).bold()
            TitleCard("Total Colleges: ", total)
            TitleCard("North Colleges: ", north)
            TitleCard("Central Colleges: ", central)
            TitleCard("South Colleges: ", south)
            Spacer()
        }
        .padding()
    }
    
    //function to display North/Central/South Colleges in VStack
    //Need _ to call String/Int above
    private func TitleCard(_ label: String, _ value: Int) -> some View {
        HStack{
            Text("\(label)")
            Spacer()
            Text("\(value)")
        }
        .padding()
    }
}

#Preview {
    SummaryView()
}
