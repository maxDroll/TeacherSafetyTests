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
    var body: some View {
        VStack(spacing:0){
            ForEach(machines, id: \.self){machine in
                Button {
                    selectedMachine = machine
                } label: {
                    ZStack{
                        if selectedMachine == machine{
                            Rectangle()
                                .frame(width: 500, height: 203)
                                .foregroundStyle(.blue)
                                .opacity(0.3)
                        }
                        Text(machine)
                            .font(.system(size: 55))
                            .frame(width: 450, height: 203, alignment: .leading)
                            .foregroundStyle(.black)
                    }
                }
                if machine != "Angle Grinder"{
                    Rectangle()
                        .foregroundStyle(.black)
                        .frame(width: 500, height: 5)
                }
            }
        }
        .frame(width: 500)
        .offset(y: -23)
    }
}
