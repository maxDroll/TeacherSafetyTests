//
//  MachineSelection.swift
//  TeacherSafetyTests
//
//  Created by Maxwell K. Droll on 2/21/25.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct MachineSelection: View {
    let machines = ["Lathe", "Mille", "Welder", "Angle Grinder"]
    @FirestoreQuery(collectionPath: "Students") var students:[Student]
    @Binding var selectedMachine: String
    @State var selectedClass = ""
    @State var updatedClass = ""
    var body: some View {
        VStack(spacing:0){
            TextField("Enter Class", text: $selectedClass)
                .offset(x: 15)
                .onSubmit {
                    updatedClass = selectedClass
                }
            Rectangle()
                .foregroundStyle(.black)
                .frame(width: 500, height: 5)
            ForEach(machines, id: \.self){machine in
                Button {
                    selectedMachine = machine
                } label: {
                    ZStack{
                        if selectedMachine == machine{
                            Rectangle()
                                .frame(width: 500, height: 175)
                                .foregroundStyle(.blue)
                                .opacity(0.3)
                        }
                        Text(machine)
                            .font(.system(size: 50))
                            .frame(width: 450, height: 175, alignment: .leading)
                            .foregroundStyle(.black)
                    }
                }
                Rectangle()
                    .foregroundStyle(.black)
                    .frame(width: 500, height: 5)
            }
        }
        .frame(width: 500)
    }
}
