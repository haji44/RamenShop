//
//  ShopMapViewModel.swift
//  RamenSample
//
//  Created by kitano hajime on 2022/03/14.
//

import SwiftUI
import MapKit
@MainActor
final class ShopMapViewModel: ObservableObject {
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.88, longitude: 140.333), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    @Published var alertItem: AlertItem?
    @Published var shopInfo: [RamenShop] = []

    init() async {
        await getShopInfo()
    }

    func getShopInfo() async {
        await MainActor.run(body: {
            Task {
                do {
                    shopInfo = try await CloudKitManager.getLocation()
                } catch {
                    alertItem = AlertContext.unableToGetRamenInfo
                }
            }
        })
    }
}
