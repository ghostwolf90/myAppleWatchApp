//
//  ContactRow.swift
//  myAppleWatchApp
//
//  Created by Laibit on 2019/2/10.
//  Copyright © 2019 Laibit. All rights reserved.
//

import WatchKit

class ContactRow: NSObject {
    var id:String?
    @IBOutlet var unReadGroup: WKInterfaceGroup!
    @IBOutlet var unReadLabel: WKInterfaceLabel!
    @IBOutlet weak var imageView: WKInterfaceImage!
    @IBOutlet weak var nameLabel: WKInterfaceLabel!
    @IBOutlet weak var timeLabel: WKInterfaceLabel!
}
