//
//  CollegeRow.swift
//  NJColleges
//
//  Created by Christopher W. Kenny on 10/21/26.
//

import SwiftUI
import UIKit

struct CollegeRowView: View{
    let college: College
    var body: some View{
        HStack(spacing: 15){
            CollegeLogos(college: college, size: 30)
            VStack(alignment: .leading, spacing: 2){
                Text(college.name).font(.headline).bold()
                Text("Located: " + college.municipali + ", " + college.city)
                Text("Address: " + college.address)
                Text("Phone Number: " + college.area + "-" + college.phone)
                Text("Highest Degree: " + college.degree)
                Text(String("Zip: \(college.zip)"))
            }
        }
        .padding()
    }
}

//Struct for generating Logos
struct CollegeLogos: View {
    let college: College
    var size: CGFloat = 50
    
    private var logoName: String {
        let name = college.name
        let names: [String: String] = [
            "Rutgers": "rutgers",
            "Rowan": "rowan",
            "Princeton": "princeton",
            "Monmouth": "monmouth",
            "Kean": "kean",
            "Montclair": "montclair",
            "William Patterson": "william-patterson",
            "Fairleigh Dickinson": "fairleigh-dickinson"
        ]
        if let match = names.first(where: {name.contains($0.key)}){
            return match.value
        }
        return "logo_\(college.name)"
    }
    private var logo: UIImage?{
        UIImage(named: logoName)
    }
    
    var body: some View{
        ZStack {
            if let logo {
                Image(uiImage: logo)
                    .resizable()
                    .scaledToFit()
            }
            else {
                Image(systemName: "graduationcap.circle.fill")
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(width: 100, height: 100)
    }
}
