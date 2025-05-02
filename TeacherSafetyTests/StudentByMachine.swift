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
        if let screenSize = UIScreen.main.bounds as CGRect? {
            if selectedMachine != ""{
                ScrollView(.vertical){
                    VStack(spacing:0){
                        TextField("Enter Class", text: $selectedClass)
                            .offset(x: 15)
                            .font(.title)
                            .onSubmit {
                                updatedClass = selectedClass
                            }
                        Rectangle()
                            .foregroundStyle(.black)
                            .frame(width: (screenSize.width * (7 / 12)), height: 5)
                        if updatedClass == ""{
                            Spacer()
                            Text("Please Enter a Class Code")
                                .font(.title)
                        } else{
                            ForEach(students, id: \.name){Stud in
                                if Stud.Class == updatedClass{
                                    switch selectedMachine{
                                    case "Mill": StudentStat(name: Stud.name, quiz: Stud.MillTest, video: Stud.MillVideo)
                                    case "Angle Grinder": StudentStat(name: Stud.name, quiz: Stud.AngleGrinderTest, video: Stud.AngleGrinderVideo)
                                    case "Lathe": StudentStat(name: Stud.name, quiz: Stud.LatheTest, video: Stud.LatheVideo)
                                    default: StudentStat(name: Stud.name, quiz: Stud.WelderTest, video: Stud.WelderVideo)
                                    }
                                    Rectangle()
                                        .foregroundStyle(.black)
                                        .frame(width: (screenSize.width * (7 / 12)), height: 5)
                                }
                            }
                        }
                    }
                }
                .frame(width: (screenSize.width * (7 / 12)))
            }
            else{
                Text("Please Select a Machine")
                    .font(.largeTitle)
                    .frame(width: (screenSize.width * (7 / 12)))
            }
        }
    }
    struct StudentStat: View {
        let name: String
        let quiz: Int
        let video: Bool
        var body: some View {
            VStack(spacing:10){
                Text(name)
                    .font(.largeTitle)
                HStack(spacing:100){
                    VStack{
                        Text("Watched Quiz?")
                            .font(.title)
                        Text("Quiz Score")
                            .font(.title)
                    }
                    VStack{
                        if video{
                            Image(systemName: "checkmark.square")
                                .font(.title)
                                .foregroundStyle(.green)
                        }else{
                            Image(systemName: "x.square")
                                .font(.title)
                                .foregroundStyle(.red)
                        }
                        if quiz == -1{
                            Text("Not Taken")
                                .font(.title)
                        } else{
                            Text("\(quiz)/5")
                                .font(.title)
                        }
                    }
                }
            }
        }
    }
}
