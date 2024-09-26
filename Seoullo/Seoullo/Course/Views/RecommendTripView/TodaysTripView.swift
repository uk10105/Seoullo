//
//  TodaysTripView.swift
//  Seoullo
//
//  Created by 한유진 on 9/15/24.
//

import SwiftUI
import Kingfisher

extension Int: Identifiable {
    public var id: Int { self }
}

// 랜드마크 투어
/*
 /areaBasedList1
 1.
 "contentid": "1889328",
 "firstimage": "http://tong.visitkorea.or.kr/cms/resource/15/1356615_image2_1.jpg"
 "firstimage2": "http://tong.visitkorea.or.kr/cms/resource/15/1356615_image3_1.jpg",
 "title": "서울의 랜드마크를 만나다"
 2.
 "contentid": "1914507",
 "firstimage": "http://tong.visitkorea.or.kr/cms/resource/52/1545552_image2_1.jpg",
 "firstimage2": "http://tong.visitkorea.or.kr/cms/resource/52/1545552_image3_1.jpg",
 "title": "서울의 놀거리, 볼거리를 하루에"
 3.
 "contentid": "2390484",
 "firstimage": "http://tong.visitkorea.or.kr/cms/resource/63/1567863_image2_1.jpg",
 "firstimage2": "http://tong.visitkorea.or.kr/cms/resource/63/1567863_image3_1.jpg",
 "title": "잠실 관광특구 코스",
 4.
 "contentid": "1886054",
 "firstimage": "http://tong.visitkorea.or.kr/cms/resource/88/1568388_image2_1.jpg",
 "firstimage2": "http://tong.visitkorea.or.kr/cms/resource/88/1568388_image3_1.jpg",
 "title": "동대문 주변에서 만나는 역사의 현장",
 5.
 "contentid": "1889319",
 "firstimage": "http://tong.visitkorea.or.kr/cms/resource/81/1569281_image2_1.jpg",
 "firstimage2": "http://tong.visitkorea.or.kr/cms/resource/81/1569281_image3_1.jpg",
 "title": "한양의 500년 도읍을 거닐다"
 6.
 "contentid": "1952962",
 "firstimage": "http://tong.visitkorea.or.kr/cms/resource/81/1075281_image2_1.jpg",
 "firstimage2": "http://tong.visitkorea.or.kr/cms/resource/81/1075281_image3_1.jpg",
 "title": "경복궁 북쪽마을 북촌 즐기기"
 */

