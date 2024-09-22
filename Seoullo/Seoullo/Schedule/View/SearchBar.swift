//
//  SearchBarView.swift
//  Seoullo
//
//  Created by 김혜수 on 9/11/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @State var isEditing = false
    var handler: () -> Void
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.point)
                .padding(.leading, 10)
            TextField("장소를 검색하세요", text: $searchText)
            Spacer()
            if isEditing {
                Button {
                    isEditing = false
                    searchText = ""
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.point)
                        .fontWeight(.semibold)
                        .padding(.trailing, -10)
                }
                .padding(.trailing, 25)
                .transition(.move(edge: .trailing))
            }
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 15))
        .onTapGesture {
            isEditing = true
        }

    }
}

#Preview {
    SearchBarView(searchText: .constant("경복궁"), handler: {})
}
