//
//  CollegeDetailView.swift
//  NJColleges
//
//  Created by Christopher W. Kenny on 10/21/26.
//

import SwiftUI
import MapKit

struct CollegeDetailView: View{
    
    @State private var locationManager = LocationManager()
    
    let college: College
    
    var collegeInfo: some View {
        let rows: [(String, String)] = [
            ("Name: ", college.name),
            ("Municipality: ", college.municipali),
            ("Address: ", college.address),
            ("City: ", college.city),
            ("ZIP: ", college.zip),
            ("Doctorate: ", college.doctorate ? "Yes" : "No")
        ]
        /*
         Original Code, trying to make an array of rows instead
         let properties = Mirror(reflecting: college).children.compactMap{
         child -> (String, String)? in
         
         guard let name = child.label else{
         return nil
         }
         return (name, String(describing: child.value))
         */
    
        return LazyVGrid(
            columns:
                [GridItem(.flexible()),
                 GridItem(.flexible())],
            alignment: .leading
        ){
            ForEach(rows, id: \.0) {
                row in
                Text(row.0).fontWeight(.semibold)
                Text(row.1)
            }
            .padding()
        }
    }

    
    var body: some View{
        GeometryReader{geometry in
            VStack(spacing: 0) {
                ScrollView{
                    collegeInfo
                }
                .frame(height: geometry.size.height / 2)
                
                Map(initialPosition: .region(
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(
                            latitude: college.latitude,
                            longitude: college.longitude),
                        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    )
                )
                ){
                UserAnnotation()
                Marker(college.name, coordinate:        CLLocationCoordinate2D(
                        latitude: college.latitude,
                        longitude: college.longitude))
                }
                .mapControls{
                    MapUserLocationButton()
                }
                .mapStyle(.hybrid(elevation:.realistic))
                .frame(height: geometry.size.height / 2)
            }
            .navigationTitle(college.name)
        }
    }
}

#Preview{
    let vm = CollegesVM()
    let college = vm.njColleges[0]
    CollegeDetailView(college: college)
}
