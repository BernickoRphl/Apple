import SwiftUI
import PencilKit

struct ContentView: View {
    @State private var sproutName = ""
    @State var canvas = PKCanvasView()
    @State private var isDrawingViewActive = false
    @State var isDraw = true
    @State var color : Color = .black
    @State var type: PKInkingTool.InkType = .pencil
    @State var colorPicker = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(#colorLiteral(red: 0.8352941176, green: 0.8941176471, blue: 0.8666666667, alpha: 1))
                    .ignoresSafeArea()
                
                VStack {
                    Image("BloomSketch_LogoWhite")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 240, height: 240)
                        .foregroundColor(.red)
                    
                    Spacer()
                    
                    VStack(spacing: 2) {
                        Text("Name Your New Sprout")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(hex: 0x1B3F2E))
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                                .frame(height: 56)
                            
                            TextField("CutiePatotie", text: $sproutName)
                                .padding(.horizontal)
                        }
                        .frame(width: 300)
                        .padding(.top, 16)
                        
                        Button(action: {self.isDrawingViewActive = true}) {
                            Text("Start")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 64)
                                .background(Color(hex: 0x1B3F2E))
                                .cornerRadius(16)
                        }
                        .padding(.top, 24)
                        
                        NavigationLink(
                            destination: DrawingView(canvas: $canvas, isDraw: $isDraw, type: $type, color: $color)
                                .navigationTitle("Drawing")
                                .navigationBarTitleDisplayMode(.inline)
                                .navigationBarItems(
                                    leading: Button(action: {
                                        // Save image action
                                    }) {
                                        EmptyView()
                                    },
                                    trailing: HStack(spacing: 15) {
                                        ColorPicker("", selection: $color)
                                            .padding()
                                        
                                        Button(action: {
                                            isDraw = false
                                        }) {
                                            Image(systemName: "pencil.slash")
                                                .font(.title)
                                        }
                                        
                                        Menu {
                                            Button(action: {
                                                isDraw = true
                                                type = .pencil
                                                
                                            }) {
                                                Label {
                                                    Text("Pencil")
                                                } icon: {
                                                    Image(systemName: "pencil")
                                                }
                                            }
                                            Button(action: {
                                                isDraw = true
                                                type = .pen
                                            }) {
                                                Label {
                                                    Text("Pen")
                                                } icon: {
                                                    Image(systemName: "pencil.tip")
                                                }
                                            }
                                            Button(action: {
                                                isDraw = true
                                                type = .marker
                                            }) {
                                                Label {
                                                    Text("Marker")
                                                } icon: {
                                                    Image(systemName: "highlighter")
                                                }
                                            }
                                            
                                            
                                        } label: {
                                            Image("menu")
                                                .resizable()
                                                .frame(width: 22, height: 22)
                                        }
                                    }
                                ),
                            isActive: $isDrawingViewActive,
                            label: {
                                EmptyView()
                            }
                        )
                        .hidden()

                    }
                    Spacer()
                    
                    Image("BottomBarLeaves_Crop")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
    }
    
    func createSprout() {
        // masukin ke controller sendiri kaaah
    }
}


#Preview {
    ContentView()
}

// Bekas Widget Streak Testing lama
//struct ContentView: View {
//    var body: some View {
//        let streak = 10
//
//        VStack {
//            GroupBox {
//                if streak > 7 {
//                    Text("Current Streak Is \(streak)!\nKeep Up The Good Work!")
//                } else {
//                    Text("Current Streak is \(streak)!\nLet's Get Brushing")
//                }
//            } label: {
//                Label("Streak", systemImage: "flame.fill")
//                    .foregroundColor(.red)
//            }
//            .frame(width: 350)
//            NavigationView {
//                NavigationLink(destination: NewSproutView()) {
//                    Image(systemName: "livephoto.play")
//                        .font(.system(size: 120))
//                        .foregroundColor(.red)
//                }
//            }
//            Spacer()
//        }
//    }
//}
