//
//  CloudKitManager.swift
//  RamenSample
//
//  Created by kitano hajime on 2022/03/14.
//

import CloudKit

enum RecordName {
    static let ramenShop = "RamenShop"
}

struct CloudKitManager {
    static let shared = CloudKitManager()

    private init() { }
    static let container = CKContainer.default()

    static func getLocation() async throws -> [RamenShop] {
        let sortDescriptor = NSSortDescriptor(key: RamenShop.kName, ascending: true)
        let query = CKQuery(recordType: RecordName.ramenShop, predicate: NSPredicate(value: true))
        query.sortDescriptors = [sortDescriptor]

        let (matchResults, _) = try await container.publicCloudDatabase.records(matching: query)
        let records = matchResults.compactMap { _, result in try? result.get() }
        return records.map(RamenShop.init)
    }
}
