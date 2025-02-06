//
//  TeacherStudentSelection.swift
//  TeacherSafetyTests
//
//  Created by Maxwell K. Droll on 2/6/25.
//

import SwiftUI

struct TeacherStudentSelectionOrganizer: View {
    @State var selectedStudent = ""
    var body: some View {
        HStack{
            StudentList(selectedStudent: $selectedStudent)
        }
    }
}
