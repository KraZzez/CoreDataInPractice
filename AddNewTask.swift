//
//  AddNewTask.swift
//  CoreDataInPractice
//
//  Created by Ludvig Krantzén on 2022-11-28.
//


// Ask about saving multiple things at once. Not needing two buttons to do it.
// Ask about having values stored at startup and not needing to manually add Frequencies

import SwiftUI

struct AddNewTask: View {
    
    @State var mainTask: String = ""
    @State var selectedPriority: FrequencyPicker = .daily
    @StateObject var vm = CoreDataRelationshipViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button(action: {
                vm.addFrequency()
            }, label: {
                Text("Add Frequency")
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(10))
            })
            
            TextField(
                "Describe your task...",
                text: $mainTask)
            PickerFrequency(selectedFrequency: $selectedPriority)
            Button(action: {
                vm.addTaskObject(mainTask: mainTask, picker: selectedPriority)
            }, label: {
                Text("Add Task")
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(10))
            })
            Button(action: {
                vm.addSubTask()
            }, label: {
                Text("Add SubTask")
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(10))
            })
            Button(action: {
                vm.deleteTaskObject()
            }, label: {
                Text("Delete TaskObject")
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(10))
            })
            Button(action: {
                vm.deleteSubTask()
            }, label: {
                Text("Delete SubTask")
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(10))
            })
        }
    }
}

struct AddNewTask_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTask()
    }
}
