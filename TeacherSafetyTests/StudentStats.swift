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
        GeometryReader{ geometry in
            if selectedStudent.name == "XXXXX" && selectedStudent.Class == "XXXXX"{
                Text("Please Select a Student")
                    .font(.largeTitle)
                    .frame(width:(geometry.size.width * (7 / 12)))
            }else{
                VStack{
                    Text(selectedStudent.name)
                        .frame(width:(geometry.size.width * (7 / 12)) - 100,alignment: .trailing)
                        .font(.title)
                        .offset(y: 75)
                    machine(machineVideo: selectedStudent.LatheVideo, machineTest: selectedStudent.LatheTest, machineName: "Lathe")
                    machine(machineVideo: selectedStudent.MillVideo, machineTest: selectedStudent.MillTest, machineName: "Mill")
                    machine(machineVideo: selectedStudent.WelderVideo, machineTest: selectedStudent.WelderTest, machineName: "Welder")
                    machine(machineVideo: selectedStudent.AngleGrinderVideo, machineTest: selectedStudent.AngleGrinderTest, machineName: "Angle Grinder")
                }
                .frame(width: (geometry.size.width * (7 / 12)))
                .offset(y: -50)
            }
        }
    }
    struct machine: View {
        let machineVideo: Bool
        let machineTest: Int
        let machineName: String
        var body: some View {
            GeometryReader { geometry in
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
                if machineName != "Angle Grinder"{
                    Rectangle()
                        .foregroundStyle(.black)
                        .frame(width: (geometry.size.width * (7 / 12)), height: 5)
                }
            }
        }
    }
}
