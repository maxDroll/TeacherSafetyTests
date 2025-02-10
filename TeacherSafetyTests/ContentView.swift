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
            NavigationLink(destination: TeacherStudentSelectionOrganizer(selectedSorting: $selectedSorting)) {
                Text("select by student")
                
            }
        }
    }
    
}
