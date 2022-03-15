//
//  CKRecord+Ext.swift
//  RamenSample
//
//  Created by kitano hajime on 2022/03/14.
//

import CloudKit

extension CKRecord {
    func convertToRamenShop() -> RamenShop { RamenShop(record: self) }
}
