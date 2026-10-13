//
//  MyMapView.swift
//  NJColleges
//
//  Created by Christopher W. Kenny on 10/12/26.
//

import SwiftUI
import MapKit

struct MyMapView: View {
    
    @State private var locationManager = LocationManager()
    
    @State var collegeVM = CollegesVM()
    @State var selectedCollege = College?
    
    var body: some View{
        Map() {
            UserAnnotation()
            ForEach(collegeVM.njColleges){college in
                Annotation(college.name,
                           coordinate: CLLocationCoordinate2D,
                           (latitude: college.latitude,
                            longitude: college.longitude)){
                    Image(systemName: "text.book.closed")
                        .foregroundStyle(.white)
                        .onTapGesture{
                            selectedCollege = college
                        }
                }
            }
    }
        .mapStyle(.standard)
        .sheet(item: $selectedCollege){college in
            CollegeDetailView(college: college)
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
        }
    }
}

#Preview{
    MyMapView()
}
