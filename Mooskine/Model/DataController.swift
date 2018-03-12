//
//  DataController.swift
//  Mooskine
//
//  Created by Ansuke on 3/12/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    let persistentContainter: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return persistentContainter.viewContext
    }
    
    init(modelName:String) {
        persistentContainter = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (() -> Void)? = nil) {
        persistentContainter.loadPersistentStores { (storeDescription, error) in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            completion?()
        }
    }
}
