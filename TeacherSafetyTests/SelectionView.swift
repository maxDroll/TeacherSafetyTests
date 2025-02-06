//
//  SelectionView.swift
//  TeacherSafetyTests
//
//  Created by Eric M. Wetzel on 2/6/25.
//

import SwiftUI

struct SelectionView: View {
    @State private var selection = "Students"
    let categories = ["Students", "Machine"]
    let quizzes: [String] = ["Lathe", "Welder", "Mille", "Angle Grinder"]
    
    var body: some View {
        VStack {
            Picker("Sort by", selection: $selection) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            
            List {
                ForEach(filteredQuizzes, id: \.self) { quiz in
                    Text(quiz)
                }
            }
        }
        
    }
  
    var filteredQuizzes: [String] {
        return quizzes
    }

    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
    }
}
