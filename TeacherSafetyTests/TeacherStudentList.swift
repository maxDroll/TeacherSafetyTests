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
    @State var selectedClass = ""
    @State var updatedClass = ""
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical){
                TextField("Enter Class", text: $selectedClass)
                    .offset(x: 35)
                    .font(.title)
                    .onSubmit {
                        updatedClass = selectedClass
                    }
                VStack(spacing:0){
                    Rectangle()
                        .foregroundStyle(.black)
                        .frame(width: (geometry.size.width * (5 / 12)), height: 5)
                    if updatedClass == ""{
                        Text("Please Enter A Class Code")
                            .font(.title)
                    }
                    VStack(alignment: .leading, spacing:0){
                        ForEach(students, id: \.name){student in
                            if student.Class == updatedClass{
                                Button {
                                    selectedStudent = student
                                } label: {
                                    ZStack{
                                        Text(student.name)
                                            .frame(width: (geometry.size.width * (5 / 12)) - 50, height: 100, alignment: .leading)
                                            .font(.system(size: 30))
                                            .foregroundStyle(.black)
                                        if selectedStudent.name == student.name && selectedStudent.Class == student.Class{
                                            Rectangle()
                                                .foregroundStyle(.blue)
                                                .opacity(0.3)
                                                .frame(width: (geometry.size.width * (5 / 12)), height: 100)
                                        }
                                    }
                                    .frame(width: (geometry.size.width * (5 / 12)))
                                }
                                Rectangle()
                                    .foregroundStyle(.black)
                                    .frame(width: (geometry.size.width * (5 / 12)), height: 5)
                            }
                        }
                    }
                    .frame(width: (geometry.size.width * (5 / 12)))
                }
            }
        }
    }
}
