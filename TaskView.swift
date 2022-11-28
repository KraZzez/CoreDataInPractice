//
//  TaskView.swift
//  CoreDataInPractice
//
//  Created by Ludvig Krantzén on 2022-11-28.
//

import SwiftUI

struct CoreDataRelationships: View {
    
    @StateObject var vm = CoreDataRelationshipViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    NavigationLink {
                        AddNewTask()
                    } label: {
                        Text("Add new task")
                    }
                    
                    
                    

                    
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        HStack(alignment: .top) {
                            ForEach(vm.frequencies) { frequency in
                                FrequencyView(entity: frequency)
                            }
                        }
                    })
                    .onAppear(){
                        vm.getFrequencies()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        HStack(alignment: .top) {
                            ForEach(vm.taskObjects) { object in
                                TaskObjectView(entity: object)
                            }
                        }
                    })
                    .onAppear(){
                        vm.getTaskObjects()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        HStack(alignment: .top) {
                            ForEach(vm.subTasks) { task in
                                SubTaskView(entity: task)
                            }
                        }
                    })
                    .onAppear(){
                        vm.getSubTasks()
                    }
                }
            }
        }
    }
}

struct CoreDataRelationships_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataRelationships()
    }
}



struct FrequencyView: View {
    
    let entity: Frequency
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Frequency: \(entity.name ?? "")")
                .bold()
            
            if let taskObjects = entity.taskObjects?.allObjects as? [TaskObject] {
                Text("TaskObjects:")
                    .bold()
                ForEach(taskObjects) { object in
                    Text(object.category ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct TaskObjectView: View {
    
    let entity: TaskObject
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("MainTask: \(entity.mainTask ?? "")")
                .bold()
            Text("Category: \(entity.category ?? "")")
                .bold()
            if entity.isComplete {
                Text("Is completed: True")
            } else {
                Text("Is completed: False")
            }
            Text("Date Created: \(entity.dateCreated ?? Date())")
            
            Text("Frequency: ")
                .bold()
            Text(entity.frequency?.name ?? "")
            
            if let subTasks = entity.subTasks?.allObjects as? [SubTask] {
                Text("SubTasks: ")
                    .bold()
                ForEach(subTasks) { subTask in
                    Text(subTask.name ?? "")
                    if subTask.isComplete {
                        Text("Is completed: True")
                    } else {
                        Text("Is completed: False")
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.green.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct SubTaskView: View {
    
    let entity: SubTask
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("SubTask Name: \(entity.name ?? "")")
                .bold()
            
            if entity.isComplete {
                Text("Is completed: True")
            } else {
                Text("Is completed: False")
            }
            
            Text("Frequency: ")
                .bold()
            Text(entity.frequency?.name ?? "")
            
            Text("Connected to maintask: ")
                .bold()
            Text(entity.taskObject?.mainTask ?? "")
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.blue.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}
