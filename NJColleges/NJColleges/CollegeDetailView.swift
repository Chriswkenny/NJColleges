//
//  CollegeDetailView.swift
//  NJColleges
//
//  Created by Christopher W. Kenny on 10/12/26.
//

import SwiftUI
import MapKit

struct CollegeDetailView: View{
    
    @State private var locationManager = LocationManager()
    
    let college: College
    
    var collegeInfo: some View {
        let properties = Mirror(reflecting: college).children.compactMap{
            child -> (String, String)? in
            
            guard let name = child.label else{
                return nil
            }
            return (name, String(describing: child.value))
        }
        
        return LazyVGrid(
            columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ],
            alignment: .leading
        ){
            ForEach(properties, id: \.0) {
                property in
                Text(property.0).fontWeight(.semibold)
                Text(property.1)
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
                    )
                )
                ){UserAnnotation()
                    Marker(
                        item: college.name,
                        
                    )
                }
                .mapControls{
                    
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
