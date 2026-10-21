//
//  ContentView.swift
//  NJColleges
//
//  Created by Christopher W. Kenny on 10/21/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab("Summary", systemImage: "home"){
                SummaryView()
            }
            Tab("Colleges", systemImage: "text.book.closed"){
                CollegesListView()
            }
            Tab("Map", systemImage: "mappin.circle"){
                MyMapView()
            }
        }
    }
}

#Preview {
    ContentView()
}
