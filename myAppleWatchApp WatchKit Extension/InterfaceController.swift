//
//  InterfaceController.swift
//  myAppleWatchApp WatchKit Extension
//
//  Created by Laibit on 2019/2/10.
//  Copyright © 2019 Laibit. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var Table: WKInterfaceTable!
    @IBOutlet weak var emptyTable: WKInterfaceTable!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        showEmptyData()
    }
    
    func showEmptyData() {
        self.emptyTable.setNumberOfRows(1, withRowType: "EmptyRow")
        let row = self.emptyTable.rowController(at: 0) as? EmptyRow
        row?.titleLabel.setText("沒有任何訊息")
    }
    
    struct ContactStruct{
        var name = ""
        var image = ""
        var time = ""
    }
    
    func loadData() {
        //Get API Call Back...
        //postData {
        let contact1 = ContactStruct(name: "123", image: "", time: "12:34")
        let contact2 = ContactStruct(name: "321", image: "", time: "43:21")
        let data:[ContactStruct] = [contact1, contact2] //api returned data...
        
        self.Table.setNumberOfRows(data.count, withRowType: "ContactRow")
        //如果你有多種ROW需要呈現則用：
        //self.Table.setRowTypes(["ContactRow","ContactRow2","ContactRow3"])
        //
        for item in data.enumerated() {
            if let row = self.Table.rowController(at: item.offset) as? ContactRow {
                row.nameLabel.setText(item.element.name)
                row.timeLabel.setText(item.element.time)
            }
        }
        
        //}
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        loadData()
    }
    
    //處理Row點選時:
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        guard let row = table.rowController(at: rowIndex) as? ContactRow,let id = row.id else {
            return
        }
        self.pushController(withName: "showDetail", context: id)
    }

}
