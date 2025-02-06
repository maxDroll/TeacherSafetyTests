//
//  TeacherStudentList.swift
//  TeacherSafetyTests
//
//  Created by Maxwell K. Droll on 2/6/25.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct StudentList: View {
    @FirestoreQuery(collectionPath: "Students") var students:[Student]
    @Binding var selectedStudent: Student
    var body: some View {
        VStack{
            ForEach(students, id: \.name){student in
                Button {
                    selectedStudent = student
                } label: {
                    Text(student.name)
                }
                
            }
        }
    }
}
