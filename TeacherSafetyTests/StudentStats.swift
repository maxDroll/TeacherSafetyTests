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
            Rectangle()
                .foregroundStyle(.black)
                .frame(width: 700, height: 5)
            machine(machineVideo: selectedStudent.LatheVideo, machineTest: selectedStudent.LatheTest, machineName: "Lathe")
            machine(machineVideo: selectedStudent.MillVideo, machineTest: selectedStudent.MillTest, machineName: "Mill")
            machine(machineVideo: selectedStudent.WelderVideo, machineTest: selectedStudent.WelderTest, machineName: "Welder")
            machine(machineVideo: selectedStudent.AngleGrinderVideo, machineTest: selectedStudent.AngleGrinderTest, machineName: "Angle Grinder")
        }
        .frame(width: 700)
    }
    struct machine: View {
        let machineVideo: Bool
        let machineTest: Int
        let machineName: String
        var body: some View {
            Text(machineName)
                .font(.largeTitle)
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
                        Text("Watched")
                            .font(.title)
                    }else{
                        Text("Not Watched")
                            .font(.title)
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
