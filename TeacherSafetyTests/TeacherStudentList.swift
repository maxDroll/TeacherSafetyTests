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
        ScrollView(.vertical){
            VStack(alignment: .leading, spacing:0){
                Rectangle()
                    .foregroundStyle(.black)
                    .frame(width: 500, height: 5)
                ForEach(students, id: \.name){student in
                    Button {
                        selectedStudent = student
                    } label: {
                        ZStack{
                            Text(student.name)
                                .frame(width: 450, height: 100, alignment: .leading)
                                .font(.system(size: 30))
                            if selectedStudent.name == student.name && selectedStudent.Class == student.Class{
                                Rectangle()
                                    .foregroundStyle(.blue)
                                    .opacity(0.3)
                                    .frame(width: 500, height: 100)
                            }
                        }
                        .frame(width: 500)
                    }
                    Rectangle()
                        .foregroundStyle(.black)
                        .frame(width: 500, height: 5)
                }
            }
            .frame(width: 500)
        }
    }
}
