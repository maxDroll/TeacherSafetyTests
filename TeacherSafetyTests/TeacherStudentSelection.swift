//
//  TeacherStudentSelection.swift
//  TeacherSafetyTests
//
//  Created by Maxwell K. Droll on 2/6/25.
//

import SwiftUI

struct TeacherStudentSelectionOrganizer: View {
    @State var selectedStudent: Student = Student(AngleGrinderTest: -1, AngleGrinderVideo: false, Class: "XXXXX", LatheTest: -1, LatheVideo: false, MillTest: -1, MillVideo: false, WelderTest: -1, WelderVideo: false, name: "XXXXX", Teacher: false, StudentID: "000001")
    @Binding var selectedSorting: String
    @State var selectedMachine = ""
    var body: some View {
        HStack(spacing:0){
            if selectedSorting == "student"{
                StudentList(selectedStudent: $selectedStudent)
                Rectangle()
                    .foregroundStyle(.black)
                    .frame(width: 5, height: 1000)
                StudentStats(selectedStudent: $selectedStudent)
            }
            else{
                MachineSelection(selectedMachine: $selectedMachine)
                Rectangle()
                    .foregroundStyle(.black)
                    .frame(width: 5, height: 1000)
                StudentByMachine(selectedMachine: $selectedMachine)
            }
        }
    }
}
