//
//  AttendanceMO.swift
//  iOS Project SA45 Yee Junyi & Qin Wenhao Joel
//
//  Created by Joel Qin on 9/2/18.
//  Copyright © 2018 Institute of Systems Science. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AttendanceMO : NSManagedObject {
    
    @NSManaged var studentId : String?
    @NSManaged var dateTime : String?
}

