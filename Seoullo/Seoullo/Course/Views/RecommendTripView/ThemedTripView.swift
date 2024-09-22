//
//  ThemedTripView.swift
//  Seoullo
//
//  Created by 한유진 on 9/15/24.
//

/*
 {
 "response": {
 "header": {
 "resultCode": "0000",
 "resultMsg": "OK"
 },
 "body": {
 "items": {
 "item": [
 {
 "code": "C0112",
 "name": "가족코스",
 "rnum": 1
 },
 {
 "code": "C0113",
 "name": "나홀로코스",
 "rnum": 2
 },
 {
 "code": "C0114",
 "name": "힐링코스",
 "rnum": 3
 },
 {
 "code": "C0115",
 "name": "도보코스",
 "rnum": 4
 },
 {
 "code": "C0116",
 "name": "캠핑코스",
 "rnum": 5
 },
 {
 "code": "C0117",
 "name": "맛코스",
 "rnum": 6
 }
 ]
 },
 "numOfRows": 6,
 "pageNo": 1,
 "totalCount": 6
 }
 }
 }
 */

struct RouteCode {
    let code: String
    let name: String
    let color: LinearGradient
    let icon: String
}

let routeCodes: [RouteCode] = [
    RouteCode(
        code: "C0112",
        name: "가족 코스",
        color: LinearGradient(
            colors: [.point, .subpoint],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ),
        icon: "house.fill"
    ),
    RouteCode(
        code: "C0113",
        name: "나홀로 코스",
        color: LinearGradient(
            colors: [.point, .subpoint],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ),
        icon: "person.fill"
    ),
    RouteCode(
        code: "C0114",
        name: "힐링 코스",
        color: LinearGradient(
            colors: [.point, .subpoint],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ),
        icon: "leaf.fill"
    ),
    RouteCode(
        code: "C0115",
        name: "도보 코스",
        color: LinearGradient(
            colors: [.point, .subpoint],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ),
        icon: "figure.walk"
    ),
    RouteCode(
        code: "C0116",
        name: "캠핑 코스",
        color: LinearGradient(
            colors: [.point, .subpoint],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ),
        icon: "tent.fill"
    ),
    RouteCode(
        code: "C0117",
        name: "맛 코스",
        color: LinearGradient(
            colors: [.point, .subpoint],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ),
        icon: "fork.knife"
    )
]

import SwiftUI

struct ThemedTripView: View {
    var body: some View {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("카테고리 별 코스")
                            .font(.title)
                        Text("카테고리 별 코스를 여행하세요.")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                }
                
                /*
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(routeCodes, id: \.code) { code in
                            NavigationLink(destination: RouteListView(code: code)) {
                                ZStack(alignment: .bottomLeading) {
                                    ZStack {
                                        code.color
                                        Image(systemName: code.icon)
                                            .foregroundColor(.white.opacity(0.8))
                                            .font(.system(size: 60))
                                    }
                                    .frame(width: 150, height: 150)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        HStack {
                                            Text(code.name)
                                                .font(.title)
                                                .foregroundColor(.white)
                                            Spacer()
                                        }
                                    }
                                    .padding(10)
                                    .frame(width: 150, height: 150)
                                }
                                .padding(.trailing, 10)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                */
                
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 150))],
                    spacing: 10
                ) {
                    ForEach(routeCodes, id: \.code) { code in
                        NavigationLink(destination: RouteListView(code: code)) {
                            ZStack(alignment: .bottomLeading) {
                                ZStack {
                                    code.color
                                    Image(systemName: code.icon)
                                        .foregroundColor(.white.opacity(0.8))
                                        .font(.system(size: 60))
                                }
                                .frame(width: 165, height: 165)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                VStack(alignment: .leading) {
                                    Spacer()
                                    HStack {
                                        Text(code.name)
                                            .font(.title)
                                            .foregroundColor(.white)
                                        Spacer()
                                    }
                                }
                                .padding(10)
                                .frame(width: 165, height: 165)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
    }
}

#Preview {
    ThemedTripView()
}
