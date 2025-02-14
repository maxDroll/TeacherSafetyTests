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
        if selectedStudent.name == "XXXXX" && selectedStudent.Class == "XXXXX"{
            Text("Please Select a Student")
                .font(.largeTitle)
                .frame(width:700)
        }else{
            VStack{
                Text(selectedStudent.name)
                    .frame(width:600,alignment: .trailing)
                    .font(.title)
                    .offset(y: 75)
                Rectangle()
                    .foregroundStyle(.black)
                    .frame(width: 700, height: 5)
                machine(machineVideo: selectedStudent.LatheVideo, machineTest: selectedStudent.LatheTest, machineName: "Lathe")
                machine(machineVideo: selectedStudent.MillVideo, machineTest: selectedStudent.MillTest, machineName: "Mill")
                machine(machineVideo: selectedStudent.WelderVideo, machineTest: selectedStudent.WelderTest, machineName: "Welder")
                machine(machineVideo: selectedStudent.AngleGrinderVideo, machineTest: selectedStudent.AngleGrinderTest, machineName: "Angle Grinder")
            }
            .frame(width: 700)
            .offset(y: -50)
        }
    }
    struct machine: View {
        let machineVideo: Bool
        let machineTest: Int
        let machineName: String
        var body: some View {
            Text(machineName)
                .font(.largeTitle)
                .frame(height: 78)
            HStack{
                VStack(spacing: 20){
                    Text("Video Status")
                        .font(.title)
                    Text("Test Score")
                        .font(.title)
                }
                .frame(width: 200)
                VStack(spacing: 20){
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
                        Text("\(machineTest)/5")
                            .font(.title)
                    }
                }
            }
            Rectangle()
                .foregroundStyle(.black)
                .frame(width: 700, height: 5)
        }
    }
}
