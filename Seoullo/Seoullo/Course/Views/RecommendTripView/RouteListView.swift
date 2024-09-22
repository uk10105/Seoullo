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
    // TODO: code를 사용해서 routeSummaries를 불러오도록 수정
    let routeSummaries: [RouteSummary] = [
        RouteSummary(id: "1952978",
                     title: "궁의 북쪽 자하문 돌아보기",
                     image1: "http://tong.visitkorea.or.kr/cms/resource/42/1568042_image2_1.jpg",
                     image2: "http://tong.visitkorea.or.kr/cms/resource/42/1568042_image3_1.jpg",
                     overview: nil),
        RouteSummary(id: "1921815",
                     title: "남산을 중심으로 문화놀이",
                     image1: "http://tong.visitkorea.or.kr/cms/resource/73/1569173_image2_1.jpg",
                     image2: "http://tong.visitkorea.or.kr/cms/resource/73/1569173_image3_1.jpg",
                     overview: nil),
        RouteSummary(id: "1977713",
                     title: "서울 양천구 서서울호수공원 코스",
                     image1: "http://tong.visitkorea.or.kr/cms/resource/68/1967068_image2_1.jpg",
                     image2: "http://tong.visitkorea.or.kr/cms/resource/68/1967068_image3_1.jpg",
                     overview: nil)
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(routeSummaries, id: \.id) { summary in
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
                                HStack {
                                    Spacer()
                                    Image(systemName: "heart")
                                }
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
        }
        .navigationTitle(code.name)
        .fullScreenCover(item: $selectedRouteSummary) { summary in
            TripDetailView(routeSummary: summary)
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
