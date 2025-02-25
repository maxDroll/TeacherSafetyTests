//
//  ContentView.swift
//  TeacherSafetyTests
//
//  Created by Maxwell K. Droll on 2/6/25.
//

import SwiftUI

struct ContentView: View {
    @State var selectedSorting = "student"
    var body: some View {
        NavigationStack{
            HStack(spacing:0){
                VStack(alignment: .center){
                    NavigationLink(destination: TeacherStudentSelectionOrganizer(selectedSorting: $selectedSorting)) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(.blue)
                                .frame(width: 350, height: 200)
                            Text("Select by Student")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                        }
                    }
                    .simultaneousGesture(TapGesture().onEnded({ _ in
                        selectedSorting = "student"
                    }))
                }
                .frame(width: 600)
                Rectangle()
                    .foregroundStyle(.black)
                    .frame(width: 5, height: 1000)
                VStack(alignment: .center){
                    NavigationLink(destination: TeacherStudentSelectionOrganizer(selectedSorting: $selectedSorting)) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(.blue)
                                .frame(width: 350, height: 200)
                            Text("Select by Machine")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                        }
                    }
                    .simultaneousGesture(TapGesture().onEnded({ _ in
                        selectedSorting = "machine"
                    }))
                }
                .frame(width: 600)
            }
        }
    }
    
}
