//
//  RamenShop.swift
//  RamenSample
//
//  Created by kitano hajime on 2022/03/14.
//

import Foundation
import CloudKit

struct RamenShop {

    // MARK: - KeyValue
    static let kName = "name"
    static let kStreet = "street"
    static let kWebsite = "website"
    static let kPhoneNumber = "phoneNumber"
    static let kLocation = "location"
    static let kPhoto = "photo"

    // MARK: - Property
    let ckRecordId: CKRecord.ID
    let name: String
    let street: String
    let website: String
    let phoneNumber: String
    let location: CLLocation
    let photo: CKAsset! // イメージではなくAsset

    // MARK: - Init
    init(record: CKRecord) {
        ckRecordId = record.recordID
        name = record[RamenShop.kName] as? String ?? "N/A"
        street = record[RamenShop.kStreet] as? String ?? "N/A"
        website = record[RamenShop.kWebsite] as? String ?? "N/A"
        phoneNumber = record[RamenShop.kPhoneNumber] as? String ?? "N/A"
        location = record[RamenShop.kLocation] as? CLLocation ?? CLLocation(latitude: 0, longitude: 0)
        photo = record[RamenShop.kPhoto] as? CKAsset
    }
}


struct MockData {
    static var location: CKRecord {
        let record = CKRecord(recordType: "RamenShop")
        record[RamenShop.kName] = "Tsukemen"
        record[RamenShop.kStreet] = "123 Main"
        record[RamenShop.kWebsite] = "https://github.com/haji44"
        record[RamenShop.kPhoneNumber] = "000-111-222"
        record[RamenShop.kLocation] = CLLocation(latitude: 38, longitude: 135)
        return record
    }
}

extension RamenShop : Hashable { }
