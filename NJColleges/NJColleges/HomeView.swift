//
//  ContentView.swift
//  NJColleges
//
//  Created by Christopher W. Kenny on 10/12/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView{
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
    HomeView()
}
