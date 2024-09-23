//
//  DetailMainView.swift
//  Seoullo
//
//  Created by 이유경 on 9/23/24.
//

import SwiftUI

struct DetailMainView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // 상단 이미지 및 버튼
                    ZStack(alignment: .top) {
                        Image("test2")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 300)
                        
                        HStack {
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "chevron.left")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15)
                                    .foregroundStyle(.point)
                                    .font(.system(size: 20, weight: .bold))
                                    .padding(18)
                                    .background(Circle().fill(Color.white))
                            })
                            Spacer()
                            
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                                    .foregroundStyle(.point)
                                    .padding()
                                    .background(Circle().fill(Color.white))
                            })
                        }
                        .padding(.horizontal, 50)
                        .padding(.top,50)
                    }
                    
                    // 제목
                    Text("경복궁")
                        .font(.system(size: 30))
                        .bold()
                        .padding(.horizontal, 60)
                    Text("위치 어디어디어디어디어디ㅓ이더ㅣ어디")
                        .font(.system(size: 18))
                        .foregroundStyle(.gray)
                        .padding(.horizontal, 60)
                    
                    InfoIcon()
                        .padding(.horizontal, 40)
                    
                    Text("""
                    연건평 1,000 여평(지하 1층, 지상 3층)
                    
                    무료 (학내구성원 이용)
                    
                    성신교정도서관 02-740-9720
                    
                    [대출반납실]
                    - 학기 중 09:00~17:00
                    - 방학 중 09:00~16:00
                    
                    [자료열람실 / 참고열람실 / 복사실 / 시청각실]
                    - 학기 중 08:00~22:00
                    - 방학 중 휴실
                    """)
                    .padding(.horizontal, 60)
                }
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    DetailMainView()
}