struct TodaysTripView: View {
    @State private var selectedRouteSummary: RouteSummary?
    // TODO: contendIds 리스트와 /detailCommon1 API 연동
    let routeSummaries: [RouteSummary] = [
        RouteSummary(id: "1889328",
                     title: "서울의 랜드마크를 만나다",
                     image1: "http://tong.visitkorea.or.kr/cms/resource/15/1356615_image2_1.jpg",
                     image2: "http://tong.visitkorea.or.kr/cms/resource/15/1356615_image3_1.jpg",
                     overview: "볼거리 넘치는 서울 도심을 가족과 함께 돌아보자. 옛날 서울역사를 리모델링해 독특한 테마의 전시를 하고 있는 문화 공간, 문화역 서울 284를 둘러보고 서울광장에서 펼쳐지는 다양한 이벤트에도 참여해보자. 남산 한옥마을에서 전통체험을 즐기고 남산서울타워에 오르면 서울의 전경이 파노라마로 펼쳐진다."),
        RouteSummary(id: "1914507",
                     title: "서울의 놀거리, 볼거리를 하루에",
                     image1: "http://tong.visitkorea.or.kr/cms/resource/52/1545552_image2_1.jpg",
                     image2: "http://tong.visitkorea.or.kr/cms/resource/52/1545552_image3_1.jpg",
                     overview: "성북동의 고즈넉한 미술관에서 수준 높은 고미술을 관람하고, 서울 사람이라면 한번은 가봤을 롯데월드에서 한나절 신나게 놀이기구를 즐겨보자. 그리고 저녁쯤 남산 서울타워에서 야경을 보며 서울여행을 마무리하면 후회 없는 하루가 될 것이다."),
        RouteSummary(id: "2390484",
                     title: "잠실 관광특구 코스",
                     image1: "http://tong.visitkorea.or.kr/cms/resource/63/1567863_image2_1.jpg",
                     image2: "http://tong.visitkorea.or.kr/cms/resource/63/1567863_image3_1.jpg",
                     overview: "잠실 관광특구는 롯데월드 및 롯데월드타워를 포함하여 다양한 놀이와 취미 활동은 물론 쇼핑과 역사 유적 탐방까지 근거리에서 한 번에 해결할 수 있는 아주 훌륭한 코스다."),
        RouteSummary(id: "1886054",
                     title: "동대문 주변에서 만나는 역사의 현장",
                     image1: "http://tong.visitkorea.or.kr/cms/resource/88/1568388_image2_1.jpg",
                     image2: "http://tong.visitkorea.or.kr/cms/resource/88/1568388_image3_1.jpg",
                     overview: "우리나라 보물인 동대문. 동대문을 중심으로 한양성곽길이 북쪽으로 이어져 있고, 동대문운동장과 패션시장으로 우뚝 선 동대문 중심의 상권을 만나볼 수 있는 곳이다."),
        RouteSummary(id: "1889319",
                     title: "한양의 500년 도읍을 거닐다",
                     image1: "http://tong.visitkorea.or.kr/cms/resource/81/1569281_image2_1.jpg",
                     image2: "http://tong.visitkorea.or.kr/cms/resource/81/1569281_image3_1.jpg",
                     overview: "서울 도심 속에 자리한 500년 도읍의 흔적을 따라 걷는다. 인사동 문화의 거리를 지나 한국 불교를 대표하는 조계종 총본산인 조계사를 둘러보면 길은 경복궁으로 이어진다. 조선 왕조의 역사를 담고 있는 경복궁을 돌아 나오면 최근 들어 인기 탐방지로 떠오른 부암동이 지척이다."),
        RouteSummary(id: "1952962",
                     title: "경복궁 북쪽마을 북촌 즐기기",
                     image1: "http://tong.visitkorea.or.kr/cms/resource/81/1075281_image2_1.jpg",
                     image2: "http://tong.visitkorea.or.kr/cms/resource/81/1075281_image3_1.jpg",
                     overview: "경복궁 인근 길들은 정말 고풍스럽고 아름답다. 최근에는 고풍스런 북촌에 젊은 디자이너들이 색을 입혀 갤러리와 아기자기한 상점들이 많이 들어섰다. 걸어도 걸어도 눈이 즐겁다. 정독도서관의 시원스럽고 운치있는 정원의 한가로움도 서울의 번잡함을 잊게 해 준다.\n주변의 작은 갤러리들도 눈요깃감이 많다.\n<br /><br />출처:이야기를 따라 한양 도성을 걷다.")
    ]
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("추천 여행 코스")
                        .font(.title)
                    Text("서울의 랜드마크를 방문하세요.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
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
                                    .frame(width: 300, height: 150)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                LinearGradient(
                                    colors: [.subpoint, .black],
                                    startPoint: .topLeading,
                                    endPoint: .bottom
                                ).opacity(0.3)
                                    .frame(width: 300, height: 150)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                VStack(alignment: .leading) {
//                                    HStack {
//                                        Spacer()
//                                        Image(systemName: "heart")
//                                    }
                                    Spacer()
                                    Text(summary.title)
                                        .font(.headline)
                                    Text(summary.overview ?? "")
                                        .font(.footnote)
                                        .lineLimit(1)
                                }
                                .foregroundColor(.white)
                                .padding(10)
                                .frame(width: 300, height: 150)
                            }
                            .padding(.trailing, 10)
                        }
                    }
                }
            }
            .fullScreenCover(item: $selectedRouteSummary) { summary in
                RouteDetailView(routeSummary: summary)
            }
        }
    }
}

struct TodaysTripView2: View {
    @State private var selectedTripIndex: Int?
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("오늘의 추천")
                        .font(.title)
                    Text("오늘의 추천 코스를 여행하세요.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<3) { index in
                        Button(action: {
                            selectedTripIndex = index
                        }) {
                            ZStack(alignment: .bottomLeading) {
                                Image("icybay")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 300, height: 150)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Spacer()
                                        Image(systemName: "heart")
                                    }
                                    Spacer()
                                    Text("Title \(index)")
                                        .font(.headline)
                                    Text("Description")
                                        .font(.footnote)
                                }
                                .foregroundColor(.white)
                                .padding(10)
                                .frame(width: 300, height: 150)
                            }
                            .padding(.trailing, 10)
                        }
                    }
                }
            }
            .fullScreenCover(item: $selectedTripIndex) { index in
                RouteDetailView(routeSummary:
                                RouteSummary(id: "1977713",
                                             title: "서울 양천구 서서울호수공원 코스",
                                             image1: "http://tong.visitkorea.or.kr/cms/resource/68/1967068_image2_1.jpg",
                                             image2: "http://tong.visitkorea.or.kr/cms/resource/68/1967068_image3_1.jpg",
                                             overview: nil)
                )
            }
        }
    }
}

#Preview {
    TodaysTripView()
}
