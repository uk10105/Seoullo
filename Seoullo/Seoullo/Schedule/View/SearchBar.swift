//
//  SearchBar.swift
//  Seoullo
//
//  Created by 김혜수 on 9/11/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @State var isEditing = true
    var handler: () -> Void
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.point)
            TextField("장소를 검색하세요", text: $searchText)
            if isEditing {
                Button {
                    isEditing = false
                    searchText = ""
                } label: {
                    Text("취소")
                }
                .padding(.trailing, 25)
                .transition(.move(edge: .trailing))
            }
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 25)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 15))
        .onTapGesture {
            isEditing = true
        }

    }
}

#Preview {
    SearchBar(searchText: .constant("경복궁"), handler: {})
}
