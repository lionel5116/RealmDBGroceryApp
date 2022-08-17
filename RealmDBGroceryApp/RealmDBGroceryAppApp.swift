//
//  RealmDBGroceryAppApp.swift
//  RealmDBGroceryApp
//
//  Created by lionel jones on 8/17/22.
//

import SwiftUI

@main
struct RealmDBGroceryAppApp: App {
    
    //run/make migrations
    let migrator = Migrator();
    
    var body: some Scene {
        WindowGroup {
            //this line tells swift not to show any consraint errors
            let _ = UserDefaults.standard.set(false,forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            //this line alows you to print the path of the Realm Document Directory
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            ContentView()
        }
    }
}
