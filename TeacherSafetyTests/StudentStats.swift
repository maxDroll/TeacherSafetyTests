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
    let machines = ["Lathe", "Mill", "Welder", "Angle Grinder"]
    var body: some View {
        if let screenSize = UIScreen.main.bounds as CGRect? {
            if selectedStudent.name == "XXXXX" && selectedStudent.Class == "XXXXX"{
                Text("Please Select a Student")
                    .font(.largeTitle)
                    .frame(width:(screenSize.width * (7 / 12)))
            }else{
                VStack{
                    Text(selectedStudent.name)
                        .frame(width:(screenSize.width * (7 / 12)) - 100,alignment: .trailing)
                        .font(.title)
                        .offset(y: 85)
                    machine(machineVideo: selectedStudent.LatheVideo, machineTest: selectedStudent.LatheTest, machineName: "Lathe", numberOfQuestions: 12)
                    machine(machineVideo: selectedStudent.MillVideo, machineTest: selectedStudent.MillTest, machineName: "Mill", numberOfQuestions: 12)
                    machine(machineVideo: selectedStudent.WelderVideo, machineTest: selectedStudent.WelderTest, machineName: "Welder", numberOfQuestions: 14)
                    machine(machineVideo: selectedStudent.AngleGrinderVideo, machineTest: selectedStudent.AngleGrinderTest, machineName: "Angle Grinder", numberOfQuestions: 12)
                }
                .frame(width: (screenSize.width * (7 / 12)))
                .offset(y: -50)
            }
        }
    }
    struct machine: View {
        let machineVideo: Bool
        let machineTest: Int
        let machineName: String
        let numberOfQuestions: Int
        var body: some View {
            if let screenSize = UIScreen.main.bounds as CGRect? {
                VStack{
                    Text(machineName)
                        .font(.largeTitle)
                        .frame(height: 70)
                    HStack{
                        VStack(spacing: 18){
                            Text("Video Status")
                                .font(.title)
                            Text("Test Score")
                                .font(.title)
                        }
                        .frame(width: 180)
                        VStack(spacing: 18){
                            if machineVideo{
                                Image(systemName: "checkmark.square")
                                    .font(.title)
                                    .foregroundStyle(.green)
                            }else{
                                Image(systemName: "x.square")
                                    .font(.title)
                                    .foregroundStyle(.red)
                            }
                            if machineTest == -1{
                                Text("Not Taken")
                                    .font(.title)
                            }else{
                                Text("\(machineTest)/\(numberOfQuestions)")
                                    .font(.title)
                            }
                        }
                    }
                    if machineName != "Angle Grinder"{
                        Rectangle()
                            .foregroundStyle(.black)
                            .frame(width: (screenSize.width * (7 / 12)), height: 5)
                    }
                }
                .offset(y:20)
            }
        }
    }
}
