//
//  StudentByMachine.swift
//  TeacherSafetyTests
//
//  Created by Maxwell K. Droll on 2/21/25.
//

import SwiftUI
import Firebase
import FirebaseFirestore


struct StudentByMachine: View {
    @FirestoreQuery(collectionPath: "Students") var students:[Student]
    @State var selectedClass = ""
    @State var updatedClass = ""
    @Binding var selectedMachine: String
    var body: some View {
        ScrollView(.vertical){
            VStack{
                if selectedMachine != ""{
                    TextField("Enter Class", text: $selectedClass)
                        .offset(x: 15)
                        .onSubmit {
                            updatedClass = selectedClass
                        }
                    Rectangle()
                        .foregroundStyle(.black)
                        .frame(width: 700, height: 5)
                    if updatedClass == ""{
                        Text("Please Enter a Class")
                    } else{
                        ForEach(students, id: \.name){Stud in
                            if Stud.Class == updatedClass{
                                switch selectedMachine{
                                case "Mille": StudentStat(name: Stud.name, quiz: Stud.MillTest, video: Stud.MillVideo)
                                case "Angle Grinder": StudentStat(name: Stud.name, quiz: Stud.AngleGrinderTest, video: Stud.AngleGrinderVideo)
                                case "Lathe": StudentStat(name: Stud.name, quiz: Stud.LatheTest, video: Stud.LatheVideo)
                                default: StudentStat(name: Stud.name, quiz: Stud.WelderTest, video: Stud.WelderVideo)
                                }
                            }
                        }
                    }
                }
                else{
                    Text("Please Select a Machine")
                }
            }
        }
        .frame(width: 700)
    }
    struct StudentStat: View {
        let name: String
        let quiz: Int
        let video: Bool
        var body: some View {
            HStack{
                Text(name)
                VStack{
                    Text("Watched Quiz?")
                    Text("Quiz Score")
                }
                VStack{
                    Text("\(video)")
                    Text("\(quiz)")
                }
            }
        }
    }
}
