//
//  MacOs12SignalTypesView.swift
//  Telemetry Viewer (macOS)
//
//  Created by Daniel Jilg on 20.07.21.
//

import SwiftUI

@available(macOS 12, *)
struct MacOs12PayloadsView: View {
    @EnvironmentObject var lexiconService: LexiconService
    @State private var sortOrder: [KeyPathComparator<DTO.LexiconPayloadKey>] = [
        .init(\.payloadKey, order: SortOrder.forward)
    ]
    @State var searchText: String = ""

    let appID: UUID

    var table: some View {
        Table(payloadTypes, sortOrder: $sortOrder) {
            TableColumn("Key", value: \.payloadKey)
            TableColumn("First Seen", value: \.firstSeenAt) { x in Text("\(x.firstSeenAt, style: .date)") }
        }
    }

    var body: some View {
        table
            .searchable(text: $searchText)
            .navigationTitle("Lexicon")
            .onAppear {
                lexiconService.getPayloadKeys(for: appID)
            }
            .toolbar {
                if lexiconService.isLoading(appID: appID) {
                    ProgressView().scaleEffect(progressViewScaleLarge, anchor: .center)
                } else {
                    Button(action: {
                        lexiconService.getPayloadKeys(for: appID)
                    }, label: {
                        Image(systemName: "arrow.counterclockwise.circle")
                    })
                }
            }
    }

    var payloadTypes: [DTO.LexiconPayloadKey] {
        return lexiconService.payloadKeys(for: appID)
            .filter {
                searchText.isEmpty ? true : $0.payloadKey.localizedCaseInsensitiveContains(searchText)
            }
            .sorted(using: sortOrder)
    }
}
