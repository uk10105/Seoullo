//
//  TripDetailView.swift
//  Seoullo
//
//  Created by 한유진 on 9/15/24.
//

import SwiftUI
import Kingfisher

struct TripDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    let routeSummary: RouteSummary
    var route: Route = Route(item: [])
    
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        ZStack {
            // TODO: routeSummary.title, routeSummary.overview, routeDetail 등 추가
            VStack {
                KFImage(URL(string: routeSummary.image1 ?? ""))
                    .placeholder {
                        ProgressView()
                            .frame(width: 300, height: 300)
                            .background(Color.gray.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("코스 소개")
                                .font(.caption)
                                .foregroundStyle(.point)
                            Spacer()
                        }
                        
                        HStack {
                            Text(routeSummary.title)
                                .font(.title)
                            Spacer()
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text(routeSummary.overview ?? "")
                                .font(.subheadline)
                            Spacer()
                        }
                        .padding(.bottom, 20)
                        
                        // TODO: /detailInfo1 API 연동
                        
                        ForEach(route.item, id: \.id) { item in
                            VStack {
                                HStack {
                                    Image(systemName: "flag.fill")
                                    Text("\((Int(item.index) ?? 0) + 1)번째 목적지")
                                        .font(.caption)
                                    Spacer()
                                }
                                .foregroundStyle(.point)
                                
                                VStack {
                                    HStack {
                                        Text(item.title)
                                            .font(.title3)
                                            .padding(.horizontal)
                                            .padding(.vertical, 5)
                                            .background(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        Spacer()
                                    }
                                    
                                    Text(item.overview ?? "")
                                        .font(.subheadline)
                                }
                                .padding()
                                .background(.subpoint)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            .padding(.bottom, 20)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 50)
                
                Spacer()
            }
            
            // 드롭다운 아이콘
            VStack {
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color.white.opacity(0.5))
                    .frame(width: 40, height: 5)
                    .padding(.top, 10)
                
                Spacer()
            }
        }
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
    TripDetailView(routeSummary:
                    RouteSummary(id: "1889328",
                                 title: "서울의 랜드마크를 만나다",
                                 image1: "http://tong.visitkorea.or.kr/cms/resource/15/1356615_image2_1.jpg",
                                 image2: "http://tong.visitkorea.or.kr/cms/resource/15/1356615_image3_1.jpg",
                                 overview: "볼거리 넘치는 서울 도심을 가족과 함께 돌아보자. 옛날 서울역사를 리모델링해 독특한 테마의 전시를 하고 있는 문화 공간, 문화역 서울 284를 둘러보고 서울광장에서 펼쳐지는 다양한 이벤트에도 참여해보자. 남산 한옥마을에서 전통체험을 즐기고 남산서울타워에 오르면 서울의 전경이 파노라마로 펼쳐진다."),
                   route: sampleRoute
    )
}

