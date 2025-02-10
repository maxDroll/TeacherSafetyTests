//
//  StudentStats.swift
//  TeacherSafetyTests
//
//  Created by Maxwell K. Droll on 2/6/25.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct StudentStats: View {
    @Binding var selectedStudent: Student
    let machines = ["Lathe", "Mille", "Welder", "Angle Grinder"]
    var body: some View {
        VStack{
            HStack{
                Text("Lathe")
                Text("\(selectedStudent.LatheTest)")
                Text("\(selectedStudent.LatheVideo)")
            }
            HStack{
                Text("Mille")
                Text("\(selectedStudent.MillTest)")
                Text("\(selectedStudent.MillVideo)")
            }
            HStack{
                Text("Welder")
                Text("\(selectedStudent.WelderTest)")
                Text("\(selectedStudent.WelderVideo)")
            }
            HStack{
                Text("Angle Grinder")
                Text("\(selectedStudent.AngleGrinderTest)")
                Text("\(selectedStudent.AngleGrinderVideo)")
            }

        }
        .frame(width: 700)
    }
}
