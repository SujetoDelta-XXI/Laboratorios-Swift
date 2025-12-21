//
//  Actividad2.swift
//  Semana12-Lab
//
//  Created by Mac11 on 18/11/25.
//

import SwiftUI

struct ProductItem {
    let id: Int
    let name: String
    let price: Double
}

class ShoppingCart: ObservableObject {

    @Published var items: [ProductItem] = []

    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }

    func addItem(_ item: ProductItem) {
        items.append(item)
    }

    func removeItem(at index: Int) {
        items.remove(at: index)
    }
}

struct ProductListView: View {

    @StateObject private var cart = ShoppingCart()

    let products = [
        ProductItem(id:1, name: "iPhone", price: 5000.18),
        ProductItem(id:2, name: "iPad", price: 3000.25),
        ProductItem(id:3, name: "MacBook", price: 9000.08)
    ]

    var body: some View {

        NavigationView {

            VStack {
                List(products, id: \.id) { product in
                    HStack {
                        Text(product.name)
                        Text("S/\(product.price, specifier: "%.2f")")
                        Spacer()
                        Button("Add"){
                            cart.addItem(product)
                        }.buttonStyle(.bordered)
                    }
                } // end List

                // Navigation to cart
                NavigationLink("View Cart (\(cart.items.count))") {
                    CartView(cart: cart)
                }
            }.navigationTitle("Products")
        } // end NavigationView
    }
}

struct CartView: View {

    @ObservedObject var cart: ShoppingCart

    var body: some View {
        VStack{
            List(self.cart.items.indices , id: \.self) { index in
                let item = self.cart.items[index]
                HStack{
                    Text(item.name)
                    Text("S/\(item.price, specifier: "%.2f")")
                    Spacer()
                    Button("Remove", role: .destructive){
                        cart.removeItem(at: index)
                    }.buttonStyle(.bordered)
                }
            }

            HStack {
                Text("Total: S/\(cart.totalPrice, specifier: "%.2f")")
            }
        }
    }
}

#Preview {
    ProductListView()
}
