//
//  wwdc2021_collectionApp.swift
//  wwdc2021-collection
//
//  Created by Media Guest on 28.06.2021.
//

import SwiftUI

@main
struct wwdc2021_collectionApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
