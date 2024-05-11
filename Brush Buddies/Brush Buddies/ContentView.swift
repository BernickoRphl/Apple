import SwiftUI

struct ContentView: View {
    var body: some View {
        let streak = 10
        VStack {
            GroupBox {
                if streak > 7 {
                    Text("Current Streak Is \(streak)!\nKeep Up The Good Work!")
                } else {
                    Text("Current Streak is \(streak)!\nLet's Get Brushing")
                }
            } label: {
                Label("Streak", systemImage: "flame.fill")
                    .foregroundColor(.red)
            }
            .frame(width: 350)
            NavigationView {
                NavigationLink(destination: TimerView()) {
                    Image(systemName: "livephoto.play")
                        .font(.system(size: 120))
                        .foregroundColor(.red)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
