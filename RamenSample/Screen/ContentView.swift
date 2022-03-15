//
//  ContentView.swift
//  RamenSample
//
//  Created by kitano hajime on 2022/03/14.
//

import SwiftUI
import MapKit

struct ContentView: View {

    @State private var shopInfo: [RamenShop] = []
    //        ZStack {
    //            Map(coordinateRegion: $viewModel.region).ignoresSafeArea()
    //
    //        }
    //        .alert(item: $viewModel.alertItem, content: { alertItem in
    //            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dissmissButton)
    //        })
    var body: some View {
        NavigationView {
            List {
                ForEach(shopInfo, id: \.self) { shopInfo in
                    HStack {
                        Text(shopInfo.name)
                        Spacer()
                        Link(destination: URL(string: shopInfo.website)!) {
                            Image(systemName: "map.fill")
                        }//: LINK
                    }//: HSTACK
                }//: FROEATCH
            }//: LIST
            .navigationTitle("ラーメン情報")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task {
                            do {
                                shopInfo = try await CloudKitManager.getLocation()
                            } catch let error {
                                print(error)
                            }
                        }
                    } label: {
                        Image(systemName: "globe.badge.chevron.backward")
                            .imageScale(.large)
                    }

                }
            }
        }//: NAVIGATION
    }//: BODY
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




