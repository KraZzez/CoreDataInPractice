//
//  CoreDataInPracticeApp.swift
//  CoreDataInPractice
//
//  Created by Ludvig Krantzén on 2022-11-28.
//

import SwiftUI

@main
struct CoreDataInPracticeApp: App {
   // @State var selectedPriority: FrequencyPicker = .daily
    var body: some Scene {
        WindowGroup {
            CoreDataRelationships()
          //  PickerFrequency(selectedFrequency: $selectedPriority)
        }
    }
}
