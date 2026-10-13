//
//  CollegesListView.swift
//  NJColleges
//
//  Created by Christopher W. Kenny on 10/12/26.
//

import SwiftUI

struct CollegesListView: View{
    
    @State var collegesVM = CollegesVM()
    @State var searchText: String =  ""
    
    var body: some View{
        NavigationStack{
            List(searchResults){college in
                NavigationLink(destination:
                    CollegeDetailView(college: college)){
                    CollegeRow(college: college)
                }
            }
            .navigationTitle("Colleges")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText)
        }
    }
    
    var searchResults: [College]{
        if searchText.isEmpty{
            return collegesVM.njColleges
        }else{
            return collegesVM.njColleges.filter
                {(searchFilter(college: $0))}
        }
    }
    
    func searchFilter(college: College) -> Bool{
        return
            college.name.lowercased().contains(searchText.lowercased())
        ||
            college.city.lowercased().contains(searchText.lowercased())
        ||
            college.municipali.lowercased().contains(searchText.lowercased())
    }
}

#Preview{
    CollegesListView()
}
