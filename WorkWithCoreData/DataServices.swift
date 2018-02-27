//
//  DataServices.swift
//  WorkWithCoreData
//
//  Created by ĐỖ HOÀNG VŨ on 2/27/18.
//  Copyright © 2018 ĐỖ HOÀNG VŨ. All rights reserved.
//

import Foundation


class DataServices {
    
    static let shared : DataServices = DataServices()
    
    private var _studentNames: [Entity]?
    
    var studentNames: [Entity] {
        set {
            _studentNames = newValue
        }
        get {
            if _studentNames == nil {
                updatestudentNames()
            }
            return _studentNames ?? []
        }
    }
    
    func updatestudentNames() {
        _studentNames = []
        _studentNames = try? AppDelegate.context.fetch(Entity.fetchRequest())
        NotificationCenter.default.post(name: .updateStudentName, object: nil)
    }
    
}

extension Notification.Name {
    static let updateStudentName                 = Notification.Name("updateStudentName")
    
}


