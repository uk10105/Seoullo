//
//  RouteListView.swift
//  Seoullo
//
//  Created by 한유진 on 9/21/24.
//

import SwiftUI
import Kingfisher

struct RouteListView: View {
    @State private var selectedRouteSummary: RouteSummary?
    let code: RouteCode
    @StateObject var routeListViewModel = RouteListViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(routeListViewModel.routeSummaries, id: \.id) { summary in
                    Button(action: {
                        selectedRouteSummary = summary
                    }) {
                        ZStack(alignment: .bottomLeading) {
                            KFImage(URL(string: summary.image1 ?? ""))
                                .placeholder {
                                    ProgressView()
                                        .frame(width: 150, height: 150)
                                        .background(Color.gray.opacity(0.3))
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                                .resizable()
                                .scaledToFill()
                                .frame(height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            LinearGradient(
                                colors: [.subpoint, .black],
                                startPoint: .top,
                                endPoint: .bottom
                            ).opacity(0.3)
                                .frame(height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            VStack(alignment: .leading) {
//                                HStack {
//                                    Spacer()
//                                    Image(systemName: "heart")
//                                }
                                Spacer()
                                Text(summary.title)
                                    .font(.title3)
                                    .bold()
                            }
                            .foregroundColor(.white)
                            .padding(10)
                            .frame(height: 150)
                        }
                    }
                    .padding(.bottom, 20)
                }
            }
            .padding(25)
            .onAppear(perform: {
                routeListViewModel.code = code.code
                routeListViewModel.getRouteSummaries()
            })
        }
        .navigationTitle(code.name)
        .fullScreenCover(item: $selectedRouteSummary) { summary in
            RouteDetailView(routeSummary: summary)
        }
    }
}

#Preview {
    RouteListView(code: RouteCode(
        code: "C0117",
        name: "맛 코스",
        color: LinearGradient(
            colors: [.point, .subpoint],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ),
        icon: "fork.knife"
    ))
}
