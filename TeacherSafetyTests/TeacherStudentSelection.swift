//
//  TeacherStudentSelection.swift
//  TeacherSafetyTests
//
//  Created by Maxwell K. Droll on 2/6/25.
//

import SwiftUI

struct TeacherStudentSelectionOrganizer: View {
    @State var selectedStudent: Student = Student(AngleGrinderTest: -1, AngleGrinderVideo: false, Class: "XXXXX", LatheTest: -1, LatheVideo: false, MillTest: -1, MillVideo: false, WelderTest: -1, WelderVideo: false, name: "XXXXX", Teacher: false)
    var body: some View {
        HStack{
            StudentList(selectedStudent: $selectedStudent)
            StudentStats(selectedStudent: $selectedStudent)
        }
    }
}
