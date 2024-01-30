//
//  HomeView.swift
//  MySparTestCase
//
//  Created by Ruslan Magomedov on 30.01.2024.
//

import SwiftUI

enum Measurements: String, CaseIterable {
    case pieces = "Шт"
    case kg = "Кг"
}

struct HomeView: View {
    @State private var choice = Measurements.pieces
    
    var body: some View {
        ScrollView(.vertical) {
            Divider()
            
            VStack (alignment: .leading, spacing: 26) {
                imageProduct
                titleProduct
                countryProductProduced
                descriptionProduct
                mainFeaturesProduct
                allFeaturesProduct
                reviewsProductList
            }
        }
        .overlay(overlayContent, alignment: .bottom)
    }
}

extension HomeView {
    private var imageProduct: some View {
        ZStack(alignment: .bottomTrailing) {
            ZStack(alignment: .topLeading) {
                Image("ImageTea")
                    .resizable()
                    .scaledToFit()
                
                Text("Удар по ценам")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(4)
                    .background(
                        RoundedRectangle(cornerRadius: 3)
                            .fill(Color.green)
                    )
            }
            
            reviewsAndDiscount
        }
        .padding(.horizontal)
    }
    
    private var reviewsAndDiscount: some View {
        HStack(alignment: .bottom) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                
                Text("4.1")
                
                Divider()
                    .frame(height: 24)
                    .overlay(Color.black)
                
                Text("19 отзывов")
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("–5%")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(8)
                .background(
                    DiscountShapeBackground()
                        .foregroundColor(.red)
                )
        }
    }
    
    private var titleProduct: some View {
        Text("Добавка \"Липа\" \nк чаю 200 г")
            .font(.title)
            .fontWeight(.bold)
            .padding(.horizontal)
    }
    
    private var countryProductProduced: some View {
        HStack {
            Image("SpainFlag")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 36)
            
            Text("Испания, Риоха")
                .font(.footnote)
        }
        .padding(.horizontal)
    }
    
    private var descriptionProduct: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Описание")
                .fontWeight(.semibold)
            
            Text("Флавоноиды липового цвета обладают противовосплалительным действием, способствует укреплению стенки сосудов.")
                .font(.callout)
        }
        .padding(.horizontal)
    }
    
    private var mainFeaturesProduct: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Основные характеристики")
                .fontWeight(.semibold)
            
            VStack(alignment: .leading, spacing: 16) {
                CharacteristicItemView(characteristicName: "Производство", characteristicValue: "Россия, Краснодарский край")
                CharacteristicItemView(characteristicName: "Энергетическая ценность,ккал/100 г", characteristicValue: "25 ккал, 105 кДж")
                
                CharacteristicItemView(characteristicName: "Жиры/100 г", characteristicValue: "0.1 г")
                CharacteristicItemView(characteristicName: "Белки/100 г", characteristicValue: "1.3 г")
                CharacteristicItemView(characteristicName: "Углеводы/100 г", characteristicValue: "3.3 г")
            }
        }
        .padding(.horizontal)
    }
    
    private var allFeaturesProduct: some View {
        Button(action: {}, label: {
            Text("Все характеристики")
                .foregroundColor(.green)
                .fontWeight(.heavy)
        })
        .padding(.horizontal)
    }
    
    private var reviewsProduct: some View {
        HStack {
            Text("Отзывы")
                .font(.title3)
                .fontWeight(.bold)
            
            Spacer()
            
            Button(action: {}, label: {
                Text("Все 152")
                    .foregroundColor(.green)
                    .fontWeight(.bold)
            })
        }
        .padding(.horizontal)
    }
    
    private var reviewsProductList: some View {
        VStack(alignment: .leading, spacing: 0) {
            reviewsProduct
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 18) {
                    ForEach(0..<5, id: \.self) { _ in
                        ReviewsProductItemView()
                    }
                }
                .padding(.horizontal)
            }
            
            sendReviewButton
        }
        .padding(.bottom, 135)
    }
    
    private var sendReviewButton: some View {
        Button(action: {}, label: {
            Text("Оставить отзыв")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .foregroundColor(.green)
                .padding(.vertical, 10)
                .background(
                    Capsule()
                        .stroke(.green, lineWidth: 3)
                )
        })
        .padding(.horizontal)
    }
    
    private var overlayContent: some View {
        VStack {
            VStack(spacing: 16) {
                Picker("Единица измерения", selection: $choice) {
                    ForEach(Measurements.allCases, id: \.rawValue) { measurement in
                        Text(measurement.rawValue)
                            .tag(measurement)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("55.9")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(.heavy)
                            
                            Image("sign")
                        }
                        Text("199.9")
                            .font(.caption)
                            .strikethrough()
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {}, label: {
                            Text("—")
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                        })
                        
                        VStack {
                            Text("1 шт")
                                .foregroundColor(.white)
                            
                            Text("120,0 ₽")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .fixedSize()
                        .padding(.vertical, 6)
                        .padding(.horizontal)
                        
                        Button(action: {}, label: {
                            Text("+")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                        })
                    }
                    .background(
                        Capsule()
                            .fill(.green)
                    )
                }
            }
            .padding()
        }
        .background(Color.white)
    }
}

#Preview {
    HomeView()
}
