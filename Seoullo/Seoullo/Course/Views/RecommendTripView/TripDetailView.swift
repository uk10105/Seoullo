//
//  TripDetailView.swift
//  Seoullo
//
//  Created by 한유진 on 9/15/24.
//

import SwiftUI

struct TripDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    let tripIndex: Int
    
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        VStack {
            VStack {
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 40, height: 5)
                    .padding(.top, 10)
                
                Spacer()
            }
            
            VStack {
                Text("Detail \(tripIndex)")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .background(Color.blue.opacity(0.3))
        .offset(y: dragOffset.height)
        .gesture(
            DragGesture()
                .updating($dragOffset) { value, state, _ in
                    state = value.translation
                }
                .onEnded { value in
                    if value.translation.height > 100 {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
        )
    }
}

#Preview {
    TripDetailView(tripIndex: 0)
}

